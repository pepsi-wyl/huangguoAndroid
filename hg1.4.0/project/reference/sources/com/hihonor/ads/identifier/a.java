package com.hihonor.ads.identifier;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.util.Log;
import com.hihonor.ads.identifier.AdvertisingIdClient;
import com.hihonor.cloudservice.oaid.a;
import com.hihonor.cloudservice.oaid.b;
import java.util.concurrent.CountDownLatch;

/* loaded from: classes.dex */
public class a implements ServiceConnection {
    public AdvertisingIdClient.Info a;
    public Context b;
    public BinderC0019a c = new BinderC0019a();
    public b d = new b();
    public CountDownLatch e = new CountDownLatch(2);

    /* renamed from: com.hihonor.ads.identifier.a$a, reason: collision with other inner class name */
    public class BinderC0019a extends a.AbstractBinderC0020a {
        public BinderC0019a() {
        }

        @Override // com.hihonor.cloudservice.oaid.a
        public void a(int i, long j, boolean z, float f, double d, String str) {
        }

        @Override // com.hihonor.cloudservice.oaid.a
        public void a(int i, Bundle bundle) {
            Log.e("AdvertisingIdPlatform", "OAIDCallBack handleResult retCode=" + i + " retInfo=" + bundle);
            if (i != 0 || bundle == null) {
                Log.e("AdvertisingIdPlatform", "OAIDCallBack handleResult error retCode=$ " + i);
            } else if (a.this.a != null) {
                a.this.a.id = bundle.getString("oa_id_flag");
                Log.i("AdvertisingIdPlatform", "OAIDCallBack handleResult success");
            }
            a.this.e.countDown();
        }
    }

    public class b extends a.AbstractBinderC0020a {
        public b() {
        }

        @Override // com.hihonor.cloudservice.oaid.a
        public void a(int i, long j, boolean z, float f, double d, String str) {
        }

        @Override // com.hihonor.cloudservice.oaid.a
        public void a(int i, Bundle bundle) {
            Log.e("AdvertisingIdPlatform", "OAIDCallBack handleResult retCode=" + i + " retInfo= " + bundle);
            if (i != 0 || bundle == null) {
                Log.e("AdvertisingIdPlatform", "OAIDLimitCallback handleResult error retCode= " + i);
            } else if (a.this.a != null) {
                boolean z = bundle.getBoolean("oa_id_limit_state");
                a.this.a.isLimit = z;
                Log.i("AdvertisingIdPlatform", "OAIDLimitCallback handleResult success  isLimit=" + z);
            }
            a.this.e.countDown();
        }
    }

    public final void a() {
        Log.i("AdvertisingIdPlatform", "disconnect");
        try {
            this.b.unbindService(this);
        } catch (Exception e) {
            Log.e("AdvertisingIdPlatform", "OAIDClientImpl#disconnect#Disconnect error::" + e.getMessage());
        }
    }

    public boolean a(Context context) throws PackageManager.NameNotFoundException {
        try {
            context.getPackageManager().getPackageInfo("com.hihonor.id", 0);
            new Intent("com.hihonor.id.HnOaIdService").setPackage("com.hihonor.id");
            return !r5.queryIntentServices(r2, 0).isEmpty();
        } catch (PackageManager.NameNotFoundException | Exception unused) {
            return false;
        }
    }

    @Override // android.content.ServiceConnection
    public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        com.hihonor.cloudservice.oaid.b c0021a;
        Log.i("AdvertisingIdPlatform", "onServiceConnected ");
        try {
            this.a = new AdvertisingIdClient.Info();
            int i = b.a.a;
            if (iBinder == null) {
                c0021a = null;
            } else {
                IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.hihonor.cloudservice.oaid.IOAIDService");
                c0021a = (iInterfaceQueryLocalInterface == null || !(iInterfaceQueryLocalInterface instanceof com.hihonor.cloudservice.oaid.b)) ? new b.a.C0021a(iBinder) : (com.hihonor.cloudservice.oaid.b) iInterfaceQueryLocalInterface;
            }
            c0021a.b(this.c);
            c0021a.a(this.d);
        } catch (Exception e) {
            Log.e("AdvertisingIdPlatform", "onServiceConnected error:" + e.getMessage());
            this.e.countDown();
            this.e.countDown();
            a();
        }
    }

    @Override // android.content.ServiceConnection
    public void onServiceDisconnected(ComponentName componentName) {
        Log.i("AdvertisingIdPlatform", "onServiceDisconnected ");
        this.e.countDown();
        this.e.countDown();
    }
}
