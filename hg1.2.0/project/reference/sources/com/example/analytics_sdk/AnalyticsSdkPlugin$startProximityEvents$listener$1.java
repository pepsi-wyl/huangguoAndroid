package com.example.analytics_sdk;

import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.os.Handler;
import androidx.core.app.NotificationCompat;
import io.flutter.plugin.common.EventChannel;
import kotlin.Metadata;
import kotlin.collections.ArraysKt;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: AnalyticsSdkPlugin.kt */
@Metadata(d1 = {"\u0000%\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\b\n\u0018\u00002\u00020\u0001J\u001a\u0010\u0002\u001a\u00020\u00032\b\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J\u0010\u0010\b\u001a\u00020\u00032\u0006\u0010\t\u001a\u00020\nH\u0016¨\u0006\u000b"}, d2 = {"com/example/analytics_sdk/AnalyticsSdkPlugin$startProximityEvents$listener$1", "Landroid/hardware/SensorEventListener;", "onAccuracyChanged", "", "sensor", "Landroid/hardware/Sensor;", "accuracy", "", "onSensorChanged", NotificationCompat.CATEGORY_EVENT, "Landroid/hardware/SensorEvent;", "analytics_sdk_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class AnalyticsSdkPlugin$startProximityEvents$listener$1 implements SensorEventListener {
    final /* synthetic */ Sensor $sensor;
    final /* synthetic */ AnalyticsSdkPlugin this$0;

    @Override // android.hardware.SensorEventListener
    public void onAccuracyChanged(Sensor sensor, int accuracy) {
    }

    AnalyticsSdkPlugin$startProximityEvents$listener$1(Sensor sensor, AnalyticsSdkPlugin analyticsSdkPlugin) {
        this.$sensor = sensor;
        this.this$0 = analyticsSdkPlugin;
    }

    @Override // android.hardware.SensorEventListener
    public void onSensorChanged(SensorEvent event) {
        Intrinsics.checkNotNullParameter(event, "event");
        float[] values = event.values;
        Intrinsics.checkNotNullExpressionValue(values, "values");
        Float fFirstOrNull = ArraysKt.firstOrNull(values);
        if (fFirstOrNull != null) {
            final boolean z = fFirstOrNull.floatValue() < this.$sensor.getMaximumRange();
            Handler handler = this.this$0.mainHandler;
            final AnalyticsSdkPlugin analyticsSdkPlugin = this.this$0;
            handler.post(new Runnable() { // from class: com.example.analytics_sdk.AnalyticsSdkPlugin$startProximityEvents$listener$1$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    AnalyticsSdkPlugin$startProximityEvents$listener$1.onSensorChanged$lambda$0(analyticsSdkPlugin, z);
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void onSensorChanged$lambda$0(AnalyticsSdkPlugin this$0, boolean z) {
        Intrinsics.checkNotNullParameter(this$0, "this$0");
        EventChannel.EventSink eventSink = this$0.proximityEventSink;
        if (eventSink != null) {
            eventSink.success(Integer.valueOf(z ? 1 : 0));
        }
    }
}
