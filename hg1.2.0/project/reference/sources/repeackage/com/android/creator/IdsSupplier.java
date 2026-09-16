package repeackage.com.android.creator;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

/* loaded from: classes2.dex */
public interface IdsSupplier extends IInterface {

    public static class Default implements IdsSupplier {
        @Override // android.os.IInterface
        public IBinder asBinder() {
            return null;
        }

        @Override // repeackage.com.android.creator.IdsSupplier
        public String getAAID(String str) throws RemoteException {
            return null;
        }

        @Override // repeackage.com.android.creator.IdsSupplier
        public String getOAID() throws RemoteException {
            return null;
        }

        @Override // repeackage.com.android.creator.IdsSupplier
        public String getUDID(String str) throws RemoteException {
            return null;
        }

        @Override // repeackage.com.android.creator.IdsSupplier
        public String getVAID() throws RemoteException {
            return null;
        }

        @Override // repeackage.com.android.creator.IdsSupplier
        public boolean isSupported() throws RemoteException {
            return false;
        }
    }

    String getAAID(String str) throws RemoteException;

    String getOAID() throws RemoteException;

    String getUDID(String str) throws RemoteException;

    String getVAID() throws RemoteException;

    boolean isSupported() throws RemoteException;

    public static abstract class Stub extends Binder implements IdsSupplier {
        private static final String DESCRIPTOR = "com.android.creator.IdsSupplier";
        static final int TRANSACTION_getAAID = 5;
        static final int TRANSACTION_getOAID = 3;
        static final int TRANSACTION_getUDID = 2;
        static final int TRANSACTION_getVAID = 4;
        static final int TRANSACTION_isSupported = 1;

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static IdsSupplier asInterface(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface(DESCRIPTOR);
            if (iInterfaceQueryLocalInterface != null && (iInterfaceQueryLocalInterface instanceof IdsSupplier)) {
                return (IdsSupplier) iInterfaceQueryLocalInterface;
            }
            return new Proxy(iBinder);
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            if (i == 1) {
                parcel.enforceInterface(DESCRIPTOR);
                boolean zIsSupported = isSupported();
                parcel2.writeNoException();
                parcel2.writeInt(zIsSupported ? 1 : 0);
                return true;
            }
            if (i == 2) {
                parcel.enforceInterface(DESCRIPTOR);
                String udid = getUDID(parcel.readString());
                parcel2.writeNoException();
                parcel2.writeString(udid);
                return true;
            }
            if (i == 3) {
                parcel.enforceInterface(DESCRIPTOR);
                String oaid = getOAID();
                parcel2.writeNoException();
                parcel2.writeString(oaid);
                return true;
            }
            if (i == 4) {
                parcel.enforceInterface(DESCRIPTOR);
                String vaid = getVAID();
                parcel2.writeNoException();
                parcel2.writeString(vaid);
                return true;
            }
            if (i != 5) {
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

        private static class Proxy implements IdsSupplier {
            public static IdsSupplier sDefaultImpl;
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

            @Override // repeackage.com.android.creator.IdsSupplier
            public boolean isSupported() throws RemoteException {
                Parcel parcelObtain = Parcel.obtain();
                Parcel parcelObtain2 = Parcel.obtain();
                try {
                    parcelObtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (!this.mRemote.transact(1, parcelObtain, parcelObtain2, 0) && Stub.getDefaultImpl() != null) {
                        return Stub.getDefaultImpl().isSupported();
                    }
                    parcelObtain2.readException();
                    return parcelObtain2.readInt() != 0;
                } finally {
                    parcelObtain2.recycle();
                    parcelObtain.recycle();
                }
            }

            @Override // repeackage.com.android.creator.IdsSupplier
            public String getUDID(String str) throws RemoteException {
                Parcel parcelObtain = Parcel.obtain();
                Parcel parcelObtain2 = Parcel.obtain();
                try {
                    parcelObtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    parcelObtain.writeString(str);
                    if (!this.mRemote.transact(2, parcelObtain, parcelObtain2, 0) && Stub.getDefaultImpl() != null) {
                        return Stub.getDefaultImpl().getUDID(str);
                    }
                    parcelObtain2.readException();
                    return parcelObtain2.readString();
                } finally {
                    parcelObtain2.recycle();
                    parcelObtain.recycle();
                }
            }

            @Override // repeackage.com.android.creator.IdsSupplier
            public String getOAID() throws RemoteException {
                Parcel parcelObtain = Parcel.obtain();
                Parcel parcelObtain2 = Parcel.obtain();
                try {
                    parcelObtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (!this.mRemote.transact(3, parcelObtain, parcelObtain2, 0) && Stub.getDefaultImpl() != null) {
                        return Stub.getDefaultImpl().getOAID();
                    }
                    parcelObtain2.readException();
                    return parcelObtain2.readString();
                } finally {
                    parcelObtain2.recycle();
                    parcelObtain.recycle();
                }
            }

            @Override // repeackage.com.android.creator.IdsSupplier
            public String getVAID() throws RemoteException {
                Parcel parcelObtain = Parcel.obtain();
                Parcel parcelObtain2 = Parcel.obtain();
                try {
                    parcelObtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (!this.mRemote.transact(4, parcelObtain, parcelObtain2, 0) && Stub.getDefaultImpl() != null) {
                        return Stub.getDefaultImpl().getVAID();
                    }
                    parcelObtain2.readException();
                    return parcelObtain2.readString();
                } finally {
                    parcelObtain2.recycle();
                    parcelObtain.recycle();
                }
            }

            @Override // repeackage.com.android.creator.IdsSupplier
            public String getAAID(String str) throws RemoteException {
                Parcel parcelObtain = Parcel.obtain();
                Parcel parcelObtain2 = Parcel.obtain();
                try {
                    parcelObtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    parcelObtain.writeString(str);
                    if (!this.mRemote.transact(5, parcelObtain, parcelObtain2, 0) && Stub.getDefaultImpl() != null) {
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

        public static boolean setDefaultImpl(IdsSupplier idsSupplier) {
            if (Proxy.sDefaultImpl != null) {
                throw new IllegalStateException("setDefaultImpl() called twice");
            }
            if (idsSupplier == null) {
                return false;
            }
            Proxy.sDefaultImpl = idsSupplier;
            return true;
        }

        public static IdsSupplier getDefaultImpl() {
            return Proxy.sDefaultImpl;
        }
    }
}
