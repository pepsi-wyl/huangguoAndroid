package androidx.datastore.preferences.protobuf;

import androidx.datastore.preferences.protobuf.GeneratedMessageLite;
import androidx.datastore.preferences.protobuf.Internal;
import androidx.datastore.preferences.protobuf.Method;
import androidx.datastore.preferences.protobuf.Mixin;
import androidx.datastore.preferences.protobuf.Option;
import androidx.datastore.preferences.protobuf.SourceContext;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.util.Collections;
import java.util.List;

/* loaded from: classes.dex */
public final class Api extends GeneratedMessageLite<Api, Builder> implements ApiOrBuilder {
    private static final Api DEFAULT_INSTANCE;
    public static final int METHODS_FIELD_NUMBER = 2;
    public static final int MIXINS_FIELD_NUMBER = 6;
    public static final int NAME_FIELD_NUMBER = 1;
    public static final int OPTIONS_FIELD_NUMBER = 3;
    private static volatile Parser<Api> PARSER = null;
    public static final int SOURCE_CONTEXT_FIELD_NUMBER = 5;
    public static final int SYNTAX_FIELD_NUMBER = 7;
    public static final int VERSION_FIELD_NUMBER = 4;
    private SourceContext sourceContext_;
    private int syntax_;
    private String name_ = "";
    private Internal.ProtobufList<Method> methods_ = emptyProtobufList();
    private Internal.ProtobufList<Option> options_ = emptyProtobufList();
    private String version_ = "";
    private Internal.ProtobufList<Mixin> mixins_ = emptyProtobufList();

    private Api() {
    }

    @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
    public String getName() {
        return this.name_;
    }

    @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
    public ByteString getNameBytes() {
        return ByteString.copyFromUtf8(this.name_);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setName(String str) {
        str.getClass();
        this.name_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearName() {
        this.name_ = getDefaultInstance().getName();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setNameBytes(ByteString byteString) {
        byteString.getClass();
        checkByteStringIsUtf8(byteString);
        this.name_ = byteString.toStringUtf8();
    }

    @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
    public List<Method> getMethodsList() {
        return this.methods_;
    }

    public List<? extends MethodOrBuilder> getMethodsOrBuilderList() {
        return this.methods_;
    }

    @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
    public int getMethodsCount() {
        return this.methods_.size();
    }

    @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
    public Method getMethods(int i) {
        return this.methods_.get(i);
    }

    public MethodOrBuilder getMethodsOrBuilder(int i) {
        return this.methods_.get(i);
    }

    private void ensureMethodsIsMutable() {
        if (this.methods_.isModifiable()) {
            return;
        }
        this.methods_ = GeneratedMessageLite.mutableCopy(this.methods_);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setMethods(int i, Method method) {
        method.getClass();
        ensureMethodsIsMutable();
        this.methods_.set(i, method);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setMethods(int i, Method.Builder builder) {
        ensureMethodsIsMutable();
        this.methods_.set(i, builder.build());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void addMethods(Method method) {
        method.getClass();
        ensureMethodsIsMutable();
        this.methods_.add(method);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void addMethods(int i, Method method) {
        method.getClass();
        ensureMethodsIsMutable();
        this.methods_.add(i, method);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void addMethods(Method.Builder builder) {
        ensureMethodsIsMutable();
        this.methods_.add(builder.build());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void addMethods(int i, Method.Builder builder) {
        ensureMethodsIsMutable();
        this.methods_.add(i, builder.build());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void addAllMethods(Iterable<? extends Method> iterable) {
        ensureMethodsIsMutable();
        AbstractMessageLite.addAll((Iterable) iterable, (List) this.methods_);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearMethods() {
        this.methods_ = emptyProtobufList();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void removeMethods(int i) {
        ensureMethodsIsMutable();
        this.methods_.remove(i);
    }

    @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
    public List<Option> getOptionsList() {
        return this.options_;
    }

    public List<? extends OptionOrBuilder> getOptionsOrBuilderList() {
        return this.options_;
    }

    @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
    public int getOptionsCount() {
        return this.options_.size();
    }

    @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
    public Option getOptions(int i) {
        return this.options_.get(i);
    }

    public OptionOrBuilder getOptionsOrBuilder(int i) {
        return this.options_.get(i);
    }

    private void ensureOptionsIsMutable() {
        if (this.options_.isModifiable()) {
            return;
        }
        this.options_ = GeneratedMessageLite.mutableCopy(this.options_);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setOptions(int i, Option option) {
        option.getClass();
        ensureOptionsIsMutable();
        this.options_.set(i, option);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setOptions(int i, Option.Builder builder) {
        ensureOptionsIsMutable();
        this.options_.set(i, builder.build());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void addOptions(Option option) {
        option.getClass();
        ensureOptionsIsMutable();
        this.options_.add(option);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void addOptions(int i, Option option) {
        option.getClass();
        ensureOptionsIsMutable();
        this.options_.add(i, option);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void addOptions(Option.Builder builder) {
        ensureOptionsIsMutable();
        this.options_.add(builder.build());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void addOptions(int i, Option.Builder builder) {
        ensureOptionsIsMutable();
        this.options_.add(i, builder.build());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void addAllOptions(Iterable<? extends Option> iterable) {
        ensureOptionsIsMutable();
        AbstractMessageLite.addAll((Iterable) iterable, (List) this.options_);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearOptions() {
        this.options_ = emptyProtobufList();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void removeOptions(int i) {
        ensureOptionsIsMutable();
        this.options_.remove(i);
    }

    @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
    public String getVersion() {
        return this.version_;
    }

    @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
    public ByteString getVersionBytes() {
        return ByteString.copyFromUtf8(this.version_);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setVersion(String str) {
        str.getClass();
        this.version_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearVersion() {
        this.version_ = getDefaultInstance().getVersion();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setVersionBytes(ByteString byteString) {
        byteString.getClass();
        checkByteStringIsUtf8(byteString);
        this.version_ = byteString.toStringUtf8();
    }

    @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
    public boolean hasSourceContext() {
        return this.sourceContext_ != null;
    }

    @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
    public SourceContext getSourceContext() {
        SourceContext sourceContext = this.sourceContext_;
        return sourceContext == null ? SourceContext.getDefaultInstance() : sourceContext;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setSourceContext(SourceContext sourceContext) {
        sourceContext.getClass();
        this.sourceContext_ = sourceContext;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setSourceContext(SourceContext.Builder builder) {
        this.sourceContext_ = builder.build();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void mergeSourceContext(SourceContext sourceContext) {
        sourceContext.getClass();
        SourceContext sourceContext2 = this.sourceContext_;
        if (sourceContext2 != null && sourceContext2 != SourceContext.getDefaultInstance()) {
            this.sourceContext_ = SourceContext.newBuilder(this.sourceContext_).mergeFrom((SourceContext.Builder) sourceContext).buildPartial();
        } else {
            this.sourceContext_ = sourceContext;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearSourceContext() {
        this.sourceContext_ = null;
    }

    @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
    public List<Mixin> getMixinsList() {
        return this.mixins_;
    }

    public List<? extends MixinOrBuilder> getMixinsOrBuilderList() {
        return this.mixins_;
    }

    @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
    public int getMixinsCount() {
        return this.mixins_.size();
    }

    @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
    public Mixin getMixins(int i) {
        return this.mixins_.get(i);
    }

    public MixinOrBuilder getMixinsOrBuilder(int i) {
        return this.mixins_.get(i);
    }

    private void ensureMixinsIsMutable() {
        if (this.mixins_.isModifiable()) {
            return;
        }
        this.mixins_ = GeneratedMessageLite.mutableCopy(this.mixins_);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setMixins(int i, Mixin mixin) {
        mixin.getClass();
        ensureMixinsIsMutable();
        this.mixins_.set(i, mixin);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setMixins(int i, Mixin.Builder builder) {
        ensureMixinsIsMutable();
        this.mixins_.set(i, builder.build());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void addMixins(Mixin mixin) {
        mixin.getClass();
        ensureMixinsIsMutable();
        this.mixins_.add(mixin);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void addMixins(int i, Mixin mixin) {
        mixin.getClass();
        ensureMixinsIsMutable();
        this.mixins_.add(i, mixin);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void addMixins(Mixin.Builder builder) {
        ensureMixinsIsMutable();
        this.mixins_.add(builder.build());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void addMixins(int i, Mixin.Builder builder) {
        ensureMixinsIsMutable();
        this.mixins_.add(i, builder.build());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void addAllMixins(Iterable<? extends Mixin> iterable) {
        ensureMixinsIsMutable();
        AbstractMessageLite.addAll((Iterable) iterable, (List) this.mixins_);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearMixins() {
        this.mixins_ = emptyProtobufList();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void removeMixins(int i) {
        ensureMixinsIsMutable();
        this.mixins_.remove(i);
    }

    @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
    public int getSyntaxValue() {
        return this.syntax_;
    }

    @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
    public Syntax getSyntax() {
        Syntax syntaxForNumber = Syntax.forNumber(this.syntax_);
        return syntaxForNumber == null ? Syntax.UNRECOGNIZED : syntaxForNumber;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setSyntaxValue(int i) {
        this.syntax_ = i;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setSyntax(Syntax syntax) {
        syntax.getClass();
        this.syntax_ = syntax.getNumber();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearSyntax() {
        this.syntax_ = 0;
    }

    public static Api parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
        return (Api) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, byteBuffer);
    }

    public static Api parseFrom(ByteBuffer byteBuffer, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
        return (Api) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, byteBuffer, extensionRegistryLite);
    }

    public static Api parseFrom(ByteString byteString) throws InvalidProtocolBufferException {
        return (Api) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, byteString);
    }

    public static Api parseFrom(ByteString byteString, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
        return (Api) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, byteString, extensionRegistryLite);
    }

    public static Api parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
        return (Api) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, bArr);
    }

    public static Api parseFrom(byte[] bArr, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
        return (Api) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, bArr, extensionRegistryLite);
    }

    public static Api parseFrom(InputStream inputStream) throws IOException {
        return (Api) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, inputStream);
    }

    public static Api parseFrom(InputStream inputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException {
        return (Api) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, inputStream, extensionRegistryLite);
    }

    public static Api parseDelimitedFrom(InputStream inputStream) throws IOException {
        return (Api) parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
    }

    public static Api parseDelimitedFrom(InputStream inputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException {
        return (Api) parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, extensionRegistryLite);
    }

    public static Api parseFrom(CodedInputStream codedInputStream) throws IOException {
        return (Api) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, codedInputStream);
    }

    public static Api parseFrom(CodedInputStream codedInputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException {
        return (Api) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, codedInputStream, extensionRegistryLite);
    }

    public static Builder newBuilder() {
        return DEFAULT_INSTANCE.createBuilder();
    }

    public static Builder newBuilder(Api api) {
        return DEFAULT_INSTANCE.createBuilder(api);
    }

    public static final class Builder extends GeneratedMessageLite.Builder<Api, Builder> implements ApiOrBuilder {
        /* synthetic */ Builder(AnonymousClass1 anonymousClass1) {
            this();
        }

        private Builder() {
            super(Api.DEFAULT_INSTANCE);
        }

        @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
        public String getName() {
            return ((Api) this.instance).getName();
        }

        @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
        public ByteString getNameBytes() {
            return ((Api) this.instance).getNameBytes();
        }

        public Builder setName(String str) {
            copyOnWrite();
            ((Api) this.instance).setName(str);
            return this;
        }

        public Builder clearName() {
            copyOnWrite();
            ((Api) this.instance).clearName();
            return this;
        }

        public Builder setNameBytes(ByteString byteString) {
            copyOnWrite();
            ((Api) this.instance).setNameBytes(byteString);
            return this;
        }

        @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
        public List<Method> getMethodsList() {
            return Collections.unmodifiableList(((Api) this.instance).getMethodsList());
        }

        @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
        public int getMethodsCount() {
            return ((Api) this.instance).getMethodsCount();
        }

        @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
        public Method getMethods(int i) {
            return ((Api) this.instance).getMethods(i);
        }

        public Builder setMethods(int i, Method method) {
            copyOnWrite();
            ((Api) this.instance).setMethods(i, method);
            return this;
        }

        public Builder setMethods(int i, Method.Builder builder) {
            copyOnWrite();
            ((Api) this.instance).setMethods(i, builder);
            return this;
        }

        public Builder addMethods(Method method) {
            copyOnWrite();
            ((Api) this.instance).addMethods(method);
            return this;
        }

        public Builder addMethods(int i, Method method) {
            copyOnWrite();
            ((Api) this.instance).addMethods(i, method);
            return this;
        }

        public Builder addMethods(Method.Builder builder) {
            copyOnWrite();
            ((Api) this.instance).addMethods(builder);
            return this;
        }

        public Builder addMethods(int i, Method.Builder builder) {
            copyOnWrite();
            ((Api) this.instance).addMethods(i, builder);
            return this;
        }

        public Builder addAllMethods(Iterable<? extends Method> iterable) {
            copyOnWrite();
            ((Api) this.instance).addAllMethods(iterable);
            return this;
        }

        public Builder clearMethods() {
            copyOnWrite();
            ((Api) this.instance).clearMethods();
            return this;
        }

        public Builder removeMethods(int i) {
            copyOnWrite();
            ((Api) this.instance).removeMethods(i);
            return this;
        }

        @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
        public List<Option> getOptionsList() {
            return Collections.unmodifiableList(((Api) this.instance).getOptionsList());
        }

        @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
        public int getOptionsCount() {
            return ((Api) this.instance).getOptionsCount();
        }

        @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
        public Option getOptions(int i) {
            return ((Api) this.instance).getOptions(i);
        }

        public Builder setOptions(int i, Option option) {
            copyOnWrite();
            ((Api) this.instance).setOptions(i, option);
            return this;
        }

        public Builder setOptions(int i, Option.Builder builder) {
            copyOnWrite();
            ((Api) this.instance).setOptions(i, builder);
            return this;
        }

        public Builder addOptions(Option option) {
            copyOnWrite();
            ((Api) this.instance).addOptions(option);
            return this;
        }

        public Builder addOptions(int i, Option option) {
            copyOnWrite();
            ((Api) this.instance).addOptions(i, option);
            return this;
        }

        public Builder addOptions(Option.Builder builder) {
            copyOnWrite();
            ((Api) this.instance).addOptions(builder);
            return this;
        }

        public Builder addOptions(int i, Option.Builder builder) {
            copyOnWrite();
            ((Api) this.instance).addOptions(i, builder);
            return this;
        }

        public Builder addAllOptions(Iterable<? extends Option> iterable) {
            copyOnWrite();
            ((Api) this.instance).addAllOptions(iterable);
            return this;
        }

        public Builder clearOptions() {
            copyOnWrite();
            ((Api) this.instance).clearOptions();
            return this;
        }

        public Builder removeOptions(int i) {
            copyOnWrite();
            ((Api) this.instance).removeOptions(i);
            return this;
        }

        @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
        public String getVersion() {
            return ((Api) this.instance).getVersion();
        }

        @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
        public ByteString getVersionBytes() {
            return ((Api) this.instance).getVersionBytes();
        }

        public Builder setVersion(String str) {
            copyOnWrite();
            ((Api) this.instance).setVersion(str);
            return this;
        }

        public Builder clearVersion() {
            copyOnWrite();
            ((Api) this.instance).clearVersion();
            return this;
        }

        public Builder setVersionBytes(ByteString byteString) {
            copyOnWrite();
            ((Api) this.instance).setVersionBytes(byteString);
            return this;
        }

        @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
        public boolean hasSourceContext() {
            return ((Api) this.instance).hasSourceContext();
        }

        @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
        public SourceContext getSourceContext() {
            return ((Api) this.instance).getSourceContext();
        }

        public Builder setSourceContext(SourceContext sourceContext) {
            copyOnWrite();
            ((Api) this.instance).setSourceContext(sourceContext);
            return this;
        }

        public Builder setSourceContext(SourceContext.Builder builder) {
            copyOnWrite();
            ((Api) this.instance).setSourceContext(builder);
            return this;
        }

        public Builder mergeSourceContext(SourceContext sourceContext) {
            copyOnWrite();
            ((Api) this.instance).mergeSourceContext(sourceContext);
            return this;
        }

        public Builder clearSourceContext() {
            copyOnWrite();
            ((Api) this.instance).clearSourceContext();
            return this;
        }

        @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
        public List<Mixin> getMixinsList() {
            return Collections.unmodifiableList(((Api) this.instance).getMixinsList());
        }

        @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
        public int getMixinsCount() {
            return ((Api) this.instance).getMixinsCount();
        }

        @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
        public Mixin getMixins(int i) {
            return ((Api) this.instance).getMixins(i);
        }

        public Builder setMixins(int i, Mixin mixin) {
            copyOnWrite();
            ((Api) this.instance).setMixins(i, mixin);
            return this;
        }

        public Builder setMixins(int i, Mixin.Builder builder) {
            copyOnWrite();
            ((Api) this.instance).setMixins(i, builder);
            return this;
        }

        public Builder addMixins(Mixin mixin) {
            copyOnWrite();
            ((Api) this.instance).addMixins(mixin);
            return this;
        }

        public Builder addMixins(int i, Mixin mixin) {
            copyOnWrite();
            ((Api) this.instance).addMixins(i, mixin);
            return this;
        }

        public Builder addMixins(Mixin.Builder builder) {
            copyOnWrite();
            ((Api) this.instance).addMixins(builder);
            return this;
        }

        public Builder addMixins(int i, Mixin.Builder builder) {
            copyOnWrite();
            ((Api) this.instance).addMixins(i, builder);
            return this;
        }

        public Builder addAllMixins(Iterable<? extends Mixin> iterable) {
            copyOnWrite();
            ((Api) this.instance).addAllMixins(iterable);
            return this;
        }

        public Builder clearMixins() {
            copyOnWrite();
            ((Api) this.instance).clearMixins();
            return this;
        }

        public Builder removeMixins(int i) {
            copyOnWrite();
            ((Api) this.instance).removeMixins(i);
            return this;
        }

        @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
        public int getSyntaxValue() {
            return ((Api) this.instance).getSyntaxValue();
        }

        public Builder setSyntaxValue(int i) {
            copyOnWrite();
            ((Api) this.instance).setSyntaxValue(i);
            return this;
        }

        @Override // androidx.datastore.preferences.protobuf.ApiOrBuilder
        public Syntax getSyntax() {
            return ((Api) this.instance).getSyntax();
        }

        public Builder setSyntax(Syntax syntax) {
            copyOnWrite();
            ((Api) this.instance).setSyntax(syntax);
            return this;
        }

        public Builder clearSyntax() {
            copyOnWrite();
            ((Api) this.instance).clearSyntax();
            return this;
        }
    }

    /* renamed from: androidx.datastore.preferences.protobuf.Api$1, reason: invalid class name */
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
                return new Api();
            case 2:
                return new Builder(anonymousClass1);
            case 3:
                return newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0007\u0000\u0000\u0001\u0007\u0007\u0000\u0003\u0000\u0001Ȉ\u0002\u001b\u0003\u001b\u0004Ȉ\u0005\t\u0006\u001b\u0007\f", new Object[]{"name_", "methods_", Method.class, "options_", Option.class, "version_", "sourceContext_", "mixins_", Mixin.class, "syntax_"});
            case 4:
                return DEFAULT_INSTANCE;
            case 5:
                Parser<Api> defaultInstanceBasedParser = PARSER;
                if (defaultInstanceBasedParser == null) {
                    synchronized (Api.class) {
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
        Api api = new Api();
        DEFAULT_INSTANCE = api;
        GeneratedMessageLite.registerDefaultInstance(Api.class, api);
    }

    public static Api getDefaultInstance() {
        return DEFAULT_INSTANCE;
    }

    public static Parser<Api> parser() {
        return DEFAULT_INSTANCE.getParserForType();
    }
}
