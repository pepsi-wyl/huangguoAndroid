package androidx.media3.extractor;

/* loaded from: classes.dex */
public final class NoOpExtractorOutput implements ExtractorOutput {
    @Override // androidx.media3.extractor.ExtractorOutput
    public void endTracks() {
    }

    @Override // androidx.media3.extractor.ExtractorOutput
    public void seekMap(SeekMap seekMap) {
    }

    @Override // androidx.media3.extractor.ExtractorOutput
    public TrackOutput track(int i, int i2) {
        return new DiscardingTrackOutput();
    }
}
