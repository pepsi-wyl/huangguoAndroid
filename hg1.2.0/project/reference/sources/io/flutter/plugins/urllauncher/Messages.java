package io.flutter.plugins.urllauncher;

import android.util.Log;
import androidx.media3.extractor.ts.TsExtractor;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugins.urllauncher.Messages;
import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Map;

/* loaded from: classes2.dex */
public class Messages {

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

    public static final class WebViewOptions {
        private Boolean enableDomStorage;
        private Boolean enableJavaScript;
        private Map<String, String> headers;

        public Boolean getEnableJavaScript() {
            return this.enableJavaScript;
        }

        public void setEnableJavaScript(Boolean bool) {
            if (bool == null) {
                throw new IllegalStateException("Nonnull field \"enableJavaScript\" is null.");
            }
            this.enableJavaScript = bool;
        }

        public Boolean getEnableDomStorage() {
            return this.enableDomStorage;
        }

        public void setEnableDomStorage(Boolean bool) {
            if (bool == null) {
                throw new IllegalStateException("Nonnull field \"enableDomStorage\" is null.");
            }
            this.enableDomStorage = bool;
        }

        public Map<String, String> getHeaders() {
            return this.headers;
        }

        public void setHeaders(Map<String, String> map) {
            if (map == null) {
                throw new IllegalStateException("Nonnull field \"headers\" is null.");
            }
            this.headers = map;
        }

        WebViewOptions() {
        }

        public static final class Builder {
            private Boolean enableDomStorage;
            private Boolean enableJavaScript;
            private Map<String, String> headers;

            public Builder setEnableJavaScript(Boolean bool) {
                this.enableJavaScript = bool;
                return this;
            }

            public Builder setEnableDomStorage(Boolean bool) {
                this.enableDomStorage = bool;
                return this;
            }

            public Builder setHeaders(Map<String, String> map) {
                this.headers = map;
                return this;
            }

            public WebViewOptions build() {
                WebViewOptions webViewOptions = new WebViewOptions();
                webViewOptions.setEnableJavaScript(this.enableJavaScript);
                webViewOptions.setEnableDomStorage(this.enableDomStorage);
                webViewOptions.setHeaders(this.headers);
                return webViewOptions;
            }
        }

        ArrayList<Object> toList() {
            ArrayList<Object> arrayList = new ArrayList<>(3);
            arrayList.add(this.enableJavaScript);
            arrayList.add(this.enableDomStorage);
            arrayList.add(this.headers);
            return arrayList;
        }

        static WebViewOptions fromList(ArrayList<Object> arrayList) {
            WebViewOptions webViewOptions = new WebViewOptions();
            webViewOptions.setEnableJavaScript((Boolean) arrayList.get(0));
            webViewOptions.setEnableDomStorage((Boolean) arrayList.get(1));
            webViewOptions.setHeaders((Map) arrayList.get(2));
            return webViewOptions;
        }
    }

    public static final class BrowserOptions {
        private Boolean showTitle;

        public Boolean getShowTitle() {
            return this.showTitle;
        }

        public void setShowTitle(Boolean bool) {
            if (bool == null) {
                throw new IllegalStateException("Nonnull field \"showTitle\" is null.");
            }
            this.showTitle = bool;
        }

        BrowserOptions() {
        }

        public static final class Builder {
            private Boolean showTitle;

            public Builder setShowTitle(Boolean bool) {
                this.showTitle = bool;
                return this;
            }

            public BrowserOptions build() {
                BrowserOptions browserOptions = new BrowserOptions();
                browserOptions.setShowTitle(this.showTitle);
                return browserOptions;
            }
        }

        ArrayList<Object> toList() {
            ArrayList<Object> arrayList = new ArrayList<>(1);
            arrayList.add(this.showTitle);
            return arrayList;
        }

        static BrowserOptions fromList(ArrayList<Object> arrayList) {
            BrowserOptions browserOptions = new BrowserOptions();
            browserOptions.setShowTitle((Boolean) arrayList.get(0));
            return browserOptions;
        }
    }

    private static class UrlLauncherApiCodec extends StandardMessageCodec {
        public static final UrlLauncherApiCodec INSTANCE = new UrlLauncherApiCodec();

        private UrlLauncherApiCodec() {
        }

        @Override // io.flutter.plugin.common.StandardMessageCodec
        protected Object readValueOfType(byte b, ByteBuffer byteBuffer) {
            if (b == -128) {
                return BrowserOptions.fromList((ArrayList) readValue(byteBuffer));
            }
            if (b == -127) {
                return WebViewOptions.fromList((ArrayList) readValue(byteBuffer));
            }
            return super.readValueOfType(b, byteBuffer);
        }

        @Override // io.flutter.plugin.common.StandardMessageCodec
        protected void writeValue(ByteArrayOutputStream byteArrayOutputStream, Object obj) {
            if (obj instanceof BrowserOptions) {
                byteArrayOutputStream.write(128);
                writeValue(byteArrayOutputStream, ((BrowserOptions) obj).toList());
            } else if (obj instanceof WebViewOptions) {
                byteArrayOutputStream.write(TsExtractor.TS_STREAM_TYPE_AC3);
                writeValue(byteArrayOutputStream, ((WebViewOptions) obj).toList());
            } else {
                super.writeValue(byteArrayOutputStream, obj);
            }
        }
    }

    public interface UrlLauncherApi {
        Boolean canLaunchUrl(String str);

        void closeWebView();

        Boolean launchUrl(String str, Map<String, String> map);

        Boolean openUrlInApp(String str, Boolean bool, WebViewOptions webViewOptions, BrowserOptions browserOptions);

        Boolean supportsCustomTabs();

        /* renamed from: io.flutter.plugins.urllauncher.Messages$UrlLauncherApi$-CC, reason: invalid class name */
        public final /* synthetic */ class CC {
            public static MessageCodec<Object> getCodec() {
                return UrlLauncherApiCodec.INSTANCE;
            }

            public static void setup(BinaryMessenger binaryMessenger, final UrlLauncherApi urlLauncherApi) {
                BasicMessageChannel basicMessageChannel = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.url_launcher_android.UrlLauncherApi.canLaunchUrl", getCodec());
                if (urlLauncherApi != null) {
                    basicMessageChannel.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.urllauncher.Messages$UrlLauncherApi$$ExternalSyntheticLambda0
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            Messages.UrlLauncherApi.CC.lambda$setup$0(urlLauncherApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel2 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.url_launcher_android.UrlLauncherApi.launchUrl", getCodec());
                if (urlLauncherApi != null) {
                    basicMessageChannel2.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.urllauncher.Messages$UrlLauncherApi$$ExternalSyntheticLambda1
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            Messages.UrlLauncherApi.CC.lambda$setup$1(urlLauncherApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel2.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel3 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.url_launcher_android.UrlLauncherApi.openUrlInApp", getCodec());
                if (urlLauncherApi != null) {
                    basicMessageChannel3.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.urllauncher.Messages$UrlLauncherApi$$ExternalSyntheticLambda2
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            Messages.UrlLauncherApi.CC.lambda$setup$2(urlLauncherApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel3.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel4 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.url_launcher_android.UrlLauncherApi.supportsCustomTabs", getCodec());
                if (urlLauncherApi != null) {
                    basicMessageChannel4.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.urllauncher.Messages$UrlLauncherApi$$ExternalSyntheticLambda3
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            Messages.UrlLauncherApi.CC.lambda$setup$3(urlLauncherApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel4.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel5 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.url_launcher_android.UrlLauncherApi.closeWebView", getCodec());
                if (urlLauncherApi != null) {
                    basicMessageChannel5.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.urllauncher.Messages$UrlLauncherApi$$ExternalSyntheticLambda4
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            Messages.UrlLauncherApi.CC.lambda$setup$4(urlLauncherApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel5.setMessageHandler(null);
                }
            }

            public static /* synthetic */ void lambda$setup$0(UrlLauncherApi urlLauncherApi, Object obj, BasicMessageChannel.Reply reply) {
                ArrayList<Object> arrayList = new ArrayList<>();
                try {
                    arrayList.add(0, urlLauncherApi.canLaunchUrl((String) ((ArrayList) obj).get(0)));
                } catch (Throwable th) {
                    arrayList = Messages.wrapError(th);
                }
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$1(UrlLauncherApi urlLauncherApi, Object obj, BasicMessageChannel.Reply reply) {
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                try {
                    arrayList.add(0, urlLauncherApi.launchUrl((String) arrayList2.get(0), (Map) arrayList2.get(1)));
                } catch (Throwable th) {
                    arrayList = Messages.wrapError(th);
                }
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$2(UrlLauncherApi urlLauncherApi, Object obj, BasicMessageChannel.Reply reply) {
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                try {
                    arrayList.add(0, urlLauncherApi.openUrlInApp((String) arrayList2.get(0), (Boolean) arrayList2.get(1), (WebViewOptions) arrayList2.get(2), (BrowserOptions) arrayList2.get(3)));
                } catch (Throwable th) {
                    arrayList = Messages.wrapError(th);
                }
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$3(UrlLauncherApi urlLauncherApi, Object obj, BasicMessageChannel.Reply reply) {
                ArrayList<Object> arrayList = new ArrayList<>();
                try {
                    arrayList.add(0, urlLauncherApi.supportsCustomTabs());
                } catch (Throwable th) {
                    arrayList = Messages.wrapError(th);
                }
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$4(UrlLauncherApi urlLauncherApi, Object obj, BasicMessageChannel.Reply reply) {
                ArrayList<Object> arrayList = new ArrayList<>();
                try {
                    urlLauncherApi.closeWebView();
                    arrayList.add(0, null);
                } catch (Throwable th) {
                    arrayList = Messages.wrapError(th);
                }
                reply.reply(arrayList);
            }
        }
    }
}
