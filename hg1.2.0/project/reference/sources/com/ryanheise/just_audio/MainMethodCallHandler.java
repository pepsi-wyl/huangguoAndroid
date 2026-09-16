package com.ryanheise.just_audio;

import android.content.Context;
import androidx.media3.extractor.text.ttml.TtmlNode;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: classes2.dex */
public class MainMethodCallHandler implements MethodChannel.MethodCallHandler {
    private final Context applicationContext;
    private final BinaryMessenger messenger;
    private final Map<String, AudioPlayer> players = new HashMap();

    public MainMethodCallHandler(Context context, BinaryMessenger binaryMessenger) {
        this.applicationContext = context;
        this.messenger = binaryMessenger;
    }

    @Override // io.flutter.plugin.common.MethodChannel.MethodCallHandler
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        String str = methodCall.method;
        str.hashCode();
        switch (str) {
            case "init":
                String str2 = (String) methodCall.argument(TtmlNode.ATTR_ID);
                if (this.players.containsKey(str2)) {
                    result.error("Platform player " + str2 + " already exists", null, null);
                    break;
                } else {
                    this.players.put(str2, new AudioPlayer(this.applicationContext, this.messenger, str2, (Map) methodCall.argument("audioLoadConfiguration"), (List) methodCall.argument("androidAudioEffects"), (Boolean) methodCall.argument("androidOffloadSchedulingEnabled")));
                    result.success(null);
                    break;
                }
            case "disposePlayer":
                String str3 = (String) methodCall.argument(TtmlNode.ATTR_ID);
                AudioPlayer audioPlayer = this.players.get(str3);
                if (audioPlayer != null) {
                    audioPlayer.dispose();
                    this.players.remove(str3);
                }
                result.success(new HashMap());
                break;
            case "disposeAllPlayers":
                dispose();
                result.success(new HashMap());
                break;
            default:
                result.notImplemented();
                break;
        }
    }

    void dispose() {
        Iterator it = new ArrayList(this.players.values()).iterator();
        while (it.hasNext()) {
            ((AudioPlayer) it.next()).dispose();
        }
        this.players.clear();
    }
}
