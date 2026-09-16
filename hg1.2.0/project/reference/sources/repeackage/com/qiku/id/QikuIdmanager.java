package repeackage.com.qiku.id;

import android.os.IBinder;
import android.os.Parcel;
import android.os.RemoteException;
import com.github.gzuliyujiang.oaid.OAIDLog;

/* loaded from: classes2.dex */
public final class QikuIdmanager {
    public static int CODE_GET_AAID = 6;
    public static int CODE_GET_OAID = 4;
    public static int CODE_GET_UDID = 3;
    public static int CODE_GET_VAID = 5;
    public static int CODE_IS_SUPPORTED = 2;
    public static final int CODE_LIMIT_READ_OAID = 9;
    public static final int CODE_RESET_OAID = 8;
    public static int CODE_SHUTDOWN = 7;
    private IBinder mIBinder;

    public QikuIdmanager() {
        this.mIBinder = null;
        try {
            Class<?> cls = Class.forName("android.os.SystemProperties");
            if (((String) cls.getMethod("get", String.class, String.class).invoke(cls, "ro.build.uiversion", "")).contains("360UI")) {
                this.mIBinder = (IBinder) Class.forName("android.os.ServiceManager").getDeclaredMethod("getService", String.class).invoke(null, "qikuid");
            }
        } catch (Throwable th) {
            OAIDLog.print("Failure get qikuid service");
            OAIDLog.print(th);
        }
    }

    public boolean isSupported() {
        if (this.mIBinder != null) {
            Parcel parcelObtain = Parcel.obtain();
            Parcel parcelObtain2 = Parcel.obtain();
            try {
                this.mIBinder.transact(CODE_IS_SUPPORTED, parcelObtain, parcelObtain2, 0);
                return parcelObtain2.readInt() == 1;
            } catch (RemoteException e) {
                OAIDLog.print(e);
            } finally {
                parcelObtain.recycle();
                parcelObtain2.recycle();
            }
        }
        return false;
    }

    public String getUDID() {
        if (this.mIBinder == null) {
            return null;
        }
        Parcel parcelObtain = Parcel.obtain();
        Parcel parcelObtain2 = Parcel.obtain();
        try {
            this.mIBinder.transact(CODE_GET_UDID, parcelObtain, parcelObtain2, 0);
            return parcelObtain2.readString();
        } catch (RemoteException e) {
            OAIDLog.print(e);
            return null;
        } finally {
            parcelObtain.recycle();
            parcelObtain2.recycle();
        }
    }

    public String getOAID() {
        if (this.mIBinder == null) {
            return null;
        }
        Parcel parcelObtain = Parcel.obtain();
        Parcel parcelObtain2 = Parcel.obtain();
        try {
            this.mIBinder.transact(CODE_GET_OAID, parcelObtain, parcelObtain2, 0);
            return parcelObtain2.readString();
        } catch (RemoteException e) {
            OAIDLog.print(e);
            return null;
        } finally {
            parcelObtain.recycle();
            parcelObtain2.recycle();
        }
    }

    public String getVAID() {
        if (this.mIBinder == null) {
            return null;
        }
        Parcel parcelObtain = Parcel.obtain();
        Parcel parcelObtain2 = Parcel.obtain();
        try {
            this.mIBinder.transact(CODE_GET_VAID, parcelObtain, parcelObtain2, 0);
            return parcelObtain2.readString();
        } catch (RemoteException e) {
            OAIDLog.print(e);
            return null;
        } finally {
            parcelObtain.recycle();
            parcelObtain2.recycle();
        }
    }

    public String getAAID() {
        if (this.mIBinder == null) {
            return null;
        }
        Parcel parcelObtain = Parcel.obtain();
        Parcel parcelObtain2 = Parcel.obtain();
        try {
            this.mIBinder.transact(CODE_GET_AAID, parcelObtain, parcelObtain2, 0);
            return parcelObtain2.readString();
        } catch (RemoteException e) {
            OAIDLog.print(e);
            return null;
        } finally {
            parcelObtain.recycle();
            parcelObtain2.recycle();
        }
    }

    public void shutDown() {
        if (this.mIBinder != null) {
            Parcel parcelObtain = Parcel.obtain();
            Parcel parcelObtain2 = Parcel.obtain();
            try {
                try {
                    this.mIBinder.transact(CODE_SHUTDOWN, parcelObtain, parcelObtain2, 0);
                } catch (RemoteException e) {
                    OAIDLog.print(e);
                }
            } finally {
                parcelObtain.recycle();
                parcelObtain2.recycle();
            }
        }
    }

    public boolean isLimited() {
        if (this.mIBinder != null) {
            Parcel parcelObtain = Parcel.obtain();
            Parcel parcelObtain2 = Parcel.obtain();
            try {
                this.mIBinder.transact(9, parcelObtain, parcelObtain2, 0);
                return parcelObtain2.readInt() != 0;
            } catch (RemoteException e) {
                OAIDLog.print(e);
            } finally {
                parcelObtain.recycle();
                parcelObtain2.recycle();
            }
        }
        return false;
    }
}
