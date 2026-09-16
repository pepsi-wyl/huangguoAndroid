package io.flutter.plugins.videoplayer;

import android.util.Log;
import androidx.media3.extractor.ts.TsExtractor;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugins.videoplayer.Messages;
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

    public static final class TextureMessage {
        private Long textureId;

        public Long getTextureId() {
            return this.textureId;
        }

        public void setTextureId(Long l) {
            if (l == null) {
                throw new IllegalStateException("Nonnull field \"textureId\" is null.");
            }
            this.textureId = l;
        }

        TextureMessage() {
        }

        public static final class Builder {
            private Long textureId;

            public Builder setTextureId(Long l) {
                this.textureId = l;
                return this;
            }

            public TextureMessage build() {
                TextureMessage textureMessage = new TextureMessage();
                textureMessage.setTextureId(this.textureId);
                return textureMessage;
            }
        }

        ArrayList<Object> toList() {
            ArrayList<Object> arrayList = new ArrayList<>(1);
            arrayList.add(this.textureId);
            return arrayList;
        }

        static TextureMessage fromList(ArrayList<Object> arrayList) {
            Long lValueOf;
            TextureMessage textureMessage = new TextureMessage();
            Object obj = arrayList.get(0);
            if (obj == null) {
                lValueOf = null;
            } else {
                lValueOf = Long.valueOf(obj instanceof Integer ? ((Integer) obj).intValue() : ((Long) obj).longValue());
            }
            textureMessage.setTextureId(lValueOf);
            return textureMessage;
        }
    }

    public static final class LoopingMessage {
        private Boolean isLooping;
        private Long textureId;

        public Long getTextureId() {
            return this.textureId;
        }

        public void setTextureId(Long l) {
            if (l == null) {
                throw new IllegalStateException("Nonnull field \"textureId\" is null.");
            }
            this.textureId = l;
        }

        public Boolean getIsLooping() {
            return this.isLooping;
        }

        public void setIsLooping(Boolean bool) {
            if (bool == null) {
                throw new IllegalStateException("Nonnull field \"isLooping\" is null.");
            }
            this.isLooping = bool;
        }

        LoopingMessage() {
        }

        public static final class Builder {
            private Boolean isLooping;
            private Long textureId;

            public Builder setTextureId(Long l) {
                this.textureId = l;
                return this;
            }

            public Builder setIsLooping(Boolean bool) {
                this.isLooping = bool;
                return this;
            }

            public LoopingMessage build() {
                LoopingMessage loopingMessage = new LoopingMessage();
                loopingMessage.setTextureId(this.textureId);
                loopingMessage.setIsLooping(this.isLooping);
                return loopingMessage;
            }
        }

        ArrayList<Object> toList() {
            ArrayList<Object> arrayList = new ArrayList<>(2);
            arrayList.add(this.textureId);
            arrayList.add(this.isLooping);
            return arrayList;
        }

        static LoopingMessage fromList(ArrayList<Object> arrayList) {
            Long lValueOf;
            LoopingMessage loopingMessage = new LoopingMessage();
            Object obj = arrayList.get(0);
            if (obj == null) {
                lValueOf = null;
            } else {
                lValueOf = Long.valueOf(obj instanceof Integer ? ((Integer) obj).intValue() : ((Long) obj).longValue());
            }
            loopingMessage.setTextureId(lValueOf);
            loopingMessage.setIsLooping((Boolean) arrayList.get(1));
            return loopingMessage;
        }
    }

    public static final class VolumeMessage {
        private Long textureId;
        private Double volume;

        public Long getTextureId() {
            return this.textureId;
        }

        public void setTextureId(Long l) {
            if (l == null) {
                throw new IllegalStateException("Nonnull field \"textureId\" is null.");
            }
            this.textureId = l;
        }

        public Double getVolume() {
            return this.volume;
        }

        public void setVolume(Double d) {
            if (d == null) {
                throw new IllegalStateException("Nonnull field \"volume\" is null.");
            }
            this.volume = d;
        }

        VolumeMessage() {
        }

        public static final class Builder {
            private Long textureId;
            private Double volume;

            public Builder setTextureId(Long l) {
                this.textureId = l;
                return this;
            }

            public Builder setVolume(Double d) {
                this.volume = d;
                return this;
            }

            public VolumeMessage build() {
                VolumeMessage volumeMessage = new VolumeMessage();
                volumeMessage.setTextureId(this.textureId);
                volumeMessage.setVolume(this.volume);
                return volumeMessage;
            }
        }

        ArrayList<Object> toList() {
            ArrayList<Object> arrayList = new ArrayList<>(2);
            arrayList.add(this.textureId);
            arrayList.add(this.volume);
            return arrayList;
        }

        static VolumeMessage fromList(ArrayList<Object> arrayList) {
            Long lValueOf;
            VolumeMessage volumeMessage = new VolumeMessage();
            Object obj = arrayList.get(0);
            if (obj == null) {
                lValueOf = null;
            } else {
                lValueOf = Long.valueOf(obj instanceof Integer ? ((Integer) obj).intValue() : ((Long) obj).longValue());
            }
            volumeMessage.setTextureId(lValueOf);
            volumeMessage.setVolume((Double) arrayList.get(1));
            return volumeMessage;
        }
    }

    public static final class PlaybackSpeedMessage {
        private Double speed;
        private Long textureId;

        public Long getTextureId() {
            return this.textureId;
        }

        public void setTextureId(Long l) {
            if (l == null) {
                throw new IllegalStateException("Nonnull field \"textureId\" is null.");
            }
            this.textureId = l;
        }

        public Double getSpeed() {
            return this.speed;
        }

        public void setSpeed(Double d) {
            if (d == null) {
                throw new IllegalStateException("Nonnull field \"speed\" is null.");
            }
            this.speed = d;
        }

        PlaybackSpeedMessage() {
        }

        public static final class Builder {
            private Double speed;
            private Long textureId;

            public Builder setTextureId(Long l) {
                this.textureId = l;
                return this;
            }

            public Builder setSpeed(Double d) {
                this.speed = d;
                return this;
            }

            public PlaybackSpeedMessage build() {
                PlaybackSpeedMessage playbackSpeedMessage = new PlaybackSpeedMessage();
                playbackSpeedMessage.setTextureId(this.textureId);
                playbackSpeedMessage.setSpeed(this.speed);
                return playbackSpeedMessage;
            }
        }

        ArrayList<Object> toList() {
            ArrayList<Object> arrayList = new ArrayList<>(2);
            arrayList.add(this.textureId);
            arrayList.add(this.speed);
            return arrayList;
        }

        static PlaybackSpeedMessage fromList(ArrayList<Object> arrayList) {
            Long lValueOf;
            PlaybackSpeedMessage playbackSpeedMessage = new PlaybackSpeedMessage();
            Object obj = arrayList.get(0);
            if (obj == null) {
                lValueOf = null;
            } else {
                lValueOf = Long.valueOf(obj instanceof Integer ? ((Integer) obj).intValue() : ((Long) obj).longValue());
            }
            playbackSpeedMessage.setTextureId(lValueOf);
            playbackSpeedMessage.setSpeed((Double) arrayList.get(1));
            return playbackSpeedMessage;
        }
    }

    public static final class PositionMessage {
        private Long position;
        private Long textureId;

        public Long getTextureId() {
            return this.textureId;
        }

        public void setTextureId(Long l) {
            if (l == null) {
                throw new IllegalStateException("Nonnull field \"textureId\" is null.");
            }
            this.textureId = l;
        }

        public Long getPosition() {
            return this.position;
        }

        public void setPosition(Long l) {
            if (l == null) {
                throw new IllegalStateException("Nonnull field \"position\" is null.");
            }
            this.position = l;
        }

        PositionMessage() {
        }

        public static final class Builder {
            private Long position;
            private Long textureId;

            public Builder setTextureId(Long l) {
                this.textureId = l;
                return this;
            }

            public Builder setPosition(Long l) {
                this.position = l;
                return this;
            }

            public PositionMessage build() {
                PositionMessage positionMessage = new PositionMessage();
                positionMessage.setTextureId(this.textureId);
                positionMessage.setPosition(this.position);
                return positionMessage;
            }
        }

        ArrayList<Object> toList() {
            ArrayList<Object> arrayList = new ArrayList<>(2);
            arrayList.add(this.textureId);
            arrayList.add(this.position);
            return arrayList;
        }

        static PositionMessage fromList(ArrayList<Object> arrayList) {
            Long lValueOf;
            PositionMessage positionMessage = new PositionMessage();
            Object obj = arrayList.get(0);
            Long lValueOf2 = null;
            if (obj == null) {
                lValueOf = null;
            } else {
                lValueOf = Long.valueOf(obj instanceof Integer ? ((Integer) obj).intValue() : ((Long) obj).longValue());
            }
            positionMessage.setTextureId(lValueOf);
            Object obj2 = arrayList.get(1);
            if (obj2 != null) {
                lValueOf2 = Long.valueOf(obj2 instanceof Integer ? ((Integer) obj2).intValue() : ((Long) obj2).longValue());
            }
            positionMessage.setPosition(lValueOf2);
            return positionMessage;
        }
    }

    public static final class CreateMessage {
        private String asset;
        private String formatHint;
        private Map<String, String> httpHeaders;
        private String packageName;
        private String uri;

        public String getAsset() {
            return this.asset;
        }

        public void setAsset(String str) {
            this.asset = str;
        }

        public String getUri() {
            return this.uri;
        }

        public void setUri(String str) {
            this.uri = str;
        }

        public String getPackageName() {
            return this.packageName;
        }

        public void setPackageName(String str) {
            this.packageName = str;
        }

        public String getFormatHint() {
            return this.formatHint;
        }

        public void setFormatHint(String str) {
            this.formatHint = str;
        }

        public Map<String, String> getHttpHeaders() {
            return this.httpHeaders;
        }

        public void setHttpHeaders(Map<String, String> map) {
            if (map == null) {
                throw new IllegalStateException("Nonnull field \"httpHeaders\" is null.");
            }
            this.httpHeaders = map;
        }

        CreateMessage() {
        }

        public static final class Builder {
            private String asset;
            private String formatHint;
            private Map<String, String> httpHeaders;
            private String packageName;
            private String uri;

            public Builder setAsset(String str) {
                this.asset = str;
                return this;
            }

            public Builder setUri(String str) {
                this.uri = str;
                return this;
            }

            public Builder setPackageName(String str) {
                this.packageName = str;
                return this;
            }

            public Builder setFormatHint(String str) {
                this.formatHint = str;
                return this;
            }

            public Builder setHttpHeaders(Map<String, String> map) {
                this.httpHeaders = map;
                return this;
            }

            public CreateMessage build() {
                CreateMessage createMessage = new CreateMessage();
                createMessage.setAsset(this.asset);
                createMessage.setUri(this.uri);
                createMessage.setPackageName(this.packageName);
                createMessage.setFormatHint(this.formatHint);
                createMessage.setHttpHeaders(this.httpHeaders);
                return createMessage;
            }
        }

        ArrayList<Object> toList() {
            ArrayList<Object> arrayList = new ArrayList<>(5);
            arrayList.add(this.asset);
            arrayList.add(this.uri);
            arrayList.add(this.packageName);
            arrayList.add(this.formatHint);
            arrayList.add(this.httpHeaders);
            return arrayList;
        }

        static CreateMessage fromList(ArrayList<Object> arrayList) {
            CreateMessage createMessage = new CreateMessage();
            createMessage.setAsset((String) arrayList.get(0));
            createMessage.setUri((String) arrayList.get(1));
            createMessage.setPackageName((String) arrayList.get(2));
            createMessage.setFormatHint((String) arrayList.get(3));
            createMessage.setHttpHeaders((Map) arrayList.get(4));
            return createMessage;
        }
    }

    public static final class MixWithOthersMessage {
        private Boolean mixWithOthers;

        public Boolean getMixWithOthers() {
            return this.mixWithOthers;
        }

        public void setMixWithOthers(Boolean bool) {
            if (bool == null) {
                throw new IllegalStateException("Nonnull field \"mixWithOthers\" is null.");
            }
            this.mixWithOthers = bool;
        }

        MixWithOthersMessage() {
        }

        public static final class Builder {
            private Boolean mixWithOthers;

            public Builder setMixWithOthers(Boolean bool) {
                this.mixWithOthers = bool;
                return this;
            }

            public MixWithOthersMessage build() {
                MixWithOthersMessage mixWithOthersMessage = new MixWithOthersMessage();
                mixWithOthersMessage.setMixWithOthers(this.mixWithOthers);
                return mixWithOthersMessage;
            }
        }

        ArrayList<Object> toList() {
            ArrayList<Object> arrayList = new ArrayList<>(1);
            arrayList.add(this.mixWithOthers);
            return arrayList;
        }

        static MixWithOthersMessage fromList(ArrayList<Object> arrayList) {
            MixWithOthersMessage mixWithOthersMessage = new MixWithOthersMessage();
            mixWithOthersMessage.setMixWithOthers((Boolean) arrayList.get(0));
            return mixWithOthersMessage;
        }
    }

    public static final class BrightnessMessage {
        private Double brightness;
        private Long textureId;

        public Long getTextureId() {
            return this.textureId;
        }

        public void setTextureId(Long l) {
            if (l == null) {
                throw new IllegalStateException("Nonnull field \"textureId\" is null.");
            }
            this.textureId = l;
        }

        public Double getBrightness() {
            return this.brightness;
        }

        public void setBrightness(Double d) {
            if (d == null) {
                throw new IllegalStateException("Nonnull field \"brightness\" is null.");
            }
            this.brightness = d;
        }

        BrightnessMessage() {
        }

        public static final class Builder {
            private Double brightness;
            private Long textureId;

            public Builder setTextureId(Long l) {
                this.textureId = l;
                return this;
            }

            public Builder setBrightness(Double d) {
                this.brightness = d;
                return this;
            }

            public BrightnessMessage build() {
                BrightnessMessage brightnessMessage = new BrightnessMessage();
                brightnessMessage.setTextureId(this.textureId);
                brightnessMessage.setBrightness(this.brightness);
                return brightnessMessage;
            }
        }

        ArrayList<Object> toList() {
            ArrayList<Object> arrayList = new ArrayList<>(2);
            arrayList.add(this.textureId);
            arrayList.add(this.brightness);
            return arrayList;
        }

        static BrightnessMessage fromList(ArrayList<Object> arrayList) {
            Long lValueOf;
            BrightnessMessage brightnessMessage = new BrightnessMessage();
            Object obj = arrayList.get(0);
            if (obj == null) {
                lValueOf = null;
            } else {
                lValueOf = Long.valueOf(obj instanceof Integer ? ((Integer) obj).intValue() : ((Long) obj).longValue());
            }
            brightnessMessage.setTextureId(lValueOf);
            brightnessMessage.setBrightness((Double) arrayList.get(1));
            return brightnessMessage;
        }
    }

    private static class AndroidVideoPlayerApiCodec extends StandardMessageCodec {
        public static final AndroidVideoPlayerApiCodec INSTANCE = new AndroidVideoPlayerApiCodec();

        private AndroidVideoPlayerApiCodec() {
        }

        @Override // io.flutter.plugin.common.StandardMessageCodec
        protected Object readValueOfType(byte b, ByteBuffer byteBuffer) {
            switch (b) {
                case -128:
                    return BrightnessMessage.fromList((ArrayList) readValue(byteBuffer));
                case -127:
                    return CreateMessage.fromList((ArrayList) readValue(byteBuffer));
                case -126:
                    return LoopingMessage.fromList((ArrayList) readValue(byteBuffer));
                case -125:
                    return MixWithOthersMessage.fromList((ArrayList) readValue(byteBuffer));
                case -124:
                    return PlaybackSpeedMessage.fromList((ArrayList) readValue(byteBuffer));
                case -123:
                    return PositionMessage.fromList((ArrayList) readValue(byteBuffer));
                case -122:
                    return TextureMessage.fromList((ArrayList) readValue(byteBuffer));
                case -121:
                    return VolumeMessage.fromList((ArrayList) readValue(byteBuffer));
                default:
                    return super.readValueOfType(b, byteBuffer);
            }
        }

        @Override // io.flutter.plugin.common.StandardMessageCodec
        protected void writeValue(ByteArrayOutputStream byteArrayOutputStream, Object obj) {
            if (obj instanceof BrightnessMessage) {
                byteArrayOutputStream.write(128);
                writeValue(byteArrayOutputStream, ((BrightnessMessage) obj).toList());
                return;
            }
            if (obj instanceof CreateMessage) {
                byteArrayOutputStream.write(TsExtractor.TS_STREAM_TYPE_AC3);
                writeValue(byteArrayOutputStream, ((CreateMessage) obj).toList());
                return;
            }
            if (obj instanceof LoopingMessage) {
                byteArrayOutputStream.write(TsExtractor.TS_STREAM_TYPE_HDMV_DTS);
                writeValue(byteArrayOutputStream, ((LoopingMessage) obj).toList());
                return;
            }
            if (obj instanceof MixWithOthersMessage) {
                byteArrayOutputStream.write(131);
                writeValue(byteArrayOutputStream, ((MixWithOthersMessage) obj).toList());
                return;
            }
            if (obj instanceof PlaybackSpeedMessage) {
                byteArrayOutputStream.write(132);
                writeValue(byteArrayOutputStream, ((PlaybackSpeedMessage) obj).toList());
                return;
            }
            if (obj instanceof PositionMessage) {
                byteArrayOutputStream.write(133);
                writeValue(byteArrayOutputStream, ((PositionMessage) obj).toList());
            } else if (obj instanceof TextureMessage) {
                byteArrayOutputStream.write(TsExtractor.TS_STREAM_TYPE_SPLICE_INFO);
                writeValue(byteArrayOutputStream, ((TextureMessage) obj).toList());
            } else if (obj instanceof VolumeMessage) {
                byteArrayOutputStream.write(TsExtractor.TS_STREAM_TYPE_E_AC3);
                writeValue(byteArrayOutputStream, ((VolumeMessage) obj).toList());
            } else {
                super.writeValue(byteArrayOutputStream, obj);
            }
        }
    }

    public interface AndroidVideoPlayerApi {
        TextureMessage create(CreateMessage createMessage);

        void dispose(TextureMessage textureMessage);

        void initialize();

        void pause(TextureMessage textureMessage);

        void play(TextureMessage textureMessage);

        PositionMessage position(TextureMessage textureMessage);

        void seekTo(PositionMessage positionMessage);

        void setBrightness(BrightnessMessage brightnessMessage);

        void setLooping(LoopingMessage loopingMessage);

        void setMixWithOthers(MixWithOthersMessage mixWithOthersMessage);

        void setPlaybackSpeed(PlaybackSpeedMessage playbackSpeedMessage);

        void setVolume(VolumeMessage volumeMessage);

        /* renamed from: io.flutter.plugins.videoplayer.Messages$AndroidVideoPlayerApi$-CC, reason: invalid class name */
        public final /* synthetic */ class CC {
            public static MessageCodec<Object> getCodec() {
                return AndroidVideoPlayerApiCodec.INSTANCE;
            }

            public static void setup(BinaryMessenger binaryMessenger, final AndroidVideoPlayerApi androidVideoPlayerApi) {
                BasicMessageChannel basicMessageChannel = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.AndroidVideoPlayerApi.initialize", getCodec());
                if (androidVideoPlayerApi != null) {
                    basicMessageChannel.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.videoplayer.Messages$AndroidVideoPlayerApi$$ExternalSyntheticLambda0
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            Messages.AndroidVideoPlayerApi.CC.lambda$setup$0(androidVideoPlayerApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel2 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.AndroidVideoPlayerApi.create", getCodec());
                if (androidVideoPlayerApi != null) {
                    basicMessageChannel2.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.videoplayer.Messages$AndroidVideoPlayerApi$$ExternalSyntheticLambda5
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            Messages.AndroidVideoPlayerApi.CC.lambda$setup$1(androidVideoPlayerApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel2.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel3 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.AndroidVideoPlayerApi.dispose", getCodec());
                if (androidVideoPlayerApi != null) {
                    basicMessageChannel3.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.videoplayer.Messages$AndroidVideoPlayerApi$$ExternalSyntheticLambda6
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            Messages.AndroidVideoPlayerApi.CC.lambda$setup$2(androidVideoPlayerApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel3.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel4 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.AndroidVideoPlayerApi.setLooping", getCodec());
                if (androidVideoPlayerApi != null) {
                    basicMessageChannel4.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.videoplayer.Messages$AndroidVideoPlayerApi$$ExternalSyntheticLambda7
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            Messages.AndroidVideoPlayerApi.CC.lambda$setup$3(androidVideoPlayerApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel4.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel5 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.AndroidVideoPlayerApi.setVolume", getCodec());
                if (androidVideoPlayerApi != null) {
                    basicMessageChannel5.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.videoplayer.Messages$AndroidVideoPlayerApi$$ExternalSyntheticLambda8
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            Messages.AndroidVideoPlayerApi.CC.lambda$setup$4(androidVideoPlayerApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel5.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel6 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.AndroidVideoPlayerApi.setPlaybackSpeed", getCodec());
                if (androidVideoPlayerApi != null) {
                    basicMessageChannel6.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.videoplayer.Messages$AndroidVideoPlayerApi$$ExternalSyntheticLambda9
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            Messages.AndroidVideoPlayerApi.CC.lambda$setup$5(androidVideoPlayerApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel6.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel7 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.AndroidVideoPlayerApi.play", getCodec());
                if (androidVideoPlayerApi != null) {
                    basicMessageChannel7.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.videoplayer.Messages$AndroidVideoPlayerApi$$ExternalSyntheticLambda10
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            Messages.AndroidVideoPlayerApi.CC.lambda$setup$6(androidVideoPlayerApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel7.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel8 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.AndroidVideoPlayerApi.position", getCodec());
                if (androidVideoPlayerApi != null) {
                    basicMessageChannel8.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.videoplayer.Messages$AndroidVideoPlayerApi$$ExternalSyntheticLambda11
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            Messages.AndroidVideoPlayerApi.CC.lambda$setup$7(androidVideoPlayerApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel8.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel9 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.AndroidVideoPlayerApi.seekTo", getCodec());
                if (androidVideoPlayerApi != null) {
                    basicMessageChannel9.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.videoplayer.Messages$AndroidVideoPlayerApi$$ExternalSyntheticLambda1
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            Messages.AndroidVideoPlayerApi.CC.lambda$setup$8(androidVideoPlayerApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel9.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel10 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.AndroidVideoPlayerApi.pause", getCodec());
                if (androidVideoPlayerApi != null) {
                    basicMessageChannel10.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.videoplayer.Messages$AndroidVideoPlayerApi$$ExternalSyntheticLambda2
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            Messages.AndroidVideoPlayerApi.CC.lambda$setup$9(androidVideoPlayerApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel10.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel11 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.AndroidVideoPlayerApi.setMixWithOthers", getCodec());
                if (androidVideoPlayerApi != null) {
                    basicMessageChannel11.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.videoplayer.Messages$AndroidVideoPlayerApi$$ExternalSyntheticLambda3
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            Messages.AndroidVideoPlayerApi.CC.lambda$setup$10(androidVideoPlayerApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel11.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel12 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.AndroidVideoPlayerApi.setBrightness", getCodec());
                if (androidVideoPlayerApi != null) {
                    basicMessageChannel12.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.videoplayer.Messages$AndroidVideoPlayerApi$$ExternalSyntheticLambda4
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            Messages.AndroidVideoPlayerApi.CC.lambda$setup$11(androidVideoPlayerApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel12.setMessageHandler(null);
                }
            }

            public static /* synthetic */ void lambda$setup$0(AndroidVideoPlayerApi androidVideoPlayerApi, Object obj, BasicMessageChannel.Reply reply) {
                ArrayList<Object> arrayList = new ArrayList<>();
                try {
                    androidVideoPlayerApi.initialize();
                    arrayList.add(0, null);
                } catch (Throwable th) {
                    arrayList = Messages.wrapError(th);
                }
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$1(AndroidVideoPlayerApi androidVideoPlayerApi, Object obj, BasicMessageChannel.Reply reply) {
                ArrayList<Object> arrayList = new ArrayList<>();
                try {
                    arrayList.add(0, androidVideoPlayerApi.create((CreateMessage) ((ArrayList) obj).get(0)));
                } catch (Throwable th) {
                    arrayList = Messages.wrapError(th);
                }
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$2(AndroidVideoPlayerApi androidVideoPlayerApi, Object obj, BasicMessageChannel.Reply reply) {
                ArrayList<Object> arrayList = new ArrayList<>();
                try {
                    androidVideoPlayerApi.dispose((TextureMessage) ((ArrayList) obj).get(0));
                    arrayList.add(0, null);
                } catch (Throwable th) {
                    arrayList = Messages.wrapError(th);
                }
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$3(AndroidVideoPlayerApi androidVideoPlayerApi, Object obj, BasicMessageChannel.Reply reply) {
                ArrayList<Object> arrayList = new ArrayList<>();
                try {
                    androidVideoPlayerApi.setLooping((LoopingMessage) ((ArrayList) obj).get(0));
                    arrayList.add(0, null);
                } catch (Throwable th) {
                    arrayList = Messages.wrapError(th);
                }
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$4(AndroidVideoPlayerApi androidVideoPlayerApi, Object obj, BasicMessageChannel.Reply reply) {
                ArrayList<Object> arrayList = new ArrayList<>();
                try {
                    androidVideoPlayerApi.setVolume((VolumeMessage) ((ArrayList) obj).get(0));
                    arrayList.add(0, null);
                } catch (Throwable th) {
                    arrayList = Messages.wrapError(th);
                }
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$5(AndroidVideoPlayerApi androidVideoPlayerApi, Object obj, BasicMessageChannel.Reply reply) {
                ArrayList<Object> arrayList = new ArrayList<>();
                try {
                    androidVideoPlayerApi.setPlaybackSpeed((PlaybackSpeedMessage) ((ArrayList) obj).get(0));
                    arrayList.add(0, null);
                } catch (Throwable th) {
                    arrayList = Messages.wrapError(th);
                }
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$6(AndroidVideoPlayerApi androidVideoPlayerApi, Object obj, BasicMessageChannel.Reply reply) {
                ArrayList<Object> arrayList = new ArrayList<>();
                try {
                    androidVideoPlayerApi.play((TextureMessage) ((ArrayList) obj).get(0));
                    arrayList.add(0, null);
                } catch (Throwable th) {
                    arrayList = Messages.wrapError(th);
                }
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$7(AndroidVideoPlayerApi androidVideoPlayerApi, Object obj, BasicMessageChannel.Reply reply) {
                ArrayList<Object> arrayList = new ArrayList<>();
                try {
                    arrayList.add(0, androidVideoPlayerApi.position((TextureMessage) ((ArrayList) obj).get(0)));
                } catch (Throwable th) {
                    arrayList = Messages.wrapError(th);
                }
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$8(AndroidVideoPlayerApi androidVideoPlayerApi, Object obj, BasicMessageChannel.Reply reply) {
                ArrayList<Object> arrayList = new ArrayList<>();
                try {
                    androidVideoPlayerApi.seekTo((PositionMessage) ((ArrayList) obj).get(0));
                    arrayList.add(0, null);
                } catch (Throwable th) {
                    arrayList = Messages.wrapError(th);
                }
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$9(AndroidVideoPlayerApi androidVideoPlayerApi, Object obj, BasicMessageChannel.Reply reply) {
                ArrayList<Object> arrayList = new ArrayList<>();
                try {
                    androidVideoPlayerApi.pause((TextureMessage) ((ArrayList) obj).get(0));
                    arrayList.add(0, null);
                } catch (Throwable th) {
                    arrayList = Messages.wrapError(th);
                }
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$10(AndroidVideoPlayerApi androidVideoPlayerApi, Object obj, BasicMessageChannel.Reply reply) {
                ArrayList<Object> arrayList = new ArrayList<>();
                try {
                    androidVideoPlayerApi.setMixWithOthers((MixWithOthersMessage) ((ArrayList) obj).get(0));
                    arrayList.add(0, null);
                } catch (Throwable th) {
                    arrayList = Messages.wrapError(th);
                }
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$11(AndroidVideoPlayerApi androidVideoPlayerApi, Object obj, BasicMessageChannel.Reply reply) {
                ArrayList<Object> arrayList = new ArrayList<>();
                try {
                    androidVideoPlayerApi.setBrightness((BrightnessMessage) ((ArrayList) obj).get(0));
                    arrayList.add(0, null);
                } catch (Throwable th) {
                    arrayList = Messages.wrapError(th);
                }
                reply.reply(arrayList);
            }
        }
    }
}
