package com.aaassseee.screen_brightness_android.stream_handler;

import android.content.Context;
import android.database.ContentObserver;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import io.flutter.plugin.common.EventChannel;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: CurrentBrightnessChangeStreamHandler.kt */
@Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0006\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\u0018\u00002\u00020\u0001BU\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012#\u0010\u0004\u001a\u001f\u0012\u0013\u0012\u00110\u0006¢\u0006\f\b\u0007\u0012\b\b\b\u0012\u0004\b\b(\t\u0012\u0004\u0012\u00020\n\u0018\u00010\u0005\u0012!\u0010\u000b\u001a\u001d\u0012\u0013\u0012\u00110\u0006¢\u0006\f\b\u0007\u0012\b\b\b\u0012\u0004\b\b(\t\u0012\u0004\u0012\u00020\n0\u0005¢\u0006\u0002\u0010\fJ\u000e\u0010\u0012\u001a\u00020\n2\u0006\u0010\u0013\u001a\u00020\u0014J\u0012\u0010\u0015\u001a\u00020\n2\b\u0010\u0016\u001a\u0004\u0018\u00010\u0017H\u0016J\u001c\u0010\u0018\u001a\u00020\n2\b\u0010\u0016\u001a\u0004\u0018\u00010\u00172\b\u0010\u0019\u001a\u0004\u0018\u00010\u0006H\u0016R\u000e\u0010\r\u001a\u00020\u000eX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R,\u0010\u000b\u001a\u001d\u0012\u0013\u0012\u00110\u0006¢\u0006\f\b\u0007\u0012\b\b\b\u0012\u0004\b\b(\t\u0012\u0004\u0012\u00020\n0\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R.\u0010\u0004\u001a\u001f\u0012\u0013\u0012\u00110\u0006¢\u0006\f\b\u0007\u0012\b\b\b\u0012\u0004\b\b(\t\u0012\u0004\u0012\u00020\n\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0010¨\u0006\u001a"}, d2 = {"Lcom/aaassseee/screen_brightness_android/stream_handler/CurrentBrightnessChangeStreamHandler;", "Lcom/aaassseee/screen_brightness_android/stream_handler/BaseStreamHandler;", "context", "Landroid/content/Context;", "onListenStart", "Lkotlin/Function1;", "Lio/flutter/plugin/common/EventChannel$EventSink;", "Lkotlin/ParameterName;", "name", "eventSink", "", "onChange", "(Landroid/content/Context;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V", "contentObserver", "Landroid/database/ContentObserver;", "getOnChange", "()Lkotlin/jvm/functions/Function1;", "getOnListenStart", "addCurrentBrightnessToEventSink", "brightness", "", "onCancel", "arguments", "", "onListen", "events", "screen_brightness_android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class CurrentBrightnessChangeStreamHandler extends BaseStreamHandler {
    private final ContentObserver contentObserver;
    private final Context context;
    private final Function1<EventChannel.EventSink, Unit> onChange;
    private final Function1<EventChannel.EventSink, Unit> onListenStart;

    public final Function1<EventChannel.EventSink, Unit> getOnListenStart() {
        return this.onListenStart;
    }

    public final Function1<EventChannel.EventSink, Unit> getOnChange() {
        return this.onChange;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public CurrentBrightnessChangeStreamHandler(Context context, Function1<? super EventChannel.EventSink, Unit> function1, Function1<? super EventChannel.EventSink, Unit> onChange) {
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(onChange, "onChange");
        this.context = context;
        this.onListenStart = function1;
        this.onChange = onChange;
        final Handler handler = new Handler(Looper.getMainLooper());
        this.contentObserver = new ContentObserver(handler) { // from class: com.aaassseee.screen_brightness_android.stream_handler.CurrentBrightnessChangeStreamHandler$contentObserver$1
            @Override // android.database.ContentObserver
            public void onChange(boolean selfChange) {
                super.onChange(selfChange);
                EventChannel.EventSink eventSink = this.this$0.getEventSink();
                if (eventSink == null) {
                    return;
                }
                this.this$0.getOnChange().invoke(eventSink);
            }
        };
    }

    @Override // com.aaassseee.screen_brightness_android.stream_handler.BaseStreamHandler, io.flutter.plugin.common.EventChannel.StreamHandler
    public void onListen(Object arguments, EventChannel.EventSink events) {
        Function1<EventChannel.EventSink, Unit> function1;
        super.onListen(arguments, events);
        this.context.getContentResolver().registerContentObserver(Settings.System.getUriFor("screen_brightness"), false, this.contentObserver);
        EventChannel.EventSink eventSink = getEventSink();
        if (eventSink == null || (function1 = this.onListenStart) == null) {
            return;
        }
        function1.invoke(eventSink);
    }

    @Override // com.aaassseee.screen_brightness_android.stream_handler.BaseStreamHandler, io.flutter.plugin.common.EventChannel.StreamHandler
    public void onCancel(Object arguments) {
        super.onCancel(arguments);
        this.context.getContentResolver().unregisterContentObserver(this.contentObserver);
    }

    public final void addCurrentBrightnessToEventSink(double brightness) {
        EventChannel.EventSink eventSink = getEventSink();
        if (eventSink == null) {
            return;
        }
        eventSink.success(Double.valueOf(brightness));
    }
}
