package androidx.webkit;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: classes.dex */
public final class ProxyConfig {
    private static final String BYPASS_RULE_REMOVE_IMPLICIT = "<-loopback>";
    private static final String BYPASS_RULE_SIMPLE_NAMES = "<local>";
    private static final String DIRECT = "direct://";
    public static final String MATCH_ALL_SCHEMES = "*";
    public static final String MATCH_HTTP = "http";
    public static final String MATCH_HTTPS = "https";
    private List<String> mBypassRules;
    private List<ProxyRule> mProxyRules;
    private boolean mReverseBypass;

    @Retention(RetentionPolicy.SOURCE)
    public @interface ProxyScheme {
    }

    public ProxyConfig(List<ProxyRule> list, List<String> list2, boolean z) {
        this.mProxyRules = list;
        this.mBypassRules = list2;
        this.mReverseBypass = z;
    }

    public List<ProxyRule> getProxyRules() {
        return Collections.unmodifiableList(this.mProxyRules);
    }

    public List<String> getBypassRules() {
        return Collections.unmodifiableList(this.mBypassRules);
    }

    public boolean isReverseBypassEnabled() {
        return this.mReverseBypass;
    }

    public static final class ProxyRule {
        private String mSchemeFilter;
        private String mUrl;

        public ProxyRule(String str, String str2) {
            this.mSchemeFilter = str;
            this.mUrl = str2;
        }

        public ProxyRule(String str) {
            this(ProxyConfig.MATCH_ALL_SCHEMES, str);
        }

        public String getSchemeFilter() {
            return this.mSchemeFilter;
        }

        public String getUrl() {
            return this.mUrl;
        }
    }

    public static final class Builder {
        private List<String> mBypassRules;
        private List<ProxyRule> mProxyRules;
        private boolean mReverseBypass;

        public Builder() {
            this.mReverseBypass = false;
            this.mProxyRules = new ArrayList();
            this.mBypassRules = new ArrayList();
        }

        public Builder(ProxyConfig proxyConfig) {
            this.mReverseBypass = false;
            this.mProxyRules = proxyConfig.getProxyRules();
            this.mBypassRules = proxyConfig.getBypassRules();
            this.mReverseBypass = proxyConfig.isReverseBypassEnabled();
        }

        public ProxyConfig build() {
            return new ProxyConfig(proxyRules(), bypassRules(), reverseBypass());
        }

        public Builder addProxyRule(String str) {
            this.mProxyRules.add(new ProxyRule(str));
            return this;
        }

        public Builder addProxyRule(String str, String str2) {
            this.mProxyRules.add(new ProxyRule(str2, str));
            return this;
        }

        public Builder addBypassRule(String str) {
            this.mBypassRules.add(str);
            return this;
        }

        public Builder addDirect(String str) {
            this.mProxyRules.add(new ProxyRule(str, ProxyConfig.DIRECT));
            return this;
        }

        public Builder addDirect() {
            return addDirect(ProxyConfig.MATCH_ALL_SCHEMES);
        }

        public Builder bypassSimpleHostnames() {
            return addBypassRule(ProxyConfig.BYPASS_RULE_SIMPLE_NAMES);
        }

        public Builder removeImplicitRules() {
            return addBypassRule(ProxyConfig.BYPASS_RULE_REMOVE_IMPLICIT);
        }

        public Builder setReverseBypassEnabled(boolean z) {
            this.mReverseBypass = z;
            return this;
        }

        private List<ProxyRule> proxyRules() {
            return this.mProxyRules;
        }

        private List<String> bypassRules() {
            return this.mBypassRules;
        }

        private boolean reverseBypass() {
            return this.mReverseBypass;
        }
    }
}
