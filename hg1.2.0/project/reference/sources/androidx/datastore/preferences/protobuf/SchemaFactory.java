package androidx.datastore.preferences.protobuf;

/* loaded from: classes.dex */
interface SchemaFactory {
    <T> Schema<T> createSchema(Class<T> cls);
}
