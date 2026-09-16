package defpackage;

import androidx.media3.extractor.ts.TsExtractor;
import io.flutter.plugin.common.StandardMessageCodec;
import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: WakelockPlusMessages.g.kt */
@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0005\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0012\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J\u001a\u0010\u0003\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\bH\u0014J\u001a\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\f2\b\u0010\r\u001a\u0004\u0018\u00010\u0004H\u0014¨\u0006\u000e"}, d2 = {"LWakelockPlusMessagesPigeonCodec;", "Lio/flutter/plugin/common/StandardMessageCodec;", "()V", "readValueOfType", "", "type", "", "buffer", "Ljava/nio/ByteBuffer;", "writeValue", "", "stream", "Ljava/io/ByteArrayOutputStream;", "value", "wakelock_plus_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
class WakelockPlusMessagesPigeonCodec extends StandardMessageCodec {
    @Override // io.flutter.plugin.common.StandardMessageCodec
    protected Object readValueOfType(byte type, ByteBuffer buffer) {
        Intrinsics.checkNotNullParameter(buffer, "buffer");
        if (type == -127) {
            Object value = readValue(buffer);
            List<? extends Object> list = value instanceof List ? (List) value : null;
            if (list != null) {
                return ToggleMessage.INSTANCE.fromList(list);
            }
            return null;
        }
        if (type == -126) {
            Object value2 = readValue(buffer);
            List<? extends Object> list2 = value2 instanceof List ? (List) value2 : null;
            if (list2 != null) {
                return IsEnabledMessage.INSTANCE.fromList(list2);
            }
            return null;
        }
        return super.readValueOfType(type, buffer);
    }

    @Override // io.flutter.plugin.common.StandardMessageCodec
    protected void writeValue(ByteArrayOutputStream stream, Object value) {
        Intrinsics.checkNotNullParameter(stream, "stream");
        if (value instanceof ToggleMessage) {
            stream.write(TsExtractor.TS_STREAM_TYPE_AC3);
            writeValue(stream, ((ToggleMessage) value).toList());
        } else if (value instanceof IsEnabledMessage) {
            stream.write(TsExtractor.TS_STREAM_TYPE_HDMV_DTS);
            writeValue(stream, ((IsEnabledMessage) value).toList());
        } else {
            super.writeValue(stream, value);
        }
    }
}
