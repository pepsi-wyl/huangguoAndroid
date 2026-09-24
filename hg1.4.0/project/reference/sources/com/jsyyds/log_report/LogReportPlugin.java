package com.jsyyds.log_report;

import androidx.core.app.NotificationCompat;
import androidx.webkit.ProxyConfig;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import java.io.IOException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.ProxySelector;
import java.net.SocketAddress;
import java.net.URI;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.StringsKt;
import tv.danmaku.ijk.media.player.IjkMediaPlayer;

/* compiled from: LogReportPlugin.kt */
@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\u0018\u0000 \u00102\u00020\u00012\u00020\u0002:\u0002\u0010\u0011B\u0005¢\u0006\u0002\u0010\u0003J\u0012\u0010\u0006\u001a\u00020\u00072\b\b\u0001\u0010\b\u001a\u00020\tH\u0016J\u0012\u0010\n\u001a\u00020\u00072\b\b\u0001\u0010\b\u001a\u00020\tH\u0016J\u001c\u0010\u000b\u001a\u00020\u00072\b\b\u0001\u0010\f\u001a\u00020\r2\b\b\u0001\u0010\u000e\u001a\u00020\u000fH\u0016R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082.¢\u0006\u0002\n\u0000¨\u0006\u0012"}, d2 = {"Lcom/jsyyds/log_report/LogReportPlugin;", "Lio/flutter/embedding/engine/plugins/FlutterPlugin;", "Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;", "()V", "channel", "Lio/flutter/plugin/common/MethodChannel;", "onAttachedToEngine", "", "binding", "Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;", "onDetachedFromEngine", "onMethodCall", NotificationCompat.CATEGORY_CALL, "Lio/flutter/plugin/common/MethodCall;", "result", "Lio/flutter/plugin/common/MethodChannel$Result;", "Companion", "PinnedProxySelector", "log_report_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class LogReportPlugin implements FlutterPlugin, MethodChannel.MethodCallHandler {

    @Deprecated
    public static final String CHANNEL = "log_report/native_proxy";
    private static final Companion Companion = new Companion(null);
    private static volatile PinnedProxySelector installed;
    private MethodChannel channel;

    @Override // io.flutter.embedding.engine.plugins.FlutterPlugin
    public void onAttachedToEngine(FlutterPlugin.FlutterPluginBinding binding) {
        Intrinsics.checkNotNullParameter(binding, "binding");
        MethodChannel methodChannel = new MethodChannel(binding.getBinaryMessenger(), CHANNEL);
        this.channel = methodChannel;
        methodChannel.setMethodCallHandler(this);
    }

    @Override // io.flutter.embedding.engine.plugins.FlutterPlugin
    public void onDetachedFromEngine(FlutterPlugin.FlutterPluginBinding binding) {
        Intrinsics.checkNotNullParameter(binding, "binding");
        MethodChannel methodChannel = this.channel;
        if (methodChannel == null) {
            Intrinsics.throwUninitializedPropertyAccessException("channel");
            methodChannel = null;
        }
        methodChannel.setMethodCallHandler(null);
        Companion.uninstall();
    }

    @Override // io.flutter.plugin.common.MethodChannel.MethodCallHandler
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        Intrinsics.checkNotNullParameter(call, "call");
        Intrinsics.checkNotNullParameter(result, "result");
        String str = call.method;
        if (Intrinsics.areEqual(str, "enableProxy")) {
            Integer num = (Integer) call.argument(IjkMediaPlayer.OnNativeInvokeListener.ARG_PORT);
            if (num == null || num.intValue() <= 0) {
                result.error("bad_port", "port 缺失或非法: " + num, null);
                return;
            } else {
                Companion.install(num.intValue());
                result.success(true);
                return;
            }
        }
        if (Intrinsics.areEqual(str, "disableProxy")) {
            Companion.uninstall();
            result.success(true);
        } else {
            result.notImplemented();
        }
    }

    /* compiled from: LogReportPlugin.kt */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0082\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u000e\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\nJ\u0006\u0010\u000b\u001a\u00020\bR\u000e\u0010\u0003\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u0010\u0010\u0005\u001a\u0004\u0018\u00010\u0006X\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006\f"}, d2 = {"Lcom/jsyyds/log_report/LogReportPlugin$Companion;", "", "()V", "CHANNEL", "", "installed", "Lcom/jsyyds/log_report/LogReportPlugin$PinnedProxySelector;", "install", "", IjkMediaPlayer.OnNativeInvokeListener.ARG_PORT, "", "uninstall", "log_report_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    private static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        public final synchronized void install(int port) {
            ProxySelector previous = ProxySelector.getDefault();
            if (previous instanceof PinnedProxySelector) {
                previous = ((PinnedProxySelector) previous).getPrevious();
            }
            PinnedProxySelector pinnedProxySelector = new PinnedProxySelector(previous, port);
            LogReportPlugin.installed = pinnedProxySelector;
            ProxySelector.setDefault(pinnedProxySelector);
        }

        public final synchronized void uninstall() {
            PinnedProxySelector pinnedProxySelector = LogReportPlugin.installed;
            if (pinnedProxySelector == null) {
                return;
            }
            LogReportPlugin.installed = null;
            if (ProxySelector.getDefault() == pinnedProxySelector) {
                ProxySelector.setDefault(pinnedProxySelector.getPrevious());
            }
        }
    }

    /* compiled from: LogReportPlugin.kt */
    @Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\b\u0002\u0018\u00002\u00020\u0001B\u0017\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0001\u0012\u0006\u0010\u0003\u001a\u00020\u0004¢\u0006\u0002\u0010\u0005J&\u0010\u000b\u001a\u00020\f2\b\u0010\r\u001a\u0004\u0018\u00010\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0012H\u0016J\u0010\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u0016H\u0002J\u0018\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\n0\t2\b\u0010\r\u001a\u0004\u0018\u00010\u000eH\u0002J\u0018\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\n0\t2\b\u0010\r\u001a\u0004\u0018\u00010\u000eH\u0016R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0001¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\b\u0012\u0004\u0012\u00020\n0\tX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0019"}, d2 = {"Lcom/jsyyds/log_report/LogReportPlugin$PinnedProxySelector;", "Ljava/net/ProxySelector;", "previous", IjkMediaPlayer.OnNativeInvokeListener.ARG_PORT, "", "(Ljava/net/ProxySelector;I)V", "getPrevious", "()Ljava/net/ProxySelector;", "proxies", "", "Ljava/net/Proxy;", "connectFailed", "", "uri", "Ljava/net/URI;", "sa", "Ljava/net/SocketAddress;", "ioe", "Ljava/io/IOException;", "isLoopback", "", "host", "", "passThrough", "select", "log_report_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    private static final class PinnedProxySelector extends ProxySelector {
        private final ProxySelector previous;
        private final List<Proxy> proxies;

        public final ProxySelector getPrevious() {
            return this.previous;
        }

        public PinnedProxySelector(ProxySelector proxySelector, int i) {
            this.previous = proxySelector;
            this.proxies = CollectionsKt.listOf(new Proxy(Proxy.Type.HTTP, new InetSocketAddress(InetAddress.getByAddress(new byte[]{127, 0, 0, 1}), i)));
        }

        @Override // java.net.ProxySelector
        public List<Proxy> select(URI uri) {
            String host;
            if (uri == null) {
                return passThrough(null);
            }
            if (StringsKt.equals(ProxyConfig.MATCH_HTTPS, uri.getScheme(), true) && (host = uri.getHost()) != null && !isLoopback(host)) {
                return this.proxies;
            }
            return passThrough(uri);
        }

        @Override // java.net.ProxySelector
        public void connectFailed(URI uri, SocketAddress sa, IOException ioe) {
            ProxySelector proxySelector = this.previous;
            if (proxySelector != null) {
                proxySelector.connectFailed(uri, sa, ioe);
            }
        }

        private final List<Proxy> passThrough(URI uri) {
            ProxySelector proxySelector = this.previous;
            List<Proxy> listSelect = proxySelector != null ? proxySelector.select(uri) : null;
            return listSelect == null ? CollectionsKt.listOf(Proxy.NO_PROXY) : listSelect;
        }

        private final boolean isLoopback(String host) {
            return Intrinsics.areEqual(host, "127.0.0.1") || Intrinsics.areEqual(host, "localhost") || Intrinsics.areEqual(host, "::1") || Intrinsics.areEqual(host, "[::1]");
        }
    }
}
