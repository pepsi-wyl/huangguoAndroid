package com.zero.app_installer;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.text.TextUtils;
import androidx.core.content.FileProvider;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;
import java.io.File;

/* loaded from: classes2.dex */
public class AppInstallerPlugin implements FlutterPlugin, ActivityAware, MethodChannel.MethodCallHandler, PluginRegistry.ActivityResultListener {
    private File apkFile;
    private Context applicationContext;
    private Activity mActivity;
    private MethodChannel methodChannel;
    private MethodChannel.Result result;

    private PluginRegistry.ActivityResultListener getActivityResultListener() {
        return this;
    }

    @Override // io.flutter.embedding.engine.plugins.activity.ActivityAware
    public void onDetachedFromActivityForConfigChanges() {
    }

    @Override // io.flutter.embedding.engine.plugins.FlutterPlugin
    public void onAttachedToEngine(FlutterPlugin.FlutterPluginBinding flutterPluginBinding) {
        onAttachedToEngine(flutterPluginBinding.getApplicationContext(), flutterPluginBinding.getBinaryMessenger());
    }

    private void onAttachedToEngine(Context context, BinaryMessenger binaryMessenger) {
        this.applicationContext = context;
        MethodChannel methodChannel = new MethodChannel(binaryMessenger, "app_installer");
        this.methodChannel = methodChannel;
        methodChannel.setMethodCallHandler(this);
    }

    @Override // io.flutter.embedding.engine.plugins.FlutterPlugin
    public void onDetachedFromEngine(FlutterPlugin.FlutterPluginBinding flutterPluginBinding) {
        this.applicationContext = null;
        this.methodChannel.setMethodCallHandler(null);
        this.methodChannel = null;
    }

    @Override // io.flutter.embedding.engine.plugins.activity.ActivityAware
    public void onAttachedToActivity(ActivityPluginBinding activityPluginBinding) {
        onAttachedToActivity(activityPluginBinding.getActivity());
        activityPluginBinding.addActivityResultListener(getActivityResultListener());
    }

    private void onAttachedToActivity(Activity activity) {
        this.mActivity = activity;
    }

    @Override // io.flutter.embedding.engine.plugins.activity.ActivityAware
    public void onReattachedToActivityForConfigChanges(ActivityPluginBinding activityPluginBinding) {
        onAttachedToActivity(activityPluginBinding);
        activityPluginBinding.removeActivityResultListener(getActivityResultListener());
        activityPluginBinding.addActivityResultListener(getActivityResultListener());
    }

    @Override // io.flutter.embedding.engine.plugins.activity.ActivityAware
    public void onDetachedFromActivity() {
        this.mActivity = null;
    }

    @Override // io.flutter.plugin.common.MethodChannel.MethodCallHandler
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        String str = methodCall.method;
        if (str.equals("goStore")) {
            goAppStore(this.mActivity, (String) methodCall.argument("androidAppId"));
            result.success(true);
        } else {
            if (str.equals("installApk")) {
                String str2 = (String) methodCall.argument("apkPath");
                if (TextUtils.isEmpty(str2)) {
                    result.error("installApk", "apkPath is null", null);
                    return;
                } else {
                    installProcess(new File(str2), result);
                    return;
                }
            }
            result.notImplemented();
        }
    }

    private void goAppStore(Activity activity, String str) {
        if (str == null) {
            str = activity.getPackageName();
        }
        Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("market://details?id=" + str));
        intent.addFlags(1208483840);
        activity.startActivity(intent);
    }

    private void installProcess(File file, MethodChannel.Result result) {
        this.apkFile = file;
        this.result = result;
        installApk(file, result);
    }

    private void startInstallPermissionSettingActivity() {
        this.mActivity.startActivityForResult(new Intent("android.settings.MANAGE_UNKNOWN_APP_SOURCES", Uri.parse("package:" + this.applicationContext.getPackageName())), 10086);
    }

    private void installApk(File file, MethodChannel.Result result) {
        if (file != null && file.exists() && file.length() > 0) {
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.addFlags(268435456);
            if (Build.VERSION.SDK_INT >= 24) {
                intent.addFlags(1);
                intent.setDataAndType(FileProvider.getUriForFile(this.applicationContext, this.applicationContext.getPackageName() + ".fileProvider", file), "application/vnd.android.package-archive");
            } else {
                intent.setDataAndType(Uri.fromFile(file), "application/vnd.android.package-archive");
            }
            this.mActivity.startActivity(intent);
            if (result != null) {
                result.success(true);
            }
        } else if (result != null) {
            result.success(false);
        }
        this.apkFile = null;
        this.result = null;
    }

    @Override // io.flutter.plugin.common.PluginRegistry.ActivityResultListener
    public boolean onActivityResult(int i, int i2, Intent intent) {
        if (i != 10086 || i2 != -1) {
            return false;
        }
        installProcess(this.apkFile, this.result);
        return true;
    }
}
