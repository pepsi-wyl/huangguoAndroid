package com.github.gzuliyujiang.oaid.impl;

import android.content.Context;
import android.content.Intent;
import android.os.IBinder;
import android.os.RemoteException;
import com.github.gzuliyujiang.oaid.IGetter;
import com.github.gzuliyujiang.oaid.IOAID;
import com.github.gzuliyujiang.oaid.OAIDException;
import com.github.gzuliyujiang.oaid.OAIDLog;
import com.github.gzuliyujiang.oaid.impl.OAIDService;
import repeackage.com.qiku.id.IOAIDInterface;
import repeackage.com.qiku.id.QikuIdmanager;

/* loaded from: classes.dex */
public class QikuImpl implements IOAID {
    private final Context context;
    private boolean mUseQikuId = true;

    public QikuImpl(Context context) {
        this.context = context;
    }

    @Override // com.github.gzuliyujiang.oaid.IOAID
    public boolean supported() {
        Context context = this.context;
        if (context == null) {
            return false;
        }
        try {
            if (context.getPackageManager().getPackageInfo("com.qiku.id", 0) != null) {
                return true;
            }
            this.mUseQikuId = false;
            return new QikuIdmanager().isSupported();
        } catch (Exception e) {
            OAIDLog.print(e);
            return false;
        }
    }

    @Override // com.github.gzuliyujiang.oaid.IOAID
    public void doGet(IGetter iGetter) {
        if (this.context == null || iGetter == null) {
            return;
        }
        if (this.mUseQikuId) {
            Intent intent = new Intent("qiku.service.action.id");
            intent.setPackage("com.qiku.id");
            OAIDService.bind(this.context, intent, iGetter, new OAIDService.RemoteCaller() { // from class: com.github.gzuliyujiang.oaid.impl.QikuImpl.1
                @Override // com.github.gzuliyujiang.oaid.impl.OAIDService.RemoteCaller
                public String callRemoteInterface(IBinder iBinder) throws OAIDException, RemoteException {
                    IOAIDInterface iOAIDInterfaceAsInterface = IOAIDInterface.Stub.asInterface(iBinder);
                    if (iOAIDInterfaceAsInterface == null) {
                        throw new OAIDException("IOAIDInterface is null");
                    }
                    return iOAIDInterfaceAsInterface.getOAID();
                }
            });
            return;
        }
        try {
            String oaid = new QikuIdmanager().getOAID();
            if (oaid == null || oaid.length() == 0) {
                throw new OAIDException("OAID/AAID acquire failed");
            }
            iGetter.onOAIDGetComplete(oaid);
        } catch (Exception e) {
            iGetter.onOAIDGetError(e);
        }
    }
}
