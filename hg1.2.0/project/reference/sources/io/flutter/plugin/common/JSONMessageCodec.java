package io.flutter.plugin.common;

import java.nio.ByteBuffer;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

/* loaded from: classes2.dex */
public final class JSONMessageCodec implements MessageCodec<Object> {
    public static final JSONMessageCodec INSTANCE = new JSONMessageCodec();

    private JSONMessageCodec() {
    }

    @Override // io.flutter.plugin.common.MessageCodec
    public ByteBuffer encodeMessage(Object obj) throws JSONException {
        if (obj == null) {
            return null;
        }
        Object objWrap = JSONUtil.wrap(obj);
        if (objWrap instanceof String) {
            return StringCodec.INSTANCE.encodeMessage(JSONObject.quote((String) objWrap));
        }
        return StringCodec.INSTANCE.encodeMessage(objWrap.toString());
    }

    @Override // io.flutter.plugin.common.MessageCodec
    public Object decodeMessage(ByteBuffer byteBuffer) throws JSONException {
        if (byteBuffer == null) {
            return null;
        }
        try {
            JSONTokener jSONTokener = new JSONTokener(StringCodec.INSTANCE.decodeMessage(byteBuffer));
            Object objNextValue = jSONTokener.nextValue();
            if (jSONTokener.more()) {
                throw new IllegalArgumentException("Invalid JSON");
            }
            return objNextValue;
        } catch (JSONException e) {
            throw new IllegalArgumentException("Invalid JSON", e);
        }
    }
}
