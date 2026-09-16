package androidx.media3.exoplayer;

import androidx.media3.common.PlaybackParameters;

/* loaded from: classes.dex */
public interface MediaClock {

    /* renamed from: androidx.media3.exoplayer.MediaClock$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
        public static boolean $default$hasSkippedSilenceSinceLastCall(MediaClock _this) {
            return false;
        }
    }

    PlaybackParameters getPlaybackParameters();

    long getPositionUs();

    boolean hasSkippedSilenceSinceLastCall();

    void setPlaybackParameters(PlaybackParameters playbackParameters);
}
