package io.flutter.plugins.webviewflutter;

import android.util.Log;
import androidx.media3.extractor.ts.TsExtractor;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugins.webviewflutter.GeneratedAndroidWebView;
import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/* loaded from: classes2.dex */
public class GeneratedAndroidWebView {

    public interface Result<T> {
        void error(Throwable th);

        void success(T t);
    }

    public static class FlutterError extends RuntimeException {
        public final String code;
        public final Object details;

        public FlutterError(String str, String str2, Object obj) {
            super(str2);
            this.code = str;
            this.details = obj;
        }
    }

    protected static ArrayList<Object> wrapError(Throwable th) {
        ArrayList<Object> arrayList = new ArrayList<>(3);
        if (th instanceof FlutterError) {
            FlutterError flutterError = (FlutterError) th;
            arrayList.add(flutterError.code);
            arrayList.add(flutterError.getMessage());
            arrayList.add(flutterError.details);
        } else {
            arrayList.add(th.toString());
            arrayList.add(th.getClass().getSimpleName());
            arrayList.add("Cause: " + th.getCause() + ", Stacktrace: " + Log.getStackTraceString(th));
        }
        return arrayList;
    }

    public enum FileChooserMode {
        OPEN(0),
        OPEN_MULTIPLE(1),
        SAVE(2);

        final int index;

        FileChooserMode(int i) {
            this.index = i;
        }
    }

    public enum ConsoleMessageLevel {
        DEBUG(0),
        ERROR(1),
        LOG(2),
        TIP(3),
        WARNING(4),
        UNKNOWN(5);

        final int index;

        ConsoleMessageLevel(int i) {
            this.index = i;
        }
    }

    public static final class WebResourceRequestData {
        private Boolean hasGesture;
        private Boolean isForMainFrame;
        private Boolean isRedirect;
        private String method;
        private Map<String, String> requestHeaders;
        private String url;

        public String getUrl() {
            return this.url;
        }

        public void setUrl(String str) {
            if (str == null) {
                throw new IllegalStateException("Nonnull field \"url\" is null.");
            }
            this.url = str;
        }

        public Boolean getIsForMainFrame() {
            return this.isForMainFrame;
        }

        public void setIsForMainFrame(Boolean bool) {
            if (bool == null) {
                throw new IllegalStateException("Nonnull field \"isForMainFrame\" is null.");
            }
            this.isForMainFrame = bool;
        }

        public Boolean getIsRedirect() {
            return this.isRedirect;
        }

        public void setIsRedirect(Boolean bool) {
            this.isRedirect = bool;
        }

        public Boolean getHasGesture() {
            return this.hasGesture;
        }

        public void setHasGesture(Boolean bool) {
            if (bool == null) {
                throw new IllegalStateException("Nonnull field \"hasGesture\" is null.");
            }
            this.hasGesture = bool;
        }

        public String getMethod() {
            return this.method;
        }

        public void setMethod(String str) {
            if (str == null) {
                throw new IllegalStateException("Nonnull field \"method\" is null.");
            }
            this.method = str;
        }

        public Map<String, String> getRequestHeaders() {
            return this.requestHeaders;
        }

        public void setRequestHeaders(Map<String, String> map) {
            if (map == null) {
                throw new IllegalStateException("Nonnull field \"requestHeaders\" is null.");
            }
            this.requestHeaders = map;
        }

        WebResourceRequestData() {
        }

        public static final class Builder {
            private Boolean hasGesture;
            private Boolean isForMainFrame;
            private Boolean isRedirect;
            private String method;
            private Map<String, String> requestHeaders;
            private String url;

            public Builder setUrl(String str) {
                this.url = str;
                return this;
            }

            public Builder setIsForMainFrame(Boolean bool) {
                this.isForMainFrame = bool;
                return this;
            }

            public Builder setIsRedirect(Boolean bool) {
                this.isRedirect = bool;
                return this;
            }

            public Builder setHasGesture(Boolean bool) {
                this.hasGesture = bool;
                return this;
            }

            public Builder setMethod(String str) {
                this.method = str;
                return this;
            }

            public Builder setRequestHeaders(Map<String, String> map) {
                this.requestHeaders = map;
                return this;
            }

            public WebResourceRequestData build() {
                WebResourceRequestData webResourceRequestData = new WebResourceRequestData();
                webResourceRequestData.setUrl(this.url);
                webResourceRequestData.setIsForMainFrame(this.isForMainFrame);
                webResourceRequestData.setIsRedirect(this.isRedirect);
                webResourceRequestData.setHasGesture(this.hasGesture);
                webResourceRequestData.setMethod(this.method);
                webResourceRequestData.setRequestHeaders(this.requestHeaders);
                return webResourceRequestData;
            }
        }

        ArrayList<Object> toList() {
            ArrayList<Object> arrayList = new ArrayList<>(6);
            arrayList.add(this.url);
            arrayList.add(this.isForMainFrame);
            arrayList.add(this.isRedirect);
            arrayList.add(this.hasGesture);
            arrayList.add(this.method);
            arrayList.add(this.requestHeaders);
            return arrayList;
        }

        static WebResourceRequestData fromList(ArrayList<Object> arrayList) {
            WebResourceRequestData webResourceRequestData = new WebResourceRequestData();
            webResourceRequestData.setUrl((String) arrayList.get(0));
            webResourceRequestData.setIsForMainFrame((Boolean) arrayList.get(1));
            webResourceRequestData.setIsRedirect((Boolean) arrayList.get(2));
            webResourceRequestData.setHasGesture((Boolean) arrayList.get(3));
            webResourceRequestData.setMethod((String) arrayList.get(4));
            webResourceRequestData.setRequestHeaders((Map) arrayList.get(5));
            return webResourceRequestData;
        }
    }

    public static final class WebResourceResponseData {
        private Long statusCode;

        public Long getStatusCode() {
            return this.statusCode;
        }

        public void setStatusCode(Long l) {
            if (l == null) {
                throw new IllegalStateException("Nonnull field \"statusCode\" is null.");
            }
            this.statusCode = l;
        }

        WebResourceResponseData() {
        }

        public static final class Builder {
            private Long statusCode;

            public Builder setStatusCode(Long l) {
                this.statusCode = l;
                return this;
            }

            public WebResourceResponseData build() {
                WebResourceResponseData webResourceResponseData = new WebResourceResponseData();
                webResourceResponseData.setStatusCode(this.statusCode);
                return webResourceResponseData;
            }
        }

        ArrayList<Object> toList() {
            ArrayList<Object> arrayList = new ArrayList<>(1);
            arrayList.add(this.statusCode);
            return arrayList;
        }

        static WebResourceResponseData fromList(ArrayList<Object> arrayList) {
            Long lValueOf;
            WebResourceResponseData webResourceResponseData = new WebResourceResponseData();
            Object obj = arrayList.get(0);
            if (obj == null) {
                lValueOf = null;
            } else {
                lValueOf = Long.valueOf(obj instanceof Integer ? ((Integer) obj).intValue() : ((Long) obj).longValue());
            }
            webResourceResponseData.setStatusCode(lValueOf);
            return webResourceResponseData;
        }
    }

    public static final class WebResourceErrorData {
        private String description;
        private Long errorCode;

        public Long getErrorCode() {
            return this.errorCode;
        }

        public void setErrorCode(Long l) {
            if (l == null) {
                throw new IllegalStateException("Nonnull field \"errorCode\" is null.");
            }
            this.errorCode = l;
        }

        public String getDescription() {
            return this.description;
        }

        public void setDescription(String str) {
            if (str == null) {
                throw new IllegalStateException("Nonnull field \"description\" is null.");
            }
            this.description = str;
        }

        WebResourceErrorData() {
        }

        public static final class Builder {
            private String description;
            private Long errorCode;

            public Builder setErrorCode(Long l) {
                this.errorCode = l;
                return this;
            }

            public Builder setDescription(String str) {
                this.description = str;
                return this;
            }

            public WebResourceErrorData build() {
                WebResourceErrorData webResourceErrorData = new WebResourceErrorData();
                webResourceErrorData.setErrorCode(this.errorCode);
                webResourceErrorData.setDescription(this.description);
                return webResourceErrorData;
            }
        }

        ArrayList<Object> toList() {
            ArrayList<Object> arrayList = new ArrayList<>(2);
            arrayList.add(this.errorCode);
            arrayList.add(this.description);
            return arrayList;
        }

        static WebResourceErrorData fromList(ArrayList<Object> arrayList) {
            Long lValueOf;
            WebResourceErrorData webResourceErrorData = new WebResourceErrorData();
            Object obj = arrayList.get(0);
            if (obj == null) {
                lValueOf = null;
            } else {
                lValueOf = Long.valueOf(obj instanceof Integer ? ((Integer) obj).intValue() : ((Long) obj).longValue());
            }
            webResourceErrorData.setErrorCode(lValueOf);
            webResourceErrorData.setDescription((String) arrayList.get(1));
            return webResourceErrorData;
        }
    }

    public static final class WebViewPoint {
        private Long x;
        private Long y;

        public Long getX() {
            return this.x;
        }

        public void setX(Long l) {
            if (l == null) {
                throw new IllegalStateException("Nonnull field \"x\" is null.");
            }
            this.x = l;
        }

        public Long getY() {
            return this.y;
        }

        public void setY(Long l) {
            if (l == null) {
                throw new IllegalStateException("Nonnull field \"y\" is null.");
            }
            this.y = l;
        }

        WebViewPoint() {
        }

        public static final class Builder {
            private Long x;
            private Long y;

            public Builder setX(Long l) {
                this.x = l;
                return this;
            }

            public Builder setY(Long l) {
                this.y = l;
                return this;
            }

            public WebViewPoint build() {
                WebViewPoint webViewPoint = new WebViewPoint();
                webViewPoint.setX(this.x);
                webViewPoint.setY(this.y);
                return webViewPoint;
            }
        }

        ArrayList<Object> toList() {
            ArrayList<Object> arrayList = new ArrayList<>(2);
            arrayList.add(this.x);
            arrayList.add(this.y);
            return arrayList;
        }

        static WebViewPoint fromList(ArrayList<Object> arrayList) {
            Long lValueOf;
            WebViewPoint webViewPoint = new WebViewPoint();
            Object obj = arrayList.get(0);
            Long lValueOf2 = null;
            if (obj == null) {
                lValueOf = null;
            } else {
                lValueOf = Long.valueOf(obj instanceof Integer ? ((Integer) obj).intValue() : ((Long) obj).longValue());
            }
            webViewPoint.setX(lValueOf);
            Object obj2 = arrayList.get(1);
            if (obj2 != null) {
                lValueOf2 = Long.valueOf(obj2 instanceof Integer ? ((Integer) obj2).intValue() : ((Long) obj2).longValue());
            }
            webViewPoint.setY(lValueOf2);
            return webViewPoint;
        }
    }

    public static final class ConsoleMessage {
        private ConsoleMessageLevel level;
        private Long lineNumber;
        private String message;
        private String sourceId;

        public Long getLineNumber() {
            return this.lineNumber;
        }

        public void setLineNumber(Long l) {
            if (l == null) {
                throw new IllegalStateException("Nonnull field \"lineNumber\" is null.");
            }
            this.lineNumber = l;
        }

        public String getMessage() {
            return this.message;
        }

        public void setMessage(String str) {
            if (str == null) {
                throw new IllegalStateException("Nonnull field \"message\" is null.");
            }
            this.message = str;
        }

        public ConsoleMessageLevel getLevel() {
            return this.level;
        }

        public void setLevel(ConsoleMessageLevel consoleMessageLevel) {
            if (consoleMessageLevel == null) {
                throw new IllegalStateException("Nonnull field \"level\" is null.");
            }
            this.level = consoleMessageLevel;
        }

        public String getSourceId() {
            return this.sourceId;
        }

        public void setSourceId(String str) {
            if (str == null) {
                throw new IllegalStateException("Nonnull field \"sourceId\" is null.");
            }
            this.sourceId = str;
        }

        ConsoleMessage() {
        }

        public static final class Builder {
            private ConsoleMessageLevel level;
            private Long lineNumber;
            private String message;
            private String sourceId;

            public Builder setLineNumber(Long l) {
                this.lineNumber = l;
                return this;
            }

            public Builder setMessage(String str) {
                this.message = str;
                return this;
            }

            public Builder setLevel(ConsoleMessageLevel consoleMessageLevel) {
                this.level = consoleMessageLevel;
                return this;
            }

            public Builder setSourceId(String str) {
                this.sourceId = str;
                return this;
            }

            public ConsoleMessage build() {
                ConsoleMessage consoleMessage = new ConsoleMessage();
                consoleMessage.setLineNumber(this.lineNumber);
                consoleMessage.setMessage(this.message);
                consoleMessage.setLevel(this.level);
                consoleMessage.setSourceId(this.sourceId);
                return consoleMessage;
            }
        }

        ArrayList<Object> toList() {
            ArrayList<Object> arrayList = new ArrayList<>(4);
            arrayList.add(this.lineNumber);
            arrayList.add(this.message);
            ConsoleMessageLevel consoleMessageLevel = this.level;
            arrayList.add(consoleMessageLevel == null ? null : Integer.valueOf(consoleMessageLevel.index));
            arrayList.add(this.sourceId);
            return arrayList;
        }

        static ConsoleMessage fromList(ArrayList<Object> arrayList) {
            Long lValueOf;
            ConsoleMessage consoleMessage = new ConsoleMessage();
            Object obj = arrayList.get(0);
            if (obj == null) {
                lValueOf = null;
            } else {
                lValueOf = Long.valueOf(obj instanceof Integer ? ((Integer) obj).intValue() : ((Long) obj).longValue());
            }
            consoleMessage.setLineNumber(lValueOf);
            consoleMessage.setMessage((String) arrayList.get(1));
            consoleMessage.setLevel(ConsoleMessageLevel.values()[((Integer) arrayList.get(2)).intValue()]);
            consoleMessage.setSourceId((String) arrayList.get(3));
            return consoleMessage;
        }
    }

    public interface InstanceManagerHostApi {
        void clear();

        /* renamed from: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$InstanceManagerHostApi$-CC, reason: invalid class name */
        public final /* synthetic */ class CC {
            public static MessageCodec<Object> getCodec() {
                return new StandardMessageCodec();
            }

            public static void setup(BinaryMessenger binaryMessenger, final InstanceManagerHostApi instanceManagerHostApi) {
                BasicMessageChannel basicMessageChannel = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.InstanceManagerHostApi.clear", getCodec());
                if (instanceManagerHostApi != null) {
                    basicMessageChannel.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$InstanceManagerHostApi$$ExternalSyntheticLambda0
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.InstanceManagerHostApi.CC.lambda$setup$0(instanceManagerHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel.setMessageHandler(null);
                }
            }

            public static /* synthetic */ void lambda$setup$0(InstanceManagerHostApi instanceManagerHostApi, Object obj, BasicMessageChannel.Reply reply) {
                ArrayList<Object> arrayList = new ArrayList<>();
                try {
                    instanceManagerHostApi.clear();
                    arrayList.add(0, null);
                } catch (Throwable th) {
                    arrayList = GeneratedAndroidWebView.wrapError(th);
                }
                reply.reply(arrayList);
            }
        }
    }

    public interface JavaObjectHostApi {
        void dispose(Long l);

        /* renamed from: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$JavaObjectHostApi$-CC, reason: invalid class name */
        public final /* synthetic */ class CC {
            public static MessageCodec<Object> getCodec() {
                return new StandardMessageCodec();
            }

            public static void setup(BinaryMessenger binaryMessenger, final JavaObjectHostApi javaObjectHostApi) {
                BasicMessageChannel basicMessageChannel = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.JavaObjectHostApi.dispose", getCodec());
                if (javaObjectHostApi != null) {
                    basicMessageChannel.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$JavaObjectHostApi$$ExternalSyntheticLambda0
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.JavaObjectHostApi.CC.lambda$setup$0(javaObjectHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel.setMessageHandler(null);
                }
            }

            public static /* synthetic */ void lambda$setup$0(JavaObjectHostApi javaObjectHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                Number number = (Number) ((ArrayList) obj).get(0);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                javaObjectHostApi.dispose(lValueOf);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }
        }
    }

    public static class JavaObjectFlutterApi {
        private final BinaryMessenger binaryMessenger;

        public interface Reply<T> {
            void reply(T t);
        }

        public JavaObjectFlutterApi(BinaryMessenger binaryMessenger) {
            this.binaryMessenger = binaryMessenger;
        }

        static MessageCodec<Object> getCodec() {
            return new StandardMessageCodec();
        }

        public void dispose(Long l, final Reply<Void> reply) {
            new BasicMessageChannel(this.binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.JavaObjectFlutterApi.dispose", getCodec()).send(new ArrayList(Collections.singletonList(l)), new BasicMessageChannel.Reply() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$JavaObjectFlutterApi$$ExternalSyntheticLambda0
                @Override // io.flutter.plugin.common.BasicMessageChannel.Reply
                public final void reply(Object obj) {
                    reply.reply(null);
                }
            });
        }
    }

    public interface CookieManagerHostApi {
        void attachInstance(Long l);

        void removeAllCookies(Long l, Result<Boolean> result);

        void setAcceptThirdPartyCookies(Long l, Long l2, Boolean bool);

        void setCookie(Long l, String str, String str2);

        /* renamed from: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$CookieManagerHostApi$-CC, reason: invalid class name */
        public final /* synthetic */ class CC {
            public static MessageCodec<Object> getCodec() {
                return new StandardMessageCodec();
            }

            public static void setup(BinaryMessenger binaryMessenger, final CookieManagerHostApi cookieManagerHostApi) {
                BasicMessageChannel basicMessageChannel = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.CookieManagerHostApi.attachInstance", getCodec());
                if (cookieManagerHostApi != null) {
                    basicMessageChannel.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$CookieManagerHostApi$$ExternalSyntheticLambda0
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.CookieManagerHostApi.CC.lambda$setup$0(cookieManagerHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel2 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.CookieManagerHostApi.setCookie", getCodec());
                if (cookieManagerHostApi != null) {
                    basicMessageChannel2.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$CookieManagerHostApi$$ExternalSyntheticLambda1
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.CookieManagerHostApi.CC.lambda$setup$1(cookieManagerHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel2.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel3 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.CookieManagerHostApi.removeAllCookies", getCodec());
                if (cookieManagerHostApi != null) {
                    basicMessageChannel3.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$CookieManagerHostApi$$ExternalSyntheticLambda2
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.CookieManagerHostApi.CC.lambda$setup$2(cookieManagerHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel3.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel4 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.CookieManagerHostApi.setAcceptThirdPartyCookies", getCodec());
                if (cookieManagerHostApi != null) {
                    basicMessageChannel4.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$CookieManagerHostApi$$ExternalSyntheticLambda3
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.CookieManagerHostApi.CC.lambda$setup$3(cookieManagerHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel4.setMessageHandler(null);
                }
            }

            public static /* synthetic */ void lambda$setup$0(CookieManagerHostApi cookieManagerHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                Number number = (Number) ((ArrayList) obj).get(0);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                cookieManagerHostApi.attachInstance(lValueOf);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$1(CookieManagerHostApi cookieManagerHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                String str = (String) arrayList2.get(1);
                String str2 = (String) arrayList2.get(2);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                cookieManagerHostApi.setCookie(lValueOf, str, str2);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$2(CookieManagerHostApi cookieManagerHostApi, Object obj, final BasicMessageChannel.Reply reply) {
                final ArrayList arrayList = new ArrayList();
                Number number = (Number) ((ArrayList) obj).get(0);
                cookieManagerHostApi.removeAllCookies(number == null ? null : Long.valueOf(number.longValue()), new Result<Boolean>() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.CookieManagerHostApi.1
                    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.Result
                    public void success(Boolean bool) {
                        arrayList.add(0, bool);
                        reply.reply(arrayList);
                    }

                    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.Result
                    public void error(Throwable th) {
                        reply.reply(GeneratedAndroidWebView.wrapError(th));
                    }
                });
            }

            public static /* synthetic */ void lambda$setup$3(CookieManagerHostApi cookieManagerHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                Number number2 = (Number) arrayList2.get(1);
                Boolean bool = (Boolean) arrayList2.get(2);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                cookieManagerHostApi.setAcceptThirdPartyCookies(lValueOf, number2 == null ? null : Long.valueOf(number2.longValue()), bool);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }
        }
    }

    private static class WebViewHostApiCodec extends StandardMessageCodec {
        public static final WebViewHostApiCodec INSTANCE = new WebViewHostApiCodec();

        private WebViewHostApiCodec() {
        }

        @Override // io.flutter.plugin.common.StandardMessageCodec
        protected Object readValueOfType(byte b, ByteBuffer byteBuffer) {
            if (b == -128) {
                return WebViewPoint.fromList((ArrayList) readValue(byteBuffer));
            }
            return super.readValueOfType(b, byteBuffer);
        }

        @Override // io.flutter.plugin.common.StandardMessageCodec
        protected void writeValue(ByteArrayOutputStream byteArrayOutputStream, Object obj) {
            if (obj instanceof WebViewPoint) {
                byteArrayOutputStream.write(128);
                writeValue(byteArrayOutputStream, ((WebViewPoint) obj).toList());
            } else {
                super.writeValue(byteArrayOutputStream, obj);
            }
        }
    }

    public interface WebViewHostApi {
        void addJavaScriptChannel(Long l, Long l2);

        Boolean canGoBack(Long l);

        Boolean canGoForward(Long l);

        void clearCache(Long l, Boolean bool);

        void create(Long l);

        void evaluateJavascript(Long l, String str, Result<String> result);

        WebViewPoint getScrollPosition(Long l);

        Long getScrollX(Long l);

        Long getScrollY(Long l);

        String getTitle(Long l);

        String getUrl(Long l);

        void goBack(Long l);

        void goForward(Long l);

        void loadData(Long l, String str, String str2, String str3);

        void loadDataWithBaseUrl(Long l, String str, String str2, String str3, String str4, String str5);

        void loadUrl(Long l, String str, Map<String, String> map);

        void postUrl(Long l, String str, byte[] bArr);

        void reload(Long l);

        void removeJavaScriptChannel(Long l, Long l2);

        void scrollBy(Long l, Long l2, Long l3);

        void scrollTo(Long l, Long l2, Long l3);

        void setBackgroundColor(Long l, Long l2);

        void setDownloadListener(Long l, Long l2);

        void setWebChromeClient(Long l, Long l2);

        void setWebContentsDebuggingEnabled(Boolean bool);

        void setWebViewClient(Long l, Long l2);

        /* renamed from: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewHostApi$-CC, reason: invalid class name */
        public final /* synthetic */ class CC {
            public static MessageCodec<Object> getCodec() {
                return WebViewHostApiCodec.INSTANCE;
            }

            public static void setup(BinaryMessenger binaryMessenger, final WebViewHostApi webViewHostApi) {
                BasicMessageChannel basicMessageChannel = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewHostApi.create", getCodec());
                if (webViewHostApi != null) {
                    basicMessageChannel.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewHostApi$$ExternalSyntheticLambda0
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebViewHostApi.CC.lambda$setup$0(webViewHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel2 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewHostApi.loadData", getCodec());
                if (webViewHostApi != null) {
                    basicMessageChannel2.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewHostApi$$ExternalSyntheticLambda2
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebViewHostApi.CC.lambda$setup$1(webViewHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel2.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel3 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewHostApi.loadDataWithBaseUrl", getCodec());
                if (webViewHostApi != null) {
                    basicMessageChannel3.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewHostApi$$ExternalSyntheticLambda9
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebViewHostApi.CC.lambda$setup$2(webViewHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel3.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel4 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewHostApi.loadUrl", getCodec());
                if (webViewHostApi != null) {
                    basicMessageChannel4.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewHostApi$$ExternalSyntheticLambda10
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebViewHostApi.CC.lambda$setup$3(webViewHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel4.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel5 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewHostApi.postUrl", getCodec());
                if (webViewHostApi != null) {
                    basicMessageChannel5.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewHostApi$$ExternalSyntheticLambda12
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebViewHostApi.CC.lambda$setup$4(webViewHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel5.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel6 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewHostApi.getUrl", getCodec());
                if (webViewHostApi != null) {
                    basicMessageChannel6.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewHostApi$$ExternalSyntheticLambda13
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebViewHostApi.CC.lambda$setup$5(webViewHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel6.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel7 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewHostApi.canGoBack", getCodec());
                if (webViewHostApi != null) {
                    basicMessageChannel7.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewHostApi$$ExternalSyntheticLambda14
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebViewHostApi.CC.lambda$setup$6(webViewHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel7.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel8 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewHostApi.canGoForward", getCodec());
                if (webViewHostApi != null) {
                    basicMessageChannel8.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewHostApi$$ExternalSyntheticLambda15
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebViewHostApi.CC.lambda$setup$7(webViewHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel8.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel9 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewHostApi.goBack", getCodec());
                if (webViewHostApi != null) {
                    basicMessageChannel9.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewHostApi$$ExternalSyntheticLambda16
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebViewHostApi.CC.lambda$setup$8(webViewHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel9.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel10 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewHostApi.goForward", getCodec());
                if (webViewHostApi != null) {
                    basicMessageChannel10.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewHostApi$$ExternalSyntheticLambda17
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebViewHostApi.CC.lambda$setup$9(webViewHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel10.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel11 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewHostApi.reload", getCodec());
                if (webViewHostApi != null) {
                    basicMessageChannel11.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewHostApi$$ExternalSyntheticLambda11
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebViewHostApi.CC.lambda$setup$10(webViewHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel11.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel12 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewHostApi.clearCache", getCodec());
                if (webViewHostApi != null) {
                    basicMessageChannel12.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewHostApi$$ExternalSyntheticLambda18
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebViewHostApi.CC.lambda$setup$11(webViewHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel12.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel13 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewHostApi.evaluateJavascript", getCodec());
                if (webViewHostApi != null) {
                    basicMessageChannel13.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewHostApi$$ExternalSyntheticLambda19
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebViewHostApi.CC.lambda$setup$12(webViewHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel13.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel14 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewHostApi.getTitle", getCodec());
                if (webViewHostApi != null) {
                    basicMessageChannel14.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewHostApi$$ExternalSyntheticLambda20
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebViewHostApi.CC.lambda$setup$13(webViewHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel14.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel15 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewHostApi.scrollTo", getCodec());
                if (webViewHostApi != null) {
                    basicMessageChannel15.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewHostApi$$ExternalSyntheticLambda21
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebViewHostApi.CC.lambda$setup$14(webViewHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel15.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel16 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewHostApi.scrollBy", getCodec());
                if (webViewHostApi != null) {
                    basicMessageChannel16.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewHostApi$$ExternalSyntheticLambda22
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebViewHostApi.CC.lambda$setup$15(webViewHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel16.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel17 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewHostApi.getScrollX", getCodec());
                if (webViewHostApi != null) {
                    basicMessageChannel17.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewHostApi$$ExternalSyntheticLambda23
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebViewHostApi.CC.lambda$setup$16(webViewHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel17.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel18 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewHostApi.getScrollY", getCodec());
                if (webViewHostApi != null) {
                    basicMessageChannel18.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewHostApi$$ExternalSyntheticLambda24
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebViewHostApi.CC.lambda$setup$17(webViewHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel18.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel19 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewHostApi.getScrollPosition", getCodec());
                if (webViewHostApi != null) {
                    basicMessageChannel19.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewHostApi$$ExternalSyntheticLambda25
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebViewHostApi.CC.lambda$setup$18(webViewHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel19.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel20 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewHostApi.setWebContentsDebuggingEnabled", getCodec());
                if (webViewHostApi != null) {
                    basicMessageChannel20.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewHostApi$$ExternalSyntheticLambda1
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebViewHostApi.CC.lambda$setup$19(webViewHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel20.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel21 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewHostApi.setWebViewClient", getCodec());
                if (webViewHostApi != null) {
                    basicMessageChannel21.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewHostApi$$ExternalSyntheticLambda3
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebViewHostApi.CC.lambda$setup$20(webViewHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel21.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel22 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewHostApi.addJavaScriptChannel", getCodec());
                if (webViewHostApi != null) {
                    basicMessageChannel22.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewHostApi$$ExternalSyntheticLambda4
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebViewHostApi.CC.lambda$setup$21(webViewHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel22.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel23 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewHostApi.removeJavaScriptChannel", getCodec());
                if (webViewHostApi != null) {
                    basicMessageChannel23.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewHostApi$$ExternalSyntheticLambda5
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebViewHostApi.CC.lambda$setup$22(webViewHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel23.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel24 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewHostApi.setDownloadListener", getCodec());
                if (webViewHostApi != null) {
                    basicMessageChannel24.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewHostApi$$ExternalSyntheticLambda6
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebViewHostApi.CC.lambda$setup$23(webViewHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel24.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel25 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewHostApi.setWebChromeClient", getCodec());
                if (webViewHostApi != null) {
                    basicMessageChannel25.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewHostApi$$ExternalSyntheticLambda7
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebViewHostApi.CC.lambda$setup$24(webViewHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel25.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel26 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewHostApi.setBackgroundColor", getCodec());
                if (webViewHostApi != null) {
                    basicMessageChannel26.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewHostApi$$ExternalSyntheticLambda8
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebViewHostApi.CC.lambda$setup$25(webViewHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel26.setMessageHandler(null);
                }
            }

            public static /* synthetic */ void lambda$setup$0(WebViewHostApi webViewHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                Number number = (Number) ((ArrayList) obj).get(0);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webViewHostApi.create(lValueOf);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$1(WebViewHostApi webViewHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                String str = (String) arrayList2.get(1);
                String str2 = (String) arrayList2.get(2);
                String str3 = (String) arrayList2.get(3);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webViewHostApi.loadData(lValueOf, str, str2, str3);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$2(WebViewHostApi webViewHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                String str = (String) arrayList2.get(1);
                String str2 = (String) arrayList2.get(2);
                String str3 = (String) arrayList2.get(3);
                String str4 = (String) arrayList2.get(4);
                String str5 = (String) arrayList2.get(5);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webViewHostApi.loadDataWithBaseUrl(lValueOf, str, str2, str3, str4, str5);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$3(WebViewHostApi webViewHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                String str = (String) arrayList2.get(1);
                Map<String, String> map = (Map) arrayList2.get(2);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webViewHostApi.loadUrl(lValueOf, str, map);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$4(WebViewHostApi webViewHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                String str = (String) arrayList2.get(1);
                byte[] bArr = (byte[]) arrayList2.get(2);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webViewHostApi.postUrl(lValueOf, str, bArr);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$5(WebViewHostApi webViewHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                Number number = (Number) ((ArrayList) obj).get(0);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                arrayList.add(0, webViewHostApi.getUrl(lValueOf));
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$6(WebViewHostApi webViewHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                Number number = (Number) ((ArrayList) obj).get(0);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                arrayList.add(0, webViewHostApi.canGoBack(lValueOf));
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$7(WebViewHostApi webViewHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                Number number = (Number) ((ArrayList) obj).get(0);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                arrayList.add(0, webViewHostApi.canGoForward(lValueOf));
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$8(WebViewHostApi webViewHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                Number number = (Number) ((ArrayList) obj).get(0);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webViewHostApi.goBack(lValueOf);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$9(WebViewHostApi webViewHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                Number number = (Number) ((ArrayList) obj).get(0);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webViewHostApi.goForward(lValueOf);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$10(WebViewHostApi webViewHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                Number number = (Number) ((ArrayList) obj).get(0);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webViewHostApi.reload(lValueOf);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$11(WebViewHostApi webViewHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                Boolean bool = (Boolean) arrayList2.get(1);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webViewHostApi.clearCache(lValueOf, bool);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$12(WebViewHostApi webViewHostApi, Object obj, final BasicMessageChannel.Reply reply) {
                final ArrayList arrayList = new ArrayList();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                webViewHostApi.evaluateJavascript(number == null ? null : Long.valueOf(number.longValue()), (String) arrayList2.get(1), new Result<String>() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewHostApi.1
                    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.Result
                    public void success(String str) {
                        arrayList.add(0, str);
                        reply.reply(arrayList);
                    }

                    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.Result
                    public void error(Throwable th) {
                        reply.reply(GeneratedAndroidWebView.wrapError(th));
                    }
                });
            }

            public static /* synthetic */ void lambda$setup$13(WebViewHostApi webViewHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                Number number = (Number) ((ArrayList) obj).get(0);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                arrayList.add(0, webViewHostApi.getTitle(lValueOf));
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$14(WebViewHostApi webViewHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                Number number2 = (Number) arrayList2.get(1);
                Number number3 = (Number) arrayList2.get(2);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webViewHostApi.scrollTo(lValueOf, number2 == null ? null : Long.valueOf(number2.longValue()), number3 == null ? null : Long.valueOf(number3.longValue()));
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$15(WebViewHostApi webViewHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                Number number2 = (Number) arrayList2.get(1);
                Number number3 = (Number) arrayList2.get(2);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webViewHostApi.scrollBy(lValueOf, number2 == null ? null : Long.valueOf(number2.longValue()), number3 == null ? null : Long.valueOf(number3.longValue()));
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$16(WebViewHostApi webViewHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                Number number = (Number) ((ArrayList) obj).get(0);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                arrayList.add(0, webViewHostApi.getScrollX(lValueOf));
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$17(WebViewHostApi webViewHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                Number number = (Number) ((ArrayList) obj).get(0);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                arrayList.add(0, webViewHostApi.getScrollY(lValueOf));
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$18(WebViewHostApi webViewHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                Number number = (Number) ((ArrayList) obj).get(0);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                arrayList.add(0, webViewHostApi.getScrollPosition(lValueOf));
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$19(WebViewHostApi webViewHostApi, Object obj, BasicMessageChannel.Reply reply) {
                ArrayList<Object> arrayList = new ArrayList<>();
                try {
                    webViewHostApi.setWebContentsDebuggingEnabled((Boolean) ((ArrayList) obj).get(0));
                    arrayList.add(0, null);
                } catch (Throwable th) {
                    arrayList = GeneratedAndroidWebView.wrapError(th);
                }
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$20(WebViewHostApi webViewHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                Number number2 = (Number) arrayList2.get(1);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webViewHostApi.setWebViewClient(lValueOf, number2 == null ? null : Long.valueOf(number2.longValue()));
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$21(WebViewHostApi webViewHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                Number number2 = (Number) arrayList2.get(1);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webViewHostApi.addJavaScriptChannel(lValueOf, number2 == null ? null : Long.valueOf(number2.longValue()));
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$22(WebViewHostApi webViewHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                Number number2 = (Number) arrayList2.get(1);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webViewHostApi.removeJavaScriptChannel(lValueOf, number2 == null ? null : Long.valueOf(number2.longValue()));
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$23(WebViewHostApi webViewHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                Number number2 = (Number) arrayList2.get(1);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webViewHostApi.setDownloadListener(lValueOf, number2 == null ? null : Long.valueOf(number2.longValue()));
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$24(WebViewHostApi webViewHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                Number number2 = (Number) arrayList2.get(1);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webViewHostApi.setWebChromeClient(lValueOf, number2 == null ? null : Long.valueOf(number2.longValue()));
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$25(WebViewHostApi webViewHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                Number number2 = (Number) arrayList2.get(1);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webViewHostApi.setBackgroundColor(lValueOf, number2 == null ? null : Long.valueOf(number2.longValue()));
                arrayList.add(0, null);
                reply.reply(arrayList);
            }
        }
    }

    public static class WebViewFlutterApi {
        private final BinaryMessenger binaryMessenger;

        public interface Reply<T> {
            void reply(T t);
        }

        public WebViewFlutterApi(BinaryMessenger binaryMessenger) {
            this.binaryMessenger = binaryMessenger;
        }

        static MessageCodec<Object> getCodec() {
            return new StandardMessageCodec();
        }

        public void create(Long l, final Reply<Void> reply) {
            new BasicMessageChannel(this.binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewFlutterApi.create", getCodec()).send(new ArrayList(Collections.singletonList(l)), new BasicMessageChannel.Reply() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewFlutterApi$$ExternalSyntheticLambda1
                @Override // io.flutter.plugin.common.BasicMessageChannel.Reply
                public final void reply(Object obj) {
                    reply.reply(null);
                }
            });
        }

        public void onScrollChanged(Long l, Long l2, Long l3, Long l4, Long l5, final Reply<Void> reply) {
            new BasicMessageChannel(this.binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewFlutterApi.onScrollChanged", getCodec()).send(new ArrayList(Arrays.asList(l, l2, l3, l4, l5)), new BasicMessageChannel.Reply() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewFlutterApi$$ExternalSyntheticLambda0
                @Override // io.flutter.plugin.common.BasicMessageChannel.Reply
                public final void reply(Object obj) {
                    reply.reply(null);
                }
            });
        }
    }

    public interface WebSettingsHostApi {
        void create(Long l, Long l2);

        String getUserAgentString(Long l);

        void setAllowFileAccess(Long l, Boolean bool);

        void setBuiltInZoomControls(Long l, Boolean bool);

        void setDisplayZoomControls(Long l, Boolean bool);

        void setDomStorageEnabled(Long l, Boolean bool);

        void setJavaScriptCanOpenWindowsAutomatically(Long l, Boolean bool);

        void setJavaScriptEnabled(Long l, Boolean bool);

        void setLoadWithOverviewMode(Long l, Boolean bool);

        void setMediaPlaybackRequiresUserGesture(Long l, Boolean bool);

        void setSupportMultipleWindows(Long l, Boolean bool);

        void setSupportZoom(Long l, Boolean bool);

        void setTextZoom(Long l, Long l2);

        void setUseWideViewPort(Long l, Boolean bool);

        void setUserAgentString(Long l, String str);

        /* renamed from: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebSettingsHostApi$-CC, reason: invalid class name */
        public final /* synthetic */ class CC {
            public static MessageCodec<Object> getCodec() {
                return new StandardMessageCodec();
            }

            public static void setup(BinaryMessenger binaryMessenger, final WebSettingsHostApi webSettingsHostApi) {
                BasicMessageChannel basicMessageChannel = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebSettingsHostApi.create", getCodec());
                if (webSettingsHostApi != null) {
                    basicMessageChannel.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebSettingsHostApi$$ExternalSyntheticLambda0
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebSettingsHostApi.CC.lambda$setup$0(webSettingsHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel2 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebSettingsHostApi.setDomStorageEnabled", getCodec());
                if (webSettingsHostApi != null) {
                    basicMessageChannel2.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebSettingsHostApi$$ExternalSyntheticLambda11
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebSettingsHostApi.CC.lambda$setup$1(webSettingsHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel2.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel3 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebSettingsHostApi.setJavaScriptCanOpenWindowsAutomatically", getCodec());
                if (webSettingsHostApi != null) {
                    basicMessageChannel3.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebSettingsHostApi$$ExternalSyntheticLambda12
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebSettingsHostApi.CC.lambda$setup$2(webSettingsHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel3.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel4 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebSettingsHostApi.setSupportMultipleWindows", getCodec());
                if (webSettingsHostApi != null) {
                    basicMessageChannel4.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebSettingsHostApi$$ExternalSyntheticLambda13
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebSettingsHostApi.CC.lambda$setup$3(webSettingsHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel4.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel5 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebSettingsHostApi.setJavaScriptEnabled", getCodec());
                if (webSettingsHostApi != null) {
                    basicMessageChannel5.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebSettingsHostApi$$ExternalSyntheticLambda14
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebSettingsHostApi.CC.lambda$setup$4(webSettingsHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel5.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel6 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebSettingsHostApi.setUserAgentString", getCodec());
                if (webSettingsHostApi != null) {
                    basicMessageChannel6.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebSettingsHostApi$$ExternalSyntheticLambda1
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebSettingsHostApi.CC.lambda$setup$5(webSettingsHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel6.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel7 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebSettingsHostApi.setMediaPlaybackRequiresUserGesture", getCodec());
                if (webSettingsHostApi != null) {
                    basicMessageChannel7.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebSettingsHostApi$$ExternalSyntheticLambda2
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebSettingsHostApi.CC.lambda$setup$6(webSettingsHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel7.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel8 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebSettingsHostApi.setSupportZoom", getCodec());
                if (webSettingsHostApi != null) {
                    basicMessageChannel8.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebSettingsHostApi$$ExternalSyntheticLambda3
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebSettingsHostApi.CC.lambda$setup$7(webSettingsHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel8.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel9 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebSettingsHostApi.setLoadWithOverviewMode", getCodec());
                if (webSettingsHostApi != null) {
                    basicMessageChannel9.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebSettingsHostApi$$ExternalSyntheticLambda4
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebSettingsHostApi.CC.lambda$setup$8(webSettingsHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel9.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel10 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebSettingsHostApi.setUseWideViewPort", getCodec());
                if (webSettingsHostApi != null) {
                    basicMessageChannel10.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebSettingsHostApi$$ExternalSyntheticLambda5
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebSettingsHostApi.CC.lambda$setup$9(webSettingsHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel10.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel11 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebSettingsHostApi.setDisplayZoomControls", getCodec());
                if (webSettingsHostApi != null) {
                    basicMessageChannel11.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebSettingsHostApi$$ExternalSyntheticLambda6
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebSettingsHostApi.CC.lambda$setup$10(webSettingsHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel11.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel12 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebSettingsHostApi.setBuiltInZoomControls", getCodec());
                if (webSettingsHostApi != null) {
                    basicMessageChannel12.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebSettingsHostApi$$ExternalSyntheticLambda7
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebSettingsHostApi.CC.lambda$setup$11(webSettingsHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel12.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel13 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebSettingsHostApi.setAllowFileAccess", getCodec());
                if (webSettingsHostApi != null) {
                    basicMessageChannel13.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebSettingsHostApi$$ExternalSyntheticLambda8
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebSettingsHostApi.CC.lambda$setup$12(webSettingsHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel13.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel14 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebSettingsHostApi.setTextZoom", getCodec());
                if (webSettingsHostApi != null) {
                    basicMessageChannel14.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebSettingsHostApi$$ExternalSyntheticLambda9
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebSettingsHostApi.CC.lambda$setup$13(webSettingsHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel14.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel15 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebSettingsHostApi.getUserAgentString", getCodec());
                if (webSettingsHostApi != null) {
                    basicMessageChannel15.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebSettingsHostApi$$ExternalSyntheticLambda10
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebSettingsHostApi.CC.lambda$setup$14(webSettingsHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel15.setMessageHandler(null);
                }
            }

            public static /* synthetic */ void lambda$setup$0(WebSettingsHostApi webSettingsHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                Number number2 = (Number) arrayList2.get(1);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webSettingsHostApi.create(lValueOf, number2 == null ? null : Long.valueOf(number2.longValue()));
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$1(WebSettingsHostApi webSettingsHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                Boolean bool = (Boolean) arrayList2.get(1);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webSettingsHostApi.setDomStorageEnabled(lValueOf, bool);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$2(WebSettingsHostApi webSettingsHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                Boolean bool = (Boolean) arrayList2.get(1);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webSettingsHostApi.setJavaScriptCanOpenWindowsAutomatically(lValueOf, bool);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$3(WebSettingsHostApi webSettingsHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                Boolean bool = (Boolean) arrayList2.get(1);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webSettingsHostApi.setSupportMultipleWindows(lValueOf, bool);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$4(WebSettingsHostApi webSettingsHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                Boolean bool = (Boolean) arrayList2.get(1);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webSettingsHostApi.setJavaScriptEnabled(lValueOf, bool);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$5(WebSettingsHostApi webSettingsHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                String str = (String) arrayList2.get(1);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webSettingsHostApi.setUserAgentString(lValueOf, str);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$6(WebSettingsHostApi webSettingsHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                Boolean bool = (Boolean) arrayList2.get(1);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webSettingsHostApi.setMediaPlaybackRequiresUserGesture(lValueOf, bool);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$7(WebSettingsHostApi webSettingsHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                Boolean bool = (Boolean) arrayList2.get(1);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webSettingsHostApi.setSupportZoom(lValueOf, bool);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$8(WebSettingsHostApi webSettingsHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                Boolean bool = (Boolean) arrayList2.get(1);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webSettingsHostApi.setLoadWithOverviewMode(lValueOf, bool);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$9(WebSettingsHostApi webSettingsHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                Boolean bool = (Boolean) arrayList2.get(1);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webSettingsHostApi.setUseWideViewPort(lValueOf, bool);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$10(WebSettingsHostApi webSettingsHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                Boolean bool = (Boolean) arrayList2.get(1);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webSettingsHostApi.setDisplayZoomControls(lValueOf, bool);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$11(WebSettingsHostApi webSettingsHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                Boolean bool = (Boolean) arrayList2.get(1);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webSettingsHostApi.setBuiltInZoomControls(lValueOf, bool);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$12(WebSettingsHostApi webSettingsHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                Boolean bool = (Boolean) arrayList2.get(1);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webSettingsHostApi.setAllowFileAccess(lValueOf, bool);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$13(WebSettingsHostApi webSettingsHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                Number number2 = (Number) arrayList2.get(1);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webSettingsHostApi.setTextZoom(lValueOf, number2 == null ? null : Long.valueOf(number2.longValue()));
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$14(WebSettingsHostApi webSettingsHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                Number number = (Number) ((ArrayList) obj).get(0);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                arrayList.add(0, webSettingsHostApi.getUserAgentString(lValueOf));
                reply.reply(arrayList);
            }
        }
    }

    public interface JavaScriptChannelHostApi {
        void create(Long l, String str);

        /* renamed from: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$JavaScriptChannelHostApi$-CC, reason: invalid class name */
        public final /* synthetic */ class CC {
            public static MessageCodec<Object> getCodec() {
                return new StandardMessageCodec();
            }

            public static void setup(BinaryMessenger binaryMessenger, final JavaScriptChannelHostApi javaScriptChannelHostApi) {
                BasicMessageChannel basicMessageChannel = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.JavaScriptChannelHostApi.create", getCodec());
                if (javaScriptChannelHostApi != null) {
                    basicMessageChannel.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$JavaScriptChannelHostApi$$ExternalSyntheticLambda0
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.JavaScriptChannelHostApi.CC.lambda$setup$0(javaScriptChannelHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel.setMessageHandler(null);
                }
            }

            public static /* synthetic */ void lambda$setup$0(JavaScriptChannelHostApi javaScriptChannelHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                String str = (String) arrayList2.get(1);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                javaScriptChannelHostApi.create(lValueOf, str);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }
        }
    }

    public static class JavaScriptChannelFlutterApi {
        private final BinaryMessenger binaryMessenger;

        public interface Reply<T> {
            void reply(T t);
        }

        public JavaScriptChannelFlutterApi(BinaryMessenger binaryMessenger) {
            this.binaryMessenger = binaryMessenger;
        }

        static MessageCodec<Object> getCodec() {
            return new StandardMessageCodec();
        }

        public void postMessage(Long l, String str, final Reply<Void> reply) {
            new BasicMessageChannel(this.binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.JavaScriptChannelFlutterApi.postMessage", getCodec()).send(new ArrayList(Arrays.asList(l, str)), new BasicMessageChannel.Reply() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$JavaScriptChannelFlutterApi$$ExternalSyntheticLambda0
                @Override // io.flutter.plugin.common.BasicMessageChannel.Reply
                public final void reply(Object obj) {
                    reply.reply(null);
                }
            });
        }
    }

    public interface WebViewClientHostApi {
        void create(Long l);

        void setSynchronousReturnValueForShouldOverrideUrlLoading(Long l, Boolean bool);

        /* renamed from: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewClientHostApi$-CC, reason: invalid class name */
        public final /* synthetic */ class CC {
            public static MessageCodec<Object> getCodec() {
                return new StandardMessageCodec();
            }

            public static void setup(BinaryMessenger binaryMessenger, final WebViewClientHostApi webViewClientHostApi) {
                BasicMessageChannel basicMessageChannel = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewClientHostApi.create", getCodec());
                if (webViewClientHostApi != null) {
                    basicMessageChannel.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewClientHostApi$$ExternalSyntheticLambda0
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebViewClientHostApi.CC.lambda$setup$0(webViewClientHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel2 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewClientHostApi.setSynchronousReturnValueForShouldOverrideUrlLoading", getCodec());
                if (webViewClientHostApi != null) {
                    basicMessageChannel2.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewClientHostApi$$ExternalSyntheticLambda1
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebViewClientHostApi.CC.lambda$setup$1(webViewClientHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel2.setMessageHandler(null);
                }
            }

            public static /* synthetic */ void lambda$setup$0(WebViewClientHostApi webViewClientHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                Number number = (Number) ((ArrayList) obj).get(0);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webViewClientHostApi.create(lValueOf);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$1(WebViewClientHostApi webViewClientHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                Boolean bool = (Boolean) arrayList2.get(1);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webViewClientHostApi.setSynchronousReturnValueForShouldOverrideUrlLoading(lValueOf, bool);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }
        }
    }

    private static class WebViewClientFlutterApiCodec extends StandardMessageCodec {
        public static final WebViewClientFlutterApiCodec INSTANCE = new WebViewClientFlutterApiCodec();

        private WebViewClientFlutterApiCodec() {
        }

        @Override // io.flutter.plugin.common.StandardMessageCodec
        protected Object readValueOfType(byte b, ByteBuffer byteBuffer) {
            switch (b) {
                case -128:
                    return WebResourceErrorData.fromList((ArrayList) readValue(byteBuffer));
                case -127:
                    return WebResourceRequestData.fromList((ArrayList) readValue(byteBuffer));
                case -126:
                    return WebResourceResponseData.fromList((ArrayList) readValue(byteBuffer));
                default:
                    return super.readValueOfType(b, byteBuffer);
            }
        }

        @Override // io.flutter.plugin.common.StandardMessageCodec
        protected void writeValue(ByteArrayOutputStream byteArrayOutputStream, Object obj) {
            if (obj instanceof WebResourceErrorData) {
                byteArrayOutputStream.write(128);
                writeValue(byteArrayOutputStream, ((WebResourceErrorData) obj).toList());
            } else if (obj instanceof WebResourceRequestData) {
                byteArrayOutputStream.write(TsExtractor.TS_STREAM_TYPE_AC3);
                writeValue(byteArrayOutputStream, ((WebResourceRequestData) obj).toList());
            } else if (obj instanceof WebResourceResponseData) {
                byteArrayOutputStream.write(TsExtractor.TS_STREAM_TYPE_HDMV_DTS);
                writeValue(byteArrayOutputStream, ((WebResourceResponseData) obj).toList());
            } else {
                super.writeValue(byteArrayOutputStream, obj);
            }
        }
    }

    public static class WebViewClientFlutterApi {
        private final BinaryMessenger binaryMessenger;

        public interface Reply<T> {
            void reply(T t);
        }

        public WebViewClientFlutterApi(BinaryMessenger binaryMessenger) {
            this.binaryMessenger = binaryMessenger;
        }

        static MessageCodec<Object> getCodec() {
            return WebViewClientFlutterApiCodec.INSTANCE;
        }

        public void onPageStarted(Long l, Long l2, String str, final Reply<Void> reply) {
            new BasicMessageChannel(this.binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewClientFlutterApi.onPageStarted", getCodec()).send(new ArrayList(Arrays.asList(l, l2, str)), new BasicMessageChannel.Reply() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewClientFlutterApi$$ExternalSyntheticLambda2
                @Override // io.flutter.plugin.common.BasicMessageChannel.Reply
                public final void reply(Object obj) {
                    reply.reply(null);
                }
            });
        }

        public void onPageFinished(Long l, Long l2, String str, final Reply<Void> reply) {
            new BasicMessageChannel(this.binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewClientFlutterApi.onPageFinished", getCodec()).send(new ArrayList(Arrays.asList(l, l2, str)), new BasicMessageChannel.Reply() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewClientFlutterApi$$ExternalSyntheticLambda6
                @Override // io.flutter.plugin.common.BasicMessageChannel.Reply
                public final void reply(Object obj) {
                    reply.reply(null);
                }
            });
        }

        public void onReceivedHttpError(Long l, Long l2, WebResourceRequestData webResourceRequestData, WebResourceResponseData webResourceResponseData, final Reply<Void> reply) {
            new BasicMessageChannel(this.binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewClientFlutterApi.onReceivedHttpError", getCodec()).send(new ArrayList(Arrays.asList(l, l2, webResourceRequestData, webResourceResponseData)), new BasicMessageChannel.Reply() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewClientFlutterApi$$ExternalSyntheticLambda8
                @Override // io.flutter.plugin.common.BasicMessageChannel.Reply
                public final void reply(Object obj) {
                    reply.reply(null);
                }
            });
        }

        public void onReceivedRequestError(Long l, Long l2, WebResourceRequestData webResourceRequestData, WebResourceErrorData webResourceErrorData, final Reply<Void> reply) {
            new BasicMessageChannel(this.binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewClientFlutterApi.onReceivedRequestError", getCodec()).send(new ArrayList(Arrays.asList(l, l2, webResourceRequestData, webResourceErrorData)), new BasicMessageChannel.Reply() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewClientFlutterApi$$ExternalSyntheticLambda4
                @Override // io.flutter.plugin.common.BasicMessageChannel.Reply
                public final void reply(Object obj) {
                    reply.reply(null);
                }
            });
        }

        public void onReceivedError(Long l, Long l2, Long l3, String str, String str2, final Reply<Void> reply) {
            new BasicMessageChannel(this.binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewClientFlutterApi.onReceivedError", getCodec()).send(new ArrayList(Arrays.asList(l, l2, l3, str, str2)), new BasicMessageChannel.Reply() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewClientFlutterApi$$ExternalSyntheticLambda1
                @Override // io.flutter.plugin.common.BasicMessageChannel.Reply
                public final void reply(Object obj) {
                    reply.reply(null);
                }
            });
        }

        public void requestLoading(Long l, Long l2, WebResourceRequestData webResourceRequestData, final Reply<Void> reply) {
            new BasicMessageChannel(this.binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewClientFlutterApi.requestLoading", getCodec()).send(new ArrayList(Arrays.asList(l, l2, webResourceRequestData)), new BasicMessageChannel.Reply() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewClientFlutterApi$$ExternalSyntheticLambda3
                @Override // io.flutter.plugin.common.BasicMessageChannel.Reply
                public final void reply(Object obj) {
                    reply.reply(null);
                }
            });
        }

        public void urlLoading(Long l, Long l2, String str, final Reply<Void> reply) {
            new BasicMessageChannel(this.binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewClientFlutterApi.urlLoading", getCodec()).send(new ArrayList(Arrays.asList(l, l2, str)), new BasicMessageChannel.Reply() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewClientFlutterApi$$ExternalSyntheticLambda0
                @Override // io.flutter.plugin.common.BasicMessageChannel.Reply
                public final void reply(Object obj) {
                    reply.reply(null);
                }
            });
        }

        public void doUpdateVisitedHistory(Long l, Long l2, String str, Boolean bool, final Reply<Void> reply) {
            new BasicMessageChannel(this.binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewClientFlutterApi.doUpdateVisitedHistory", getCodec()).send(new ArrayList(Arrays.asList(l, l2, str, bool)), new BasicMessageChannel.Reply() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewClientFlutterApi$$ExternalSyntheticLambda5
                @Override // io.flutter.plugin.common.BasicMessageChannel.Reply
                public final void reply(Object obj) {
                    reply.reply(null);
                }
            });
        }

        public void onReceivedHttpAuthRequest(Long l, Long l2, Long l3, String str, String str2, final Reply<Void> reply) {
            new BasicMessageChannel(this.binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebViewClientFlutterApi.onReceivedHttpAuthRequest", getCodec()).send(new ArrayList(Arrays.asList(l, l2, l3, str, str2)), new BasicMessageChannel.Reply() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebViewClientFlutterApi$$ExternalSyntheticLambda7
                @Override // io.flutter.plugin.common.BasicMessageChannel.Reply
                public final void reply(Object obj) {
                    reply.reply(null);
                }
            });
        }
    }

    public interface DownloadListenerHostApi {
        void create(Long l);

        /* renamed from: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$DownloadListenerHostApi$-CC, reason: invalid class name */
        public final /* synthetic */ class CC {
            public static MessageCodec<Object> getCodec() {
                return new StandardMessageCodec();
            }

            public static void setup(BinaryMessenger binaryMessenger, final DownloadListenerHostApi downloadListenerHostApi) {
                BasicMessageChannel basicMessageChannel = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.DownloadListenerHostApi.create", getCodec());
                if (downloadListenerHostApi != null) {
                    basicMessageChannel.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$DownloadListenerHostApi$$ExternalSyntheticLambda0
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.DownloadListenerHostApi.CC.lambda$setup$0(downloadListenerHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel.setMessageHandler(null);
                }
            }

            public static /* synthetic */ void lambda$setup$0(DownloadListenerHostApi downloadListenerHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                Number number = (Number) ((ArrayList) obj).get(0);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                downloadListenerHostApi.create(lValueOf);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }
        }
    }

    public static class DownloadListenerFlutterApi {
        private final BinaryMessenger binaryMessenger;

        public interface Reply<T> {
            void reply(T t);
        }

        public DownloadListenerFlutterApi(BinaryMessenger binaryMessenger) {
            this.binaryMessenger = binaryMessenger;
        }

        static MessageCodec<Object> getCodec() {
            return new StandardMessageCodec();
        }

        public void onDownloadStart(Long l, String str, String str2, String str3, String str4, Long l2, final Reply<Void> reply) {
            new BasicMessageChannel(this.binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.DownloadListenerFlutterApi.onDownloadStart", getCodec()).send(new ArrayList(Arrays.asList(l, str, str2, str3, str4, l2)), new BasicMessageChannel.Reply() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$DownloadListenerFlutterApi$$ExternalSyntheticLambda0
                @Override // io.flutter.plugin.common.BasicMessageChannel.Reply
                public final void reply(Object obj) {
                    reply.reply(null);
                }
            });
        }
    }

    public interface WebChromeClientHostApi {
        void create(Long l);

        void setSynchronousReturnValueForOnConsoleMessage(Long l, Boolean bool);

        void setSynchronousReturnValueForOnJsAlert(Long l, Boolean bool);

        void setSynchronousReturnValueForOnJsConfirm(Long l, Boolean bool);

        void setSynchronousReturnValueForOnJsPrompt(Long l, Boolean bool);

        void setSynchronousReturnValueForOnShowFileChooser(Long l, Boolean bool);

        /* renamed from: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebChromeClientHostApi$-CC, reason: invalid class name */
        public final /* synthetic */ class CC {
            public static MessageCodec<Object> getCodec() {
                return new StandardMessageCodec();
            }

            public static void setup(BinaryMessenger binaryMessenger, final WebChromeClientHostApi webChromeClientHostApi) {
                BasicMessageChannel basicMessageChannel = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebChromeClientHostApi.create", getCodec());
                if (webChromeClientHostApi != null) {
                    basicMessageChannel.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebChromeClientHostApi$$ExternalSyntheticLambda0
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebChromeClientHostApi.CC.lambda$setup$0(webChromeClientHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel2 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebChromeClientHostApi.setSynchronousReturnValueForOnShowFileChooser", getCodec());
                if (webChromeClientHostApi != null) {
                    basicMessageChannel2.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebChromeClientHostApi$$ExternalSyntheticLambda1
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebChromeClientHostApi.CC.lambda$setup$1(webChromeClientHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel2.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel3 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebChromeClientHostApi.setSynchronousReturnValueForOnConsoleMessage", getCodec());
                if (webChromeClientHostApi != null) {
                    basicMessageChannel3.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebChromeClientHostApi$$ExternalSyntheticLambda2
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebChromeClientHostApi.CC.lambda$setup$2(webChromeClientHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel3.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel4 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebChromeClientHostApi.setSynchronousReturnValueForOnJsAlert", getCodec());
                if (webChromeClientHostApi != null) {
                    basicMessageChannel4.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebChromeClientHostApi$$ExternalSyntheticLambda3
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebChromeClientHostApi.CC.lambda$setup$3(webChromeClientHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel4.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel5 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebChromeClientHostApi.setSynchronousReturnValueForOnJsConfirm", getCodec());
                if (webChromeClientHostApi != null) {
                    basicMessageChannel5.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebChromeClientHostApi$$ExternalSyntheticLambda4
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebChromeClientHostApi.CC.lambda$setup$4(webChromeClientHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel5.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel6 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebChromeClientHostApi.setSynchronousReturnValueForOnJsPrompt", getCodec());
                if (webChromeClientHostApi != null) {
                    basicMessageChannel6.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebChromeClientHostApi$$ExternalSyntheticLambda5
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebChromeClientHostApi.CC.lambda$setup$5(webChromeClientHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel6.setMessageHandler(null);
                }
            }

            public static /* synthetic */ void lambda$setup$0(WebChromeClientHostApi webChromeClientHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                Number number = (Number) ((ArrayList) obj).get(0);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webChromeClientHostApi.create(lValueOf);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$1(WebChromeClientHostApi webChromeClientHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                Boolean bool = (Boolean) arrayList2.get(1);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webChromeClientHostApi.setSynchronousReturnValueForOnShowFileChooser(lValueOf, bool);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$2(WebChromeClientHostApi webChromeClientHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                Boolean bool = (Boolean) arrayList2.get(1);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webChromeClientHostApi.setSynchronousReturnValueForOnConsoleMessage(lValueOf, bool);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$3(WebChromeClientHostApi webChromeClientHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                Boolean bool = (Boolean) arrayList2.get(1);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webChromeClientHostApi.setSynchronousReturnValueForOnJsAlert(lValueOf, bool);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$4(WebChromeClientHostApi webChromeClientHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                Boolean bool = (Boolean) arrayList2.get(1);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webChromeClientHostApi.setSynchronousReturnValueForOnJsConfirm(lValueOf, bool);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$5(WebChromeClientHostApi webChromeClientHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                Boolean bool = (Boolean) arrayList2.get(1);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webChromeClientHostApi.setSynchronousReturnValueForOnJsPrompt(lValueOf, bool);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }
        }
    }

    public interface FlutterAssetManagerHostApi {
        String getAssetFilePathByName(String str);

        List<String> list(String str);

        /* renamed from: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$FlutterAssetManagerHostApi$-CC, reason: invalid class name */
        public final /* synthetic */ class CC {
            public static MessageCodec<Object> getCodec() {
                return new StandardMessageCodec();
            }

            public static void setup(BinaryMessenger binaryMessenger, final FlutterAssetManagerHostApi flutterAssetManagerHostApi) {
                BasicMessageChannel basicMessageChannel = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.FlutterAssetManagerHostApi.list", getCodec());
                if (flutterAssetManagerHostApi != null) {
                    basicMessageChannel.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$FlutterAssetManagerHostApi$$ExternalSyntheticLambda0
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.FlutterAssetManagerHostApi.CC.lambda$setup$0(flutterAssetManagerHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel2 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.FlutterAssetManagerHostApi.getAssetFilePathByName", getCodec());
                if (flutterAssetManagerHostApi != null) {
                    basicMessageChannel2.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$FlutterAssetManagerHostApi$$ExternalSyntheticLambda1
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.FlutterAssetManagerHostApi.CC.lambda$setup$1(flutterAssetManagerHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel2.setMessageHandler(null);
                }
            }

            public static /* synthetic */ void lambda$setup$0(FlutterAssetManagerHostApi flutterAssetManagerHostApi, Object obj, BasicMessageChannel.Reply reply) {
                ArrayList<Object> arrayList = new ArrayList<>();
                try {
                    arrayList.add(0, flutterAssetManagerHostApi.list((String) ((ArrayList) obj).get(0)));
                } catch (Throwable th) {
                    arrayList = GeneratedAndroidWebView.wrapError(th);
                }
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$1(FlutterAssetManagerHostApi flutterAssetManagerHostApi, Object obj, BasicMessageChannel.Reply reply) {
                ArrayList<Object> arrayList = new ArrayList<>();
                try {
                    arrayList.add(0, flutterAssetManagerHostApi.getAssetFilePathByName((String) ((ArrayList) obj).get(0)));
                } catch (Throwable th) {
                    arrayList = GeneratedAndroidWebView.wrapError(th);
                }
                reply.reply(arrayList);
            }
        }
    }

    private static class WebChromeClientFlutterApiCodec extends StandardMessageCodec {
        public static final WebChromeClientFlutterApiCodec INSTANCE = new WebChromeClientFlutterApiCodec();

        private WebChromeClientFlutterApiCodec() {
        }

        @Override // io.flutter.plugin.common.StandardMessageCodec
        protected Object readValueOfType(byte b, ByteBuffer byteBuffer) {
            if (b == -128) {
                return ConsoleMessage.fromList((ArrayList) readValue(byteBuffer));
            }
            return super.readValueOfType(b, byteBuffer);
        }

        @Override // io.flutter.plugin.common.StandardMessageCodec
        protected void writeValue(ByteArrayOutputStream byteArrayOutputStream, Object obj) {
            if (obj instanceof ConsoleMessage) {
                byteArrayOutputStream.write(128);
                writeValue(byteArrayOutputStream, ((ConsoleMessage) obj).toList());
            } else {
                super.writeValue(byteArrayOutputStream, obj);
            }
        }
    }

    public static class WebChromeClientFlutterApi {
        private final BinaryMessenger binaryMessenger;

        public interface Reply<T> {
            void reply(T t);
        }

        public WebChromeClientFlutterApi(BinaryMessenger binaryMessenger) {
            this.binaryMessenger = binaryMessenger;
        }

        static MessageCodec<Object> getCodec() {
            return WebChromeClientFlutterApiCodec.INSTANCE;
        }

        public void onProgressChanged(Long l, Long l2, Long l3, final Reply<Void> reply) {
            new BasicMessageChannel(this.binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebChromeClientFlutterApi.onProgressChanged", getCodec()).send(new ArrayList(Arrays.asList(l, l2, l3)), new BasicMessageChannel.Reply() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebChromeClientFlutterApi$$ExternalSyntheticLambda8
                @Override // io.flutter.plugin.common.BasicMessageChannel.Reply
                public final void reply(Object obj) {
                    reply.reply(null);
                }
            });
        }

        public void onShowFileChooser(Long l, Long l2, Long l3, final Reply<List<String>> reply) {
            new BasicMessageChannel(this.binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebChromeClientFlutterApi.onShowFileChooser", getCodec()).send(new ArrayList(Arrays.asList(l, l2, l3)), new BasicMessageChannel.Reply() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebChromeClientFlutterApi$$ExternalSyntheticLambda1
                @Override // io.flutter.plugin.common.BasicMessageChannel.Reply
                public final void reply(Object obj) {
                    reply.reply((List) obj);
                }
            });
        }

        public void onPermissionRequest(Long l, Long l2, final Reply<Void> reply) {
            new BasicMessageChannel(this.binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebChromeClientFlutterApi.onPermissionRequest", getCodec()).send(new ArrayList(Arrays.asList(l, l2)), new BasicMessageChannel.Reply() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebChromeClientFlutterApi$$ExternalSyntheticLambda5
                @Override // io.flutter.plugin.common.BasicMessageChannel.Reply
                public final void reply(Object obj) {
                    reply.reply(null);
                }
            });
        }

        public void onShowCustomView(Long l, Long l2, Long l3, final Reply<Void> reply) {
            new BasicMessageChannel(this.binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebChromeClientFlutterApi.onShowCustomView", getCodec()).send(new ArrayList(Arrays.asList(l, l2, l3)), new BasicMessageChannel.Reply() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebChromeClientFlutterApi$$ExternalSyntheticLambda7
                @Override // io.flutter.plugin.common.BasicMessageChannel.Reply
                public final void reply(Object obj) {
                    reply.reply(null);
                }
            });
        }

        public void onHideCustomView(Long l, final Reply<Void> reply) {
            new BasicMessageChannel(this.binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebChromeClientFlutterApi.onHideCustomView", getCodec()).send(new ArrayList(Collections.singletonList(l)), new BasicMessageChannel.Reply() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebChromeClientFlutterApi$$ExternalSyntheticLambda2
                @Override // io.flutter.plugin.common.BasicMessageChannel.Reply
                public final void reply(Object obj) {
                    reply.reply(null);
                }
            });
        }

        public void onGeolocationPermissionsShowPrompt(Long l, Long l2, String str, final Reply<Void> reply) {
            new BasicMessageChannel(this.binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebChromeClientFlutterApi.onGeolocationPermissionsShowPrompt", getCodec()).send(new ArrayList(Arrays.asList(l, l2, str)), new BasicMessageChannel.Reply() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebChromeClientFlutterApi$$ExternalSyntheticLambda0
                @Override // io.flutter.plugin.common.BasicMessageChannel.Reply
                public final void reply(Object obj) {
                    reply.reply(null);
                }
            });
        }

        public void onGeolocationPermissionsHidePrompt(Long l, final Reply<Void> reply) {
            new BasicMessageChannel(this.binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebChromeClientFlutterApi.onGeolocationPermissionsHidePrompt", getCodec()).send(new ArrayList(Collections.singletonList(l)), new BasicMessageChannel.Reply() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebChromeClientFlutterApi$$ExternalSyntheticLambda10
                @Override // io.flutter.plugin.common.BasicMessageChannel.Reply
                public final void reply(Object obj) {
                    reply.reply(null);
                }
            });
        }

        public void onConsoleMessage(Long l, ConsoleMessage consoleMessage, final Reply<Void> reply) {
            new BasicMessageChannel(this.binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebChromeClientFlutterApi.onConsoleMessage", getCodec()).send(new ArrayList(Arrays.asList(l, consoleMessage)), new BasicMessageChannel.Reply() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebChromeClientFlutterApi$$ExternalSyntheticLambda4
                @Override // io.flutter.plugin.common.BasicMessageChannel.Reply
                public final void reply(Object obj) {
                    reply.reply(null);
                }
            });
        }

        public void onJsAlert(Long l, String str, String str2, final Reply<Void> reply) {
            new BasicMessageChannel(this.binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebChromeClientFlutterApi.onJsAlert", getCodec()).send(new ArrayList(Arrays.asList(l, str, str2)), new BasicMessageChannel.Reply() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebChromeClientFlutterApi$$ExternalSyntheticLambda3
                @Override // io.flutter.plugin.common.BasicMessageChannel.Reply
                public final void reply(Object obj) {
                    reply.reply(null);
                }
            });
        }

        public void onJsConfirm(Long l, String str, String str2, final Reply<Boolean> reply) {
            new BasicMessageChannel(this.binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebChromeClientFlutterApi.onJsConfirm", getCodec()).send(new ArrayList(Arrays.asList(l, str, str2)), new BasicMessageChannel.Reply() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebChromeClientFlutterApi$$ExternalSyntheticLambda9
                @Override // io.flutter.plugin.common.BasicMessageChannel.Reply
                public final void reply(Object obj) {
                    reply.reply((Boolean) obj);
                }
            });
        }

        public void onJsPrompt(Long l, String str, String str2, String str3, final Reply<String> reply) {
            new BasicMessageChannel(this.binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebChromeClientFlutterApi.onJsPrompt", getCodec()).send(new ArrayList(Arrays.asList(l, str, str2, str3)), new BasicMessageChannel.Reply() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebChromeClientFlutterApi$$ExternalSyntheticLambda6
                @Override // io.flutter.plugin.common.BasicMessageChannel.Reply
                public final void reply(Object obj) {
                    reply.reply((String) obj);
                }
            });
        }
    }

    public interface WebStorageHostApi {
        void create(Long l);

        void deleteAllData(Long l);

        /* renamed from: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebStorageHostApi$-CC, reason: invalid class name */
        public final /* synthetic */ class CC {
            public static MessageCodec<Object> getCodec() {
                return new StandardMessageCodec();
            }

            public static void setup(BinaryMessenger binaryMessenger, final WebStorageHostApi webStorageHostApi) {
                BasicMessageChannel basicMessageChannel = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebStorageHostApi.create", getCodec());
                if (webStorageHostApi != null) {
                    basicMessageChannel.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebStorageHostApi$$ExternalSyntheticLambda0
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebStorageHostApi.CC.lambda$setup$0(webStorageHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel2 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.WebStorageHostApi.deleteAllData", getCodec());
                if (webStorageHostApi != null) {
                    basicMessageChannel2.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$WebStorageHostApi$$ExternalSyntheticLambda1
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.WebStorageHostApi.CC.lambda$setup$1(webStorageHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel2.setMessageHandler(null);
                }
            }

            public static /* synthetic */ void lambda$setup$0(WebStorageHostApi webStorageHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                Number number = (Number) ((ArrayList) obj).get(0);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webStorageHostApi.create(lValueOf);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$1(WebStorageHostApi webStorageHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                Number number = (Number) ((ArrayList) obj).get(0);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                webStorageHostApi.deleteAllData(lValueOf);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }
        }
    }

    public static class FileChooserParamsFlutterApi {
        private final BinaryMessenger binaryMessenger;

        public interface Reply<T> {
            void reply(T t);
        }

        public FileChooserParamsFlutterApi(BinaryMessenger binaryMessenger) {
            this.binaryMessenger = binaryMessenger;
        }

        static MessageCodec<Object> getCodec() {
            return new StandardMessageCodec();
        }

        public void create(Long l, Boolean bool, List<String> list, FileChooserMode fileChooserMode, String str, final Reply<Void> reply) {
            new BasicMessageChannel(this.binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.FileChooserParamsFlutterApi.create", getCodec()).send(new ArrayList(Arrays.asList(l, bool, list, Integer.valueOf(fileChooserMode.index), str)), new BasicMessageChannel.Reply() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$FileChooserParamsFlutterApi$$ExternalSyntheticLambda0
                @Override // io.flutter.plugin.common.BasicMessageChannel.Reply
                public final void reply(Object obj) {
                    reply.reply(null);
                }
            });
        }
    }

    public interface PermissionRequestHostApi {
        void deny(Long l);

        void grant(Long l, List<String> list);

        /* renamed from: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$PermissionRequestHostApi$-CC, reason: invalid class name */
        public final /* synthetic */ class CC {
            public static MessageCodec<Object> getCodec() {
                return new StandardMessageCodec();
            }

            public static void setup(BinaryMessenger binaryMessenger, final PermissionRequestHostApi permissionRequestHostApi) {
                BasicMessageChannel basicMessageChannel = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.PermissionRequestHostApi.grant", getCodec());
                if (permissionRequestHostApi != null) {
                    basicMessageChannel.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$PermissionRequestHostApi$$ExternalSyntheticLambda0
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.PermissionRequestHostApi.CC.lambda$setup$0(permissionRequestHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel2 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.PermissionRequestHostApi.deny", getCodec());
                if (permissionRequestHostApi != null) {
                    basicMessageChannel2.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$PermissionRequestHostApi$$ExternalSyntheticLambda1
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.PermissionRequestHostApi.CC.lambda$setup$1(permissionRequestHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel2.setMessageHandler(null);
                }
            }

            public static /* synthetic */ void lambda$setup$0(PermissionRequestHostApi permissionRequestHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                List<String> list = (List) arrayList2.get(1);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                permissionRequestHostApi.grant(lValueOf, list);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$1(PermissionRequestHostApi permissionRequestHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                Number number = (Number) ((ArrayList) obj).get(0);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                permissionRequestHostApi.deny(lValueOf);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }
        }
    }

    public static class PermissionRequestFlutterApi {
        private final BinaryMessenger binaryMessenger;

        public interface Reply<T> {
            void reply(T t);
        }

        public PermissionRequestFlutterApi(BinaryMessenger binaryMessenger) {
            this.binaryMessenger = binaryMessenger;
        }

        static MessageCodec<Object> getCodec() {
            return new StandardMessageCodec();
        }

        public void create(Long l, List<String> list, final Reply<Void> reply) {
            new BasicMessageChannel(this.binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.PermissionRequestFlutterApi.create", getCodec()).send(new ArrayList(Arrays.asList(l, list)), new BasicMessageChannel.Reply() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$PermissionRequestFlutterApi$$ExternalSyntheticLambda0
                @Override // io.flutter.plugin.common.BasicMessageChannel.Reply
                public final void reply(Object obj) {
                    reply.reply(null);
                }
            });
        }
    }

    public interface CustomViewCallbackHostApi {
        void onCustomViewHidden(Long l);

        /* renamed from: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$CustomViewCallbackHostApi$-CC, reason: invalid class name */
        public final /* synthetic */ class CC {
            public static MessageCodec<Object> getCodec() {
                return new StandardMessageCodec();
            }

            public static void setup(BinaryMessenger binaryMessenger, final CustomViewCallbackHostApi customViewCallbackHostApi) {
                BasicMessageChannel basicMessageChannel = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.CustomViewCallbackHostApi.onCustomViewHidden", getCodec());
                if (customViewCallbackHostApi != null) {
                    basicMessageChannel.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$CustomViewCallbackHostApi$$ExternalSyntheticLambda0
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.CustomViewCallbackHostApi.CC.lambda$setup$0(customViewCallbackHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel.setMessageHandler(null);
                }
            }

            public static /* synthetic */ void lambda$setup$0(CustomViewCallbackHostApi customViewCallbackHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                Number number = (Number) ((ArrayList) obj).get(0);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                customViewCallbackHostApi.onCustomViewHidden(lValueOf);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }
        }
    }

    public static class CustomViewCallbackFlutterApi {
        private final BinaryMessenger binaryMessenger;

        public interface Reply<T> {
            void reply(T t);
        }

        public CustomViewCallbackFlutterApi(BinaryMessenger binaryMessenger) {
            this.binaryMessenger = binaryMessenger;
        }

        static MessageCodec<Object> getCodec() {
            return new StandardMessageCodec();
        }

        public void create(Long l, final Reply<Void> reply) {
            new BasicMessageChannel(this.binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.CustomViewCallbackFlutterApi.create", getCodec()).send(new ArrayList(Collections.singletonList(l)), new BasicMessageChannel.Reply() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$CustomViewCallbackFlutterApi$$ExternalSyntheticLambda0
                @Override // io.flutter.plugin.common.BasicMessageChannel.Reply
                public final void reply(Object obj) {
                    reply.reply(null);
                }
            });
        }
    }

    public static class ViewFlutterApi {
        private final BinaryMessenger binaryMessenger;

        public interface Reply<T> {
            void reply(T t);
        }

        public ViewFlutterApi(BinaryMessenger binaryMessenger) {
            this.binaryMessenger = binaryMessenger;
        }

        static MessageCodec<Object> getCodec() {
            return new StandardMessageCodec();
        }

        public void create(Long l, final Reply<Void> reply) {
            new BasicMessageChannel(this.binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.ViewFlutterApi.create", getCodec()).send(new ArrayList(Collections.singletonList(l)), new BasicMessageChannel.Reply() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$ViewFlutterApi$$ExternalSyntheticLambda0
                @Override // io.flutter.plugin.common.BasicMessageChannel.Reply
                public final void reply(Object obj) {
                    reply.reply(null);
                }
            });
        }
    }

    public interface GeolocationPermissionsCallbackHostApi {
        void invoke(Long l, String str, Boolean bool, Boolean bool2);

        /* renamed from: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$GeolocationPermissionsCallbackHostApi$-CC, reason: invalid class name */
        public final /* synthetic */ class CC {
            public static MessageCodec<Object> getCodec() {
                return new StandardMessageCodec();
            }

            public static void setup(BinaryMessenger binaryMessenger, final GeolocationPermissionsCallbackHostApi geolocationPermissionsCallbackHostApi) {
                BasicMessageChannel basicMessageChannel = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.GeolocationPermissionsCallbackHostApi.invoke", getCodec());
                if (geolocationPermissionsCallbackHostApi != null) {
                    basicMessageChannel.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$GeolocationPermissionsCallbackHostApi$$ExternalSyntheticLambda0
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.GeolocationPermissionsCallbackHostApi.CC.lambda$setup$0(geolocationPermissionsCallbackHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel.setMessageHandler(null);
                }
            }

            public static /* synthetic */ void lambda$setup$0(GeolocationPermissionsCallbackHostApi geolocationPermissionsCallbackHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                String str = (String) arrayList2.get(1);
                Boolean bool = (Boolean) arrayList2.get(2);
                Boolean bool2 = (Boolean) arrayList2.get(3);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                geolocationPermissionsCallbackHostApi.invoke(lValueOf, str, bool, bool2);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }
        }
    }

    public static class GeolocationPermissionsCallbackFlutterApi {
        private final BinaryMessenger binaryMessenger;

        public interface Reply<T> {
            void reply(T t);
        }

        public GeolocationPermissionsCallbackFlutterApi(BinaryMessenger binaryMessenger) {
            this.binaryMessenger = binaryMessenger;
        }

        static MessageCodec<Object> getCodec() {
            return new StandardMessageCodec();
        }

        public void create(Long l, final Reply<Void> reply) {
            new BasicMessageChannel(this.binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.GeolocationPermissionsCallbackFlutterApi.create", getCodec()).send(new ArrayList(Collections.singletonList(l)), new BasicMessageChannel.Reply() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$GeolocationPermissionsCallbackFlutterApi$$ExternalSyntheticLambda0
                @Override // io.flutter.plugin.common.BasicMessageChannel.Reply
                public final void reply(Object obj) {
                    reply.reply(null);
                }
            });
        }
    }

    public interface HttpAuthHandlerHostApi {
        void cancel(Long l);

        void proceed(Long l, String str, String str2);

        Boolean useHttpAuthUsernamePassword(Long l);

        /* renamed from: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$HttpAuthHandlerHostApi$-CC, reason: invalid class name */
        public final /* synthetic */ class CC {
            public static MessageCodec<Object> getCodec() {
                return new StandardMessageCodec();
            }

            public static void setup(BinaryMessenger binaryMessenger, final HttpAuthHandlerHostApi httpAuthHandlerHostApi) {
                BasicMessageChannel basicMessageChannel = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.HttpAuthHandlerHostApi.useHttpAuthUsernamePassword", getCodec());
                if (httpAuthHandlerHostApi != null) {
                    basicMessageChannel.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$HttpAuthHandlerHostApi$$ExternalSyntheticLambda0
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.HttpAuthHandlerHostApi.CC.lambda$setup$0(httpAuthHandlerHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel2 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.HttpAuthHandlerHostApi.cancel", getCodec());
                if (httpAuthHandlerHostApi != null) {
                    basicMessageChannel2.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$HttpAuthHandlerHostApi$$ExternalSyntheticLambda1
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.HttpAuthHandlerHostApi.CC.lambda$setup$1(httpAuthHandlerHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel2.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel3 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.HttpAuthHandlerHostApi.proceed", getCodec());
                if (httpAuthHandlerHostApi != null) {
                    basicMessageChannel3.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$HttpAuthHandlerHostApi$$ExternalSyntheticLambda2
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            GeneratedAndroidWebView.HttpAuthHandlerHostApi.CC.lambda$setup$2(httpAuthHandlerHostApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel3.setMessageHandler(null);
                }
            }

            public static /* synthetic */ void lambda$setup$0(HttpAuthHandlerHostApi httpAuthHandlerHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                Number number = (Number) ((ArrayList) obj).get(0);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                arrayList.add(0, httpAuthHandlerHostApi.useHttpAuthUsernamePassword(lValueOf));
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$1(HttpAuthHandlerHostApi httpAuthHandlerHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                Number number = (Number) ((ArrayList) obj).get(0);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                httpAuthHandlerHostApi.cancel(lValueOf);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$2(HttpAuthHandlerHostApi httpAuthHandlerHostApi, Object obj, BasicMessageChannel.Reply reply) {
                Long lValueOf;
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                Number number = (Number) arrayList2.get(0);
                String str = (String) arrayList2.get(1);
                String str2 = (String) arrayList2.get(2);
                if (number == null) {
                    lValueOf = null;
                } else {
                    try {
                        lValueOf = Long.valueOf(number.longValue());
                    } catch (Throwable th) {
                        arrayList = GeneratedAndroidWebView.wrapError(th);
                    }
                }
                httpAuthHandlerHostApi.proceed(lValueOf, str, str2);
                arrayList.add(0, null);
                reply.reply(arrayList);
            }
        }
    }

    public static class HttpAuthHandlerFlutterApi {
        private final BinaryMessenger binaryMessenger;

        public interface Reply<T> {
            void reply(T t);
        }

        public HttpAuthHandlerFlutterApi(BinaryMessenger binaryMessenger) {
            this.binaryMessenger = binaryMessenger;
        }

        static MessageCodec<Object> getCodec() {
            return new StandardMessageCodec();
        }

        public void create(Long l, final Reply<Void> reply) {
            new BasicMessageChannel(this.binaryMessenger, "dev.flutter.pigeon.webview_flutter_android.HttpAuthHandlerFlutterApi.create", getCodec()).send(new ArrayList(Collections.singletonList(l)), new BasicMessageChannel.Reply() { // from class: io.flutter.plugins.webviewflutter.GeneratedAndroidWebView$HttpAuthHandlerFlutterApi$$ExternalSyntheticLambda0
                @Override // io.flutter.plugin.common.BasicMessageChannel.Reply
                public final void reply(Object obj) {
                    reply.reply(null);
                }
            });
        }
    }
}
