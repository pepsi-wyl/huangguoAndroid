package androidx.media3.exoplayer.source.chunk;

import androidx.media3.common.C;
import androidx.media3.common.Format;
import androidx.media3.common.MimeTypes;
import androidx.media3.common.util.ParsableByteArray;
import androidx.media3.datasource.DataSource;
import androidx.media3.datasource.DataSourceUtil;
import androidx.media3.datasource.DataSpec;
import androidx.media3.exoplayer.source.chunk.ChunkExtractor;
import androidx.media3.extractor.DefaultExtractorInput;
import androidx.media3.extractor.TrackOutput;
import java.io.IOException;

/* loaded from: classes.dex */
public class ContainerMediaChunk extends BaseMediaChunk {
    private final int chunkCount;
    private final ChunkExtractor chunkExtractor;
    private volatile boolean loadCanceled;
    private boolean loadCompleted;
    private long nextLoadPosition;
    private final long sampleOffsetUs;

    protected ChunkExtractor.TrackOutputProvider getTrackOutputProvider(BaseMediaChunkOutput baseMediaChunkOutput) {
        return baseMediaChunkOutput;
    }

    public ContainerMediaChunk(DataSource dataSource, DataSpec dataSpec, Format format, int i, Object obj, long j, long j2, long j3, long j4, long j5, int i2, long j6, ChunkExtractor chunkExtractor) {
        super(dataSource, dataSpec, format, i, obj, j, j2, j3, j4, j5);
        this.chunkCount = i2;
        this.sampleOffsetUs = j6;
        this.chunkExtractor = chunkExtractor;
    }

    @Override // androidx.media3.exoplayer.source.chunk.MediaChunk
    public long getNextChunkIndex() {
        return this.chunkIndex + this.chunkCount;
    }

    @Override // androidx.media3.exoplayer.source.chunk.MediaChunk
    public boolean isLoadCompleted() {
        return this.loadCompleted;
    }

    @Override // androidx.media3.exoplayer.upstream.Loader.Loadable
    public final void cancelLoad() {
        this.loadCanceled = true;
    }

    @Override // androidx.media3.exoplayer.upstream.Loader.Loadable
    public final void load() throws IOException {
        BaseMediaChunkOutput output = getOutput();
        if (this.nextLoadPosition == 0) {
            output.setSampleOffsetUs(this.sampleOffsetUs);
            ChunkExtractor chunkExtractor = this.chunkExtractor;
            ChunkExtractor.TrackOutputProvider trackOutputProvider = getTrackOutputProvider(output);
            long j = this.clippedStartTimeUs;
            long j2 = C.TIME_UNSET;
            long j3 = j == C.TIME_UNSET ? -9223372036854775807L : this.clippedStartTimeUs - this.sampleOffsetUs;
            if (this.clippedEndTimeUs != C.TIME_UNSET) {
                j2 = this.clippedEndTimeUs - this.sampleOffsetUs;
            }
            chunkExtractor.init(trackOutputProvider, j3, j2);
        }
        try {
            DataSpec dataSpecSubrange = this.dataSpec.subrange(this.nextLoadPosition);
            DefaultExtractorInput defaultExtractorInput = new DefaultExtractorInput(this.dataSource, dataSpecSubrange.position, this.dataSource.open(dataSpecSubrange));
            do {
                try {
                    if (this.loadCanceled) {
                        break;
                    }
                } finally {
                    this.nextLoadPosition = defaultExtractorInput.getPosition() - this.dataSpec.position;
                }
            } while (this.chunkExtractor.read(defaultExtractorInput));
            maybeWriteEmptySamples(output);
            DataSourceUtil.closeQuietly(this.dataSource);
            this.loadCompleted = !this.loadCanceled;
        } catch (Throwable th) {
            DataSourceUtil.closeQuietly(this.dataSource);
            throw th;
        }
    }

    private void maybeWriteEmptySamples(BaseMediaChunkOutput baseMediaChunkOutput) {
        if (MimeTypes.isImage(this.trackFormat.containerMimeType)) {
            if ((this.trackFormat.tileCountHorizontal <= 1 && this.trackFormat.tileCountVertical <= 1) || this.trackFormat.tileCountHorizontal == -1 || this.trackFormat.tileCountVertical == -1) {
                return;
            }
            TrackOutput trackOutputTrack = baseMediaChunkOutput.track(0, 4);
            int i = this.trackFormat.tileCountHorizontal * this.trackFormat.tileCountVertical;
            long j = (this.endTimeUs - this.startTimeUs) / i;
            for (int i2 = 1; i2 < i; i2++) {
                trackOutputTrack.sampleData(new ParsableByteArray(), 0);
                trackOutputTrack.sampleMetadata(i2 * j, 0, 0, 0, null);
            }
        }
    }
}
