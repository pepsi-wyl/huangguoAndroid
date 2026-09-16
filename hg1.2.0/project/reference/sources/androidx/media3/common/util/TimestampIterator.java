package androidx.media3.common.util;

/* loaded from: classes.dex */
public interface TimestampIterator {

    /* renamed from: androidx.media3.common.util.TimestampIterator$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
    }

    TimestampIterator copyOf();

    long getLastTimestampUs();

    boolean hasNext();

    long next();
}
