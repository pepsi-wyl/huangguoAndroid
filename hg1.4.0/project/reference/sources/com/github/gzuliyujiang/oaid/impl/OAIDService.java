package com.github.gzuliyujiang.oaid.impl;

import android.app.Application;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.RemoteException;
import com.github.gzuliyujiang.oaid.IGetter;
import com.github.gzuliyujiang.oaid.OAIDException;
import com.github.gzuliyujiang.oaid.OAIDLog;

/* loaded from: classes.dex */
class OAIDService implements ServiceConnection {
    private final RemoteCaller caller;
    private final Context context;
    private final IGetter getter;

    @FunctionalInterface
    public interface RemoteCaller {
        String callRemoteInterface(IBinder iBinder) throws OAIDException, RemoteException;
    }

    public static void bind(Context context, Intent intent, IGetter iGetter, RemoteCaller remoteCaller) {
        new OAIDService(context, iGetter, remoteCaller).bind(intent);
    }

    private OAIDService(Context context, IGetter iGetter, RemoteCaller remoteCaller) {
        if (context instanceof Application) {
            this.context = context;
        } else {
            this.context = context.getApplicationContext();
        }
        this.getter = iGetter;
        this.caller = remoteCaller;
    }

    private void bind(Intent intent) {
        try {
            if (!this.context.bindService(intent, this, 1)) {
                throw new OAIDException("Service binding failed");
            }
            OAIDLog.print("Service has been bound: " + intent);
        } catch (Exception e) {
            this.getter.onOAIDGetError(e);
        }
    }

    @Override // android.content.ServiceConnection
    public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        OAIDLog.print("Service has been connected: " + componentName.getClassName());
        try {
            try {
                try {
                    String strCallRemoteInterface = this.caller.callRemoteInterface(iBinder);
                    if (strCallRemoteInterface == null || strCallRemoteInterface.length() == 0) {
                        throw new OAIDException("OAID/AAID acquire failed");
                    }
                    OAIDLog.print("OAID/AAID acquire success: " + strCallRemoteInterface);
                    this.getter.onOAIDGetComplete(strCallRemoteInterface);
                    this.context.unbindService(this);
                    OAIDLog.print("Service has been unbound: " + componentName.getClassName());
                } catch (Exception e) {
                    OAIDLog.print(e);
                }
            } catch (Exception e2) {
                OAIDLog.print(e2);
                this.getter.onOAIDGetError(e2);
                this.context.unbindService(this);
                OAIDLog.print("Service has been unbound: " + componentName.getClassName());
            }
        } catch (Throwable th) {
            try {
                this.context.unbindService(this);
                OAIDLog.print("Service has been unbound: " + componentName.getClassName());
            } catch (Exception e3) {
                OAIDLog.print(e3);
            }
            throw th;
        }
    }

    @Override // android.content.ServiceConnection
    public void onServiceDisconnected(ComponentName componentName) {
        OAIDLog.print("Service has been disconnected: " + componentName.getClassName());
    }
}
