package dk.cachet.screen_state;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import io.flutter.plugin.common.EventChannel;

/* loaded from: classes2.dex */
public class ScreenReceiver extends BroadcastReceiver {
    private EventChannel.EventSink eventSink;

    public ScreenReceiver(EventChannel.EventSink eventSink) {
        this.eventSink = eventSink;
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        this.eventSink.success(intent.getAction());
    }
}
