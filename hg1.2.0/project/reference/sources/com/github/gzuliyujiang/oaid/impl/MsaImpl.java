package com.github.gzuliyujiang.oaid.impl;

import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.IBinder;
import android.os.RemoteException;
import com.github.gzuliyujiang.oaid.IGetter;
import com.github.gzuliyujiang.oaid.IOAID;
import com.github.gzuliyujiang.oaid.OAIDException;
import com.github.gzuliyujiang.oaid.OAIDLog;
import com.github.gzuliyujiang.oaid.impl.OAIDService;
import repeackage.com.bun.lib.MsaIdInterface;

/* loaded from: classes.dex */
class MsaImpl implements IOAID {
    private final Context context;

    public MsaImpl(Context context) {
        this.context = context;
    }

    @Override // com.github.gzuliyujiang.oaid.IOAID
    public boolean supported() {
        Context context = this.context;
        if (context == null) {
            return false;
        }
        try {
            return context.getPackageManager().getPackageInfo("com.mdid.msa", 0) != null;
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
        startMsaKlService();
        Intent intent = new Intent("com.bun.msa.action.bindto.service");
        intent.setClassName("com.mdid.msa", "com.mdid.msa.service.MsaIdService");
        intent.putExtra("com.bun.msa.param.pkgname", this.context.getPackageName());
        OAIDService.bind(this.context, intent, iGetter, new OAIDService.RemoteCaller() { // from class: com.github.gzuliyujiang.oaid.impl.MsaImpl.1
            @Override // com.github.gzuliyujiang.oaid.impl.OAIDService.RemoteCaller
            public String callRemoteInterface(IBinder iBinder) throws OAIDException, RemoteException {
                MsaIdInterface msaIdInterfaceAsInterface = MsaIdInterface.Stub.asInterface(iBinder);
                if (msaIdInterfaceAsInterface == null) {
                    throw new OAIDException("MsaIdInterface is null");
                }
                if (!msaIdInterfaceAsInterface.isSupported()) {
                    throw new OAIDException("MsaIdInterface#isSupported return false");
                }
                return msaIdInterfaceAsInterface.getOAID();
            }
        });
    }

    private void startMsaKlService() {
        try {
            Intent intent = new Intent("com.bun.msa.action.start.service");
            intent.setClassName("com.mdid.msa", "com.mdid.msa.service.MsaKlService");
            intent.putExtra("com.bun.msa.param.pkgname", this.context.getPackageName());
            if (Build.VERSION.SDK_INT < 26) {
                this.context.startService(intent);
            } else {
                this.context.startForegroundService(intent);
            }
        } catch (Exception e) {
            OAIDLog.print(e);
        }
    }
}
