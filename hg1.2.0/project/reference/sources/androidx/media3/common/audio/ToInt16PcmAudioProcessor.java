package androidx.media3.common.audio;

import androidx.media3.common.audio.AudioProcessor;

/* loaded from: classes.dex */
public final class ToInt16PcmAudioProcessor extends BaseAudioProcessor {
    @Override // androidx.media3.common.audio.BaseAudioProcessor
    public AudioProcessor.AudioFormat onConfigure(AudioProcessor.AudioFormat audioFormat) throws AudioProcessor.UnhandledAudioFormatException {
        int i = audioFormat.encoding;
        if (i != 3 && i != 2 && i != 268435456 && i != 21 && i != 1342177280 && i != 22 && i != 1610612736 && i != 4) {
            throw new AudioProcessor.UnhandledAudioFormatException(audioFormat);
        }
        if (i != 2) {
            return new AudioProcessor.AudioFormat(audioFormat.sampleRate, audioFormat.channelCount, 2);
        }
        return AudioProcessor.AudioFormat.NOT_SET;
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0032  */
    @Override // androidx.media3.common.audio.AudioProcessor
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void queueInput(java.nio.ByteBuffer r12) {
        /*
            Method dump skipped, instructions count: 262
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.media3.common.audio.ToInt16PcmAudioProcessor.queueInput(java.nio.ByteBuffer):void");
    }
}
