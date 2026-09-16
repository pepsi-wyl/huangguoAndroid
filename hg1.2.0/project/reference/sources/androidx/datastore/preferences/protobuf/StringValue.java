package androidx.datastore.preferences.protobuf;

import androidx.datastore.preferences.protobuf.GeneratedMessageLite;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;

/* loaded from: classes.dex */
public final class StringValue extends GeneratedMessageLite<StringValue, Builder> implements StringValueOrBuilder {
    private static final StringValue DEFAULT_INSTANCE;
    private static volatile Parser<StringValue> PARSER = null;
    public static final int VALUE_FIELD_NUMBER = 1;
    private String value_ = "";

    private StringValue() {
    }

    @Override // androidx.datastore.preferences.protobuf.StringValueOrBuilder
    public String getValue() {
        return this.value_;
    }

    @Override // androidx.datastore.preferences.protobuf.StringValueOrBuilder
    public ByteString getValueBytes() {
        return ByteString.copyFromUtf8(this.value_);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setValue(String str) {
        str.getClass();
        this.value_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearValue() {
        this.value_ = getDefaultInstance().getValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setValueBytes(ByteString byteString) {
        byteString.getClass();
        checkByteStringIsUtf8(byteString);
        this.value_ = byteString.toStringUtf8();
    }

    public static StringValue parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
        return (StringValue) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, byteBuffer);
    }

    public static StringValue parseFrom(ByteBuffer byteBuffer, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
        return (StringValue) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, byteBuffer, extensionRegistryLite);
    }

    public static StringValue parseFrom(ByteString byteString) throws InvalidProtocolBufferException {
        return (StringValue) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, byteString);
    }

    public static StringValue parseFrom(ByteString byteString, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
        return (StringValue) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, byteString, extensionRegistryLite);
    }

    public static StringValue parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
        return (StringValue) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, bArr);
    }

    public static StringValue parseFrom(byte[] bArr, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
        return (StringValue) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, bArr, extensionRegistryLite);
    }

    public static StringValue parseFrom(InputStream inputStream) throws IOException {
        return (StringValue) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, inputStream);
    }

    public static StringValue parseFrom(InputStream inputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException {
        return (StringValue) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, inputStream, extensionRegistryLite);
    }

    public static StringValue parseDelimitedFrom(InputStream inputStream) throws IOException {
        return (StringValue) parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
    }

    public static StringValue parseDelimitedFrom(InputStream inputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException {
        return (StringValue) parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, extensionRegistryLite);
    }

    public static StringValue parseFrom(CodedInputStream codedInputStream) throws IOException {
        return (StringValue) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, codedInputStream);
    }

    public static StringValue parseFrom(CodedInputStream codedInputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException {
        return (StringValue) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, codedInputStream, extensionRegistryLite);
    }

    public static Builder newBuilder() {
        return DEFAULT_INSTANCE.createBuilder();
    }

    public static Builder newBuilder(StringValue stringValue) {
        return DEFAULT_INSTANCE.createBuilder(stringValue);
    }

    public static final class Builder extends GeneratedMessageLite.Builder<StringValue, Builder> implements StringValueOrBuilder {
        /* synthetic */ Builder(AnonymousClass1 anonymousClass1) {
            this();
        }

        private Builder() {
            super(StringValue.DEFAULT_INSTANCE);
        }

        @Override // androidx.datastore.preferences.protobuf.StringValueOrBuilder
        public String getValue() {
            return ((StringValue) this.instance).getValue();
        }

        @Override // androidx.datastore.preferences.protobuf.StringValueOrBuilder
        public ByteString getValueBytes() {
            return ((StringValue) this.instance).getValueBytes();
        }

        public Builder setValue(String str) {
            copyOnWrite();
            ((StringValue) this.instance).setValue(str);
            return this;
        }

        public Builder clearValue() {
            copyOnWrite();
            ((StringValue) this.instance).clearValue();
            return this;
        }

        public Builder setValueBytes(ByteString byteString) {
            copyOnWrite();
            ((StringValue) this.instance).setValueBytes(byteString);
            return this;
        }
    }

    /* renamed from: androidx.datastore.preferences.protobuf.StringValue$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke;

        static {
            int[] iArr = new int[GeneratedMessageLite.MethodToInvoke.values().length];
            $SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke = iArr;
            try {
                iArr[GeneratedMessageLite.MethodToInvoke.NEW_MUTABLE_INSTANCE.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke[GeneratedMessageLite.MethodToInvoke.NEW_BUILDER.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke[GeneratedMessageLite.MethodToInvoke.BUILD_MESSAGE_INFO.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke[GeneratedMessageLite.MethodToInvoke.GET_DEFAULT_INSTANCE.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                $SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke[GeneratedMessageLite.MethodToInvoke.GET_PARSER.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                $SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke[GeneratedMessageLite.MethodToInvoke.GET_MEMOIZED_IS_INITIALIZED.ordinal()] = 6;
            } catch (NoSuchFieldError unused6) {
            }
            try {
                $SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke[GeneratedMessageLite.MethodToInvoke.SET_MEMOIZED_IS_INITIALIZED.ordinal()] = 7;
            } catch (NoSuchFieldError unused7) {
            }
        }
    }

    @Override // androidx.datastore.preferences.protobuf.GeneratedMessageLite
    protected final Object dynamicMethod(GeneratedMessageLite.MethodToInvoke methodToInvoke, Object obj, Object obj2) {
        AnonymousClass1 anonymousClass1 = null;
        switch (AnonymousClass1.$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke[methodToInvoke.ordinal()]) {
            case 1:
                return new StringValue();
            case 2:
                return new Builder(anonymousClass1);
            case 3:
                return newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0000\u0000\u0001Ȉ", new Object[]{"value_"});
            case 4:
                return DEFAULT_INSTANCE;
            case 5:
                Parser<StringValue> defaultInstanceBasedParser = PARSER;
                if (defaultInstanceBasedParser == null) {
                    synchronized (StringValue.class) {
                        defaultInstanceBasedParser = PARSER;
                        if (defaultInstanceBasedParser == null) {
                            defaultInstanceBasedParser = new GeneratedMessageLite.DefaultInstanceBasedParser<>(DEFAULT_INSTANCE);
                            PARSER = defaultInstanceBasedParser;
                        }
                    }
                }
                return defaultInstanceBasedParser;
            case 6:
                return (byte) 1;
            case 7:
                return null;
            default:
                throw new UnsupportedOperationException();
        }
    }

    static {
        StringValue stringValue = new StringValue();
        DEFAULT_INSTANCE = stringValue;
        GeneratedMessageLite.registerDefaultInstance(StringValue.class, stringValue);
    }

    public static StringValue getDefaultInstance() {
        return DEFAULT_INSTANCE;
    }

    public static StringValue of(String str) {
        return newBuilder().setValue(str).build();
    }

    public static Parser<StringValue> parser() {
        return DEFAULT_INSTANCE.getParserForType();
    }
}
