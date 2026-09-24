package androidx.media3.common.audio;

import androidx.media3.common.audio.AudioProcessor;
import androidx.media3.common.util.Util;
import java.nio.ByteBuffer;

/* loaded from: classes.dex */
public final class AudioMixingUtil {
    private static final float FLOAT_PCM_MAX_VALUE = 1.0f;
    private static final float FLOAT_PCM_MIN_VALUE = -1.0f;

    private static float int16SampleToFloatPcm(short s) {
        return s / (s < 0 ? 32768 : 32767);
    }

    public static boolean canMix(AudioProcessor.AudioFormat audioFormat) {
        if (audioFormat.sampleRate == -1 || audioFormat.channelCount == -1) {
            return false;
        }
        return audioFormat.encoding == 2 || audioFormat.encoding == 4;
    }

    public static boolean canMix(AudioProcessor.AudioFormat audioFormat, AudioProcessor.AudioFormat audioFormat2) {
        return audioFormat.sampleRate == audioFormat2.sampleRate && canMix(audioFormat) && canMix(audioFormat2);
    }

    public static ByteBuffer mix(ByteBuffer byteBuffer, AudioProcessor.AudioFormat audioFormat, ByteBuffer byteBuffer2, AudioProcessor.AudioFormat audioFormat2, ChannelMixingMatrix channelMixingMatrix, int i, boolean z, boolean z2) {
        AudioProcessor.AudioFormat audioFormat3;
        boolean z3;
        float fConstrainValue;
        if (audioFormat.encoding == 2) {
            audioFormat3 = audioFormat2;
            z3 = true;
        } else {
            audioFormat3 = audioFormat2;
            z3 = false;
        }
        boolean z4 = audioFormat3.encoding == 2;
        int inputChannelCount = channelMixingMatrix.getInputChannelCount();
        int outputChannelCount = channelMixingMatrix.getOutputChannelCount();
        float[] fArr = new float[inputChannelCount];
        float[] fArr2 = new float[outputChannelCount];
        for (int i2 = 0; i2 < i; i2++) {
            if (z) {
                int iPosition = byteBuffer2.position();
                for (int i3 = 0; i3 < outputChannelCount; i3++) {
                    fArr2[i3] = getPcmSample(byteBuffer2, z4, z4);
                }
                byteBuffer2.position(iPosition);
            }
            for (int i4 = 0; i4 < inputChannelCount; i4++) {
                fArr[i4] = getPcmSample(byteBuffer, z3, z4);
            }
            for (int i5 = 0; i5 < outputChannelCount; i5++) {
                for (int i6 = 0; i6 < inputChannelCount; i6++) {
                    fArr2[i5] = fArr2[i5] + (fArr[i6] * channelMixingMatrix.getMixingCoefficient(i6, i5));
                }
                if (z4) {
                    byteBuffer2.putShort((short) Util.constrainValue(fArr2[i5], -32768.0f, 32767.0f));
                } else {
                    if (z2) {
                        fConstrainValue = Util.constrainValue(fArr2[i5], FLOAT_PCM_MIN_VALUE, 1.0f);
                    } else {
                        fConstrainValue = fArr2[i5];
                    }
                    byteBuffer2.putFloat(fConstrainValue);
                }
                fArr2[i5] = 0.0f;
            }
        }
        return byteBuffer2;
    }

    private static float getPcmSample(ByteBuffer byteBuffer, boolean z, boolean z2) {
        return z2 ? z ? byteBuffer.getShort() : floatSampleToInt16Pcm(byteBuffer.getFloat()) : z ? int16SampleToFloatPcm(byteBuffer.getShort()) : byteBuffer.getFloat();
    }

    private static float floatSampleToInt16Pcm(float f) {
        return Util.constrainValue(f * (f < 0.0f ? 32768 : 32767), -32768.0f, 32767.0f);
    }

    private AudioMixingUtil() {
    }
}
