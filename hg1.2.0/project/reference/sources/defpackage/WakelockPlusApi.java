package defpackage;

import androidx.core.app.NotificationCompat;
import defpackage.WakelockPlusApi;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MessageCodec;
import java.util.List;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: WakelockPlusMessages.g.kt */
@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\bf\u0018\u0000 \b2\u00020\u0001:\u0001\bJ\b\u0010\u0002\u001a\u00020\u0003H&J\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H&¨\u0006\t"}, d2 = {"LWakelockPlusApi;", "", "isEnabled", "LIsEnabledMessage;", "toggle", "", NotificationCompat.CATEGORY_MESSAGE, "LToggleMessage;", "Companion", "wakelock_plus_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public interface WakelockPlusApi {

    /* renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = Companion.$$INSTANCE;

    IsEnabledMessage isEnabled();

    void toggle(ToggleMessage msg);

    /* compiled from: WakelockPlusMessages.g.kt */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J$\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\f2\b\u0010\r\u001a\u0004\u0018\u00010\u000e2\b\b\u0002\u0010\u000f\u001a\u00020\u0010H\u0007R#\u0010\u0003\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u00048FX\u0086\u0084\u0002¢\u0006\f\n\u0004\b\u0007\u0010\b\u001a\u0004\b\u0005\u0010\u0006¨\u0006\u0011"}, d2 = {"LWakelockPlusApi$Companion;", "", "()V", "codec", "Lio/flutter/plugin/common/MessageCodec;", "getCodec", "()Lio/flutter/plugin/common/MessageCodec;", "codec$delegate", "Lkotlin/Lazy;", "setUp", "", "binaryMessenger", "Lio/flutter/plugin/common/BinaryMessenger;", "api", "LWakelockPlusApi;", "messageChannelSuffix", "", "wakelock_plus_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final class Companion {
        static final /* synthetic */ Companion $$INSTANCE = new Companion();

        /* renamed from: codec$delegate, reason: from kotlin metadata */
        private static final Lazy<WakelockPlusMessagesPigeonCodec> codec = LazyKt.lazy(new Function0<WakelockPlusMessagesPigeonCodec>() { // from class: WakelockPlusApi$Companion$codec$2
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // kotlin.jvm.functions.Function0
            public final WakelockPlusMessagesPigeonCodec invoke() {
                return new WakelockPlusMessagesPigeonCodec();
            }
        });

        public final void setUp(BinaryMessenger binaryMessenger, WakelockPlusApi wakelockPlusApi) {
            Intrinsics.checkNotNullParameter(binaryMessenger, "binaryMessenger");
            setUp$default(this, binaryMessenger, wakelockPlusApi, null, 4, null);
        }

        private Companion() {
        }

        public final MessageCodec<Object> getCodec() {
            return codec.getValue();
        }

        public static /* synthetic */ void setUp$default(Companion companion, BinaryMessenger binaryMessenger, WakelockPlusApi wakelockPlusApi, String str, int i, Object obj) {
            if ((i & 4) != 0) {
                str = "";
            }
            companion.setUp(binaryMessenger, wakelockPlusApi, str);
        }

        public final void setUp(BinaryMessenger binaryMessenger, final WakelockPlusApi api, String messageChannelSuffix) {
            String str;
            Intrinsics.checkNotNullParameter(binaryMessenger, "binaryMessenger");
            Intrinsics.checkNotNullParameter(messageChannelSuffix, "messageChannelSuffix");
            if (messageChannelSuffix.length() > 0) {
                str = "." + messageChannelSuffix;
            } else {
                str = "";
            }
            BasicMessageChannel basicMessageChannel = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.wakelock_plus_platform_interface.WakelockPlusApi.toggle" + str, getCodec());
            if (api != null) {
                basicMessageChannel.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: WakelockPlusApi$Companion$$ExternalSyntheticLambda0
                    @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                    public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                        WakelockPlusApi.Companion.setUp$lambda$1$lambda$0(api, obj, reply);
                    }
                });
            } else {
                basicMessageChannel.setMessageHandler(null);
            }
            BasicMessageChannel basicMessageChannel2 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.wakelock_plus_platform_interface.WakelockPlusApi.isEnabled" + str, getCodec());
            if (api != null) {
                basicMessageChannel2.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: WakelockPlusApi$Companion$$ExternalSyntheticLambda1
                    @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                    public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                        WakelockPlusApi.Companion.setUp$lambda$3$lambda$2(api, obj, reply);
                    }
                });
            } else {
                basicMessageChannel2.setMessageHandler(null);
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void setUp$lambda$1$lambda$0(WakelockPlusApi wakelockPlusApi, Object obj, BasicMessageChannel.Reply reply) {
            List listWrapError;
            Intrinsics.checkNotNullParameter(reply, "reply");
            Intrinsics.checkNotNull(obj, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>");
            Object obj2 = ((List) obj).get(0);
            Intrinsics.checkNotNull(obj2, "null cannot be cast to non-null type <root>.ToggleMessage");
            try {
                wakelockPlusApi.toggle((ToggleMessage) obj2);
                listWrapError = CollectionsKt.listOf((Object) null);
            } catch (Throwable th) {
                listWrapError = wrapError.wrapError(th);
            }
            reply.reply(listWrapError);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void setUp$lambda$3$lambda$2(WakelockPlusApi wakelockPlusApi, Object obj, BasicMessageChannel.Reply reply) {
            List listWrapError;
            Intrinsics.checkNotNullParameter(reply, "reply");
            try {
                listWrapError = CollectionsKt.listOf(wakelockPlusApi.isEnabled());
            } catch (Throwable th) {
                listWrapError = wrapError.wrapError(th);
            }
            reply.reply(listWrapError);
        }
    }
}
