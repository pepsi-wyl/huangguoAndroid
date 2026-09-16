package com.github.gzuliyujiang.oaid;

import android.app.Application;
import android.content.Context;
import android.text.TextUtils;

/* loaded from: classes.dex */
public final class DeviceIdentifier {
    private static volatile String androidId = null;
    private static volatile String canvasFingerprint = null;
    private static volatile String clientId = null;
    private static volatile String guid = null;
    private static volatile String imei = null;
    private static volatile String oaid = null;
    private static volatile String pseudoId = null;
    private static volatile boolean registered = false;
    private static volatile String widevineId;

    private DeviceIdentifier() {
    }

    public static void register(Application application) {
        register(application, (IRegisterCallback) null);
    }

    public static void register(Application application, boolean z) {
        register(application, z, null);
    }

    public static void register(Application application, IRegisterCallback iRegisterCallback) {
        register(application, false, iRegisterCallback);
    }

    public static void register(Application application, boolean z, IRegisterCallback iRegisterCallback) {
        if (registered || application == null) {
            return;
        }
        synchronized (DeviceIdentifier.class) {
            if (!registered) {
                DeviceID.register(application, z, iRegisterCallback);
                registered = true;
            }
        }
    }

    public static String getClientId() {
        return getClientId(false);
    }

    public static String getClientId(boolean z) {
        if (TextUtils.isEmpty(clientId)) {
            synchronized (DeviceIdentifier.class) {
                if (TextUtils.isEmpty(clientId)) {
                    clientId = z ? DeviceID.getClientId() : DeviceID.getClientIdMD5();
                }
            }
        }
        if (clientId == null) {
            clientId = "";
        }
        return clientId;
    }

    @Deprecated
    public static String getIMEI(Context context) {
        if (imei == null) {
            synchronized (DeviceIdentifier.class) {
                if (imei == null) {
                    imei = DeviceID.getUniqueID(context);
                }
            }
        }
        if (imei == null) {
            imei = "";
        }
        return imei;
    }

    public static String getOAID(Context context) {
        if (TextUtils.isEmpty(oaid)) {
            synchronized (DeviceIdentifier.class) {
                if (TextUtils.isEmpty(oaid)) {
                    oaid = DeviceID.getOAID();
                    if (oaid == null || oaid.length() == 0) {
                        DeviceID.getOAID(context, new IGetter() { // from class: com.github.gzuliyujiang.oaid.DeviceIdentifier.1
                            @Override // com.github.gzuliyujiang.oaid.IGetter
                            public void onOAIDGetComplete(String str) {
                                String unused = DeviceIdentifier.oaid = str;
                            }

                            @Override // com.github.gzuliyujiang.oaid.IGetter
                            public void onOAIDGetError(Exception exc) {
                                String unused = DeviceIdentifier.oaid = "";
                            }
                        });
                    }
                }
            }
        }
        if (oaid == null) {
            oaid = "";
        }
        return oaid;
    }

    public static String getAndroidID(Context context) {
        if (androidId == null) {
            synchronized (DeviceIdentifier.class) {
                if (androidId == null) {
                    androidId = DeviceID.getAndroidID(context);
                }
            }
        }
        if (androidId == null) {
            androidId = "";
        }
        return androidId;
    }

    public static String getWidevineID() {
        if (widevineId == null) {
            synchronized (DeviceIdentifier.class) {
                if (widevineId == null) {
                    widevineId = DeviceID.getWidevineID();
                }
            }
        }
        if (widevineId == null) {
            widevineId = "";
        }
        return widevineId;
    }

    public static String getPseudoID() {
        if (pseudoId == null) {
            synchronized (DeviceIdentifier.class) {
                if (pseudoId == null) {
                    pseudoId = DeviceID.getPseudoID();
                }
            }
        }
        if (pseudoId == null) {
            pseudoId = "";
        }
        return pseudoId;
    }

    public static String getGUID(Context context) {
        if (guid == null) {
            synchronized (DeviceIdentifier.class) {
                if (guid == null) {
                    guid = DeviceID.getGUID(context);
                }
            }
        }
        if (guid == null) {
            guid = "";
        }
        return guid;
    }

    public static String getCanvasFingerprint() {
        if (canvasFingerprint == null) {
            synchronized (DeviceIdentifier.class) {
                if (canvasFingerprint == null) {
                    canvasFingerprint = DeviceID.getCanvasFingerprint();
                }
            }
        }
        if (canvasFingerprint == null) {
            canvasFingerprint = "";
        }
        return canvasFingerprint;
    }
}
