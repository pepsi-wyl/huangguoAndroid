package repeackage.com.samsung.android.deviceidservice;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

/* loaded from: classes2.dex */
public interface IDeviceIdService extends IInterface {

    public static class Default implements IDeviceIdService {
        @Override // android.os.IInterface
        public IBinder asBinder() {
            return null;
        }

        @Override // repeackage.com.samsung.android.deviceidservice.IDeviceIdService
        public String getAAID(String str) throws RemoteException {
            return null;
        }

        @Override // repeackage.com.samsung.android.deviceidservice.IDeviceIdService
        public String getOAID() throws RemoteException {
            return null;
        }

        @Override // repeackage.com.samsung.android.deviceidservice.IDeviceIdService
        public String getVAID(String str) throws RemoteException {
            return null;
        }
    }

    String getAAID(String str) throws RemoteException;

    String getOAID() throws RemoteException;

    String getVAID(String str) throws RemoteException;

    public static abstract class Stub extends Binder implements IDeviceIdService {
        private static final String DESCRIPTOR = "com.samsung.android.deviceidservice.IDeviceIdService";
        static final int TRANSACTION_getAAID = 3;
        static final int TRANSACTION_getOAID = 1;
        static final int TRANSACTION_getVAID = 2;

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static IDeviceIdService asInterface(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface(DESCRIPTOR);
            if (iInterfaceQueryLocalInterface != null && (iInterfaceQueryLocalInterface instanceof IDeviceIdService)) {
                return (IDeviceIdService) iInterfaceQueryLocalInterface;
            }
            return new Proxy(iBinder);
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            if (i == 1) {
                parcel.enforceInterface(DESCRIPTOR);
                String oaid = getOAID();
                parcel2.writeNoException();
                parcel2.writeString(oaid);
                return true;
            }
            if (i == 2) {
                parcel.enforceInterface(DESCRIPTOR);
                String vaid = getVAID(parcel.readString());
                parcel2.writeNoException();
                parcel2.writeString(vaid);
                return true;
            }
            if (i != 3) {
                if (i == 1598968902) {
                    parcel2.writeString(DESCRIPTOR);
                    return true;
                }
                return super.onTransact(i, parcel, parcel2, i2);
            }
            parcel.enforceInterface(DESCRIPTOR);
            String aaid = getAAID(parcel.readString());
            parcel2.writeNoException();
            parcel2.writeString(aaid);
            return true;
        }

        private static class Proxy implements IDeviceIdService {
            public static IDeviceIdService sDefaultImpl;
            private IBinder mRemote;

            Proxy(IBinder iBinder) {
                this.mRemote = iBinder;
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.mRemote;
            }

            public String getInterfaceDescriptor() {
                return Stub.DESCRIPTOR;
            }

            @Override // repeackage.com.samsung.android.deviceidservice.IDeviceIdService
            public String getOAID() throws RemoteException {
                Parcel parcelObtain = Parcel.obtain();
                Parcel parcelObtain2 = Parcel.obtain();
                try {
                    parcelObtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (!this.mRemote.transact(1, parcelObtain, parcelObtain2, 0) && Stub.getDefaultImpl() != null) {
                        return Stub.getDefaultImpl().getOAID();
                    }
                    parcelObtain2.readException();
                    return parcelObtain2.readString();
                } finally {
                    parcelObtain2.recycle();
                    parcelObtain.recycle();
                }
            }

            @Override // repeackage.com.samsung.android.deviceidservice.IDeviceIdService
            public String getVAID(String str) throws RemoteException {
                Parcel parcelObtain = Parcel.obtain();
                Parcel parcelObtain2 = Parcel.obtain();
                try {
                    parcelObtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    parcelObtain.writeString(str);
                    if (!this.mRemote.transact(2, parcelObtain, parcelObtain2, 0) && Stub.getDefaultImpl() != null) {
                        return Stub.getDefaultImpl().getVAID(str);
                    }
                    parcelObtain2.readException();
                    return parcelObtain2.readString();
                } finally {
                    parcelObtain2.recycle();
                    parcelObtain.recycle();
                }
            }

            @Override // repeackage.com.samsung.android.deviceidservice.IDeviceIdService
            public String getAAID(String str) throws RemoteException {
                Parcel parcelObtain = Parcel.obtain();
                Parcel parcelObtain2 = Parcel.obtain();
                try {
                    parcelObtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    parcelObtain.writeString(str);
                    if (!this.mRemote.transact(3, parcelObtain, parcelObtain2, 0) && Stub.getDefaultImpl() != null) {
                        return Stub.getDefaultImpl().getAAID(str);
                    }
                    parcelObtain2.readException();
                    return parcelObtain2.readString();
                } finally {
                    parcelObtain2.recycle();
                    parcelObtain.recycle();
                }
            }
        }

        public static boolean setDefaultImpl(IDeviceIdService iDeviceIdService) {
            if (Proxy.sDefaultImpl != null) {
                throw new IllegalStateException("setDefaultImpl() called twice");
            }
            if (iDeviceIdService == null) {
                return false;
            }
            Proxy.sDefaultImpl = iDeviceIdService;
            return true;
        }

        public static IDeviceIdService getDefaultImpl() {
            return Proxy.sDefaultImpl;
        }
    }
}
