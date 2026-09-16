package io.flutter.plugin.text;

import android.app.Activity;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.os.Build;
import androidx.webkit.internal.AssetHelper;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.embedding.engine.systemchannels.ProcessTextChannel;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import tv.danmaku.ijk.media.player.IjkMediaPlayer;

/* loaded from: classes2.dex */
public class ProcessTextPlugin implements FlutterPlugin, ActivityAware, PluginRegistry.ActivityResultListener, ProcessTextChannel.ProcessTextMethodHandler {
    private static final String TAG = "ProcessTextPlugin";
    private ActivityPluginBinding activityBinding;
    private final PackageManager packageManager;
    private final ProcessTextChannel processTextChannel;
    private Map<Integer, MethodChannel.Result> requestsByCode = new HashMap();
    private Map<String, ResolveInfo> resolveInfosById;

    @Override // io.flutter.embedding.engine.plugins.FlutterPlugin
    public void onAttachedToEngine(FlutterPlugin.FlutterPluginBinding flutterPluginBinding) {
    }

    @Override // io.flutter.embedding.engine.plugins.FlutterPlugin
    public void onDetachedFromEngine(FlutterPlugin.FlutterPluginBinding flutterPluginBinding) {
    }

    public ProcessTextPlugin(ProcessTextChannel processTextChannel) {
        this.processTextChannel = processTextChannel;
        this.packageManager = processTextChannel.packageManager;
        processTextChannel.setMethodHandler(this);
    }

    @Override // io.flutter.embedding.engine.systemchannels.ProcessTextChannel.ProcessTextMethodHandler
    public Map<String, String> queryTextActions() {
        if (this.resolveInfosById == null) {
            cacheResolveInfos();
        }
        HashMap map = new HashMap();
        for (String str : this.resolveInfosById.keySet()) {
            map.put(str, this.resolveInfosById.get(str).loadLabel(this.packageManager).toString());
        }
        return map;
    }

    @Override // io.flutter.embedding.engine.systemchannels.ProcessTextChannel.ProcessTextMethodHandler
    public void processTextAction(String str, String str2, boolean z, MethodChannel.Result result) {
        if (this.activityBinding == null) {
            result.error(IjkMediaPlayer.OnNativeInvokeListener.ARG_ERROR, "Plugin not bound to an Activity", null);
            return;
        }
        if (Build.VERSION.SDK_INT < 23) {
            result.error(IjkMediaPlayer.OnNativeInvokeListener.ARG_ERROR, "Android version not supported", null);
            return;
        }
        Map<String, ResolveInfo> map = this.resolveInfosById;
        if (map == null) {
            result.error(IjkMediaPlayer.OnNativeInvokeListener.ARG_ERROR, "Can not process text actions before calling queryTextActions", null);
            return;
        }
        ResolveInfo resolveInfo = map.get(str);
        if (resolveInfo == null) {
            result.error(IjkMediaPlayer.OnNativeInvokeListener.ARG_ERROR, "Text processing activity not found", null);
            return;
        }
        int iHashCode = result.hashCode();
        Integer numValueOf = Integer.valueOf(iHashCode);
        this.requestsByCode.put(numValueOf, result);
        Intent intent = new Intent();
        intent.setClassName(resolveInfo.activityInfo.packageName, resolveInfo.activityInfo.name);
        intent.setAction("android.intent.action.PROCESS_TEXT");
        intent.setType(AssetHelper.DEFAULT_MIME_TYPE);
        intent.putExtra("android.intent.extra.PROCESS_TEXT", str2);
        intent.putExtra("android.intent.extra.PROCESS_TEXT_READONLY", z);
        Activity activity = this.activityBinding.getActivity();
        numValueOf.getClass();
        activity.startActivityForResult(intent, iHashCode);
    }

    private void cacheResolveInfos() {
        List<ResolveInfo> listQueryIntentActivities;
        this.resolveInfosById = new HashMap();
        if (Build.VERSION.SDK_INT < 23) {
            return;
        }
        Intent type = new Intent().setAction("android.intent.action.PROCESS_TEXT").setType(AssetHelper.DEFAULT_MIME_TYPE);
        if (Build.VERSION.SDK_INT >= 33) {
            listQueryIntentActivities = this.packageManager.queryIntentActivities(type, PackageManager.ResolveInfoFlags.of(0L));
        } else {
            listQueryIntentActivities = this.packageManager.queryIntentActivities(type, 0);
        }
        for (ResolveInfo resolveInfo : listQueryIntentActivities) {
            String str = resolveInfo.activityInfo.name;
            resolveInfo.loadLabel(this.packageManager).toString();
            this.resolveInfosById.put(str, resolveInfo);
        }
    }

    @Override // io.flutter.plugin.common.PluginRegistry.ActivityResultListener
    public boolean onActivityResult(int i, int i2, Intent intent) {
        if (!this.requestsByCode.containsKey(Integer.valueOf(i))) {
            return false;
        }
        this.requestsByCode.remove(Integer.valueOf(i)).success(i2 == -1 ? intent.getStringExtra("android.intent.extra.PROCESS_TEXT") : null);
        return true;
    }

    public void destroy() {
        this.processTextChannel.setMethodHandler(null);
    }

    @Override // io.flutter.embedding.engine.plugins.activity.ActivityAware
    public void onAttachedToActivity(ActivityPluginBinding activityPluginBinding) {
        this.activityBinding = activityPluginBinding;
        activityPluginBinding.addActivityResultListener(this);
    }

    @Override // io.flutter.embedding.engine.plugins.activity.ActivityAware
    public void onDetachedFromActivityForConfigChanges() {
        this.activityBinding.removeActivityResultListener(this);
        this.activityBinding = null;
    }

    @Override // io.flutter.embedding.engine.plugins.activity.ActivityAware
    public void onReattachedToActivityForConfigChanges(ActivityPluginBinding activityPluginBinding) {
        this.activityBinding = activityPluginBinding;
        activityPluginBinding.addActivityResultListener(this);
    }

    @Override // io.flutter.embedding.engine.plugins.activity.ActivityAware
    public void onDetachedFromActivity() {
        this.activityBinding.removeActivityResultListener(this);
        this.activityBinding = null;
    }
}
