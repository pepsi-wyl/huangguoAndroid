package androidx.webkit.internal;

import android.os.Handler;
import android.webkit.WebMessage;
import android.webkit.WebMessagePort;
import androidx.webkit.WebMessageCompat;
import androidx.webkit.WebMessagePortCompat;
import androidx.webkit.internal.ApiFeature;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Proxy;
import org.chromium.support_lib_boundary.WebMessagePortBoundaryInterface;
import org.chromium.support_lib_boundary.util.BoundaryInterfaceReflectionUtil;

/* loaded from: classes.dex */
public class WebMessagePortImpl extends WebMessagePortCompat {
    private WebMessagePortBoundaryInterface mBoundaryInterface;
    private WebMessagePort mFrameworksImpl;

    public WebMessagePortImpl(WebMessagePort webMessagePort) {
        this.mFrameworksImpl = webMessagePort;
    }

    public WebMessagePortImpl(InvocationHandler invocationHandler) {
        this.mBoundaryInterface = (WebMessagePortBoundaryInterface) BoundaryInterfaceReflectionUtil.castToSuppLibClass(WebMessagePortBoundaryInterface.class, invocationHandler);
    }

    private WebMessagePort getFrameworksImpl() {
        if (this.mFrameworksImpl == null) {
            this.mFrameworksImpl = WebViewGlueCommunicator.getCompatConverter().convertWebMessagePort(Proxy.getInvocationHandler(this.mBoundaryInterface));
        }
        return this.mFrameworksImpl;
    }

    private WebMessagePortBoundaryInterface getBoundaryInterface() {
        if (this.mBoundaryInterface == null) {
            this.mBoundaryInterface = (WebMessagePortBoundaryInterface) BoundaryInterfaceReflectionUtil.castToSuppLibClass(WebMessagePortBoundaryInterface.class, WebViewGlueCommunicator.getCompatConverter().convertWebMessagePort(this.mFrameworksImpl));
        }
        return this.mBoundaryInterface;
    }

    @Override // androidx.webkit.WebMessagePortCompat
    public void postMessage(WebMessageCompat webMessageCompat) {
        ApiFeature.M m = WebViewFeatureInternal.WEB_MESSAGE_PORT_POST_MESSAGE;
        if (m.isSupportedByFramework() && webMessageCompat.getType() == 0) {
            ApiHelperForM.postMessage(getFrameworksImpl(), compatToFrameworkMessage(webMessageCompat));
        } else {
            if (m.isSupportedByWebView() && WebMessageAdapter.isMessagePayloadTypeSupportedByWebView(webMessageCompat.getType())) {
                getBoundaryInterface().postMessage(BoundaryInterfaceReflectionUtil.createInvocationHandlerFor(new WebMessageAdapter(webMessageCompat)));
                return;
            }
            throw WebViewFeatureInternal.getUnsupportedOperationException();
        }
    }

    @Override // androidx.webkit.WebMessagePortCompat
    public void close() {
        ApiFeature.M m = WebViewFeatureInternal.WEB_MESSAGE_PORT_CLOSE;
        if (m.isSupportedByFramework()) {
            ApiHelperForM.close(getFrameworksImpl());
        } else {
            if (m.isSupportedByWebView()) {
                getBoundaryInterface().close();
                return;
            }
            throw WebViewFeatureInternal.getUnsupportedOperationException();
        }
    }

    @Override // androidx.webkit.WebMessagePortCompat
    public void setWebMessageCallback(WebMessagePortCompat.WebMessageCallbackCompat webMessageCallbackCompat) {
        ApiFeature.M m = WebViewFeatureInternal.WEB_MESSAGE_PORT_SET_MESSAGE_CALLBACK;
        if (m.isSupportedByWebView()) {
            getBoundaryInterface().setWebMessageCallback(BoundaryInterfaceReflectionUtil.createInvocationHandlerFor(new WebMessageCallbackAdapter(webMessageCallbackCompat)));
        } else {
            if (m.isSupportedByFramework()) {
                ApiHelperForM.setWebMessageCallback(getFrameworksImpl(), webMessageCallbackCompat);
                return;
            }
            throw WebViewFeatureInternal.getUnsupportedOperationException();
        }
    }

    @Override // androidx.webkit.WebMessagePortCompat
    public void setWebMessageCallback(Handler handler, WebMessagePortCompat.WebMessageCallbackCompat webMessageCallbackCompat) {
        ApiFeature.M m = WebViewFeatureInternal.CREATE_WEB_MESSAGE_CHANNEL;
        if (m.isSupportedByWebView()) {
            getBoundaryInterface().setWebMessageCallback(BoundaryInterfaceReflectionUtil.createInvocationHandlerFor(new WebMessageCallbackAdapter(webMessageCallbackCompat)), handler);
        } else {
            if (m.isSupportedByFramework()) {
                ApiHelperForM.setWebMessageCallback(getFrameworksImpl(), webMessageCallbackCompat, handler);
                return;
            }
            throw WebViewFeatureInternal.getUnsupportedOperationException();
        }
    }

    @Override // androidx.webkit.WebMessagePortCompat
    public WebMessagePort getFrameworkPort() {
        return getFrameworksImpl();
    }

    @Override // androidx.webkit.WebMessagePortCompat
    public InvocationHandler getInvocationHandler() {
        return Proxy.getInvocationHandler(getBoundaryInterface());
    }

    public static WebMessagePortCompat[] portsToCompat(WebMessagePort[] webMessagePortArr) {
        if (webMessagePortArr == null) {
            return null;
        }
        WebMessagePortCompat[] webMessagePortCompatArr = new WebMessagePortCompat[webMessagePortArr.length];
        for (int i = 0; i < webMessagePortArr.length; i++) {
            webMessagePortCompatArr[i] = new WebMessagePortImpl(webMessagePortArr[i]);
        }
        return webMessagePortCompatArr;
    }

    public static WebMessagePort[] compatToPorts(WebMessagePortCompat[] webMessagePortCompatArr) {
        if (webMessagePortCompatArr == null) {
            return null;
        }
        int length = webMessagePortCompatArr.length;
        WebMessagePort[] webMessagePortArr = new WebMessagePort[length];
        for (int i = 0; i < length; i++) {
            webMessagePortArr[i] = webMessagePortCompatArr[i].getFrameworkPort();
        }
        return webMessagePortArr;
    }

    public static WebMessage compatToFrameworkMessage(WebMessageCompat webMessageCompat) {
        return ApiHelperForM.createWebMessage(webMessageCompat);
    }

    public static WebMessageCompat frameworkMessageToCompat(WebMessage webMessage) {
        return ApiHelperForM.createWebMessageCompat(webMessage);
    }
}
