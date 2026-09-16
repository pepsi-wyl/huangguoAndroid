package androidx.webkit.internal;

import androidx.webkit.ProxyConfig;
import androidx.webkit.ProxyController;
import androidx.webkit.internal.ApiFeature;
import java.lang.reflect.Array;
import java.util.List;
import java.util.concurrent.Executor;
import org.chromium.support_lib_boundary.ProxyControllerBoundaryInterface;

/* loaded from: classes.dex */
public class ProxyControllerImpl extends ProxyController {
    private ProxyControllerBoundaryInterface mBoundaryInterface;

    @Override // androidx.webkit.ProxyController
    public void setProxyOverride(ProxyConfig proxyConfig, Executor executor, Runnable runnable) {
        ApiFeature.NoFramework noFramework = WebViewFeatureInternal.PROXY_OVERRIDE;
        ApiFeature.NoFramework noFramework2 = WebViewFeatureInternal.PROXY_OVERRIDE_REVERSE_BYPASS;
        String[][] strArrProxyRulesToStringArray = proxyRulesToStringArray(proxyConfig.getProxyRules());
        String[] strArr = (String[]) proxyConfig.getBypassRules().toArray(new String[0]);
        if (noFramework.isSupportedByWebView() && !proxyConfig.isReverseBypassEnabled()) {
            getBoundaryInterface().setProxyOverride(strArrProxyRulesToStringArray, strArr, runnable, executor);
        } else {
            if (noFramework.isSupportedByWebView() && noFramework2.isSupportedByWebView()) {
                getBoundaryInterface().setProxyOverride(strArrProxyRulesToStringArray, strArr, runnable, executor, proxyConfig.isReverseBypassEnabled());
                return;
            }
            throw WebViewFeatureInternal.getUnsupportedOperationException();
        }
    }

    @Override // androidx.webkit.ProxyController
    public void clearProxyOverride(Executor executor, Runnable runnable) {
        if (WebViewFeatureInternal.PROXY_OVERRIDE.isSupportedByWebView()) {
            getBoundaryInterface().clearProxyOverride(runnable, executor);
            return;
        }
        throw WebViewFeatureInternal.getUnsupportedOperationException();
    }

    public static String[][] proxyRulesToStringArray(List<ProxyConfig.ProxyRule> list) {
        String[][] strArr = (String[][]) Array.newInstance((Class<?>) String.class, list.size(), 2);
        for (int i = 0; i < list.size(); i++) {
            strArr[i][0] = list.get(i).getSchemeFilter();
            strArr[i][1] = list.get(i).getUrl();
        }
        return strArr;
    }

    private ProxyControllerBoundaryInterface getBoundaryInterface() {
        if (this.mBoundaryInterface == null) {
            this.mBoundaryInterface = WebViewGlueCommunicator.getFactory().getProxyController();
        }
        return this.mBoundaryInterface;
    }
}
