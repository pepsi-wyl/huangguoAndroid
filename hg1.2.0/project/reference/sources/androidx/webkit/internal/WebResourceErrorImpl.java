package androidx.webkit.internal;

import android.webkit.WebResourceError;
import androidx.webkit.WebResourceErrorCompat;
import androidx.webkit.internal.ApiFeature;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Proxy;
import org.chromium.support_lib_boundary.WebResourceErrorBoundaryInterface;
import org.chromium.support_lib_boundary.util.BoundaryInterfaceReflectionUtil;

/* loaded from: classes.dex */
public class WebResourceErrorImpl extends WebResourceErrorCompat {
    private WebResourceErrorBoundaryInterface mBoundaryInterface;
    private WebResourceError mFrameworksImpl;

    public WebResourceErrorImpl(InvocationHandler invocationHandler) {
        this.mBoundaryInterface = (WebResourceErrorBoundaryInterface) BoundaryInterfaceReflectionUtil.castToSuppLibClass(WebResourceErrorBoundaryInterface.class, invocationHandler);
    }

    public WebResourceErrorImpl(WebResourceError webResourceError) {
        this.mFrameworksImpl = webResourceError;
    }

    private WebResourceError getFrameworksImpl() {
        if (this.mFrameworksImpl == null) {
            this.mFrameworksImpl = WebViewGlueCommunicator.getCompatConverter().convertWebResourceError(Proxy.getInvocationHandler(this.mBoundaryInterface));
        }
        return this.mFrameworksImpl;
    }

    private WebResourceErrorBoundaryInterface getBoundaryInterface() {
        if (this.mBoundaryInterface == null) {
            this.mBoundaryInterface = (WebResourceErrorBoundaryInterface) BoundaryInterfaceReflectionUtil.castToSuppLibClass(WebResourceErrorBoundaryInterface.class, WebViewGlueCommunicator.getCompatConverter().convertWebResourceError(this.mFrameworksImpl));
        }
        return this.mBoundaryInterface;
    }

    @Override // androidx.webkit.WebResourceErrorCompat
    public int getErrorCode() {
        ApiFeature.M m = WebViewFeatureInternal.WEB_RESOURCE_ERROR_GET_CODE;
        if (m.isSupportedByFramework()) {
            return ApiHelperForM.getErrorCode(getFrameworksImpl());
        }
        if (m.isSupportedByWebView()) {
            return getBoundaryInterface().getErrorCode();
        }
        throw WebViewFeatureInternal.getUnsupportedOperationException();
    }

    @Override // androidx.webkit.WebResourceErrorCompat
    public CharSequence getDescription() {
        ApiFeature.M m = WebViewFeatureInternal.WEB_RESOURCE_ERROR_GET_DESCRIPTION;
        if (m.isSupportedByFramework()) {
            return ApiHelperForM.getDescription(getFrameworksImpl());
        }
        if (m.isSupportedByWebView()) {
            return getBoundaryInterface().getDescription();
        }
        throw WebViewFeatureInternal.getUnsupportedOperationException();
    }
}
