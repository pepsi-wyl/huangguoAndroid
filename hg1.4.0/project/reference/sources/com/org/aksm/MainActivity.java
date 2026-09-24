package com.org.aksm;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Bundle;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

/* loaded from: classes2.dex */
public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "dynamic_theme";
    private Context mContext;

    @Override // io.flutter.embedding.android.FlutterActivity, android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        new MethodChannel(getFlutterEngine().getDartExecutor().getBinaryMessenger(), CHANNEL).setMethodCallHandler(new MethodChannel.MethodCallHandler() { // from class: com.org.aksm.MainActivity.1
            @Override // io.flutter.plugin.common.MethodChannel.MethodCallHandler
            public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                if (methodCall.method.equals("updateAppIcon")) {
                    MainActivity.this.setAppIcon((String) methodCall.argument("old_name"), (String) methodCall.argument("new_name"));
                    result.success(true);
                    return;
                }
                result.notImplemented();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAppIcon(String str, String str2) {
        getContext().startActivity(new Intent(getContext(), (Class<?>) MainActivity.class));
        PackageManager packageManager = getContext().getPackageManager();
        String name = MainActivity.class.getPackage().getName();
        packageManager.setComponentEnabledSetting(new ComponentName(name, name + str), 2, 1);
        packageManager.setComponentEnabledSetting(new ComponentName(name, name + str2), 1, 1);
    }
}
