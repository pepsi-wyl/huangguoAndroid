package androidx.media3.extractor;

import java.io.IOException;
import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.util.List;
import org.checkerframework.dataflow.qual.SideEffectFree;

/* loaded from: classes.dex */
public interface Extractor {
    public static final int RESULT_CONTINUE = 0;
    public static final int RESULT_END_OF_INPUT = -1;
    public static final int RESULT_SEEK = 1;

    @Target({ElementType.TYPE_USE})
    @Documented
    @Retention(RetentionPolicy.SOURCE)
    public @interface ReadResult {
    }

    List<SniffFailure> getSniffFailureDetails();

    @SideEffectFree
    Extractor getUnderlyingImplementation();

    void init(ExtractorOutput extractorOutput);

    int read(ExtractorInput extractorInput, PositionHolder positionHolder) throws IOException;

    void release();

    void seek(long j, long j2);

    boolean sniff(ExtractorInput extractorInput) throws IOException;

    /* renamed from: androidx.media3.extractor.Extractor$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
        @SideEffectFree
        public static Extractor $default$getUnderlyingImplementation(Extractor _this) {
            return _this;
        }
    }
}
