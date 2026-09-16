package io.flutter.plugins.sharedpreferences;

import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugins.sharedpreferences.SharedPreferencesAsyncApi;
import java.util.List;
import java.util.Map;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: MessagesAsync.g.kt */
@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010$\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u0006\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\f\bf\u0018\u0000 \u001e2\u00020\u0001:\u0001\u001eJ \u0010\u0002\u001a\u00020\u00032\u000e\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u00052\u0006\u0010\u0007\u001a\u00020\bH&J,\u0010\t\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00010\n2\u000e\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u00052\u0006\u0010\u0007\u001a\u00020\bH&J\u001f\u0010\u000b\u001a\u0004\u0018\u00010\f2\u0006\u0010\r\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\bH&¢\u0006\u0002\u0010\u000eJ\u001f\u0010\u000f\u001a\u0004\u0018\u00010\u00102\u0006\u0010\r\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\bH&¢\u0006\u0002\u0010\u0011J\u001f\u0010\u0012\u001a\u0004\u0018\u00010\u00132\u0006\u0010\r\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\bH&¢\u0006\u0002\u0010\u0014J&\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\u000e\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u00052\u0006\u0010\u0007\u001a\u00020\bH&J\u001a\u0010\u0016\u001a\u0004\u0018\u00010\u00062\u0006\u0010\r\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\bH&J \u0010\u0017\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u00052\u0006\u0010\r\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\bH&J \u0010\u0018\u001a\u00020\u00032\u0006\u0010\r\u001a\u00020\u00062\u0006\u0010\u0019\u001a\u00020\f2\u0006\u0010\u0007\u001a\u00020\bH&J \u0010\u001a\u001a\u00020\u00032\u0006\u0010\r\u001a\u00020\u00062\u0006\u0010\u0019\u001a\u00020\u00102\u0006\u0010\u0007\u001a\u00020\bH&J \u0010\u001b\u001a\u00020\u00032\u0006\u0010\r\u001a\u00020\u00062\u0006\u0010\u0019\u001a\u00020\u00132\u0006\u0010\u0007\u001a\u00020\bH&J \u0010\u001c\u001a\u00020\u00032\u0006\u0010\r\u001a\u00020\u00062\u0006\u0010\u0019\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\bH&J&\u0010\u001d\u001a\u00020\u00032\u0006\u0010\r\u001a\u00020\u00062\f\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\u0006\u0010\u0007\u001a\u00020\bH&¨\u0006\u001f"}, d2 = {"Lio/flutter/plugins/sharedpreferences/SharedPreferencesAsyncApi;", "", "clear", "", "allowList", "", "", "options", "Lio/flutter/plugins/sharedpreferences/SharedPreferencesPigeonOptions;", "getAll", "", "getBool", "", "key", "(Ljava/lang/String;Lio/flutter/plugins/sharedpreferences/SharedPreferencesPigeonOptions;)Ljava/lang/Boolean;", "getDouble", "", "(Ljava/lang/String;Lio/flutter/plugins/sharedpreferences/SharedPreferencesPigeonOptions;)Ljava/lang/Double;", "getInt", "", "(Ljava/lang/String;Lio/flutter/plugins/sharedpreferences/SharedPreferencesPigeonOptions;)Ljava/lang/Long;", "getKeys", "getString", "getStringList", "setBool", "value", "setDouble", "setInt", "setString", "setStringList", "Companion", "shared_preferences_android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public interface SharedPreferencesAsyncApi {

    /* renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = Companion.$$INSTANCE;

    void clear(List<String> allowList, SharedPreferencesPigeonOptions options);

    Map<String, Object> getAll(List<String> allowList, SharedPreferencesPigeonOptions options);

    Boolean getBool(String key, SharedPreferencesPigeonOptions options);

    Double getDouble(String key, SharedPreferencesPigeonOptions options);

    Long getInt(String key, SharedPreferencesPigeonOptions options);

    List<String> getKeys(List<String> allowList, SharedPreferencesPigeonOptions options);

    String getString(String key, SharedPreferencesPigeonOptions options);

    List<String> getStringList(String key, SharedPreferencesPigeonOptions options);

    void setBool(String key, boolean value, SharedPreferencesPigeonOptions options);

    void setDouble(String key, double value, SharedPreferencesPigeonOptions options);

    void setInt(String key, long value, SharedPreferencesPigeonOptions options);

    void setString(String key, String value, SharedPreferencesPigeonOptions options);

    void setStringList(String key, List<String> value, SharedPreferencesPigeonOptions options);

    /* compiled from: MessagesAsync.g.kt */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0018\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\f2\b\u0010\r\u001a\u0004\u0018\u00010\u000eR#\u0010\u0003\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u00048FX\u0086\u0084\u0002¢\u0006\f\n\u0004\b\u0007\u0010\b\u001a\u0004\b\u0005\u0010\u0006¨\u0006\u000f"}, d2 = {"Lio/flutter/plugins/sharedpreferences/SharedPreferencesAsyncApi$Companion;", "", "()V", "codec", "Lio/flutter/plugin/common/MessageCodec;", "getCodec", "()Lio/flutter/plugin/common/MessageCodec;", "codec$delegate", "Lkotlin/Lazy;", "setUp", "", "binaryMessenger", "Lio/flutter/plugin/common/BinaryMessenger;", "api", "Lio/flutter/plugins/sharedpreferences/SharedPreferencesAsyncApi;", "shared_preferences_android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final class Companion {
        static final /* synthetic */ Companion $$INSTANCE = new Companion();

        /* renamed from: codec$delegate, reason: from kotlin metadata */
        private static final Lazy<SharedPreferencesAsyncApiCodec> codec = LazyKt.lazy(new Function0<SharedPreferencesAsyncApiCodec>() { // from class: io.flutter.plugins.sharedpreferences.SharedPreferencesAsyncApi$Companion$codec$2
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // kotlin.jvm.functions.Function0
            public final SharedPreferencesAsyncApiCodec invoke() {
                return SharedPreferencesAsyncApiCodec.INSTANCE;
            }
        });

        private Companion() {
        }

        public final MessageCodec<Object> getCodec() {
            return codec.getValue();
        }

        public final void setUp(BinaryMessenger binaryMessenger, final SharedPreferencesAsyncApi api) {
            Intrinsics.checkNotNullParameter(binaryMessenger, "binaryMessenger");
            BasicMessageChannel basicMessageChannel = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.shared_preferences_android.SharedPreferencesAsyncApi.setBool", getCodec(), binaryMessenger.makeBackgroundTaskQueue());
            if (api != null) {
                basicMessageChannel.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.sharedpreferences.SharedPreferencesAsyncApi$Companion$$ExternalSyntheticLambda0
                    @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                    public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                        SharedPreferencesAsyncApi.Companion.setUp$lambda$1$lambda$0(api, obj, reply);
                    }
                });
            } else {
                basicMessageChannel.setMessageHandler(null);
            }
            BasicMessageChannel basicMessageChannel2 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.shared_preferences_android.SharedPreferencesAsyncApi.setString", getCodec(), binaryMessenger.makeBackgroundTaskQueue());
            if (api != null) {
                basicMessageChannel2.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.sharedpreferences.SharedPreferencesAsyncApi$Companion$$ExternalSyntheticLambda7
                    @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                    public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                        SharedPreferencesAsyncApi.Companion.setUp$lambda$3$lambda$2(api, obj, reply);
                    }
                });
            } else {
                basicMessageChannel2.setMessageHandler(null);
            }
            BasicMessageChannel basicMessageChannel3 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.shared_preferences_android.SharedPreferencesAsyncApi.setInt", getCodec(), binaryMessenger.makeBackgroundTaskQueue());
            if (api != null) {
                basicMessageChannel3.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.sharedpreferences.SharedPreferencesAsyncApi$Companion$$ExternalSyntheticLambda8
                    @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                    public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                        SharedPreferencesAsyncApi.Companion.setUp$lambda$6$lambda$5(api, obj, reply);
                    }
                });
            } else {
                basicMessageChannel3.setMessageHandler(null);
            }
            BasicMessageChannel basicMessageChannel4 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.shared_preferences_android.SharedPreferencesAsyncApi.setDouble", getCodec(), binaryMessenger.makeBackgroundTaskQueue());
            if (api != null) {
                basicMessageChannel4.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.sharedpreferences.SharedPreferencesAsyncApi$Companion$$ExternalSyntheticLambda9
                    @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                    public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                        SharedPreferencesAsyncApi.Companion.setUp$lambda$8$lambda$7(api, obj, reply);
                    }
                });
            } else {
                basicMessageChannel4.setMessageHandler(null);
            }
            BasicMessageChannel basicMessageChannel5 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.shared_preferences_android.SharedPreferencesAsyncApi.setStringList", getCodec(), binaryMessenger.makeBackgroundTaskQueue());
            if (api != null) {
                basicMessageChannel5.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.sharedpreferences.SharedPreferencesAsyncApi$Companion$$ExternalSyntheticLambda10
                    @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                    public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                        SharedPreferencesAsyncApi.Companion.setUp$lambda$10$lambda$9(api, obj, reply);
                    }
                });
            } else {
                basicMessageChannel5.setMessageHandler(null);
            }
            BasicMessageChannel basicMessageChannel6 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.shared_preferences_android.SharedPreferencesAsyncApi.getString", getCodec());
            if (api != null) {
                basicMessageChannel6.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.sharedpreferences.SharedPreferencesAsyncApi$Companion$$ExternalSyntheticLambda11
                    @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                    public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                        SharedPreferencesAsyncApi.Companion.setUp$lambda$12$lambda$11(api, obj, reply);
                    }
                });
            } else {
                basicMessageChannel6.setMessageHandler(null);
            }
            BasicMessageChannel basicMessageChannel7 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.shared_preferences_android.SharedPreferencesAsyncApi.getBool", getCodec());
            if (api != null) {
                basicMessageChannel7.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.sharedpreferences.SharedPreferencesAsyncApi$Companion$$ExternalSyntheticLambda12
                    @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                    public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                        SharedPreferencesAsyncApi.Companion.setUp$lambda$14$lambda$13(api, obj, reply);
                    }
                });
            } else {
                basicMessageChannel7.setMessageHandler(null);
            }
            BasicMessageChannel basicMessageChannel8 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.shared_preferences_android.SharedPreferencesAsyncApi.getDouble", getCodec());
            if (api != null) {
                basicMessageChannel8.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.sharedpreferences.SharedPreferencesAsyncApi$Companion$$ExternalSyntheticLambda1
                    @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                    public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                        SharedPreferencesAsyncApi.Companion.setUp$lambda$16$lambda$15(api, obj, reply);
                    }
                });
            } else {
                basicMessageChannel8.setMessageHandler(null);
            }
            BasicMessageChannel basicMessageChannel9 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.shared_preferences_android.SharedPreferencesAsyncApi.getInt", getCodec());
            if (api != null) {
                basicMessageChannel9.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.sharedpreferences.SharedPreferencesAsyncApi$Companion$$ExternalSyntheticLambda2
                    @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                    public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                        SharedPreferencesAsyncApi.Companion.setUp$lambda$18$lambda$17(api, obj, reply);
                    }
                });
            } else {
                basicMessageChannel9.setMessageHandler(null);
            }
            BasicMessageChannel basicMessageChannel10 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.shared_preferences_android.SharedPreferencesAsyncApi.getStringList", getCodec());
            if (api != null) {
                basicMessageChannel10.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.sharedpreferences.SharedPreferencesAsyncApi$Companion$$ExternalSyntheticLambda3
                    @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                    public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                        SharedPreferencesAsyncApi.Companion.setUp$lambda$20$lambda$19(api, obj, reply);
                    }
                });
            } else {
                basicMessageChannel10.setMessageHandler(null);
            }
            BasicMessageChannel basicMessageChannel11 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.shared_preferences_android.SharedPreferencesAsyncApi.clear", getCodec(), binaryMessenger.makeBackgroundTaskQueue());
            if (api != null) {
                basicMessageChannel11.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.sharedpreferences.SharedPreferencesAsyncApi$Companion$$ExternalSyntheticLambda4
                    @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                    public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                        SharedPreferencesAsyncApi.Companion.setUp$lambda$22$lambda$21(api, obj, reply);
                    }
                });
            } else {
                basicMessageChannel11.setMessageHandler(null);
            }
            BasicMessageChannel basicMessageChannel12 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.shared_preferences_android.SharedPreferencesAsyncApi.getAll", getCodec(), binaryMessenger.makeBackgroundTaskQueue());
            if (api != null) {
                basicMessageChannel12.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.sharedpreferences.SharedPreferencesAsyncApi$Companion$$ExternalSyntheticLambda5
                    @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                    public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                        SharedPreferencesAsyncApi.Companion.setUp$lambda$24$lambda$23(api, obj, reply);
                    }
                });
            } else {
                basicMessageChannel12.setMessageHandler(null);
            }
            BasicMessageChannel basicMessageChannel13 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.shared_preferences_android.SharedPreferencesAsyncApi.getKeys", getCodec(), binaryMessenger.makeBackgroundTaskQueue());
            if (api != null) {
                basicMessageChannel13.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.sharedpreferences.SharedPreferencesAsyncApi$Companion$$ExternalSyntheticLambda6
                    @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                    public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                        SharedPreferencesAsyncApi.Companion.setUp$lambda$26$lambda$25(api, obj, reply);
                    }
                });
            } else {
                basicMessageChannel13.setMessageHandler(null);
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void setUp$lambda$1$lambda$0(SharedPreferencesAsyncApi sharedPreferencesAsyncApi, Object obj, BasicMessageChannel.Reply reply) {
            List listWrapError;
            Intrinsics.checkNotNullParameter(reply, "reply");
            Intrinsics.checkNotNull(obj, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>");
            List list = (List) obj;
            Object obj2 = list.get(0);
            Intrinsics.checkNotNull(obj2, "null cannot be cast to non-null type kotlin.String");
            String str = (String) obj2;
            Object obj3 = list.get(1);
            Intrinsics.checkNotNull(obj3, "null cannot be cast to non-null type kotlin.Boolean");
            boolean zBooleanValue = ((Boolean) obj3).booleanValue();
            Object obj4 = list.get(2);
            Intrinsics.checkNotNull(obj4, "null cannot be cast to non-null type io.flutter.plugins.sharedpreferences.SharedPreferencesPigeonOptions");
            try {
                sharedPreferencesAsyncApi.setBool(str, zBooleanValue, (SharedPreferencesPigeonOptions) obj4);
                listWrapError = CollectionsKt.listOf((Object) null);
            } catch (Throwable th) {
                listWrapError = MessagesAsync_gKt.wrapError(th);
            }
            reply.reply(listWrapError);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void setUp$lambda$3$lambda$2(SharedPreferencesAsyncApi sharedPreferencesAsyncApi, Object obj, BasicMessageChannel.Reply reply) {
            List listWrapError;
            Intrinsics.checkNotNullParameter(reply, "reply");
            Intrinsics.checkNotNull(obj, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>");
            List list = (List) obj;
            Object obj2 = list.get(0);
            Intrinsics.checkNotNull(obj2, "null cannot be cast to non-null type kotlin.String");
            String str = (String) obj2;
            Object obj3 = list.get(1);
            Intrinsics.checkNotNull(obj3, "null cannot be cast to non-null type kotlin.String");
            String str2 = (String) obj3;
            Object obj4 = list.get(2);
            Intrinsics.checkNotNull(obj4, "null cannot be cast to non-null type io.flutter.plugins.sharedpreferences.SharedPreferencesPigeonOptions");
            try {
                sharedPreferencesAsyncApi.setString(str, str2, (SharedPreferencesPigeonOptions) obj4);
                listWrapError = CollectionsKt.listOf((Object) null);
            } catch (Throwable th) {
                listWrapError = MessagesAsync_gKt.wrapError(th);
            }
            reply.reply(listWrapError);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void setUp$lambda$6$lambda$5(SharedPreferencesAsyncApi sharedPreferencesAsyncApi, Object obj, BasicMessageChannel.Reply reply) {
            long jLongValue;
            List listWrapError;
            Intrinsics.checkNotNullParameter(reply, "reply");
            Intrinsics.checkNotNull(obj, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>");
            List list = (List) obj;
            Object obj2 = list.get(0);
            Intrinsics.checkNotNull(obj2, "null cannot be cast to non-null type kotlin.String");
            String str = (String) obj2;
            Object obj3 = list.get(1);
            if (obj3 instanceof Integer) {
                jLongValue = ((Number) obj3).intValue();
            } else {
                Intrinsics.checkNotNull(obj3, "null cannot be cast to non-null type kotlin.Long");
                jLongValue = ((Long) obj3).longValue();
            }
            Object obj4 = list.get(2);
            Intrinsics.checkNotNull(obj4, "null cannot be cast to non-null type io.flutter.plugins.sharedpreferences.SharedPreferencesPigeonOptions");
            try {
                sharedPreferencesAsyncApi.setInt(str, jLongValue, (SharedPreferencesPigeonOptions) obj4);
                listWrapError = CollectionsKt.listOf((Object) null);
            } catch (Throwable th) {
                listWrapError = MessagesAsync_gKt.wrapError(th);
            }
            reply.reply(listWrapError);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void setUp$lambda$8$lambda$7(SharedPreferencesAsyncApi sharedPreferencesAsyncApi, Object obj, BasicMessageChannel.Reply reply) {
            List listWrapError;
            Intrinsics.checkNotNullParameter(reply, "reply");
            Intrinsics.checkNotNull(obj, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>");
            List list = (List) obj;
            Object obj2 = list.get(0);
            Intrinsics.checkNotNull(obj2, "null cannot be cast to non-null type kotlin.String");
            String str = (String) obj2;
            Object obj3 = list.get(1);
            Intrinsics.checkNotNull(obj3, "null cannot be cast to non-null type kotlin.Double");
            double dDoubleValue = ((Double) obj3).doubleValue();
            Object obj4 = list.get(2);
            Intrinsics.checkNotNull(obj4, "null cannot be cast to non-null type io.flutter.plugins.sharedpreferences.SharedPreferencesPigeonOptions");
            try {
                sharedPreferencesAsyncApi.setDouble(str, dDoubleValue, (SharedPreferencesPigeonOptions) obj4);
                listWrapError = CollectionsKt.listOf((Object) null);
            } catch (Throwable th) {
                listWrapError = MessagesAsync_gKt.wrapError(th);
            }
            reply.reply(listWrapError);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void setUp$lambda$10$lambda$9(SharedPreferencesAsyncApi sharedPreferencesAsyncApi, Object obj, BasicMessageChannel.Reply reply) {
            List listWrapError;
            Intrinsics.checkNotNullParameter(reply, "reply");
            Intrinsics.checkNotNull(obj, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>");
            List list = (List) obj;
            Object obj2 = list.get(0);
            Intrinsics.checkNotNull(obj2, "null cannot be cast to non-null type kotlin.String");
            String str = (String) obj2;
            Object obj3 = list.get(1);
            Intrinsics.checkNotNull(obj3, "null cannot be cast to non-null type kotlin.collections.List<kotlin.String>");
            List<String> list2 = (List) obj3;
            Object obj4 = list.get(2);
            Intrinsics.checkNotNull(obj4, "null cannot be cast to non-null type io.flutter.plugins.sharedpreferences.SharedPreferencesPigeonOptions");
            try {
                sharedPreferencesAsyncApi.setStringList(str, list2, (SharedPreferencesPigeonOptions) obj4);
                listWrapError = CollectionsKt.listOf((Object) null);
            } catch (Throwable th) {
                listWrapError = MessagesAsync_gKt.wrapError(th);
            }
            reply.reply(listWrapError);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void setUp$lambda$12$lambda$11(SharedPreferencesAsyncApi sharedPreferencesAsyncApi, Object obj, BasicMessageChannel.Reply reply) {
            List listWrapError;
            Intrinsics.checkNotNullParameter(reply, "reply");
            Intrinsics.checkNotNull(obj, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>");
            List list = (List) obj;
            Object obj2 = list.get(0);
            Intrinsics.checkNotNull(obj2, "null cannot be cast to non-null type kotlin.String");
            String str = (String) obj2;
            Object obj3 = list.get(1);
            Intrinsics.checkNotNull(obj3, "null cannot be cast to non-null type io.flutter.plugins.sharedpreferences.SharedPreferencesPigeonOptions");
            try {
                listWrapError = CollectionsKt.listOf(sharedPreferencesAsyncApi.getString(str, (SharedPreferencesPigeonOptions) obj3));
            } catch (Throwable th) {
                listWrapError = MessagesAsync_gKt.wrapError(th);
            }
            reply.reply(listWrapError);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void setUp$lambda$14$lambda$13(SharedPreferencesAsyncApi sharedPreferencesAsyncApi, Object obj, BasicMessageChannel.Reply reply) {
            List listWrapError;
            Intrinsics.checkNotNullParameter(reply, "reply");
            Intrinsics.checkNotNull(obj, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>");
            List list = (List) obj;
            Object obj2 = list.get(0);
            Intrinsics.checkNotNull(obj2, "null cannot be cast to non-null type kotlin.String");
            String str = (String) obj2;
            Object obj3 = list.get(1);
            Intrinsics.checkNotNull(obj3, "null cannot be cast to non-null type io.flutter.plugins.sharedpreferences.SharedPreferencesPigeonOptions");
            try {
                listWrapError = CollectionsKt.listOf(sharedPreferencesAsyncApi.getBool(str, (SharedPreferencesPigeonOptions) obj3));
            } catch (Throwable th) {
                listWrapError = MessagesAsync_gKt.wrapError(th);
            }
            reply.reply(listWrapError);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void setUp$lambda$16$lambda$15(SharedPreferencesAsyncApi sharedPreferencesAsyncApi, Object obj, BasicMessageChannel.Reply reply) {
            List listWrapError;
            Intrinsics.checkNotNullParameter(reply, "reply");
            Intrinsics.checkNotNull(obj, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>");
            List list = (List) obj;
            Object obj2 = list.get(0);
            Intrinsics.checkNotNull(obj2, "null cannot be cast to non-null type kotlin.String");
            String str = (String) obj2;
            Object obj3 = list.get(1);
            Intrinsics.checkNotNull(obj3, "null cannot be cast to non-null type io.flutter.plugins.sharedpreferences.SharedPreferencesPigeonOptions");
            try {
                listWrapError = CollectionsKt.listOf(sharedPreferencesAsyncApi.getDouble(str, (SharedPreferencesPigeonOptions) obj3));
            } catch (Throwable th) {
                listWrapError = MessagesAsync_gKt.wrapError(th);
            }
            reply.reply(listWrapError);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void setUp$lambda$18$lambda$17(SharedPreferencesAsyncApi sharedPreferencesAsyncApi, Object obj, BasicMessageChannel.Reply reply) {
            List listWrapError;
            Intrinsics.checkNotNullParameter(reply, "reply");
            Intrinsics.checkNotNull(obj, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>");
            List list = (List) obj;
            Object obj2 = list.get(0);
            Intrinsics.checkNotNull(obj2, "null cannot be cast to non-null type kotlin.String");
            String str = (String) obj2;
            Object obj3 = list.get(1);
            Intrinsics.checkNotNull(obj3, "null cannot be cast to non-null type io.flutter.plugins.sharedpreferences.SharedPreferencesPigeonOptions");
            try {
                listWrapError = CollectionsKt.listOf(sharedPreferencesAsyncApi.getInt(str, (SharedPreferencesPigeonOptions) obj3));
            } catch (Throwable th) {
                listWrapError = MessagesAsync_gKt.wrapError(th);
            }
            reply.reply(listWrapError);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void setUp$lambda$20$lambda$19(SharedPreferencesAsyncApi sharedPreferencesAsyncApi, Object obj, BasicMessageChannel.Reply reply) {
            List listWrapError;
            Intrinsics.checkNotNullParameter(reply, "reply");
            Intrinsics.checkNotNull(obj, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>");
            List list = (List) obj;
            Object obj2 = list.get(0);
            Intrinsics.checkNotNull(obj2, "null cannot be cast to non-null type kotlin.String");
            String str = (String) obj2;
            Object obj3 = list.get(1);
            Intrinsics.checkNotNull(obj3, "null cannot be cast to non-null type io.flutter.plugins.sharedpreferences.SharedPreferencesPigeonOptions");
            try {
                listWrapError = CollectionsKt.listOf(sharedPreferencesAsyncApi.getStringList(str, (SharedPreferencesPigeonOptions) obj3));
            } catch (Throwable th) {
                listWrapError = MessagesAsync_gKt.wrapError(th);
            }
            reply.reply(listWrapError);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void setUp$lambda$22$lambda$21(SharedPreferencesAsyncApi sharedPreferencesAsyncApi, Object obj, BasicMessageChannel.Reply reply) {
            List listWrapError;
            Intrinsics.checkNotNullParameter(reply, "reply");
            Intrinsics.checkNotNull(obj, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>");
            List list = (List) obj;
            List<String> list2 = (List) list.get(0);
            Object obj2 = list.get(1);
            Intrinsics.checkNotNull(obj2, "null cannot be cast to non-null type io.flutter.plugins.sharedpreferences.SharedPreferencesPigeonOptions");
            try {
                sharedPreferencesAsyncApi.clear(list2, (SharedPreferencesPigeonOptions) obj2);
                listWrapError = CollectionsKt.listOf((Object) null);
            } catch (Throwable th) {
                listWrapError = MessagesAsync_gKt.wrapError(th);
            }
            reply.reply(listWrapError);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void setUp$lambda$24$lambda$23(SharedPreferencesAsyncApi sharedPreferencesAsyncApi, Object obj, BasicMessageChannel.Reply reply) {
            List listWrapError;
            Intrinsics.checkNotNullParameter(reply, "reply");
            Intrinsics.checkNotNull(obj, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>");
            List list = (List) obj;
            List<String> list2 = (List) list.get(0);
            Object obj2 = list.get(1);
            Intrinsics.checkNotNull(obj2, "null cannot be cast to non-null type io.flutter.plugins.sharedpreferences.SharedPreferencesPigeonOptions");
            try {
                listWrapError = CollectionsKt.listOf(sharedPreferencesAsyncApi.getAll(list2, (SharedPreferencesPigeonOptions) obj2));
            } catch (Throwable th) {
                listWrapError = MessagesAsync_gKt.wrapError(th);
            }
            reply.reply(listWrapError);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void setUp$lambda$26$lambda$25(SharedPreferencesAsyncApi sharedPreferencesAsyncApi, Object obj, BasicMessageChannel.Reply reply) {
            List listWrapError;
            Intrinsics.checkNotNullParameter(reply, "reply");
            Intrinsics.checkNotNull(obj, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>");
            List list = (List) obj;
            List<String> list2 = (List) list.get(0);
            Object obj2 = list.get(1);
            Intrinsics.checkNotNull(obj2, "null cannot be cast to non-null type io.flutter.plugins.sharedpreferences.SharedPreferencesPigeonOptions");
            try {
                listWrapError = CollectionsKt.listOf(sharedPreferencesAsyncApi.getKeys(list2, (SharedPreferencesPigeonOptions) obj2));
            } catch (Throwable th) {
                listWrapError = MessagesAsync_gKt.wrapError(th);
            }
            reply.reply(listWrapError);
        }
    }
}
