package io.flutter.plugin.common;

import io.flutter.Log;
import io.flutter.plugin.common.StandardMessageCodec;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/* loaded from: classes2.dex */
public final class StandardMethodCodec implements MethodCodec {
    public static final StandardMethodCodec INSTANCE = new StandardMethodCodec(StandardMessageCodec.INSTANCE);
    private final StandardMessageCodec messageCodec;

    public StandardMethodCodec(StandardMessageCodec standardMessageCodec) {
        this.messageCodec = standardMessageCodec;
    }

    @Override // io.flutter.plugin.common.MethodCodec
    public ByteBuffer encodeMethodCall(MethodCall methodCall) {
        StandardMessageCodec.ExposedByteArrayOutputStream exposedByteArrayOutputStream = new StandardMessageCodec.ExposedByteArrayOutputStream();
        this.messageCodec.writeValue(exposedByteArrayOutputStream, methodCall.method);
        this.messageCodec.writeValue(exposedByteArrayOutputStream, methodCall.arguments);
        ByteBuffer byteBufferAllocateDirect = ByteBuffer.allocateDirect(exposedByteArrayOutputStream.size());
        byteBufferAllocateDirect.put(exposedByteArrayOutputStream.buffer(), 0, exposedByteArrayOutputStream.size());
        return byteBufferAllocateDirect;
    }

    @Override // io.flutter.plugin.common.MethodCodec
    public MethodCall decodeMethodCall(ByteBuffer byteBuffer) {
        byteBuffer.order(ByteOrder.nativeOrder());
        Object value = this.messageCodec.readValue(byteBuffer);
        Object value2 = this.messageCodec.readValue(byteBuffer);
        if ((value instanceof String) && !byteBuffer.hasRemaining()) {
            return new MethodCall((String) value, value2);
        }
        throw new IllegalArgumentException("Method call corrupted");
    }

    @Override // io.flutter.plugin.common.MethodCodec
    public ByteBuffer encodeSuccessEnvelope(Object obj) {
        StandardMessageCodec.ExposedByteArrayOutputStream exposedByteArrayOutputStream = new StandardMessageCodec.ExposedByteArrayOutputStream();
        exposedByteArrayOutputStream.write(0);
        this.messageCodec.writeValue(exposedByteArrayOutputStream, obj);
        ByteBuffer byteBufferAllocateDirect = ByteBuffer.allocateDirect(exposedByteArrayOutputStream.size());
        byteBufferAllocateDirect.put(exposedByteArrayOutputStream.buffer(), 0, exposedByteArrayOutputStream.size());
        return byteBufferAllocateDirect;
    }

    @Override // io.flutter.plugin.common.MethodCodec
    public ByteBuffer encodeErrorEnvelope(String str, String str2, Object obj) {
        StandardMessageCodec.ExposedByteArrayOutputStream exposedByteArrayOutputStream = new StandardMessageCodec.ExposedByteArrayOutputStream();
        exposedByteArrayOutputStream.write(1);
        this.messageCodec.writeValue(exposedByteArrayOutputStream, str);
        this.messageCodec.writeValue(exposedByteArrayOutputStream, str2);
        if (obj instanceof Throwable) {
            this.messageCodec.writeValue(exposedByteArrayOutputStream, Log.getStackTraceString((Throwable) obj));
        } else {
            this.messageCodec.writeValue(exposedByteArrayOutputStream, obj);
        }
        ByteBuffer byteBufferAllocateDirect = ByteBuffer.allocateDirect(exposedByteArrayOutputStream.size());
        byteBufferAllocateDirect.put(exposedByteArrayOutputStream.buffer(), 0, exposedByteArrayOutputStream.size());
        return byteBufferAllocateDirect;
    }

    @Override // io.flutter.plugin.common.MethodCodec
    public ByteBuffer encodeErrorEnvelopeWithStacktrace(String str, String str2, Object obj, String str3) {
        StandardMessageCodec.ExposedByteArrayOutputStream exposedByteArrayOutputStream = new StandardMessageCodec.ExposedByteArrayOutputStream();
        exposedByteArrayOutputStream.write(1);
        this.messageCodec.writeValue(exposedByteArrayOutputStream, str);
        this.messageCodec.writeValue(exposedByteArrayOutputStream, str2);
        if (obj instanceof Throwable) {
            this.messageCodec.writeValue(exposedByteArrayOutputStream, Log.getStackTraceString((Throwable) obj));
        } else {
            this.messageCodec.writeValue(exposedByteArrayOutputStream, obj);
        }
        this.messageCodec.writeValue(exposedByteArrayOutputStream, str3);
        ByteBuffer byteBufferAllocateDirect = ByteBuffer.allocateDirect(exposedByteArrayOutputStream.size());
        byteBufferAllocateDirect.put(exposedByteArrayOutputStream.buffer(), 0, exposedByteArrayOutputStream.size());
        return byteBufferAllocateDirect;
    }

    @Override // io.flutter.plugin.common.MethodCodec
    public Object decodeEnvelope(ByteBuffer byteBuffer) {
        byteBuffer.order(ByteOrder.nativeOrder());
        byte b = byteBuffer.get();
        if (b == 0) {
            Object value = this.messageCodec.readValue(byteBuffer);
            if (!byteBuffer.hasRemaining()) {
                return value;
            }
        } else {
            if (b == 1) {
            }
            throw new IllegalArgumentException("Envelope corrupted");
        }
        Object value2 = this.messageCodec.readValue(byteBuffer);
        Object value3 = this.messageCodec.readValue(byteBuffer);
        Object value4 = this.messageCodec.readValue(byteBuffer);
        if ((value2 instanceof String) && ((value3 == null || (value3 instanceof String)) && !byteBuffer.hasRemaining())) {
            throw new FlutterException((String) value2, (String) value3, value4);
        }
        throw new IllegalArgumentException("Envelope corrupted");
    }
}
