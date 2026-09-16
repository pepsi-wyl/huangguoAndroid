package io.flutter.embedding.engine.systemchannels;

import android.view.KeyEvent;
import io.flutter.Log;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.JSONMessageCodec;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class KeyEventChannel {
    private static final String TAG = "KeyEventChannel";
    public final BasicMessageChannel<Object> channel;

    public interface EventResponseHandler {
        void onFrameworkResponse(boolean z);
    }

    public KeyEventChannel(BinaryMessenger binaryMessenger) {
        this.channel = new BasicMessageChannel<>(binaryMessenger, "flutter/keyevent", JSONMessageCodec.INSTANCE);
    }

    public void sendFlutterKeyEvent(FlutterKeyEvent flutterKeyEvent, boolean z, EventResponseHandler eventResponseHandler) {
        this.channel.send(encodeKeyEvent(flutterKeyEvent, z), createReplyHandler(eventResponseHandler));
    }

    private Map<String, Object> encodeKeyEvent(FlutterKeyEvent flutterKeyEvent, boolean z) {
        HashMap map = new HashMap();
        map.put("type", z ? "keyup" : "keydown");
        map.put("keymap", "android");
        map.put("flags", Integer.valueOf(flutterKeyEvent.event.getFlags()));
        map.put("plainCodePoint", Integer.valueOf(flutterKeyEvent.event.getUnicodeChar(0)));
        map.put("codePoint", Integer.valueOf(flutterKeyEvent.event.getUnicodeChar()));
        map.put("keyCode", Integer.valueOf(flutterKeyEvent.event.getKeyCode()));
        map.put("scanCode", Integer.valueOf(flutterKeyEvent.event.getScanCode()));
        map.put("metaState", Integer.valueOf(flutterKeyEvent.event.getMetaState()));
        if (flutterKeyEvent.complexCharacter != null) {
            map.put("character", flutterKeyEvent.complexCharacter.toString());
        }
        map.put("source", Integer.valueOf(flutterKeyEvent.event.getSource()));
        map.put("deviceId", Integer.valueOf(flutterKeyEvent.event.getDeviceId()));
        map.put("repeatCount", Integer.valueOf(flutterKeyEvent.event.getRepeatCount()));
        return map;
    }

    private static BasicMessageChannel.Reply<Object> createReplyHandler(final EventResponseHandler eventResponseHandler) {
        return new BasicMessageChannel.Reply() { // from class: io.flutter.embedding.engine.systemchannels.KeyEventChannel$$ExternalSyntheticLambda0
            @Override // io.flutter.plugin.common.BasicMessageChannel.Reply
            public final void reply(Object obj) throws JSONException {
                KeyEventChannel.lambda$createReplyHandler$0(eventResponseHandler, obj);
            }
        };
    }

    static /* synthetic */ void lambda$createReplyHandler$0(EventResponseHandler eventResponseHandler, Object obj) throws JSONException {
        boolean z = false;
        if (obj != null) {
            try {
                z = ((JSONObject) obj).getBoolean("handled");
            } catch (JSONException e) {
                Log.e(TAG, "Unable to unpack JSON message: " + e);
            }
        }
        eventResponseHandler.onFrameworkResponse(z);
    }

    public static class FlutterKeyEvent {
        public final Character complexCharacter;
        public final KeyEvent event;

        public FlutterKeyEvent(KeyEvent keyEvent) {
            this(keyEvent, null);
        }

        public FlutterKeyEvent(KeyEvent keyEvent, Character ch) {
            this.event = keyEvent;
            this.complexCharacter = ch;
        }
    }
}
