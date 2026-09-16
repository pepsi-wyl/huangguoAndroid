package androidx.datastore.preferences.protobuf;

import androidx.datastore.preferences.protobuf.FieldSet;
import androidx.datastore.preferences.protobuf.LazyField;
import androidx.datastore.preferences.protobuf.WireFormat;
import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

/* loaded from: classes.dex */
final class MessageSetSchema<T> implements Schema<T> {
    private final MessageLite defaultInstance;
    private final ExtensionSchema<?> extensionSchema;
    private final boolean hasExtensions;
    private final UnknownFieldSchema<?, ?> unknownFieldSchema;

    private MessageSetSchema(UnknownFieldSchema<?, ?> unknownFieldSchema, ExtensionSchema<?> extensionSchema, MessageLite messageLite) {
        this.unknownFieldSchema = unknownFieldSchema;
        this.hasExtensions = extensionSchema.hasExtensions(messageLite);
        this.extensionSchema = extensionSchema;
        this.defaultInstance = messageLite;
    }

    static <T> MessageSetSchema<T> newSchema(UnknownFieldSchema<?, ?> unknownFieldSchema, ExtensionSchema<?> extensionSchema, MessageLite messageLite) {
        return new MessageSetSchema<>(unknownFieldSchema, extensionSchema, messageLite);
    }

    @Override // androidx.datastore.preferences.protobuf.Schema
    public T newInstance() {
        return (T) this.defaultInstance.newBuilderForType().buildPartial();
    }

    @Override // androidx.datastore.preferences.protobuf.Schema
    public boolean equals(T t, T t2) {
        if (!this.unknownFieldSchema.getFromMessage(t).equals(this.unknownFieldSchema.getFromMessage(t2))) {
            return false;
        }
        if (this.hasExtensions) {
            return this.extensionSchema.getExtensions(t).equals(this.extensionSchema.getExtensions(t2));
        }
        return true;
    }

    @Override // androidx.datastore.preferences.protobuf.Schema
    public int hashCode(T t) {
        int iHashCode = this.unknownFieldSchema.getFromMessage(t).hashCode();
        return this.hasExtensions ? (iHashCode * 53) + this.extensionSchema.getExtensions(t).hashCode() : iHashCode;
    }

    @Override // androidx.datastore.preferences.protobuf.Schema
    public void mergeFrom(T t, T t2) {
        SchemaUtil.mergeUnknownFields(this.unknownFieldSchema, t, t2);
        if (this.hasExtensions) {
            SchemaUtil.mergeExtensions(this.extensionSchema, t, t2);
        }
    }

    @Override // androidx.datastore.preferences.protobuf.Schema
    public void writeTo(T t, Writer writer) throws IOException {
        Iterator it = this.extensionSchema.getExtensions(t).iterator();
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            FieldSet.FieldDescriptorLite fieldDescriptorLite = (FieldSet.FieldDescriptorLite) entry.getKey();
            if (fieldDescriptorLite.getLiteJavaType() != WireFormat.JavaType.MESSAGE || fieldDescriptorLite.isRepeated() || fieldDescriptorLite.isPacked()) {
                throw new IllegalStateException("Found invalid MessageSet item.");
            }
            if (entry instanceof LazyField.LazyEntry) {
                writer.writeMessageSetItem(fieldDescriptorLite.getNumber(), ((LazyField.LazyEntry) entry).getField().toByteString());
            } else {
                writer.writeMessageSetItem(fieldDescriptorLite.getNumber(), entry.getValue());
            }
        }
        writeUnknownFieldsHelper(this.unknownFieldSchema, t, writer);
    }

    private <UT, UB> void writeUnknownFieldsHelper(UnknownFieldSchema<UT, UB> unknownFieldSchema, T t, Writer writer) throws IOException {
        unknownFieldSchema.writeAsMessageSetTo(unknownFieldSchema.getFromMessage(t), writer);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00c6  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00cb A[EDGE_INSN: B:58:0x00cb->B:34:0x00cb BREAK  A[LOOP:1: B:18:0x006d->B:61:0x006d], SYNTHETIC] */
    @Override // androidx.datastore.preferences.protobuf.Schema
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void mergeFrom(T r11, byte[] r12, int r13, int r14, androidx.datastore.preferences.protobuf.ArrayDecoders.Registers r15) throws java.io.IOException {
        /*
            r10 = this;
            r0 = r11
            androidx.datastore.preferences.protobuf.GeneratedMessageLite r0 = (androidx.datastore.preferences.protobuf.GeneratedMessageLite) r0
            androidx.datastore.preferences.protobuf.UnknownFieldSetLite r1 = r0.unknownFields
            androidx.datastore.preferences.protobuf.UnknownFieldSetLite r2 = androidx.datastore.preferences.protobuf.UnknownFieldSetLite.getDefaultInstance()
            if (r1 != r2) goto L11
            androidx.datastore.preferences.protobuf.UnknownFieldSetLite r1 = androidx.datastore.preferences.protobuf.UnknownFieldSetLite.newInstance()
            r0.unknownFields = r1
        L11:
            androidx.datastore.preferences.protobuf.GeneratedMessageLite$ExtendableMessage r11 = (androidx.datastore.preferences.protobuf.GeneratedMessageLite.ExtendableMessage) r11
            androidx.datastore.preferences.protobuf.FieldSet r11 = r11.ensureExtensionsAreMutable()
            r0 = 0
            r2 = r0
        L19:
            if (r13 >= r14) goto Ld7
            int r4 = androidx.datastore.preferences.protobuf.ArrayDecoders.decodeVarint32(r12, r13, r15)
            int r13 = r15.int1
            int r3 = androidx.datastore.preferences.protobuf.WireFormat.MESSAGE_SET_ITEM_TAG
            r5 = 2
            if (r13 == r3) goto L6b
            int r3 = androidx.datastore.preferences.protobuf.WireFormat.getTagWireType(r13)
            if (r3 != r5) goto L66
            androidx.datastore.preferences.protobuf.ExtensionSchema<?> r2 = r10.extensionSchema
            androidx.datastore.preferences.protobuf.ExtensionRegistryLite r3 = r15.extensionRegistry
            androidx.datastore.preferences.protobuf.MessageLite r5 = r10.defaultInstance
            int r6 = androidx.datastore.preferences.protobuf.WireFormat.getTagFieldNumber(r13)
            java.lang.Object r2 = r2.findExtensionByNumber(r3, r5, r6)
            r8 = r2
            androidx.datastore.preferences.protobuf.GeneratedMessageLite$GeneratedExtension r8 = (androidx.datastore.preferences.protobuf.GeneratedMessageLite.GeneratedExtension) r8
            if (r8 == 0) goto L5b
            androidx.datastore.preferences.protobuf.Protobuf r13 = androidx.datastore.preferences.protobuf.Protobuf.getInstance()
            androidx.datastore.preferences.protobuf.MessageLite r2 = r8.getMessageDefaultInstance()
            java.lang.Class r2 = r2.getClass()
            androidx.datastore.preferences.protobuf.Schema r13 = r13.schemaFor(r2)
            int r13 = androidx.datastore.preferences.protobuf.ArrayDecoders.decodeMessageField(r13, r12, r4, r14, r15)
            androidx.datastore.preferences.protobuf.GeneratedMessageLite$ExtensionDescriptor r2 = r8.descriptor
            java.lang.Object r3 = r15.object1
            r11.setField(r2, r3)
            goto L64
        L5b:
            r2 = r13
            r3 = r12
            r5 = r14
            r6 = r1
            r7 = r15
            int r13 = androidx.datastore.preferences.protobuf.ArrayDecoders.decodeUnknownField(r2, r3, r4, r5, r6, r7)
        L64:
            r2 = r8
            goto L19
        L66:
            int r13 = androidx.datastore.preferences.protobuf.ArrayDecoders.skipField(r13, r12, r4, r14, r15)
            goto L19
        L6b:
            r13 = 0
            r3 = r0
        L6d:
            if (r4 >= r14) goto Lcb
            int r4 = androidx.datastore.preferences.protobuf.ArrayDecoders.decodeVarint32(r12, r4, r15)
            int r6 = r15.int1
            int r7 = androidx.datastore.preferences.protobuf.WireFormat.getTagFieldNumber(r6)
            int r8 = androidx.datastore.preferences.protobuf.WireFormat.getTagWireType(r6)
            if (r7 == r5) goto Lac
            r9 = 3
            if (r7 == r9) goto L83
            goto Lc1
        L83:
            if (r2 == 0) goto La1
            androidx.datastore.preferences.protobuf.Protobuf r6 = androidx.datastore.preferences.protobuf.Protobuf.getInstance()
            androidx.datastore.preferences.protobuf.MessageLite r7 = r2.getMessageDefaultInstance()
            java.lang.Class r7 = r7.getClass()
            androidx.datastore.preferences.protobuf.Schema r6 = r6.schemaFor(r7)
            int r4 = androidx.datastore.preferences.protobuf.ArrayDecoders.decodeMessageField(r6, r12, r4, r14, r15)
            androidx.datastore.preferences.protobuf.GeneratedMessageLite$ExtensionDescriptor r6 = r2.descriptor
            java.lang.Object r7 = r15.object1
            r11.setField(r6, r7)
            goto L6d
        La1:
            if (r8 != r5) goto Lc1
            int r4 = androidx.datastore.preferences.protobuf.ArrayDecoders.decodeBytes(r12, r4, r15)
            java.lang.Object r3 = r15.object1
            androidx.datastore.preferences.protobuf.ByteString r3 = (androidx.datastore.preferences.protobuf.ByteString) r3
            goto L6d
        Lac:
            if (r8 != 0) goto Lc1
            int r4 = androidx.datastore.preferences.protobuf.ArrayDecoders.decodeVarint32(r12, r4, r15)
            int r13 = r15.int1
            androidx.datastore.preferences.protobuf.ExtensionSchema<?> r2 = r10.extensionSchema
            androidx.datastore.preferences.protobuf.ExtensionRegistryLite r6 = r15.extensionRegistry
            androidx.datastore.preferences.protobuf.MessageLite r7 = r10.defaultInstance
            java.lang.Object r2 = r2.findExtensionByNumber(r6, r7, r13)
            androidx.datastore.preferences.protobuf.GeneratedMessageLite$GeneratedExtension r2 = (androidx.datastore.preferences.protobuf.GeneratedMessageLite.GeneratedExtension) r2
            goto L6d
        Lc1:
            int r7 = androidx.datastore.preferences.protobuf.WireFormat.MESSAGE_SET_ITEM_END_TAG
            if (r6 != r7) goto Lc6
            goto Lcb
        Lc6:
            int r4 = androidx.datastore.preferences.protobuf.ArrayDecoders.skipField(r6, r12, r4, r14, r15)
            goto L6d
        Lcb:
            if (r3 == 0) goto Ld4
            int r13 = androidx.datastore.preferences.protobuf.WireFormat.makeTag(r13, r5)
            r1.storeField(r13, r3)
        Ld4:
            r13 = r4
            goto L19
        Ld7:
            if (r13 != r14) goto Lda
            return
        Lda:
            androidx.datastore.preferences.protobuf.InvalidProtocolBufferException r11 = androidx.datastore.preferences.protobuf.InvalidProtocolBufferException.parseFailure()
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.datastore.preferences.protobuf.MessageSetSchema.mergeFrom(java.lang.Object, byte[], int, int, androidx.datastore.preferences.protobuf.ArrayDecoders$Registers):void");
    }

    @Override // androidx.datastore.preferences.protobuf.Schema
    public void mergeFrom(T t, Reader reader, ExtensionRegistryLite extensionRegistryLite) throws IOException {
        mergeFromHelper(this.unknownFieldSchema, this.extensionSchema, t, reader, extensionRegistryLite);
    }

    private <UT, UB, ET extends FieldSet.FieldDescriptorLite<ET>> void mergeFromHelper(UnknownFieldSchema<UT, UB> unknownFieldSchema, ExtensionSchema<ET> extensionSchema, T t, Reader reader, ExtensionRegistryLite extensionRegistryLite) throws IOException {
        UB builderFromMessage = unknownFieldSchema.getBuilderFromMessage(t);
        FieldSet<ET> mutableExtensions = extensionSchema.getMutableExtensions(t);
        while (reader.getFieldNumber() != Integer.MAX_VALUE) {
            try {
                if (!parseMessageSetItemOrUnknownField(reader, extensionRegistryLite, extensionSchema, mutableExtensions, unknownFieldSchema, builderFromMessage)) {
                    return;
                }
            } finally {
                unknownFieldSchema.setBuilderToMessage(t, builderFromMessage);
            }
        }
    }

    @Override // androidx.datastore.preferences.protobuf.Schema
    public void makeImmutable(T t) {
        this.unknownFieldSchema.makeImmutable(t);
        this.extensionSchema.makeImmutable(t);
    }

    /* JADX WARN: Multi-variable type inference failed */
    private <UT, UB, ET extends FieldSet.FieldDescriptorLite<ET>> boolean parseMessageSetItemOrUnknownField(Reader reader, ExtensionRegistryLite extensionRegistryLite, ExtensionSchema<ET> extensionSchema, FieldSet<ET> fieldSet, UnknownFieldSchema<UT, UB> unknownFieldSchema, UB ub) throws IOException {
        int tag = reader.getTag();
        if (tag != WireFormat.MESSAGE_SET_ITEM_TAG) {
            if (WireFormat.getTagWireType(tag) == 2) {
                Object objFindExtensionByNumber = extensionSchema.findExtensionByNumber(extensionRegistryLite, this.defaultInstance, WireFormat.getTagFieldNumber(tag));
                if (objFindExtensionByNumber != null) {
                    extensionSchema.parseLengthPrefixedMessageSetItem(reader, objFindExtensionByNumber, extensionRegistryLite, fieldSet);
                    return true;
                }
                return unknownFieldSchema.mergeOneFieldFrom(ub, reader);
            }
            return reader.skipField();
        }
        Object objFindExtensionByNumber2 = null;
        ByteString bytes = null;
        int uInt32 = 0;
        while (reader.getFieldNumber() != Integer.MAX_VALUE) {
            int tag2 = reader.getTag();
            if (tag2 == WireFormat.MESSAGE_SET_TYPE_ID_TAG) {
                uInt32 = reader.readUInt32();
                objFindExtensionByNumber2 = extensionSchema.findExtensionByNumber(extensionRegistryLite, this.defaultInstance, uInt32);
            } else if (tag2 == WireFormat.MESSAGE_SET_MESSAGE_TAG) {
                if (objFindExtensionByNumber2 != null) {
                    extensionSchema.parseLengthPrefixedMessageSetItem(reader, objFindExtensionByNumber2, extensionRegistryLite, fieldSet);
                } else {
                    bytes = reader.readBytes();
                }
            } else if (!reader.skipField()) {
                break;
            }
        }
        if (reader.getTag() != WireFormat.MESSAGE_SET_ITEM_END_TAG) {
            throw InvalidProtocolBufferException.invalidEndTag();
        }
        if (bytes != null) {
            if (objFindExtensionByNumber2 != null) {
                extensionSchema.parseMessageSetItem(bytes, objFindExtensionByNumber2, extensionRegistryLite, fieldSet);
            } else {
                unknownFieldSchema.addLengthDelimited(ub, uInt32, bytes);
            }
        }
        return true;
    }

    @Override // androidx.datastore.preferences.protobuf.Schema
    public final boolean isInitialized(T t) {
        return this.extensionSchema.getExtensions(t).isInitialized();
    }

    @Override // androidx.datastore.preferences.protobuf.Schema
    public int getSerializedSize(T t) {
        int unknownFieldsSerializedSize = getUnknownFieldsSerializedSize(this.unknownFieldSchema, t);
        return this.hasExtensions ? unknownFieldsSerializedSize + this.extensionSchema.getExtensions(t).getMessageSetSerializedSize() : unknownFieldsSerializedSize;
    }

    private <UT, UB> int getUnknownFieldsSerializedSize(UnknownFieldSchema<UT, UB> unknownFieldSchema, T t) {
        return unknownFieldSchema.getSerializedSizeAsMessageSet(unknownFieldSchema.getFromMessage(t));
    }
}
