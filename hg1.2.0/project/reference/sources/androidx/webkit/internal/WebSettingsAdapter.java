package androidx.webkit.internal;

import androidx.webkit.UserAgentMetadata;
import androidx.webkit.WebViewMediaIntegrityApiStatusConfig;
import java.util.Set;
import org.chromium.support_lib_boundary.WebSettingsBoundaryInterface;

/* loaded from: classes.dex */
public class WebSettingsAdapter {
    private final WebSettingsBoundaryInterface mBoundaryInterface;

    public WebSettingsAdapter(WebSettingsBoundaryInterface webSettingsBoundaryInterface) {
        this.mBoundaryInterface = webSettingsBoundaryInterface;
    }

    public void setOffscreenPreRaster(boolean z) {
        this.mBoundaryInterface.setOffscreenPreRaster(z);
    }

    public boolean getOffscreenPreRaster() {
        return this.mBoundaryInterface.getOffscreenPreRaster();
    }

    public void setSafeBrowsingEnabled(boolean z) {
        this.mBoundaryInterface.setSafeBrowsingEnabled(z);
    }

    public boolean getSafeBrowsingEnabled() {
        return this.mBoundaryInterface.getSafeBrowsingEnabled();
    }

    public void setDisabledActionModeMenuItems(int i) {
        this.mBoundaryInterface.setDisabledActionModeMenuItems(i);
    }

    public int getDisabledActionModeMenuItems() {
        return this.mBoundaryInterface.getDisabledActionModeMenuItems();
    }

    public void setForceDark(int i) {
        this.mBoundaryInterface.setForceDark(i);
    }

    public int getForceDark() {
        return this.mBoundaryInterface.getForceDark();
    }

    public void setForceDarkStrategy(int i) {
        this.mBoundaryInterface.setForceDarkBehavior(i);
    }

    public int getForceDarkStrategy() {
        return this.mBoundaryInterface.getForceDarkBehavior();
    }

    public void setAlgorithmicDarkeningAllowed(boolean z) {
        this.mBoundaryInterface.setAlgorithmicDarkeningAllowed(z);
    }

    public boolean isAlgorithmicDarkeningAllowed() {
        return this.mBoundaryInterface.isAlgorithmicDarkeningAllowed();
    }

    public void setEnterpriseAuthenticationAppLinkPolicyEnabled(boolean z) {
        this.mBoundaryInterface.setEnterpriseAuthenticationAppLinkPolicyEnabled(z);
    }

    public boolean getEnterpriseAuthenticationAppLinkPolicyEnabled() {
        return this.mBoundaryInterface.getEnterpriseAuthenticationAppLinkPolicyEnabled();
    }

    public Set<String> getRequestedWithHeaderOriginAllowList() {
        return this.mBoundaryInterface.getRequestedWithHeaderOriginAllowList();
    }

    public void setRequestedWithHeaderOriginAllowList(Set<String> set) {
        this.mBoundaryInterface.setRequestedWithHeaderOriginAllowList(set);
    }

    public UserAgentMetadata getUserAgentMetadata() {
        return UserAgentMetadataInternal.getUserAgentMetadataFromMap(this.mBoundaryInterface.getUserAgentMetadataMap());
    }

    public void setUserAgentMetadata(UserAgentMetadata userAgentMetadata) {
        this.mBoundaryInterface.setUserAgentMetadataFromMap(UserAgentMetadataInternal.convertUserAgentMetadataToMap(userAgentMetadata));
    }

    public int getAttributionRegistrationBehavior() {
        return this.mBoundaryInterface.getAttributionBehavior();
    }

    public void setAttributionRegistrationBehavior(int i) {
        this.mBoundaryInterface.setAttributionBehavior(i);
    }

    public void setWebViewMediaIntegrityApiStatus(WebViewMediaIntegrityApiStatusConfig webViewMediaIntegrityApiStatusConfig) {
        this.mBoundaryInterface.setWebViewMediaIntegrityApiStatus(webViewMediaIntegrityApiStatusConfig.getDefaultStatus(), webViewMediaIntegrityApiStatusConfig.getOverrideRules());
    }

    public WebViewMediaIntegrityApiStatusConfig getWebViewMediaIntegrityApiStatus() {
        return new WebViewMediaIntegrityApiStatusConfig.Builder(this.mBoundaryInterface.getWebViewMediaIntegrityApiDefaultStatus()).setOverrideRules(this.mBoundaryInterface.getWebViewMediaIntegrityApiOverrideRules()).build();
    }
}
