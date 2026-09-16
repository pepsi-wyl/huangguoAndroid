package androidx.webkit;

import java.util.HashMap;
import java.util.Map;

/* loaded from: classes.dex */
public class WebViewMediaIntegrityApiStatusConfig {
    public static final int WEBVIEW_MEDIA_INTEGRITY_API_DISABLED = 0;
    public static final int WEBVIEW_MEDIA_INTEGRITY_API_ENABLED = 2;
    public static final int WEBVIEW_MEDIA_INTEGRITY_API_ENABLED_WITHOUT_APP_IDENTITY = 1;
    private int mDefaultStatus;
    private Map<String, Integer> mOverrideRules;

    public WebViewMediaIntegrityApiStatusConfig(Builder builder) {
        this.mDefaultStatus = builder.mDefaultStatus;
        this.mOverrideRules = builder.mOverrideRules;
    }

    public static final class Builder {
        private int mDefaultStatus;
        private Map<String, Integer> mOverrideRules = new HashMap();

        public Builder(int i) {
            this.mDefaultStatus = i;
        }

        public Builder addOverrideRule(String str, int i) {
            this.mOverrideRules.put(str, Integer.valueOf(i));
            return this;
        }

        public Builder setOverrideRules(Map<String, Integer> map) {
            this.mOverrideRules = map;
            return this;
        }

        public WebViewMediaIntegrityApiStatusConfig build() {
            return new WebViewMediaIntegrityApiStatusConfig(this);
        }
    }

    public int getDefaultStatus() {
        return this.mDefaultStatus;
    }

    public Map<String, Integer> getOverrideRules() {
        return this.mOverrideRules;
    }
}
