package com.github.gzuliyujiang.oaid.impl;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.IBinder;
import android.os.RemoteException;
import com.github.gzuliyujiang.oaid.IGetter;
import com.github.gzuliyujiang.oaid.OAIDException;
import com.github.gzuliyujiang.oaid.OAIDLog;
import com.github.gzuliyujiang.oaid.impl.OAIDService;
import repeackage.com.oplus.stdid.IStdID;

/* loaded from: classes.dex */
public class OppoExtImpl extends OppoImpl {
    private static final String ACTION = "action.com.oplus.stdid.ID_SERVICE";
    private static final String CLASS_NAME = "com.oplus.stdid.IdentifyService";
    private static final String PACKAGE_NAME = "com.coloros.mcs";
    private final Context context;

    public OppoExtImpl(Context context) {
        super(context);
        this.context = context;
    }

    @Override // com.github.gzuliyujiang.oaid.impl.OppoImpl, com.github.gzuliyujiang.oaid.IOAID
    public boolean supported() {
        Context context = this.context;
        if (context == null) {
            return false;
        }
        try {
            return context.getPackageManager().getPackageInfo(PACKAGE_NAME, 0) != null;
        } catch (Exception e) {
            OAIDLog.print(e);
            return false;
        }
    }

    @Override // com.github.gzuliyujiang.oaid.impl.OppoImpl, com.github.gzuliyujiang.oaid.IOAID
    public void doGet(IGetter iGetter) {
        if (this.context == null || iGetter == null) {
            return;
        }
        Intent intent = new Intent(ACTION);
        intent.setComponent(new ComponentName(PACKAGE_NAME, CLASS_NAME));
        OAIDService.bind(this.context, intent, iGetter, new OAIDService.RemoteCaller() { // from class: com.github.gzuliyujiang.oaid.impl.OppoExtImpl.1
            @Override // com.github.gzuliyujiang.oaid.impl.OAIDService.RemoteCaller
            public String callRemoteInterface(IBinder iBinder) throws OAIDException, RemoteException {
                try {
                    return OppoExtImpl.this.realGetOUID(iBinder);
                } catch (RemoteException e) {
                    throw e;
                } catch (OAIDException e2) {
                    throw e2;
                } catch (Exception e3) {
                    throw new OAIDException(e3);
                }
            }
        });
    }

    @Override // com.github.gzuliyujiang.oaid.impl.OppoImpl
    protected String getSerId(IBinder iBinder, String str, String str2) throws OAIDException, RemoteException {
        IStdID iStdIDAsInterface = IStdID.Stub.asInterface(iBinder);
        if (iStdIDAsInterface == null) {
            throw new OAIDException("IStdID is null");
        }
        return iStdIDAsInterface.getSerID(str, str2, "OUID");
    }
}
