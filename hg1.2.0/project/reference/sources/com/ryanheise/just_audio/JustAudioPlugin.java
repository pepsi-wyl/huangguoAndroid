package com.ryanheise.just_audio;

import android.content.Context;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodChannel;

/* loaded from: classes2.dex */
public class JustAudioPlugin implements FlutterPlugin {
    private MethodChannel channel;
    private MainMethodCallHandler methodCallHandler;

    @Override // io.flutter.embedding.engine.plugins.FlutterPlugin
    public void onAttachedToEngine(FlutterPlugin.FlutterPluginBinding flutterPluginBinding) {
        Context applicationContext = flutterPluginBinding.getApplicationContext();
        BinaryMessenger binaryMessenger = flutterPluginBinding.getBinaryMessenger();
        this.methodCallHandler = new MainMethodCallHandler(applicationContext, binaryMessenger);
        MethodChannel methodChannel = new MethodChannel(binaryMessenger, "com.ryanheise.just_audio.methods");
        this.channel = methodChannel;
        methodChannel.setMethodCallHandler(this.methodCallHandler);
        flutterPluginBinding.getFlutterEngine().addEngineLifecycleListener(new FlutterEngine.EngineLifecycleListener() { // from class: com.ryanheise.just_audio.JustAudioPlugin.1
            @Override // io.flutter.embedding.engine.FlutterEngine.EngineLifecycleListener
            public void onEngineWillDestroy() {
            }

            @Override // io.flutter.embedding.engine.FlutterEngine.EngineLifecycleListener
            public void onPreEngineRestart() {
                JustAudioPlugin.this.methodCallHandler.dispose();
            }
        });
    }

    @Override // io.flutter.embedding.engine.plugins.FlutterPlugin
    public void onDetachedFromEngine(FlutterPlugin.FlutterPluginBinding flutterPluginBinding) {
        this.methodCallHandler.dispose();
        this.methodCallHandler = null;
        this.channel.setMethodCallHandler(null);
    }
}
