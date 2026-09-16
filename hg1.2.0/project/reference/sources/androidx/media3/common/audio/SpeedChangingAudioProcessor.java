package androidx.media3.common.audio;

import androidx.media3.common.C;
import androidx.media3.common.audio.AudioProcessor;
import androidx.media3.common.util.Assertions;
import androidx.media3.common.util.LongArray;
import androidx.media3.common.util.LongArrayQueue;
import androidx.media3.common.util.SpeedProviderUtil;
import androidx.media3.common.util.TimestampConsumer;
import androidx.media3.common.util.Util;
import java.math.RoundingMode;
import java.nio.ByteBuffer;
import java.util.ArrayDeque;
import java.util.Queue;
import org.checkerframework.checker.nullness.qual.EnsuresNonNull;
import org.checkerframework.checker.nullness.qual.RequiresNonNull;

/* loaded from: classes.dex */
public final class SpeedChangingAudioProcessor extends BaseAudioProcessor {
    private long bytesRead;
    private float currentSpeed;
    private boolean endOfStreamQueuedToSonic;
    private LongArray inputSegmentStartTimesUs;
    private long lastProcessedInputTimeUs;
    private long lastSpeedAdjustedInputTimeUs;
    private long lastSpeedAdjustedOutputTimeUs;
    private final Object lock;
    private LongArray outputSegmentStartTimesUs;
    private final LongArrayQueue pendingCallbackInputTimesUs;
    private final Queue<TimestampConsumer> pendingCallbacks;
    private final SynchronizedSonicAudioProcessor sonicAudioProcessor;
    private long speedAdjustedTimeAsyncInputTimeUs;
    private final SpeedProvider speedProvider;

    private static double divide(long j, long j2) {
        return j / j2;
    }

    public SpeedChangingAudioProcessor(SpeedProvider speedProvider) {
        this.speedProvider = speedProvider;
        Object obj = new Object();
        this.lock = obj;
        this.sonicAudioProcessor = new SynchronizedSonicAudioProcessor(obj);
        this.pendingCallbackInputTimesUs = new LongArrayQueue();
        this.pendingCallbacks = new ArrayDeque();
        this.speedAdjustedTimeAsyncInputTimeUs = C.TIME_UNSET;
        resetState();
    }

    @Override // androidx.media3.common.audio.BaseAudioProcessor, androidx.media3.common.audio.AudioProcessor
    public long getDurationAfterProcessorApplied(long j) {
        return SpeedProviderUtil.getDurationAfterSpeedProviderApplied(this.speedProvider, j);
    }

    @Override // androidx.media3.common.audio.BaseAudioProcessor
    public AudioProcessor.AudioFormat onConfigure(AudioProcessor.AudioFormat audioFormat) throws AudioProcessor.UnhandledAudioFormatException {
        return this.sonicAudioProcessor.configure(audioFormat);
    }

    @Override // androidx.media3.common.audio.AudioProcessor
    public void queueInput(ByteBuffer byteBuffer) {
        int iScaleLargeValue;
        long jScaleLargeTimestamp = Util.scaleLargeTimestamp(this.bytesRead, 1000000L, this.inputAudioFormat.bytesPerFrame * this.inputAudioFormat.sampleRate);
        updateSpeed(this.speedProvider.getSpeed(jScaleLargeTimestamp), jScaleLargeTimestamp);
        int iLimit = byteBuffer.limit();
        long nextSpeedChangeTimeUs = this.speedProvider.getNextSpeedChangeTimeUs(jScaleLargeTimestamp);
        if (nextSpeedChangeTimeUs != C.TIME_UNSET) {
            iScaleLargeValue = (int) Util.scaleLargeValue(nextSpeedChangeTimeUs - jScaleLargeTimestamp, this.inputAudioFormat.sampleRate * this.inputAudioFormat.bytesPerFrame, 1000000L, RoundingMode.CEILING);
            int i = this.inputAudioFormat.bytesPerFrame - (iScaleLargeValue % this.inputAudioFormat.bytesPerFrame);
            if (i != this.inputAudioFormat.bytesPerFrame) {
                iScaleLargeValue += i;
            }
            byteBuffer.limit(Math.min(iLimit, byteBuffer.position() + iScaleLargeValue));
        } else {
            iScaleLargeValue = -1;
        }
        long jPosition = byteBuffer.position();
        if (isUsingSonic()) {
            this.sonicAudioProcessor.queueInput(byteBuffer);
            if (iScaleLargeValue != -1 && byteBuffer.position() - jPosition == iScaleLargeValue) {
                this.sonicAudioProcessor.queueEndOfStream();
                this.endOfStreamQueuedToSonic = true;
            }
        } else {
            ByteBuffer byteBufferReplaceOutputBuffer = replaceOutputBuffer(byteBuffer.remaining());
            if (byteBuffer.hasRemaining()) {
                byteBufferReplaceOutputBuffer.put(byteBuffer);
            }
            byteBufferReplaceOutputBuffer.flip();
        }
        this.bytesRead += byteBuffer.position() - jPosition;
        updateLastProcessedInputTime();
        byteBuffer.limit(iLimit);
    }

    @Override // androidx.media3.common.audio.BaseAudioProcessor
    protected void onQueueEndOfStream() {
        if (this.endOfStreamQueuedToSonic) {
            return;
        }
        this.sonicAudioProcessor.queueEndOfStream();
        this.endOfStreamQueuedToSonic = true;
    }

    @Override // androidx.media3.common.audio.BaseAudioProcessor, androidx.media3.common.audio.AudioProcessor
    public ByteBuffer getOutput() {
        ByteBuffer output = isUsingSonic() ? this.sonicAudioProcessor.getOutput() : super.getOutput();
        processPendingCallbacks();
        return output;
    }

    @Override // androidx.media3.common.audio.BaseAudioProcessor, androidx.media3.common.audio.AudioProcessor
    public boolean isEnded() {
        return super.isEnded() && this.sonicAudioProcessor.isEnded();
    }

    @Override // androidx.media3.common.audio.BaseAudioProcessor
    protected void onFlush() {
        resetState();
        this.sonicAudioProcessor.flush();
    }

    @Override // androidx.media3.common.audio.BaseAudioProcessor
    protected void onReset() {
        resetState();
        this.sonicAudioProcessor.reset();
    }

    public void getSpeedAdjustedTimeAsync(long j, TimestampConsumer timestampConsumer) {
        synchronized (this.lock) {
            Assertions.checkArgument(this.speedAdjustedTimeAsyncInputTimeUs < j);
            this.speedAdjustedTimeAsyncInputTimeUs = j;
            if ((j <= this.lastProcessedInputTimeUs && this.pendingCallbackInputTimesUs.isEmpty()) || isEnded()) {
                timestampConsumer.onTimestamp(calculateSpeedAdjustedTime(j));
            } else {
                this.pendingCallbackInputTimesUs.add(j);
                this.pendingCallbacks.add(timestampConsumer);
            }
        }
    }

    public long getMediaDurationUs(long j) {
        long jRound;
        long j2;
        synchronized (this.lock) {
            int size = this.outputSegmentStartTimesUs.size() - 1;
            while (size > 0 && this.outputSegmentStartTimesUs.get(size) > j) {
                size--;
            }
            long j3 = j - this.outputSegmentStartTimesUs.get(size);
            if (size == this.outputSegmentStartTimesUs.size() - 1) {
                jRound = getMediaDurationUsAtCurrentSpeed(j3);
            } else {
                int i = size + 1;
                jRound = Math.round(j3 * divide(this.inputSegmentStartTimesUs.get(i) - this.inputSegmentStartTimesUs.get(size), this.outputSegmentStartTimesUs.get(i) - this.outputSegmentStartTimesUs.get(size)));
            }
            j2 = this.inputSegmentStartTimesUs.get(size) + jRound;
        }
        return j2;
    }

    private long calculateSpeedAdjustedTime(long j) {
        long jRound;
        int size = this.inputSegmentStartTimesUs.size() - 1;
        while (size > 0 && this.inputSegmentStartTimesUs.get(size) > j) {
            size--;
        }
        if (size == this.inputSegmentStartTimesUs.size() - 1) {
            if (this.lastSpeedAdjustedInputTimeUs < this.inputSegmentStartTimesUs.get(size)) {
                this.lastSpeedAdjustedInputTimeUs = this.inputSegmentStartTimesUs.get(size);
                this.lastSpeedAdjustedOutputTimeUs = this.outputSegmentStartTimesUs.get(size);
            }
            jRound = getPlayoutDurationUsAtCurrentSpeed(j - this.lastSpeedAdjustedInputTimeUs);
        } else {
            int i = size + 1;
            jRound = Math.round((j - this.lastSpeedAdjustedInputTimeUs) * divide(this.outputSegmentStartTimesUs.get(i) - this.outputSegmentStartTimesUs.get(size), this.inputSegmentStartTimesUs.get(i) - this.inputSegmentStartTimesUs.get(size)));
        }
        this.lastSpeedAdjustedInputTimeUs = j;
        long j2 = this.lastSpeedAdjustedOutputTimeUs + jRound;
        this.lastSpeedAdjustedOutputTimeUs = j2;
        return j2;
    }

    private void processPendingCallbacks() {
        synchronized (this.lock) {
            while (!this.pendingCallbacks.isEmpty() && (this.pendingCallbackInputTimesUs.element() <= this.lastProcessedInputTimeUs || isEnded())) {
                this.pendingCallbacks.remove().onTimestamp(calculateSpeedAdjustedTime(this.pendingCallbackInputTimesUs.remove()));
            }
        }
    }

    private void updateSpeed(float f, long j) {
        synchronized (this.lock) {
            if (f != this.currentSpeed) {
                updateSpeedChangeArrays(j);
                this.currentSpeed = f;
                if (isUsingSonic()) {
                    this.sonicAudioProcessor.setSpeed(f);
                    this.sonicAudioProcessor.setPitch(f);
                }
                this.sonicAudioProcessor.flush();
                this.endOfStreamQueuedToSonic = false;
                super.getOutput();
            }
        }
    }

    private void updateSpeedChangeArrays(long j) {
        long j2 = this.outputSegmentStartTimesUs.get(r0.size() - 1);
        long j3 = j - this.inputSegmentStartTimesUs.get(r2.size() - 1);
        this.inputSegmentStartTimesUs.add(j);
        this.outputSegmentStartTimesUs.add(j2 + getPlayoutDurationUsAtCurrentSpeed(j3));
    }

    private long getPlayoutDurationUsAtCurrentSpeed(long j) {
        return isUsingSonic() ? this.sonicAudioProcessor.getPlayoutDuration(j) : j;
    }

    private long getMediaDurationUsAtCurrentSpeed(long j) {
        return isUsingSonic() ? this.sonicAudioProcessor.getMediaDuration(j) : j;
    }

    private void updateLastProcessedInputTime() {
        synchronized (this.lock) {
            if (isUsingSonic()) {
                this.lastProcessedInputTimeUs = this.inputSegmentStartTimesUs.get(r3.size() - 1) + Util.scaleLargeTimestamp(this.sonicAudioProcessor.getProcessedInputBytes(), 1000000L, this.inputAudioFormat.bytesPerFrame * this.inputAudioFormat.sampleRate);
            } else {
                this.lastProcessedInputTimeUs = Util.scaleLargeTimestamp(this.bytesRead, 1000000L, this.inputAudioFormat.bytesPerFrame * this.inputAudioFormat.sampleRate);
            }
        }
    }

    private boolean isUsingSonic() {
        boolean z;
        synchronized (this.lock) {
            z = this.currentSpeed != 1.0f;
        }
        return z;
    }

    @EnsuresNonNull({"inputSegmentStartTimesUs", "outputSegmentStartTimesUs"})
    @RequiresNonNull({"lock"})
    private void resetState() {
        synchronized (this.lock) {
            this.inputSegmentStartTimesUs = new LongArray();
            this.outputSegmentStartTimesUs = new LongArray();
            this.inputSegmentStartTimesUs.add(0L);
            this.outputSegmentStartTimesUs.add(0L);
            this.lastProcessedInputTimeUs = 0L;
            this.lastSpeedAdjustedInputTimeUs = 0L;
            this.lastSpeedAdjustedOutputTimeUs = 0L;
            this.currentSpeed = 1.0f;
        }
        this.bytesRead = 0L;
        this.endOfStreamQueuedToSonic = false;
    }
}
