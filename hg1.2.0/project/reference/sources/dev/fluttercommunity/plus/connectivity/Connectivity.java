package dev.fluttercommunity.plus.connectivity;

import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.os.Build;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public class Connectivity {
    static final String CONNECTIVITY_BLUETOOTH = "bluetooth";
    static final String CONNECTIVITY_ETHERNET = "ethernet";
    static final String CONNECTIVITY_MOBILE = "mobile";
    static final String CONNECTIVITY_NONE = "none";
    static final String CONNECTIVITY_OTHER = "other";
    static final String CONNECTIVITY_VPN = "vpn";
    static final String CONNECTIVITY_WIFI = "wifi";
    private final ConnectivityManager connectivityManager;

    public Connectivity(ConnectivityManager connectivityManager) {
        this.connectivityManager = connectivityManager;
    }

    List<String> getNetworkTypes() {
        if (Build.VERSION.SDK_INT >= 23) {
            return getCapabilitiesFromNetwork(this.connectivityManager.getActiveNetwork());
        }
        return getNetworkTypesLegacy();
    }

    List<String> getCapabilitiesFromNetwork(Network network) {
        return getCapabilitiesList(this.connectivityManager.getNetworkCapabilities(network));
    }

    List<String> getCapabilitiesList(NetworkCapabilities networkCapabilities) {
        ArrayList arrayList = new ArrayList();
        if (networkCapabilities == null || !networkCapabilities.hasCapability(12)) {
            arrayList.add("none");
            return arrayList;
        }
        if (networkCapabilities.hasTransport(1) || networkCapabilities.hasTransport(5)) {
            arrayList.add(CONNECTIVITY_WIFI);
        }
        if (networkCapabilities.hasTransport(3)) {
            arrayList.add(CONNECTIVITY_ETHERNET);
        }
        if (networkCapabilities.hasTransport(4)) {
            arrayList.add(CONNECTIVITY_VPN);
        }
        if (networkCapabilities.hasTransport(0)) {
            arrayList.add(CONNECTIVITY_MOBILE);
        }
        if (networkCapabilities.hasTransport(2)) {
            arrayList.add(CONNECTIVITY_BLUETOOTH);
        }
        if (arrayList.isEmpty() && networkCapabilities.hasCapability(12)) {
            arrayList.add(CONNECTIVITY_OTHER);
        }
        if (arrayList.isEmpty()) {
            arrayList.add("none");
        }
        return arrayList;
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x0049  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x004f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private java.util.List<java.lang.String> getNetworkTypesLegacy() {
        /*
            r3 = this;
            android.net.ConnectivityManager r0 = r3.connectivityManager
            android.net.NetworkInfo r0 = r0.getActiveNetworkInfo()
            java.util.ArrayList r1 = new java.util.ArrayList
            r1.<init>()
            if (r0 == 0) goto L55
            boolean r2 = r0.isConnected()
            if (r2 != 0) goto L14
            goto L55
        L14:
            int r0 = r0.getType()
            if (r0 == 0) goto L4f
            r2 = 1
            if (r0 == r2) goto L49
            r2 = 4
            if (r0 == r2) goto L4f
            r2 = 5
            if (r0 == r2) goto L4f
            r2 = 6
            if (r0 == r2) goto L49
            r2 = 7
            if (r0 == r2) goto L43
            r2 = 9
            if (r0 == r2) goto L3d
            r2 = 17
            if (r0 == r2) goto L37
            java.lang.String r0 = "other"
            r1.add(r0)
            goto L54
        L37:
            java.lang.String r0 = "vpn"
            r1.add(r0)
            goto L54
        L3d:
            java.lang.String r0 = "ethernet"
            r1.add(r0)
            goto L54
        L43:
            java.lang.String r0 = "bluetooth"
            r1.add(r0)
            goto L54
        L49:
            java.lang.String r0 = "wifi"
            r1.add(r0)
            goto L54
        L4f:
            java.lang.String r0 = "mobile"
            r1.add(r0)
        L54:
            return r1
        L55:
            java.lang.String r0 = "none"
            r1.add(r0)
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: dev.fluttercommunity.plus.connectivity.Connectivity.getNetworkTypesLegacy():java.util.List");
    }

    public ConnectivityManager getConnectivityManager() {
        return this.connectivityManager;
    }
}
