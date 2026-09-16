package dev.fluttercommunity.plus.wakelock;

import androidx.core.app.NotificationCompat;
import defpackage.IsEnabledMessage;
import defpackage.ToggleMessage;
import defpackage.WakelockPlusApi;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.BinaryMessenger;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: WakelockPlusPlugin.kt */
@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u00012\u00020\u00022\u00020\u0003B\u0005¢\u0006\u0002\u0010\u0004J\b\u0010\u0007\u001a\u00020\bH\u0016J\u0010\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\fH\u0016J\u0010\u0010\r\u001a\u00020\n2\u0006\u0010\u000e\u001a\u00020\u000fH\u0016J\b\u0010\u0010\u001a\u00020\nH\u0016J\b\u0010\u0011\u001a\u00020\nH\u0016J\u0010\u0010\u0012\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000fH\u0016J\u0010\u0010\u0013\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\fH\u0016J\u0010\u0010\u0014\u001a\u00020\n2\u0006\u0010\u0015\u001a\u00020\u0016H\u0016R\u0010\u0010\u0005\u001a\u0004\u0018\u00010\u0006X\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006\u0017"}, d2 = {"Ldev/fluttercommunity/plus/wakelock/WakelockPlusPlugin;", "Lio/flutter/embedding/engine/plugins/FlutterPlugin;", "LWakelockPlusApi;", "Lio/flutter/embedding/engine/plugins/activity/ActivityAware;", "()V", "wakelock", "Ldev/fluttercommunity/plus/wakelock/Wakelock;", "isEnabled", "LIsEnabledMessage;", "onAttachedToActivity", "", "binding", "Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;", "onAttachedToEngine", "flutterPluginBinding", "Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;", "onDetachedFromActivity", "onDetachedFromActivityForConfigChanges", "onDetachedFromEngine", "onReattachedToActivityForConfigChanges", "toggle", NotificationCompat.CATEGORY_MESSAGE, "LToggleMessage;", "wakelock_plus_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class WakelockPlusPlugin implements FlutterPlugin, WakelockPlusApi, ActivityAware {
    private Wakelock wakelock;

    @Override // io.flutter.embedding.engine.plugins.FlutterPlugin
    public void onAttachedToEngine(FlutterPlugin.FlutterPluginBinding flutterPluginBinding) {
        Intrinsics.checkNotNullParameter(flutterPluginBinding, "flutterPluginBinding");
        WakelockPlusApi.Companion companion = WakelockPlusApi.INSTANCE;
        BinaryMessenger binaryMessenger = flutterPluginBinding.getBinaryMessenger();
        Intrinsics.checkNotNullExpressionValue(binaryMessenger, "getBinaryMessenger(...)");
        WakelockPlusApi.Companion.setUp$default(companion, binaryMessenger, this, null, 4, null);
        this.wakelock = new Wakelock();
    }

    @Override // io.flutter.embedding.engine.plugins.FlutterPlugin
    public void onDetachedFromEngine(FlutterPlugin.FlutterPluginBinding binding) {
        Intrinsics.checkNotNullParameter(binding, "binding");
        WakelockPlusApi.Companion companion = WakelockPlusApi.INSTANCE;
        BinaryMessenger binaryMessenger = binding.getBinaryMessenger();
        Intrinsics.checkNotNullExpressionValue(binaryMessenger, "getBinaryMessenger(...)");
        WakelockPlusApi.Companion.setUp$default(companion, binaryMessenger, null, null, 4, null);
        this.wakelock = null;
    }

    @Override // io.flutter.embedding.engine.plugins.activity.ActivityAware
    public void onAttachedToActivity(ActivityPluginBinding binding) {
        Intrinsics.checkNotNullParameter(binding, "binding");
        Wakelock wakelock = this.wakelock;
        if (wakelock == null) {
            return;
        }
        wakelock.setActivity(binding.getActivity());
    }

    @Override // io.flutter.embedding.engine.plugins.activity.ActivityAware
    public void onDetachedFromActivity() {
        Wakelock wakelock = this.wakelock;
        if (wakelock == null) {
            return;
        }
        wakelock.setActivity(null);
    }

    @Override // io.flutter.embedding.engine.plugins.activity.ActivityAware
    public void onReattachedToActivityForConfigChanges(ActivityPluginBinding binding) {
        Intrinsics.checkNotNullParameter(binding, "binding");
        onAttachedToActivity(binding);
    }

    @Override // io.flutter.embedding.engine.plugins.activity.ActivityAware
    public void onDetachedFromActivityForConfigChanges() {
        onDetachedFromActivity();
    }

    @Override // defpackage.WakelockPlusApi
    public void toggle(ToggleMessage msg) throws NoActivityException {
        Intrinsics.checkNotNullParameter(msg, "msg");
        Wakelock wakelock = this.wakelock;
        Intrinsics.checkNotNull(wakelock);
        wakelock.toggle(msg);
    }

    @Override // defpackage.WakelockPlusApi
    public IsEnabledMessage isEnabled() {
        Wakelock wakelock = this.wakelock;
        Intrinsics.checkNotNull(wakelock);
        return wakelock.isEnabled();
    }
}
