package dev.fluttercommunity.plus.sensors;

import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.SystemClock;
import io.flutter.plugin.common.EventChannel;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: StreamHandlerImpl.kt */
@Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0000\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0002\u0010\u0006J\u0010\u0010\u0013\u001a\u00020\u00102\u0006\u0010\u0014\u001a\u00020\u0015H\u0002J\u0010\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0004\u001a\u00020\u0005H\u0002J\u0012\u0010\u0018\u001a\u00020\u00192\b\u0010\u001a\u001a\u0004\u0018\u00010\u001bH\u0016J\u001a\u0010\u001c\u001a\u00020\u00192\b\u0010\u001a\u001a\u0004\u0018\u00010\u001b2\u0006\u0010\u0014\u001a\u00020\u0015H\u0016J\b\u0010\u001d\u001a\u00020\u0019H\u0002R$\u0010\b\u001a\u00020\u00052\u0006\u0010\u0007\u001a\u00020\u0005@FX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\t\u0010\n\"\u0004\b\u000b\u0010\fR\u0010\u0010\r\u001a\u0004\u0018\u00010\u000eX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u000f\u001a\u0004\u0018\u00010\u0010X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0012X\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006\u001e"}, d2 = {"Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;", "Lio/flutter/plugin/common/EventChannel$StreamHandler;", "sensorManager", "Landroid/hardware/SensorManager;", "sensorType", "", "(Landroid/hardware/SensorManager;I)V", "value", "samplingPeriod", "getSamplingPeriod", "()I", "setSamplingPeriod", "(I)V", "sensor", "Landroid/hardware/Sensor;", "sensorEventListener", "Landroid/hardware/SensorEventListener;", "timestampMicroAtBoot", "", "createSensorEventListener", "events", "Lio/flutter/plugin/common/EventChannel$EventSink;", "getSensorName", "", "onCancel", "", "arguments", "", "onListen", "updateRegistration", "sensors_plus_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class StreamHandlerImpl implements EventChannel.StreamHandler {
    private int samplingPeriod;
    private Sensor sensor;
    private SensorEventListener sensorEventListener;
    private final SensorManager sensorManager;
    private final int sensorType;
    private long timestampMicroAtBoot;

    public StreamHandlerImpl(SensorManager sensorManager, int i) {
        Intrinsics.checkNotNullParameter(sensorManager, "sensorManager");
        this.sensorManager = sensorManager;
        this.sensorType = i;
        long j = 1000;
        this.timestampMicroAtBoot = (System.currentTimeMillis() * j) - (SystemClock.elapsedRealtimeNanos() / j);
        this.samplingPeriod = 200000;
    }

    public final int getSamplingPeriod() {
        return this.samplingPeriod;
    }

    public final void setSamplingPeriod(int i) {
        this.samplingPeriod = i;
        updateRegistration();
    }

    @Override // io.flutter.plugin.common.EventChannel.StreamHandler
    public void onListen(Object arguments, EventChannel.EventSink events) {
        Intrinsics.checkNotNullParameter(events, "events");
        Sensor defaultSensor = this.sensorManager.getDefaultSensor(this.sensorType);
        this.sensor = defaultSensor;
        if (defaultSensor != null) {
            SensorEventListener sensorEventListenerCreateSensorEventListener = createSensorEventListener(events);
            this.sensorEventListener = sensorEventListenerCreateSensorEventListener;
            this.sensorManager.registerListener(sensorEventListenerCreateSensorEventListener, this.sensor, this.samplingPeriod);
        } else {
            events.error("NO_SENSOR", "Sensor not found", "It seems that your device has no " + getSensorName(this.sensorType) + " sensor");
        }
    }

    @Override // io.flutter.plugin.common.EventChannel.StreamHandler
    public void onCancel(Object arguments) {
        if (this.sensor != null) {
            this.sensorManager.unregisterListener(this.sensorEventListener);
            this.sensorEventListener = null;
        }
    }

    private final void updateRegistration() {
        SensorEventListener sensorEventListener = this.sensorEventListener;
        if (sensorEventListener != null) {
            this.sensorManager.unregisterListener(sensorEventListener);
            this.sensorManager.registerListener(this.sensorEventListener, this.sensor, this.samplingPeriod);
        }
    }

    private final String getSensorName(int sensorType) {
        if (sensorType == 1) {
            return "Accelerometer";
        }
        if (sensorType == 2) {
            return "Magnetometer";
        }
        if (sensorType == 4) {
            return "Gyroscope";
        }
        if (sensorType == 6) {
            return "Barometer";
        }
        if (sensorType == 10) {
            return "User Accelerometer";
        }
        return "Undefined";
    }

    private final SensorEventListener createSensorEventListener(final EventChannel.EventSink events) {
        return new SensorEventListener() { // from class: dev.fluttercommunity.plus.sensors.StreamHandlerImpl.createSensorEventListener.1
            @Override // android.hardware.SensorEventListener
            public void onAccuracyChanged(Sensor sensor, int accuracy) {
                Intrinsics.checkNotNullParameter(sensor, "sensor");
            }

            @Override // android.hardware.SensorEventListener
            public void onSensorChanged(SensorEvent event) {
                Intrinsics.checkNotNullParameter(event, "event");
                double[] dArr = new double[event.values.length + 1];
                float[] values = event.values;
                Intrinsics.checkNotNullExpressionValue(values, "values");
                int length = values.length;
                int i = 0;
                int i2 = 0;
                while (i < length) {
                    dArr[i2] = values[i];
                    i++;
                    i2++;
                }
                dArr[event.values.length] = StreamHandlerImpl.this.timestampMicroAtBoot + (event.timestamp / 1000);
                events.success(dArr);
            }
        };
    }
}
