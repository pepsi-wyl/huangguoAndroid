package androidx.media3.exoplayer;

import android.media.AudioDeviceInfo;
import android.media.AudioFocusRequest;
import android.media.AudioProfile;
import android.media.MediaCodec;
import android.media.MediaDrmResetException;
import android.media.metrics.MediaMetricsManager;
import android.media.metrics.NetworkEvent;
import android.media.metrics.PlaybackErrorEvent;
import android.media.metrics.PlaybackMetrics;
import android.media.metrics.PlaybackStateEvent;
import android.media.metrics.TrackChangeEvent;
import android.net.http.HttpEngine;
import android.net.http.NetworkException;

/* compiled from: D8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class ExoPlayerImpl$$ExternalSyntheticApiModelOutline0 {
    public static /* bridge */ /* synthetic */ AudioDeviceInfo m(Object obj) {
        return (AudioDeviceInfo) obj;
    }

    public static /* synthetic */ AudioFocusRequest.Builder m(int i) {
        return new AudioFocusRequest.Builder(i);
    }

    public static /* synthetic */ AudioFocusRequest.Builder m(AudioFocusRequest audioFocusRequest) {
        return new AudioFocusRequest.Builder(audioFocusRequest);
    }

    /* renamed from: m, reason: collision with other method in class */
    public static /* bridge */ /* synthetic */ AudioProfile m170m(Object obj) {
        return (AudioProfile) obj;
    }

    public static /* synthetic */ MediaCodec.CryptoInfo.Pattern m(int i, int i2) {
        return new MediaCodec.CryptoInfo.Pattern(i, i2);
    }

    /* renamed from: m, reason: collision with other method in class */
    public static /* bridge */ /* synthetic */ MediaMetricsManager m171m(Object obj) {
        return (MediaMetricsManager) obj;
    }

    /* renamed from: m, reason: collision with other method in class */
    public static /* synthetic */ NetworkEvent.Builder m172m() {
        return new NetworkEvent.Builder();
    }

    /* renamed from: m, reason: collision with other method in class */
    public static /* synthetic */ PlaybackErrorEvent.Builder m173m() {
        return new PlaybackErrorEvent.Builder();
    }

    /* renamed from: m, reason: collision with other method in class */
    public static /* synthetic */ PlaybackMetrics.Builder m174m() {
        return new PlaybackMetrics.Builder();
    }

    /* renamed from: m, reason: collision with other method in class */
    public static /* bridge */ /* synthetic */ PlaybackMetrics.Builder m175m(Object obj) {
        return (PlaybackMetrics.Builder) obj;
    }

    /* renamed from: m, reason: collision with other method in class */
    public static /* synthetic */ PlaybackStateEvent.Builder m176m() {
        return new PlaybackStateEvent.Builder();
    }

    /* renamed from: m, reason: collision with other method in class */
    public static /* synthetic */ TrackChangeEvent.Builder m177m(int i) {
        return new TrackChangeEvent.Builder(i);
    }

    /* renamed from: m, reason: collision with other method in class */
    public static /* bridge */ /* synthetic */ HttpEngine m178m(Object obj) {
        return (HttpEngine) obj;
    }

    /* renamed from: m, reason: collision with other method in class */
    public static /* bridge */ /* synthetic */ NetworkException m179m(Object obj) {
        return (NetworkException) obj;
    }

    /* renamed from: m, reason: collision with other method in class */
    public static /* synthetic */ void m181m() {
    }

    /* renamed from: m, reason: collision with other method in class */
    public static /* bridge */ /* synthetic */ boolean m185m(Object obj) {
        return obj instanceof NetworkException;
    }

    public static /* bridge */ /* synthetic */ boolean m$1(Object obj) {
        return obj instanceof MediaDrmResetException;
    }
}
