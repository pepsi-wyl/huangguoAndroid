package androidx.webkit.internal;

import androidx.webkit.JavaScriptReplyProxy;
import java.lang.reflect.InvocationHandler;
import java.util.Objects;
import java.util.concurrent.Callable;
import org.chromium.support_lib_boundary.JsReplyProxyBoundaryInterface;
import org.chromium.support_lib_boundary.util.BoundaryInterfaceReflectionUtil;

/* loaded from: classes.dex */
public class JavaScriptReplyProxyImpl extends JavaScriptReplyProxy {
    private JsReplyProxyBoundaryInterface mBoundaryInterface;

    public JavaScriptReplyProxyImpl(JsReplyProxyBoundaryInterface jsReplyProxyBoundaryInterface) {
        this.mBoundaryInterface = jsReplyProxyBoundaryInterface;
    }

    public static JavaScriptReplyProxyImpl forInvocationHandler(InvocationHandler invocationHandler) {
        final JsReplyProxyBoundaryInterface jsReplyProxyBoundaryInterface = (JsReplyProxyBoundaryInterface) BoundaryInterfaceReflectionUtil.castToSuppLibClass(JsReplyProxyBoundaryInterface.class, invocationHandler);
        return (JavaScriptReplyProxyImpl) jsReplyProxyBoundaryInterface.getOrCreatePeer(new Callable<Object>() { // from class: androidx.webkit.internal.JavaScriptReplyProxyImpl.1
            @Override // java.util.concurrent.Callable
            public Object call() {
                return new JavaScriptReplyProxyImpl(jsReplyProxyBoundaryInterface);
            }
        });
    }

    @Override // androidx.webkit.JavaScriptReplyProxy
    public void postMessage(String str) {
        if (WebViewFeatureInternal.WEB_MESSAGE_LISTENER.isSupportedByWebView()) {
            this.mBoundaryInterface.postMessage(str);
            return;
        }
        throw WebViewFeatureInternal.getUnsupportedOperationException();
    }

    @Override // androidx.webkit.JavaScriptReplyProxy
    public void postMessage(byte[] bArr) {
        Objects.requireNonNull(bArr, "ArrayBuffer must be non-null");
        if (WebViewFeatureInternal.WEB_MESSAGE_ARRAY_BUFFER.isSupportedByWebView()) {
            this.mBoundaryInterface.postMessageWithPayload(BoundaryInterfaceReflectionUtil.createInvocationHandlerFor(new WebMessagePayloadAdapter(bArr)));
            return;
        }
        throw WebViewFeatureInternal.getUnsupportedOperationException();
    }
}
