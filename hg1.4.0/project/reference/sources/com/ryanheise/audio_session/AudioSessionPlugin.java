package com.ryanheise.audio_session;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/* loaded from: classes2.dex */
public class AudioSessionPlugin implements FlutterPlugin, MethodChannel.MethodCallHandler {
    private static Map<?, ?> configuration;
    private static List<AudioSessionPlugin> instances = new ArrayList();
    private AndroidAudioManager androidAudioManager;
    private MethodChannel channel;

    @Override // io.flutter.embedding.engine.plugins.FlutterPlugin
    public void onAttachedToEngine(FlutterPlugin.FlutterPluginBinding flutterPluginBinding) {
        BinaryMessenger binaryMessenger = flutterPluginBinding.getBinaryMessenger();
        MethodChannel methodChannel = new MethodChannel(binaryMessenger, "com.ryanheise.audio_session");
        this.channel = methodChannel;
        methodChannel.setMethodCallHandler(this);
        this.androidAudioManager = new AndroidAudioManager(flutterPluginBinding.getApplicationContext(), binaryMessenger);
        instances.add(this);
    }

    @Override // io.flutter.embedding.engine.plugins.FlutterPlugin
    public void onDetachedFromEngine(FlutterPlugin.FlutterPluginBinding flutterPluginBinding) {
        this.channel.setMethodCallHandler(null);
        this.channel = null;
        this.androidAudioManager.dispose();
        this.androidAudioManager = null;
        instances.remove(this);
    }

    @Override // io.flutter.plugin.common.MethodChannel.MethodCallHandler
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        List list = (List) methodCall.arguments;
        String str = methodCall.method;
        str.hashCode();
        if (str.equals("setConfiguration")) {
            configuration = (Map) list.get(0);
            result.success(null);
            invokeMethod("onConfigurationChanged", configuration);
        } else if (str.equals("getConfiguration")) {
            result.success(configuration);
        } else {
            result.notImplemented();
        }
    }

    private void invokeMethod(String str, Object... objArr) {
        for (AudioSessionPlugin audioSessionPlugin : instances) {
            audioSessionPlugin.channel.invokeMethod(str, new ArrayList(Arrays.asList(objArr)));
        }
    }
}
