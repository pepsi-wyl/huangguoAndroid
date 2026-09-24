package dev.fluttercommunity.plus.connectivity;

import android.content.Context;
import android.net.ConnectivityManager;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodChannel;

/* loaded from: classes2.dex */
public class ConnectivityPlugin implements FlutterPlugin {
    private EventChannel eventChannel;
    private MethodChannel methodChannel;
    private ConnectivityBroadcastReceiver receiver;

    @Override // io.flutter.embedding.engine.plugins.FlutterPlugin
    public void onAttachedToEngine(FlutterPlugin.FlutterPluginBinding flutterPluginBinding) {
        setupChannels(flutterPluginBinding.getBinaryMessenger(), flutterPluginBinding.getApplicationContext());
    }

    @Override // io.flutter.embedding.engine.plugins.FlutterPlugin
    public void onDetachedFromEngine(FlutterPlugin.FlutterPluginBinding flutterPluginBinding) {
        teardownChannels();
    }

    private void setupChannels(BinaryMessenger binaryMessenger, Context context) {
        this.methodChannel = new MethodChannel(binaryMessenger, "dev.fluttercommunity.plus/connectivity");
        this.eventChannel = new EventChannel(binaryMessenger, "dev.fluttercommunity.plus/connectivity_status");
        Connectivity connectivity = new Connectivity((ConnectivityManager) context.getSystemService("connectivity"));
        ConnectivityMethodChannelHandler connectivityMethodChannelHandler = new ConnectivityMethodChannelHandler(connectivity);
        this.receiver = new ConnectivityBroadcastReceiver(context, connectivity);
        this.methodChannel.setMethodCallHandler(connectivityMethodChannelHandler);
        this.eventChannel.setStreamHandler(this.receiver);
    }

    private void teardownChannels() {
        this.methodChannel.setMethodCallHandler(null);
        this.eventChannel.setStreamHandler(null);
        this.receiver.onCancel(null);
        this.methodChannel = null;
        this.eventChannel = null;
        this.receiver = null;
    }
}
