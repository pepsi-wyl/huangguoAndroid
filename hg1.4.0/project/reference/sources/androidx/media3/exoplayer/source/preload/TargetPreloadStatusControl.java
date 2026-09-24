package androidx.media3.exoplayer.source.preload;

/* loaded from: classes.dex */
public interface TargetPreloadStatusControl<T> {

    public interface PreloadStatus {
        int getStage();

        long getValue();
    }

    PreloadStatus getTargetPreloadStatus(T t);
}
