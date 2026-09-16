package io.flutter.plugins.sharedpreferences;

import java.util.List;
import kotlin.Metadata;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: MessagesAsync.g.kt */
@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010 \n\u0002\b\u0003\b\u0086\b\u0018\u0000 \u00112\u00020\u0001:\u0001\u0011B\u0011\u0012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0002\u0010\u0004J\u000b\u0010\u0007\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\t\u001a\u00020\n2\b\u0010\u000b\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\f\u001a\u00020\rHÖ\u0001J\u000e\u0010\u000e\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u000fJ\t\u0010\u0010\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006¨\u0006\u0012"}, d2 = {"Lio/flutter/plugins/sharedpreferences/SharedPreferencesPigeonOptions;", "", "fileKey", "", "(Ljava/lang/String;)V", "getFileKey", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toList", "", "toString", "Companion", "shared_preferences_android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final /* data */ class SharedPreferencesPigeonOptions {

    /* renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion(null);
    private final String fileKey;

    /* JADX WARN: Multi-variable type inference failed */
    public SharedPreferencesPigeonOptions() {
        this(null, 1, 0 == true ? 1 : 0);
    }

    public static /* synthetic */ SharedPreferencesPigeonOptions copy$default(SharedPreferencesPigeonOptions sharedPreferencesPigeonOptions, String str, int i, Object obj) {
        if ((i & 1) != 0) {
            str = sharedPreferencesPigeonOptions.fileKey;
        }
        return sharedPreferencesPigeonOptions.copy(str);
    }

    /* renamed from: component1, reason: from getter */
    public final String getFileKey() {
        return this.fileKey;
    }

    public final SharedPreferencesPigeonOptions copy(String fileKey) {
        return new SharedPreferencesPigeonOptions(fileKey);
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof SharedPreferencesPigeonOptions) && Intrinsics.areEqual(this.fileKey, ((SharedPreferencesPigeonOptions) other).fileKey);
    }

    public int hashCode() {
        String str = this.fileKey;
        if (str == null) {
            return 0;
        }
        return str.hashCode();
    }

    public String toString() {
        return "SharedPreferencesPigeonOptions(fileKey=" + this.fileKey + ')';
    }

    public SharedPreferencesPigeonOptions(String str) {
        this.fileKey = str;
    }

    public /* synthetic */ SharedPreferencesPigeonOptions(String str, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this((i & 1) != 0 ? null : str);
    }

    public final String getFileKey() {
        return this.fileKey;
    }

    /* compiled from: MessagesAsync.g.kt */
    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0016\u0010\u0003\u001a\u00020\u00042\u000e\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0006¨\u0006\u0007"}, d2 = {"Lio/flutter/plugins/sharedpreferences/SharedPreferencesPigeonOptions$Companion;", "", "()V", "fromList", "Lio/flutter/plugins/sharedpreferences/SharedPreferencesPigeonOptions;", "list", "", "shared_preferences_android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        public final SharedPreferencesPigeonOptions fromList(List<? extends Object> list) {
            Intrinsics.checkNotNullParameter(list, "list");
            return new SharedPreferencesPigeonOptions((String) list.get(0));
        }
    }

    public final List<Object> toList() {
        return CollectionsKt.listOf(this.fileKey);
    }
}
