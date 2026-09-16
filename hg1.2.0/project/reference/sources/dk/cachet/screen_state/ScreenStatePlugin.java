package dk.cachet.screen_state;

import android.content.Context;
import android.content.IntentFilter;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.EventChannel;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: ScreenStatePlugin.kt */
@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u00012\u00020\u0002B\u0005¢\u0006\u0002\u0010\u0003J\u0012\u0010\n\u001a\u00020\u000b2\b\b\u0001\u0010\f\u001a\u00020\rH\u0016J\u0012\u0010\u000e\u001a\u00020\u000b2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0010H\u0016J\u0012\u0010\u0011\u001a\u00020\u000b2\b\b\u0001\u0010\u0012\u001a\u00020\rH\u0016J\u001c\u0010\u0013\u001a\u00020\u000b2\b\u0010\u000f\u001a\u0004\u0018\u00010\u00102\b\u0010\u0014\u001a\u0004\u0018\u00010\u0015H\u0016R\u0010\u0010\u0004\u001a\u0004\u0018\u00010\u0005X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082.¢\u0006\u0002\n\u0000R\u0010\u0010\b\u001a\u0004\u0018\u00010\tX\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006\u0016"}, d2 = {"Ldk/cachet/screen_state/ScreenStatePlugin;", "Lio/flutter/embedding/engine/plugins/FlutterPlugin;", "Lio/flutter/plugin/common/EventChannel$StreamHandler;", "()V", "context", "Landroid/content/Context;", "eventChannel", "Lio/flutter/plugin/common/EventChannel;", "screenReceiver", "Ldk/cachet/screen_state/ScreenReceiver;", "onAttachedToEngine", "", "flutterPluginBinding", "Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;", "onCancel", "arguments", "", "onDetachedFromEngine", "binding", "onListen", "events", "Lio/flutter/plugin/common/EventChannel$EventSink;", "screen_state_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class ScreenStatePlugin implements FlutterPlugin, EventChannel.StreamHandler {
    private Context context;
    private EventChannel eventChannel;
    private ScreenReceiver screenReceiver;

    @Override // io.flutter.embedding.engine.plugins.FlutterPlugin
    public void onAttachedToEngine(FlutterPlugin.FlutterPluginBinding flutterPluginBinding) {
        Intrinsics.checkNotNullParameter(flutterPluginBinding, "flutterPluginBinding");
        this.eventChannel = new EventChannel(flutterPluginBinding.getBinaryMessenger(), "screenStateEvents");
        this.context = flutterPluginBinding.getApplicationContext();
        EventChannel eventChannel = this.eventChannel;
        if (eventChannel == null) {
            Intrinsics.throwUninitializedPropertyAccessException("eventChannel");
            eventChannel = null;
        }
        eventChannel.setStreamHandler(this);
    }

    @Override // io.flutter.embedding.engine.plugins.FlutterPlugin
    public void onDetachedFromEngine(FlutterPlugin.FlutterPluginBinding binding) {
        Intrinsics.checkNotNullParameter(binding, "binding");
        EventChannel eventChannel = this.eventChannel;
        if (eventChannel == null) {
            Intrinsics.throwUninitializedPropertyAccessException("eventChannel");
            eventChannel = null;
        }
        eventChannel.setStreamHandler(null);
    }

    @Override // io.flutter.plugin.common.EventChannel.StreamHandler
    public void onListen(Object arguments, EventChannel.EventSink events) {
        this.screenReceiver = new ScreenReceiver(events);
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("android.intent.action.SCREEN_ON");
        intentFilter.addAction("android.intent.action.SCREEN_OFF");
        intentFilter.addAction("android.intent.action.USER_PRESENT");
        Context context = this.context;
        Intrinsics.checkNotNull(context);
        context.registerReceiver(this.screenReceiver, intentFilter);
    }

    @Override // io.flutter.plugin.common.EventChannel.StreamHandler
    public void onCancel(Object arguments) {
        Context context = this.context;
        Intrinsics.checkNotNull(context);
        context.unregisterReceiver(this.screenReceiver);
    }
}
