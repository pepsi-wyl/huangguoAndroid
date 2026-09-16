package com.aaassseee.screen_brightness_android.stream_handler;

import io.flutter.plugin.common.EventChannel;
import kotlin.Metadata;

/* compiled from: BaseStreamHandler.kt */
@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0016\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J\u0012\u0010\t\u001a\u00020\n2\b\u0010\u000b\u001a\u0004\u0018\u00010\fH\u0016J\u001c\u0010\r\u001a\u00020\n2\b\u0010\u000b\u001a\u0004\u0018\u00010\f2\b\u0010\u000e\u001a\u0004\u0018\u00010\u0004H\u0016R\u001c\u0010\u0003\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0005\u0010\u0006\"\u0004\b\u0007\u0010\b¨\u0006\u000f"}, d2 = {"Lcom/aaassseee/screen_brightness_android/stream_handler/BaseStreamHandler;", "Lio/flutter/plugin/common/EventChannel$StreamHandler;", "()V", "eventSink", "Lio/flutter/plugin/common/EventChannel$EventSink;", "getEventSink", "()Lio/flutter/plugin/common/EventChannel$EventSink;", "setEventSink", "(Lio/flutter/plugin/common/EventChannel$EventSink;)V", "onCancel", "", "arguments", "", "onListen", "events", "screen_brightness_android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public class BaseStreamHandler implements EventChannel.StreamHandler {
    private EventChannel.EventSink eventSink;

    public final EventChannel.EventSink getEventSink() {
        return this.eventSink;
    }

    public final void setEventSink(EventChannel.EventSink eventSink) {
        this.eventSink = eventSink;
    }

    @Override // io.flutter.plugin.common.EventChannel.StreamHandler
    public void onListen(Object arguments, EventChannel.EventSink events) {
        this.eventSink = events;
    }

    @Override // io.flutter.plugin.common.EventChannel.StreamHandler
    public void onCancel(Object arguments) {
        this.eventSink = null;
    }
}
