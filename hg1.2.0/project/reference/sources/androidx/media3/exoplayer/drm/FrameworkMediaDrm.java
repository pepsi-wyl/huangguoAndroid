package androidx.media3.exoplayer.drm;

import android.media.DeniedByServerException;
import android.media.MediaCryptoException;
import android.media.MediaDrm;
import android.media.MediaDrmException;
import android.media.NotProvisionedException;
import android.media.UnsupportedSchemeException;
import android.media.metrics.LogSessionId;
import android.os.Handler;
import android.os.PersistableBundle;
import android.text.TextUtils;
import androidx.media3.common.C;
import androidx.media3.common.DrmInitData;
import androidx.media3.common.MimeTypes;
import androidx.media3.common.util.Assertions;
import androidx.media3.common.util.Log;
import androidx.media3.common.util.ParsableByteArray;
import androidx.media3.common.util.Util;
import androidx.media3.exoplayer.analytics.PlayerId;
import androidx.media3.exoplayer.drm.ExoMediaDrm;
import androidx.media3.extractor.mp4.PsshAtomUtil;
import com.google.common.base.Charsets;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;
import org.json.JSONException;

/* loaded from: classes.dex */
public final class FrameworkMediaDrm implements ExoMediaDrm {
    private static final String CENC_SCHEME_MIME_TYPE = "cenc";
    public static final ExoMediaDrm.Provider DEFAULT_PROVIDER = new ExoMediaDrm.Provider() { // from class: androidx.media3.exoplayer.drm.FrameworkMediaDrm$$ExternalSyntheticLambda12
        @Override // androidx.media3.exoplayer.drm.ExoMediaDrm.Provider
        public final ExoMediaDrm acquireExoMediaDrm(UUID uuid) {
            return FrameworkMediaDrm.lambda$static$0(uuid);
        }
    };
    private static final String MOCK_LA_URL = "<LA_URL>https://x</LA_URL>";
    private static final String MOCK_LA_URL_VALUE = "https://x";
    private static final String TAG = "FrameworkMediaDrm";
    private static final int UTF_16_BYTES_PER_CHARACTER = 2;
    private final MediaDrm mediaDrm;
    private int referenceCount;
    private final UUID uuid;

    @Override // androidx.media3.exoplayer.drm.ExoMediaDrm
    public int getCryptoType() {
        return 2;
    }

    static /* synthetic */ ExoMediaDrm lambda$static$0(UUID uuid) {
        try {
            return newInstance(uuid);
        } catch (UnsupportedDrmException unused) {
            Log.e(TAG, "Failed to instantiate a FrameworkMediaDrm for uuid: " + uuid + ".");
            return new DummyExoMediaDrm();
        }
    }

    public static boolean isCryptoSchemeSupported(UUID uuid) {
        return MediaDrm.isCryptoSchemeSupported(adjustUuid(uuid));
    }

    public static FrameworkMediaDrm newInstance(UUID uuid) throws UnsupportedDrmException {
        try {
            return new FrameworkMediaDrm(uuid);
        } catch (UnsupportedSchemeException e) {
            throw new UnsupportedDrmException(1, e);
        } catch (Exception e2) {
            throw new UnsupportedDrmException(2, e2);
        }
    }

    private FrameworkMediaDrm(UUID uuid) throws UnsupportedSchemeException {
        Assertions.checkNotNull(uuid);
        Assertions.checkArgument(!C.COMMON_PSSH_UUID.equals(uuid), "Use C.CLEARKEY_UUID instead");
        this.uuid = uuid;
        MediaDrm mediaDrm = new MediaDrm(adjustUuid(uuid));
        this.mediaDrm = mediaDrm;
        this.referenceCount = 1;
        if (C.WIDEVINE_UUID.equals(uuid) && needsForceWidevineL3Workaround()) {
            forceWidevineL3(mediaDrm);
        }
    }

    @Override // androidx.media3.exoplayer.drm.ExoMediaDrm
    public void setOnEventListener(final ExoMediaDrm.OnEventListener onEventListener) {
        this.mediaDrm.setOnEventListener(onEventListener == null ? null : new MediaDrm.OnEventListener() { // from class: androidx.media3.exoplayer.drm.FrameworkMediaDrm$$ExternalSyntheticLambda10
            @Override // android.media.MediaDrm.OnEventListener
            public final void onEvent(MediaDrm mediaDrm, byte[] bArr, int i, int i2, byte[] bArr2) {
                this.f$0.m228x5e84e274(onEventListener, mediaDrm, bArr, i, i2, bArr2);
            }
        });
    }

    /* renamed from: lambda$setOnEventListener$1$androidx-media3-exoplayer-drm-FrameworkMediaDrm, reason: not valid java name */
    /* synthetic */ void m228x5e84e274(ExoMediaDrm.OnEventListener onEventListener, MediaDrm mediaDrm, byte[] bArr, int i, int i2, byte[] bArr2) {
        onEventListener.onEvent(this, bArr, i, i2, bArr2);
    }

    @Override // androidx.media3.exoplayer.drm.ExoMediaDrm
    public void setOnKeyStatusChangeListener(final ExoMediaDrm.OnKeyStatusChangeListener onKeyStatusChangeListener) {
        if (Util.SDK_INT < 23) {
            throw new UnsupportedOperationException();
        }
        this.mediaDrm.setOnKeyStatusChangeListener(onKeyStatusChangeListener == null ? null : new MediaDrm.OnKeyStatusChangeListener() { // from class: androidx.media3.exoplayer.drm.FrameworkMediaDrm$$ExternalSyntheticLambda11
            @Override // android.media.MediaDrm.OnKeyStatusChangeListener
            public final void onKeyStatusChange(MediaDrm mediaDrm, byte[] bArr, List list, boolean z) {
                this.f$0.m230xc78bb65c(onKeyStatusChangeListener, mediaDrm, bArr, list, z);
            }
        }, (Handler) null);
    }

    /* renamed from: lambda$setOnKeyStatusChangeListener$2$androidx-media3-exoplayer-drm-FrameworkMediaDrm, reason: not valid java name */
    /* synthetic */ void m230xc78bb65c(ExoMediaDrm.OnKeyStatusChangeListener onKeyStatusChangeListener, MediaDrm mediaDrm, byte[] bArr, List list, boolean z) {
        ArrayList arrayList = new ArrayList();
        Iterator it = list.iterator();
        while (it.hasNext()) {
            MediaDrm.KeyStatus keyStatusM232m = FrameworkMediaDrm$$ExternalSyntheticApiModelOutline0.m232m(it.next());
            arrayList.add(new ExoMediaDrm.KeyStatus(keyStatusM232m.getStatusCode(), keyStatusM232m.getKeyId()));
        }
        onKeyStatusChangeListener.onKeyStatusChange(this, bArr, arrayList, z);
    }

    @Override // androidx.media3.exoplayer.drm.ExoMediaDrm
    public void setOnExpirationUpdateListener(final ExoMediaDrm.OnExpirationUpdateListener onExpirationUpdateListener) {
        if (Util.SDK_INT < 23) {
            throw new UnsupportedOperationException();
        }
        this.mediaDrm.setOnExpirationUpdateListener(onExpirationUpdateListener == null ? null : new MediaDrm.OnExpirationUpdateListener() { // from class: androidx.media3.exoplayer.drm.FrameworkMediaDrm$$ExternalSyntheticLambda9
            @Override // android.media.MediaDrm.OnExpirationUpdateListener
            public final void onExpirationUpdate(MediaDrm mediaDrm, byte[] bArr, long j) {
                this.f$0.m229x3bcdcffc(onExpirationUpdateListener, mediaDrm, bArr, j);
            }
        }, (Handler) null);
    }

    /* renamed from: lambda$setOnExpirationUpdateListener$3$androidx-media3-exoplayer-drm-FrameworkMediaDrm, reason: not valid java name */
    /* synthetic */ void m229x3bcdcffc(ExoMediaDrm.OnExpirationUpdateListener onExpirationUpdateListener, MediaDrm mediaDrm, byte[] bArr, long j) {
        onExpirationUpdateListener.onExpirationUpdate(this, bArr, j);
    }

    @Override // androidx.media3.exoplayer.drm.ExoMediaDrm
    public byte[] openSession() throws MediaDrmException {
        return this.mediaDrm.openSession();
    }

    @Override // androidx.media3.exoplayer.drm.ExoMediaDrm
    public void closeSession(byte[] bArr) {
        this.mediaDrm.closeSession(bArr);
    }

    @Override // androidx.media3.exoplayer.drm.ExoMediaDrm
    public void setPlayerIdForSession(byte[] bArr, PlayerId playerId) {
        if (Util.SDK_INT >= 31) {
            try {
                Api31.setLogSessionIdOnMediaDrmSession(this.mediaDrm, bArr, playerId);
            } catch (UnsupportedOperationException unused) {
                Log.w(TAG, "setLogSessionId failed.");
            }
        }
    }

    @Override // androidx.media3.exoplayer.drm.ExoMediaDrm
    public ExoMediaDrm.KeyRequest getKeyRequest(byte[] bArr, List<DrmInitData.SchemeData> list, int i, HashMap<String, String> map) throws NotProvisionedException {
        DrmInitData.SchemeData schemeData;
        byte[] bArrAdjustRequestInitData;
        String strAdjustRequestMimeType;
        if (list != null) {
            schemeData = getSchemeData(this.uuid, list);
            bArrAdjustRequestInitData = adjustRequestInitData(this.uuid, (byte[]) Assertions.checkNotNull(schemeData.data));
            strAdjustRequestMimeType = adjustRequestMimeType(this.uuid, schemeData.mimeType);
        } else {
            schemeData = null;
            bArrAdjustRequestInitData = null;
            strAdjustRequestMimeType = null;
        }
        MediaDrm.KeyRequest keyRequest = this.mediaDrm.getKeyRequest(bArr, bArrAdjustRequestInitData, strAdjustRequestMimeType, i, map);
        byte[] bArrAdjustRequestData = adjustRequestData(this.uuid, keyRequest.getData());
        String strAdjustLicenseServerUrl = adjustLicenseServerUrl(keyRequest.getDefaultUrl());
        if (TextUtils.isEmpty(strAdjustLicenseServerUrl) && schemeData != null && !TextUtils.isEmpty(schemeData.licenseServerUrl)) {
            strAdjustLicenseServerUrl = schemeData.licenseServerUrl;
        }
        return new ExoMediaDrm.KeyRequest(bArrAdjustRequestData, strAdjustLicenseServerUrl, Util.SDK_INT >= 23 ? keyRequest.getRequestType() : Integer.MIN_VALUE);
    }

    private String adjustLicenseServerUrl(String str) {
        if (MOCK_LA_URL.equals(str)) {
            return "";
        }
        if (Util.SDK_INT >= 33 && "https://default.url".equals(str)) {
            String propertyString = getPropertyString("version");
            if (Objects.equals(propertyString, "1.2") || Objects.equals(propertyString, "aidl-1")) {
                return "";
            }
        }
        return str;
    }

    @Override // androidx.media3.exoplayer.drm.ExoMediaDrm
    public byte[] provideKeyResponse(byte[] bArr, byte[] bArr2) throws JSONException, DeniedByServerException, NotProvisionedException {
        if (C.CLEARKEY_UUID.equals(this.uuid)) {
            bArr2 = ClearKeyUtil.adjustResponseData(bArr2);
        }
        return this.mediaDrm.provideKeyResponse(bArr, bArr2);
    }

    @Override // androidx.media3.exoplayer.drm.ExoMediaDrm
    public ExoMediaDrm.ProvisionRequest getProvisionRequest() {
        MediaDrm.ProvisionRequest provisionRequest = this.mediaDrm.getProvisionRequest();
        return new ExoMediaDrm.ProvisionRequest(provisionRequest.getData(), provisionRequest.getDefaultUrl());
    }

    @Override // androidx.media3.exoplayer.drm.ExoMediaDrm
    public void provideProvisionResponse(byte[] bArr) throws DeniedByServerException {
        this.mediaDrm.provideProvisionResponse(bArr);
    }

    @Override // androidx.media3.exoplayer.drm.ExoMediaDrm
    public Map<String, String> queryKeyStatus(byte[] bArr) {
        return this.mediaDrm.queryKeyStatus(bArr);
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x003e A[RETURN, SYNTHETIC] */
    @Override // androidx.media3.exoplayer.drm.ExoMediaDrm
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean requiresSecureDecoder(byte[] r4, java.lang.String r5) throws java.lang.Throwable {
        /*
            r3 = this;
            int r0 = androidx.media3.common.util.Util.SDK_INT
            r1 = 31
            if (r0 < r1) goto L13
            boolean r0 = r3.isMediaDrmRequiresSecureDecoderImplemented()
            if (r0 == 0) goto L13
            android.media.MediaDrm r4 = r3.mediaDrm
            boolean r4 = androidx.media3.exoplayer.drm.FrameworkMediaDrm.Api31.requiresSecureDecoder(r4, r5)
            goto L22
        L13:
            r0 = 0
            android.media.MediaCrypto r1 = new android.media.MediaCrypto     // Catch: java.lang.Throwable -> L2b android.media.MediaCryptoException -> L32
            java.util.UUID r2 = r3.uuid     // Catch: java.lang.Throwable -> L2b android.media.MediaCryptoException -> L32
            r1.<init>(r2, r4)     // Catch: java.lang.Throwable -> L2b android.media.MediaCryptoException -> L32
            boolean r4 = r1.requiresSecureDecoderComponent(r5)     // Catch: java.lang.Throwable -> L25 android.media.MediaCryptoException -> L28
            r1.release()
        L22:
            if (r4 == 0) goto L40
            goto L38
        L25:
            r4 = move-exception
            r0 = r1
            goto L2c
        L28:
            r0 = r1
            goto L33
        L2b:
            r4 = move-exception
        L2c:
            if (r0 == 0) goto L31
            r0.release()
        L31:
            throw r4
        L32:
        L33:
            if (r0 == 0) goto L38
            r0.release()
        L38:
            boolean r4 = r3.shouldForceAllowInsecureDecoderComponents()
            if (r4 != 0) goto L40
            r4 = 1
            goto L41
        L40:
            r4 = 0
        L41:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.media3.exoplayer.drm.FrameworkMediaDrm.requiresSecureDecoder(byte[], java.lang.String):boolean");
    }

    @Override // androidx.media3.exoplayer.drm.ExoMediaDrm
    public synchronized void acquire() {
        Assertions.checkState(this.referenceCount > 0);
        this.referenceCount++;
    }

    @Override // androidx.media3.exoplayer.drm.ExoMediaDrm
    public synchronized void release() {
        int i = this.referenceCount - 1;
        this.referenceCount = i;
        if (i == 0) {
            this.mediaDrm.release();
        }
    }

    @Override // androidx.media3.exoplayer.drm.ExoMediaDrm
    public void restoreKeys(byte[] bArr, byte[] bArr2) {
        this.mediaDrm.restoreKeys(bArr, bArr2);
    }

    @Override // androidx.media3.exoplayer.drm.ExoMediaDrm
    public void removeOfflineLicense(byte[] bArr) {
        if (Util.SDK_INT < 29) {
            throw new UnsupportedOperationException();
        }
        this.mediaDrm.removeOfflineLicense(bArr);
    }

    @Override // androidx.media3.exoplayer.drm.ExoMediaDrm
    public List<byte[]> getOfflineLicenseKeySetIds() {
        if (Util.SDK_INT < 29) {
            throw new UnsupportedOperationException();
        }
        return this.mediaDrm.getOfflineLicenseKeySetIds();
    }

    @Override // androidx.media3.exoplayer.drm.ExoMediaDrm
    public PersistableBundle getMetrics() {
        if (Util.SDK_INT < 28) {
            return null;
        }
        return this.mediaDrm.getMetrics();
    }

    @Override // androidx.media3.exoplayer.drm.ExoMediaDrm
    public String getPropertyString(String str) {
        return this.mediaDrm.getPropertyString(str);
    }

    @Override // androidx.media3.exoplayer.drm.ExoMediaDrm
    public byte[] getPropertyByteArray(String str) {
        return this.mediaDrm.getPropertyByteArray(str);
    }

    @Override // androidx.media3.exoplayer.drm.ExoMediaDrm
    public void setPropertyString(String str, String str2) {
        this.mediaDrm.setPropertyString(str, str2);
    }

    @Override // androidx.media3.exoplayer.drm.ExoMediaDrm
    public void setPropertyByteArray(String str, byte[] bArr) {
        this.mediaDrm.setPropertyByteArray(str, bArr);
    }

    @Override // androidx.media3.exoplayer.drm.ExoMediaDrm
    public FrameworkCryptoConfig createCryptoConfig(byte[] bArr) throws MediaCryptoException {
        return new FrameworkCryptoConfig(adjustUuid(this.uuid), bArr, shouldForceAllowInsecureDecoderComponents());
    }

    private boolean shouldForceAllowInsecureDecoderComponents() {
        return Util.SDK_INT < 21 && C.WIDEVINE_UUID.equals(this.uuid) && "L3".equals(getPropertyString("securityLevel"));
    }

    private boolean isMediaDrmRequiresSecureDecoderImplemented() {
        if (this.uuid.equals(C.WIDEVINE_UUID)) {
            String propertyString = getPropertyString("version");
            return (propertyString.startsWith("v5.") || propertyString.startsWith("14.") || propertyString.startsWith("15.") || propertyString.startsWith("16.0")) ? false : true;
        }
        return this.uuid.equals(C.CLEARKEY_UUID);
    }

    private static DrmInitData.SchemeData getSchemeData(UUID uuid, List<DrmInitData.SchemeData> list) {
        if (!C.WIDEVINE_UUID.equals(uuid)) {
            return list.get(0);
        }
        if (Util.SDK_INT >= 28 && list.size() > 1) {
            DrmInitData.SchemeData schemeData = list.get(0);
            int length = 0;
            for (int i = 0; i < list.size(); i++) {
                DrmInitData.SchemeData schemeData2 = list.get(i);
                byte[] bArr = (byte[]) Assertions.checkNotNull(schemeData2.data);
                if (Util.areEqual(schemeData2.mimeType, schemeData.mimeType) && Util.areEqual(schemeData2.licenseServerUrl, schemeData.licenseServerUrl) && PsshAtomUtil.isPsshAtom(bArr)) {
                    length += bArr.length;
                }
            }
            byte[] bArr2 = new byte[length];
            int i2 = 0;
            for (int i3 = 0; i3 < list.size(); i3++) {
                byte[] bArr3 = (byte[]) Assertions.checkNotNull(list.get(i3).data);
                int length2 = bArr3.length;
                System.arraycopy(bArr3, 0, bArr2, i2, length2);
                i2 += length2;
            }
            return schemeData.copyWithData(bArr2);
        }
        for (int i4 = 0; i4 < list.size(); i4++) {
            DrmInitData.SchemeData schemeData3 = list.get(i4);
            int version = PsshAtomUtil.parseVersion((byte[]) Assertions.checkNotNull(schemeData3.data));
            if (Util.SDK_INT < 23 && version == 0) {
                return schemeData3;
            }
            if (Util.SDK_INT >= 23 && version == 1) {
                return schemeData3;
            }
        }
        return list.get(0);
    }

    private static UUID adjustUuid(UUID uuid) {
        return (Util.SDK_INT >= 27 || !C.CLEARKEY_UUID.equals(uuid)) ? uuid : C.COMMON_PSSH_UUID;
    }

    private static byte[] adjustRequestInitData(UUID uuid, byte[] bArr) {
        byte[] schemeSpecificData;
        if (C.PLAYREADY_UUID.equals(uuid)) {
            byte[] schemeSpecificData2 = PsshAtomUtil.parseSchemeSpecificData(bArr, uuid);
            if (schemeSpecificData2 != null) {
                bArr = schemeSpecificData2;
            }
            bArr = PsshAtomUtil.buildPsshAtom(C.PLAYREADY_UUID, addLaUrlAttributeIfMissing(bArr));
        }
        return (((Util.SDK_INT >= 23 || !C.WIDEVINE_UUID.equals(uuid)) && !(C.PLAYREADY_UUID.equals(uuid) && "Amazon".equals(Util.MANUFACTURER) && ("AFTB".equals(Util.MODEL) || "AFTS".equals(Util.MODEL) || "AFTM".equals(Util.MODEL) || "AFTT".equals(Util.MODEL)))) || (schemeSpecificData = PsshAtomUtil.parseSchemeSpecificData(bArr, uuid)) == null) ? bArr : schemeSpecificData;
    }

    private static String adjustRequestMimeType(UUID uuid, String str) {
        return (Util.SDK_INT < 26 && C.CLEARKEY_UUID.equals(uuid) && (MimeTypes.VIDEO_MP4.equals(str) || MimeTypes.AUDIO_MP4.equals(str))) ? "cenc" : str;
    }

    private static byte[] adjustRequestData(UUID uuid, byte[] bArr) {
        return C.CLEARKEY_UUID.equals(uuid) ? ClearKeyUtil.adjustRequestData(bArr) : bArr;
    }

    private static void forceWidevineL3(MediaDrm mediaDrm) {
        mediaDrm.setPropertyString("securityLevel", "L3");
    }

    private static boolean needsForceWidevineL3Workaround() {
        return "ASUS_Z00AD".equals(Util.MODEL);
    }

    private static byte[] addLaUrlAttributeIfMissing(byte[] bArr) {
        ParsableByteArray parsableByteArray = new ParsableByteArray(bArr);
        int littleEndianInt = parsableByteArray.readLittleEndianInt();
        short littleEndianShort = parsableByteArray.readLittleEndianShort();
        short littleEndianShort2 = parsableByteArray.readLittleEndianShort();
        if (littleEndianShort != 1 || littleEndianShort2 != 1) {
            Log.i(TAG, "Unexpected record count or type. Skipping LA_URL workaround.");
            return bArr;
        }
        String string = parsableByteArray.readString(parsableByteArray.readLittleEndianShort(), Charsets.UTF_16LE);
        if (string.contains("<LA_URL>")) {
            return bArr;
        }
        int iIndexOf = string.indexOf("</DATA>");
        if (iIndexOf == -1) {
            Log.w(TAG, "Could not find the </DATA> tag. Skipping LA_URL workaround.");
        }
        String str = string.substring(0, iIndexOf) + MOCK_LA_URL + string.substring(iIndexOf);
        int i = littleEndianInt + 52;
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(i);
        byteBufferAllocate.order(ByteOrder.LITTLE_ENDIAN);
        byteBufferAllocate.putInt(i);
        byteBufferAllocate.putShort(littleEndianShort);
        byteBufferAllocate.putShort(littleEndianShort2);
        byteBufferAllocate.putShort((short) (str.length() * 2));
        byteBufferAllocate.put(str.getBytes(Charsets.UTF_16LE));
        return byteBufferAllocate.array();
    }

    private static class Api31 {
        private Api31() {
        }

        public static boolean requiresSecureDecoder(MediaDrm mediaDrm, String str) {
            return mediaDrm.requiresSecureDecoder(str);
        }

        public static void setLogSessionIdOnMediaDrmSession(MediaDrm mediaDrm, byte[] bArr, PlayerId playerId) {
            LogSessionId logSessionId = playerId.getLogSessionId();
            if (logSessionId.equals(LogSessionId.LOG_SESSION_ID_NONE)) {
                return;
            }
            FrameworkMediaDrm$$ExternalSyntheticApiModelOutline0.m233m(Assertions.checkNotNull(mediaDrm.getPlaybackComponent(bArr))).setLogSessionId(logSessionId);
        }
    }
}
