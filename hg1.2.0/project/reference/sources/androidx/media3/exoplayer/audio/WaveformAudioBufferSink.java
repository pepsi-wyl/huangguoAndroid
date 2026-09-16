package androidx.media3.exoplayer.audio;

import android.util.SparseArray;
import androidx.media3.common.audio.AudioMixingUtil;
import androidx.media3.common.audio.AudioProcessor;
import androidx.media3.common.audio.ChannelMixingMatrix;
import androidx.media3.common.util.Assertions;
import androidx.media3.common.util.Util;
import androidx.media3.exoplayer.audio.TeeAudioProcessor;
import com.google.common.base.Preconditions;
import java.nio.ByteBuffer;

/* loaded from: classes.dex */
public class WaveformAudioBufferSink implements TeeAudioProcessor.AudioBufferSink {
    private final int barsPerSecond;
    private ChannelMixingMatrix channelMixingMatrix;
    private AudioProcessor.AudioFormat inputAudioFormat;
    private final Listener listener;
    private AudioProcessor.AudioFormat mixingAudioFormat;
    private final ByteBuffer mixingBuffer;
    private final SparseArray<WaveformBar> outputChannels;
    private int samplesPerBar;

    public interface Listener {
        void onNewWaveformBar(int i, WaveformBar waveformBar);
    }

    public static class WaveformBar {
        private int sampleCount;
        private double squareSum;
        private float minSampleValue = 1.0f;
        private float maxSampleValue = -1.0f;

        public int getSampleCount() {
            return this.sampleCount;
        }

        public double getMinSampleValue() {
            return this.minSampleValue;
        }

        public double getMaxSampleValue() {
            return this.maxSampleValue;
        }

        public double getRootMeanSquare() {
            return Math.sqrt(this.squareSum / this.sampleCount);
        }

        public void addSample(float f) {
            Preconditions.checkArgument(f >= -1.0f && f <= 1.0f);
            this.minSampleValue = Math.min(this.minSampleValue, f);
            this.maxSampleValue = Math.max(this.maxSampleValue, f);
            double d = f;
            this.squareSum += d * d;
            this.sampleCount++;
        }
    }

    public WaveformAudioBufferSink(int i, int i2, Listener listener) {
        this.barsPerSecond = i;
        this.listener = listener;
        this.mixingBuffer = ByteBuffer.allocate(Util.getPcmFrameSize(4, i2));
        this.outputChannels = new SparseArray<>(i2);
        for (int i3 = 0; i3 < i2; i3++) {
            this.outputChannels.append(i3, new WaveformBar());
        }
    }

    @Override // androidx.media3.exoplayer.audio.TeeAudioProcessor.AudioBufferSink
    public void flush(int i, int i2, int i3) {
        this.samplesPerBar = i / this.barsPerSecond;
        this.inputAudioFormat = new AudioProcessor.AudioFormat(i, i2, i3);
        this.mixingAudioFormat = new AudioProcessor.AudioFormat(i, this.outputChannels.size(), 4);
        this.channelMixingMatrix = ChannelMixingMatrix.create(i2, this.outputChannels.size());
    }

    @Override // androidx.media3.exoplayer.audio.TeeAudioProcessor.AudioBufferSink
    public void handleBuffer(ByteBuffer byteBuffer) {
        Assertions.checkStateNotNull(this.inputAudioFormat);
        Assertions.checkStateNotNull(this.mixingAudioFormat);
        Assertions.checkStateNotNull(this.channelMixingMatrix);
        while (byteBuffer.hasRemaining()) {
            this.mixingBuffer.rewind();
            AudioMixingUtil.mix(byteBuffer, this.inputAudioFormat, this.mixingBuffer, this.mixingAudioFormat, this.channelMixingMatrix, 1, false, true);
            this.mixingBuffer.rewind();
            for (int i = 0; i < this.outputChannels.size(); i++) {
                WaveformBar waveformBar = this.outputChannels.get(i);
                waveformBar.addSample(this.mixingBuffer.getFloat());
                if (waveformBar.getSampleCount() >= this.samplesPerBar) {
                    this.listener.onNewWaveformBar(i, waveformBar);
                    this.outputChannels.put(i, new WaveformBar());
                }
            }
        }
    }
}
