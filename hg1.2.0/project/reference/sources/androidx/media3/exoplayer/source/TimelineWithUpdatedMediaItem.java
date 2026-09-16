package androidx.media3.exoplayer.source;

import androidx.media3.common.MediaItem;
import androidx.media3.common.Timeline;

/* loaded from: classes.dex */
public final class TimelineWithUpdatedMediaItem extends ForwardingTimeline {
    private final MediaItem updatedMediaItem;

    public TimelineWithUpdatedMediaItem(Timeline timeline, MediaItem mediaItem) {
        super(timeline);
        this.updatedMediaItem = mediaItem;
    }

    @Override // androidx.media3.exoplayer.source.ForwardingTimeline, androidx.media3.common.Timeline
    public Timeline.Window getWindow(int i, Timeline.Window window, long j) {
        super.getWindow(i, window, j);
        window.mediaItem = this.updatedMediaItem;
        window.tag = this.updatedMediaItem.localConfiguration != null ? this.updatedMediaItem.localConfiguration.tag : null;
        return window;
    }
}
