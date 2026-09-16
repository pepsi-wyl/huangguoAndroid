package com.hihonor.cloudservice.oaid;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import com.hihonor.cloudservice.oaid.a;

/* loaded from: classes.dex */
public interface b extends IInterface {

    public static abstract class a extends Binder implements b {
        public static final /* synthetic */ int a = 0;

        /* renamed from: com.hihonor.cloudservice.oaid.b$a$a, reason: collision with other inner class name */
        public static class C0021a implements b {
            public IBinder a;

            public C0021a(IBinder iBinder) {
                this.a = iBinder;
            }

            @Override // com.hihonor.cloudservice.oaid.b
            public void a(com.hihonor.cloudservice.oaid.a aVar) {
                Parcel parcelObtain = Parcel.obtain();
                Parcel parcelObtain2 = Parcel.obtain();
                try {
                    parcelObtain.writeInterfaceToken("com.hihonor.cloudservice.oaid.IOAIDService");
                    parcelObtain.writeStrongBinder(aVar != null ? (a.AbstractBinderC0020a) aVar : null);
                    if (!this.a.transact(3, parcelObtain, parcelObtain2, 0)) {
                        int i = a.a;
                    }
                    parcelObtain2.readException();
                } finally {
                    parcelObtain2.recycle();
                    parcelObtain.recycle();
                }
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.a;
            }

            @Override // com.hihonor.cloudservice.oaid.b
            public void b(com.hihonor.cloudservice.oaid.a aVar) {
                Parcel parcelObtain = Parcel.obtain();
                Parcel parcelObtain2 = Parcel.obtain();
                try {
                    parcelObtain.writeInterfaceToken("com.hihonor.cloudservice.oaid.IOAIDService");
                    parcelObtain.writeStrongBinder(aVar != null ? (a.AbstractBinderC0020a) aVar : null);
                    if (!this.a.transact(2, parcelObtain, parcelObtain2, 0)) {
                        int i = a.a;
                    }
                    parcelObtain2.readException();
                } finally {
                    parcelObtain2.recycle();
                    parcelObtain.recycle();
                }
            }
        }
    }

    void a(com.hihonor.cloudservice.oaid.a aVar);

    void b(com.hihonor.cloudservice.oaid.a aVar);
}
