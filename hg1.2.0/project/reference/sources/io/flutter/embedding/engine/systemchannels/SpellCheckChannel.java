package io.flutter.embedding.engine.systemchannels;

import io.flutter.Log;
import io.flutter.embedding.engine.dart.DartExecutor;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.StandardMethodCodec;
import java.util.ArrayList;
import tv.danmaku.ijk.media.player.IjkMediaPlayer;

/* loaded from: classes2.dex */
public class SpellCheckChannel {
    private static final String TAG = "SpellCheckChannel";
    public final MethodChannel channel;
    public final MethodChannel.MethodCallHandler parsingMethodHandler;
    private SpellCheckMethodHandler spellCheckMethodHandler;

    public interface SpellCheckMethodHandler {
        void initiateSpellCheck(String str, String str2, MethodChannel.Result result);
    }

    public SpellCheckChannel(DartExecutor dartExecutor) {
        MethodChannel.MethodCallHandler methodCallHandler = new MethodChannel.MethodCallHandler() { // from class: io.flutter.embedding.engine.systemchannels.SpellCheckChannel.1
            @Override // io.flutter.plugin.common.MethodChannel.MethodCallHandler
            public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                if (SpellCheckChannel.this.spellCheckMethodHandler == null) {
                    Log.v(SpellCheckChannel.TAG, "No SpellCheckeMethodHandler registered, call not forwarded to spell check API.");
                    return;
                }
                String str = methodCall.method;
                Object obj = methodCall.arguments;
                Log.v(SpellCheckChannel.TAG, "Received '" + str + "' message.");
                str.hashCode();
                if (str.equals("SpellCheck.initiateSpellCheck")) {
                    try {
                        ArrayList arrayList = (ArrayList) obj;
                        SpellCheckChannel.this.spellCheckMethodHandler.initiateSpellCheck((String) arrayList.get(0), (String) arrayList.get(1), result);
                        return;
                    } catch (IllegalStateException e) {
                        result.error(IjkMediaPlayer.OnNativeInvokeListener.ARG_ERROR, e.getMessage(), null);
                        return;
                    }
                }
                result.notImplemented();
            }
        };
        this.parsingMethodHandler = methodCallHandler;
        MethodChannel methodChannel = new MethodChannel(dartExecutor, "flutter/spellcheck", StandardMethodCodec.INSTANCE);
        this.channel = methodChannel;
        methodChannel.setMethodCallHandler(methodCallHandler);
    }

    public void setSpellCheckMethodHandler(SpellCheckMethodHandler spellCheckMethodHandler) {
        this.spellCheckMethodHandler = spellCheckMethodHandler;
    }
}
