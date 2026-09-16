package androidx.media3.exoplayer.drm;

import androidx.media3.decoder.CryptoConfig;
import androidx.media3.exoplayer.drm.DrmSessionEventListener;
import java.io.IOException;
import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.util.Map;
import java.util.UUID;

/* loaded from: classes.dex */
public interface DrmSession {
    public static final int STATE_ERROR = 1;
    public static final int STATE_OPENED = 3;
    public static final int STATE_OPENED_WITH_KEYS = 4;
    public static final int STATE_OPENING = 2;
    public static final int STATE_RELEASED = 0;

    @Target({ElementType.FIELD, ElementType.METHOD, ElementType.PARAMETER, ElementType.LOCAL_VARIABLE, ElementType.TYPE_USE})
    @Documented
    @Retention(RetentionPolicy.SOURCE)
    public @interface State {
    }

    void acquire(DrmSessionEventListener.EventDispatcher eventDispatcher);

    CryptoConfig getCryptoConfig();

    DrmSessionException getError();

    byte[] getOfflineLicenseKeySetId();

    UUID getSchemeUuid();

    int getState();

    boolean playClearSamplesWithoutKeys();

    Map<String, String> queryKeyStatus();

    void release(DrmSessionEventListener.EventDispatcher eventDispatcher);

    boolean requiresSecureDecoder(String str);

    /* renamed from: androidx.media3.exoplayer.drm.DrmSession$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
        public static boolean $default$playClearSamplesWithoutKeys(DrmSession _this) {
            return false;
        }

        public static void replaceSession(DrmSession drmSession, DrmSession drmSession2) {
            if (drmSession == drmSession2) {
                return;
            }
            if (drmSession2 != null) {
                drmSession2.acquire(null);
            }
            if (drmSession != null) {
                drmSession.release(null);
            }
        }
    }

    public static class DrmSessionException extends IOException {
        public final int errorCode;

        public DrmSessionException(Throwable th, int i) {
            super(th);
            this.errorCode = i;
        }
    }
}
