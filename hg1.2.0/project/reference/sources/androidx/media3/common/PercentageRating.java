package androidx.media3.common;

import android.os.Bundle;
import androidx.media3.common.util.Assertions;
import androidx.media3.common.util.Util;
import com.google.common.base.Objects;

/* loaded from: classes.dex */
public final class PercentageRating extends Rating {
    private static final String FIELD_PERCENT = Util.intToStringMaxRadix(1);
    private static final int TYPE = 1;
    private final float percent;

    public PercentageRating() {
        this.percent = -1.0f;
    }

    public PercentageRating(float f) {
        Assertions.checkArgument(f >= 0.0f && f <= 100.0f, "percent must be in the range of [0, 100]");
        this.percent = f;
    }

    @Override // androidx.media3.common.Rating
    public boolean isRated() {
        return this.percent != -1.0f;
    }

    public float getPercent() {
        return this.percent;
    }

    public int hashCode() {
        return Objects.hashCode(Float.valueOf(this.percent));
    }

    public boolean equals(Object obj) {
        return (obj instanceof PercentageRating) && this.percent == ((PercentageRating) obj).percent;
    }

    @Override // androidx.media3.common.Rating
    public Bundle toBundle() {
        Bundle bundle = new Bundle();
        bundle.putInt(FIELD_RATING_TYPE, 1);
        bundle.putFloat(FIELD_PERCENT, this.percent);
        return bundle;
    }

    public static PercentageRating fromBundle(Bundle bundle) {
        Assertions.checkArgument(bundle.getInt(FIELD_RATING_TYPE, -1) == 1);
        float f = bundle.getFloat(FIELD_PERCENT, -1.0f);
        return f == -1.0f ? new PercentageRating() : new PercentageRating(f);
    }
}
