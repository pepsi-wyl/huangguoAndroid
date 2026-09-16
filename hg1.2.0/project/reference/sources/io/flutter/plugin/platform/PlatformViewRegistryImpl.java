package io.flutter.plugin.platform;

import java.util.HashMap;
import java.util.Map;

/* loaded from: classes2.dex */
class PlatformViewRegistryImpl implements PlatformViewRegistry {
    private final Map<String, PlatformViewFactory> viewFactories = new HashMap();

    PlatformViewRegistryImpl() {
    }

    @Override // io.flutter.plugin.platform.PlatformViewRegistry
    public boolean registerViewFactory(String str, PlatformViewFactory platformViewFactory) {
        if (this.viewFactories.containsKey(str)) {
            return false;
        }
        this.viewFactories.put(str, platformViewFactory);
        return true;
    }

    PlatformViewFactory getFactory(String str) {
        return this.viewFactories.get(str);
    }
}
