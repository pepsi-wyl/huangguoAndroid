package androidx.media3.common.text;

import android.os.Bundle;
import androidx.media3.common.util.Assertions;
import androidx.media3.common.util.Util;

/* loaded from: classes.dex */
public final class RubySpan implements LanguageFeatureSpan {
    public final int position;
    public final String rubyText;
    private static final String FIELD_TEXT = Util.intToStringMaxRadix(0);
    private static final String FIELD_POSITION = Util.intToStringMaxRadix(1);

    public RubySpan(String str, int i) {
        this.rubyText = str;
        this.position = i;
    }

    public Bundle toBundle() {
        Bundle bundle = new Bundle();
        bundle.putString(FIELD_TEXT, this.rubyText);
        bundle.putInt(FIELD_POSITION, this.position);
        return bundle;
    }

    public static RubySpan fromBundle(Bundle bundle) {
        return new RubySpan((String) Assertions.checkNotNull(bundle.getString(FIELD_TEXT)), bundle.getInt(FIELD_POSITION));
    }
}
