package androidx.core.view.autofill;

import android.view.autofill.AutofillId;
import androidx.media3.common.util.Util$$ExternalSyntheticApiModelOutline0;

/* loaded from: classes.dex */
public class AutofillIdCompat {
    private final Object mWrappedObj;

    private AutofillIdCompat(AutofillId autofillId) {
        this.mWrappedObj = autofillId;
    }

    public static AutofillIdCompat toAutofillIdCompat(AutofillId autofillId) {
        return new AutofillIdCompat(autofillId);
    }

    public AutofillId toAutofillId() {
        return Util$$ExternalSyntheticApiModelOutline0.m150m(this.mWrappedObj);
    }
}
