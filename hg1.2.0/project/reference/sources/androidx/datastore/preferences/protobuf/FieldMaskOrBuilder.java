package androidx.datastore.preferences.protobuf;

import java.util.List;

/* loaded from: classes.dex */
public interface FieldMaskOrBuilder extends MessageLiteOrBuilder {
    String getPaths(int i);

    ByteString getPathsBytes(int i);

    int getPathsCount();

    List<String> getPathsList();
}
