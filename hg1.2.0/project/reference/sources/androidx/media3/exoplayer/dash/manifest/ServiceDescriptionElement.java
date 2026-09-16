package androidx.media3.exoplayer.dash.manifest;

/* loaded from: classes.dex */
public final class ServiceDescriptionElement {
    public final long maxOffsetMs;
    public final float maxPlaybackSpeed;
    public final long minOffsetMs;
    public final float minPlaybackSpeed;
    public final long targetOffsetMs;

    public ServiceDescriptionElement(long j, long j2, long j3, float f, float f2) {
        this.targetOffsetMs = j;
        this.minOffsetMs = j2;
        this.maxOffsetMs = j3;
        this.minPlaybackSpeed = f;
        this.maxPlaybackSpeed = f2;
    }
}
