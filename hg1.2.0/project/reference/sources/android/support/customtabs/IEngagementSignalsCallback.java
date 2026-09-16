package android.support.customtabs;

import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.RemoteException;
import kotlin.text.Typography;

/* loaded from: classes.dex */
public interface IEngagementSignalsCallback extends IInterface {
    public static final String DESCRIPTOR = "android$support$customtabs$IEngagementSignalsCallback".replace(Typography.dollar, '.');

    public static class Default implements IEngagementSignalsCallback {
        @Override // android.os.IInterface
        public IBinder asBinder() {
            return null;
        }

        @Override // android.support.customtabs.IEngagementSignalsCallback
        public void onGreatestScrollPercentageIncreased(int i, Bundle bundle) throws RemoteException {
        }

        @Override // android.support.customtabs.IEngagementSignalsCallback
        public void onSessionEnded(boolean z, Bundle bundle) throws RemoteException {
        }

        @Override // android.support.customtabs.IEngagementSignalsCallback
        public void onVerticalScrollEvent(boolean z, Bundle bundle) throws RemoteException {
        }
    }

    void onGreatestScrollPercentageIncreased(int i, Bundle bundle) throws RemoteException;

    void onSessionEnded(boolean z, Bundle bundle) throws RemoteException;

    void onVerticalScrollEvent(boolean z, Bundle bundle) throws RemoteException;

    public static abstract class Stub extends Binder implements IEngagementSignalsCallback {
        static final int TRANSACTION_onGreatestScrollPercentageIncreased = 3;
        static final int TRANSACTION_onSessionEnded = 4;
        static final int TRANSACTION_onVerticalScrollEvent = 2;

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static IEngagementSignalsCallback asInterface(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface(DESCRIPTOR);
            if (iInterfaceQueryLocalInterface != null && (iInterfaceQueryLocalInterface instanceof IEngagementSignalsCallback)) {
                return (IEngagementSignalsCallback) iInterfaceQueryLocalInterface;
            }
            return new Proxy(iBinder);
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            String str = DESCRIPTOR;
            if (i >= 1 && i <= 16777215) {
                parcel.enforceInterface(str);
            }
            if (i == 1598968902) {
                parcel2.writeString(str);
                return true;
            }
            if (i == 2) {
                onVerticalScrollEvent(parcel.readInt() != 0, (Bundle) _Parcel.readTypedObject(parcel, Bundle.CREATOR));
            } else if (i == 3) {
                onGreatestScrollPercentageIncreased(parcel.readInt(), (Bundle) _Parcel.readTypedObject(parcel, Bundle.CREATOR));
            } else if (i == 4) {
                onSessionEnded(parcel.readInt() != 0, (Bundle) _Parcel.readTypedObject(parcel, Bundle.CREATOR));
            } else {
                return super.onTransact(i, parcel, parcel2, i2);
            }
            return true;
        }

        private static class Proxy implements IEngagementSignalsCallback {
            private IBinder mRemote;

            Proxy(IBinder iBinder) {
                this.mRemote = iBinder;
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.mRemote;
            }

            public String getInterfaceDescriptor() {
                return DESCRIPTOR;
            }

            @Override // android.support.customtabs.IEngagementSignalsCallback
            public void onVerticalScrollEvent(boolean z, Bundle bundle) throws RemoteException {
                Parcel parcelObtain = Parcel.obtain();
                try {
                    parcelObtain.writeInterfaceToken(DESCRIPTOR);
                    parcelObtain.writeInt(z ? 1 : 0);
                    _Parcel.writeTypedObject(parcelObtain, bundle, 0);
                    this.mRemote.transact(2, parcelObtain, null, 1);
                } finally {
                    parcelObtain.recycle();
                }
            }

            @Override // android.support.customtabs.IEngagementSignalsCallback
            public void onGreatestScrollPercentageIncreased(int i, Bundle bundle) throws RemoteException {
                Parcel parcelObtain = Parcel.obtain();
                try {
                    parcelObtain.writeInterfaceToken(DESCRIPTOR);
                    parcelObtain.writeInt(i);
                    _Parcel.writeTypedObject(parcelObtain, bundle, 0);
                    this.mRemote.transact(3, parcelObtain, null, 1);
                } finally {
                    parcelObtain.recycle();
                }
            }

            @Override // android.support.customtabs.IEngagementSignalsCallback
            public void onSessionEnded(boolean z, Bundle bundle) throws RemoteException {
                Parcel parcelObtain = Parcel.obtain();
                try {
                    parcelObtain.writeInterfaceToken(DESCRIPTOR);
                    parcelObtain.writeInt(z ? 1 : 0);
                    _Parcel.writeTypedObject(parcelObtain, bundle, 0);
                    this.mRemote.transact(4, parcelObtain, null, 1);
                } finally {
                    parcelObtain.recycle();
                }
            }
        }
    }

    public static class _Parcel {
        /* JADX INFO: Access modifiers changed from: private */
        public static <T> T readTypedObject(Parcel parcel, Parcelable.Creator<T> creator) {
            if (parcel.readInt() != 0) {
                return creator.createFromParcel(parcel);
            }
            return null;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static <T extends Parcelable> void writeTypedObject(Parcel parcel, T t, int i) {
            if (t != null) {
                parcel.writeInt(1);
                t.writeToParcel(parcel, i);
            } else {
                parcel.writeInt(0);
            }
        }
    }
}
