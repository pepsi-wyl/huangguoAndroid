package androidx.media;

import android.media.AudioAttributes;
import androidx.media.AudioAttributesImpl;

/* loaded from: classes.dex */
public class AudioAttributesImplApi21 implements AudioAttributesImpl {
    public AudioAttributes mAudioAttributes;
    public int mLegacyStreamType;

    public AudioAttributesImplApi21() {
        this.mLegacyStreamType = -1;
    }

    AudioAttributesImplApi21(AudioAttributes audioAttributes) {
        this(audioAttributes, -1);
    }

    AudioAttributesImplApi21(AudioAttributes audioAttributes, int i) {
        this.mAudioAttributes = audioAttributes;
        this.mLegacyStreamType = i;
    }

    @Override // androidx.media.AudioAttributesImpl
    public Object getAudioAttributes() {
        return this.mAudioAttributes;
    }

    @Override // androidx.media.AudioAttributesImpl
    public int getVolumeControlStream() {
        return AudioAttributesCompat.toVolumeStreamType(true, getFlags(), getUsage());
    }

    @Override // androidx.media.AudioAttributesImpl
    public int getLegacyStreamType() {
        int i = this.mLegacyStreamType;
        return i != -1 ? i : AudioAttributesCompat.toVolumeStreamType(false, getFlags(), getUsage());
    }

    @Override // androidx.media.AudioAttributesImpl
    public int getRawLegacyStreamType() {
        return this.mLegacyStreamType;
    }

    @Override // androidx.media.AudioAttributesImpl
    public int getContentType() {
        return this.mAudioAttributes.getContentType();
    }

    @Override // androidx.media.AudioAttributesImpl
    public int getUsage() {
        return this.mAudioAttributes.getUsage();
    }

    @Override // androidx.media.AudioAttributesImpl
    public int getFlags() {
        return this.mAudioAttributes.getFlags();
    }

    public int hashCode() {
        return this.mAudioAttributes.hashCode();
    }

    public boolean equals(Object obj) {
        if (obj instanceof AudioAttributesImplApi21) {
            return this.mAudioAttributes.equals(((AudioAttributesImplApi21) obj).mAudioAttributes);
        }
        return false;
    }

    public String toString() {
        return "AudioAttributesCompat: audioattributes=" + this.mAudioAttributes;
    }

    static class Builder implements AudioAttributesImpl.Builder {
        final AudioAttributes.Builder mFwkBuilder;

        Builder() {
            this.mFwkBuilder = new AudioAttributes.Builder();
        }

        Builder(Object obj) {
            this.mFwkBuilder = new AudioAttributes.Builder((AudioAttributes) obj);
        }

        @Override // androidx.media.AudioAttributesImpl.Builder
        public AudioAttributesImpl build() {
            return new AudioAttributesImplApi21(this.mFwkBuilder.build());
        }

        @Override // androidx.media.AudioAttributesImpl.Builder
        public Builder setUsage(int i) {
            if (i == 16) {
                i = 12;
            }
            this.mFwkBuilder.setUsage(i);
            return this;
        }

        @Override // androidx.media.AudioAttributesImpl.Builder
        public Builder setContentType(int i) {
            this.mFwkBuilder.setContentType(i);
            return this;
        }

        @Override // androidx.media.AudioAttributesImpl.Builder
        public Builder setFlags(int i) {
            this.mFwkBuilder.setFlags(i);
            return this;
        }

        @Override // androidx.media.AudioAttributesImpl.Builder
        public Builder setLegacyStreamType(int i) {
            this.mFwkBuilder.setLegacyStreamType(i);
            return this;
        }
    }
}
