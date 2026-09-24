package dev.fluttercommunity.plus.connectivity;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import io.flutter.plugin.common.EventChannel;
import java.util.List;

/* loaded from: classes2.dex */
public class ConnectivityBroadcastReceiver extends BroadcastReceiver implements EventChannel.StreamHandler {
    public static final String CONNECTIVITY_ACTION = "android.net.conn.CONNECTIVITY_CHANGE";
    private final Connectivity connectivity;
    private final Context context;
    private EventChannel.EventSink events;
    private final Handler mainHandler = new Handler(Looper.getMainLooper());
    private ConnectivityManager.NetworkCallback networkCallback;

    public ConnectivityBroadcastReceiver(Context context, Connectivity connectivity) {
        this.context = context;
        this.connectivity = connectivity;
    }

    @Override // io.flutter.plugin.common.EventChannel.StreamHandler
    public void onListen(Object obj, EventChannel.EventSink eventSink) {
        this.events = eventSink;
        if (Build.VERSION.SDK_INT >= 24) {
            this.networkCallback = new ConnectivityManager.NetworkCallback() { // from class: dev.fluttercommunity.plus.connectivity.ConnectivityBroadcastReceiver.1
                @Override // android.net.ConnectivityManager.NetworkCallback
                public void onAvailable(Network network) {
                    ConnectivityBroadcastReceiver connectivityBroadcastReceiver = ConnectivityBroadcastReceiver.this;
                    connectivityBroadcastReceiver.sendEvent(connectivityBroadcastReceiver.connectivity.getCapabilitiesFromNetwork(network));
                }

                @Override // android.net.ConnectivityManager.NetworkCallback
                public void onCapabilitiesChanged(Network network, NetworkCapabilities networkCapabilities) {
                    ConnectivityBroadcastReceiver connectivityBroadcastReceiver = ConnectivityBroadcastReceiver.this;
                    connectivityBroadcastReceiver.sendEvent(connectivityBroadcastReceiver.connectivity.getCapabilitiesList(networkCapabilities));
                }

                @Override // android.net.ConnectivityManager.NetworkCallback
                public void onLost(Network network) {
                    ConnectivityBroadcastReceiver.this.sendCurrentStatusWithDelay();
                }
            };
            this.connectivity.getConnectivityManager().registerDefaultNetworkCallback(this.networkCallback);
        } else {
            this.context.registerReceiver(this, new IntentFilter(CONNECTIVITY_ACTION));
        }
        sendEvent(this.connectivity.getNetworkTypes());
    }

    @Override // io.flutter.plugin.common.EventChannel.StreamHandler
    public void onCancel(Object obj) {
        if (Build.VERSION.SDK_INT >= 24) {
            if (this.networkCallback != null) {
                this.connectivity.getConnectivityManager().unregisterNetworkCallback(this.networkCallback);
                this.networkCallback = null;
                return;
            }
            return;
        }
        try {
            this.context.unregisterReceiver(this);
        } catch (Exception unused) {
        }
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        EventChannel.EventSink eventSink = this.events;
        if (eventSink != null) {
            eventSink.success(this.connectivity.getNetworkTypes());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$sendEvent$0(List list) {
        this.events.success(list);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sendEvent(final List<String> list) {
        this.mainHandler.post(new Runnable() { // from class: dev.fluttercommunity.plus.connectivity.ConnectivityBroadcastReceiver$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.lambda$sendEvent$0(list);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$sendCurrentStatusWithDelay$1() {
        this.events.success(this.connectivity.getNetworkTypes());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sendCurrentStatusWithDelay() {
        this.mainHandler.postDelayed(new Runnable() { // from class: dev.fluttercommunity.plus.connectivity.ConnectivityBroadcastReceiver$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.lambda$sendCurrentStatusWithDelay$1();
            }
        }, 500L);
    }
}
