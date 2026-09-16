package androidx.webkit.internal;

import androidx.webkit.WebMessageCompat;
import androidx.webkit.WebMessagePortCompat;
import java.lang.reflect.InvocationHandler;
import java.util.Objects;
import org.chromium.support_lib_boundary.WebMessageBoundaryInterface;
import org.chromium.support_lib_boundary.WebMessagePayloadBoundaryInterface;
import org.chromium.support_lib_boundary.util.BoundaryInterfaceReflectionUtil;

/* loaded from: classes.dex */
public class WebMessageAdapter implements WebMessageBoundaryInterface {
    private static final String[] sFeatures = {"WEB_MESSAGE_ARRAY_BUFFER"};
    private WebMessageCompat mWebMessageCompat;

    public WebMessageAdapter(WebMessageCompat webMessageCompat) {
        this.mWebMessageCompat = webMessageCompat;
    }

    @Override // org.chromium.support_lib_boundary.WebMessageBoundaryInterface
    @Deprecated
    public String getData() {
        return this.mWebMessageCompat.getData();
    }

    @Override // org.chromium.support_lib_boundary.WebMessageBoundaryInterface
    public InvocationHandler getMessagePayload() {
        WebMessagePayloadAdapter webMessagePayloadAdapter;
        int type = this.mWebMessageCompat.getType();
        if (type == 0) {
            webMessagePayloadAdapter = new WebMessagePayloadAdapter(this.mWebMessageCompat.getData());
        } else if (type == 1) {
            webMessagePayloadAdapter = new WebMessagePayloadAdapter((byte[]) Objects.requireNonNull(this.mWebMessageCompat.getArrayBuffer()));
        } else {
            throw new IllegalStateException("Unknown web message payload type: " + this.mWebMessageCompat.getType());
        }
        return BoundaryInterfaceReflectionUtil.createInvocationHandlerFor(webMessagePayloadAdapter);
    }

    @Override // org.chromium.support_lib_boundary.WebMessageBoundaryInterface
    public InvocationHandler[] getPorts() {
        WebMessagePortCompat[] ports = this.mWebMessageCompat.getPorts();
        if (ports == null) {
            return null;
        }
        InvocationHandler[] invocationHandlerArr = new InvocationHandler[ports.length];
        for (int i = 0; i < ports.length; i++) {
            invocationHandlerArr[i] = ports[i].getInvocationHandler();
        }
        return invocationHandlerArr;
    }

    @Override // org.chromium.support_lib_boundary.FeatureFlagHolderBoundaryInterface
    public String[] getSupportedFeatures() {
        return sFeatures;
    }

    public static boolean isMessagePayloadTypeSupportedByWebView(int i) {
        if (i != 0) {
            return i == 1 && WebViewFeatureInternal.WEB_MESSAGE_ARRAY_BUFFER.isSupportedByWebView();
        }
        return true;
    }

    public static WebMessageCompat webMessageCompatFromBoundaryInterface(WebMessageBoundaryInterface webMessageBoundaryInterface) {
        WebMessagePortCompat[] webMessagePortCompats = toWebMessagePortCompats(webMessageBoundaryInterface.getPorts());
        if (WebViewFeatureInternal.WEB_MESSAGE_ARRAY_BUFFER.isSupportedByWebView()) {
            WebMessagePayloadBoundaryInterface webMessagePayloadBoundaryInterface = (WebMessagePayloadBoundaryInterface) BoundaryInterfaceReflectionUtil.castToSuppLibClass(WebMessagePayloadBoundaryInterface.class, webMessageBoundaryInterface.getMessagePayload());
            int type = webMessagePayloadBoundaryInterface.getType();
            if (type == 0) {
                return new WebMessageCompat(webMessagePayloadBoundaryInterface.getAsString(), webMessagePortCompats);
            }
            if (type != 1) {
                return null;
            }
            return new WebMessageCompat(webMessagePayloadBoundaryInterface.getAsArrayBuffer(), webMessagePortCompats);
        }
        return new WebMessageCompat(webMessageBoundaryInterface.getData(), webMessagePortCompats);
    }

    private static WebMessagePortCompat[] toWebMessagePortCompats(InvocationHandler[] invocationHandlerArr) {
        WebMessagePortCompat[] webMessagePortCompatArr = new WebMessagePortCompat[invocationHandlerArr.length];
        for (int i = 0; i < invocationHandlerArr.length; i++) {
            webMessagePortCompatArr[i] = new WebMessagePortImpl(invocationHandlerArr[i]);
        }
        return webMessagePortCompatArr;
    }
}
