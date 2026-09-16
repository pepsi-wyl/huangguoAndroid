package androidx.media3.exoplayer;

import android.content.Context;
import androidx.media3.common.Format;
import androidx.media3.common.Metadata;
import androidx.media3.common.VideoSize;
import androidx.media3.common.text.CueGroup;
import androidx.media3.common.util.SystemClock;
import androidx.media3.common.util.Util;
import androidx.media3.exoplayer.DefaultRendererCapabilitiesList;
import androidx.media3.exoplayer.RendererCapabilitiesList;
import androidx.media3.exoplayer.analytics.PlayerId;
import androidx.media3.exoplayer.audio.AudioRendererEventListener;
import androidx.media3.exoplayer.audio.AudioSink;
import androidx.media3.exoplayer.metadata.MetadataOutput;
import androidx.media3.exoplayer.text.TextOutput;
import androidx.media3.exoplayer.video.VideoRendererEventListener;
import java.util.Arrays;
import java.util.List;

/* loaded from: classes.dex */
public final class DefaultRendererCapabilitiesList implements RendererCapabilitiesList {
    private final Renderer[] renderers;

    public static final class Factory implements RendererCapabilitiesList.Factory {
        private final RenderersFactory renderersFactory;

        static /* synthetic */ void lambda$createRendererCapabilitiesList$0(CueGroup cueGroup) {
        }

        static /* synthetic */ void lambda$createRendererCapabilitiesList$1(Metadata metadata) {
        }

        public Factory(Context context) {
            this.renderersFactory = new DefaultRenderersFactory(context);
        }

        public Factory(RenderersFactory renderersFactory) {
            this.renderersFactory = renderersFactory;
        }

        @Override // androidx.media3.exoplayer.RendererCapabilitiesList.Factory
        public DefaultRendererCapabilitiesList createRendererCapabilitiesList() {
            return new DefaultRendererCapabilitiesList(this.renderersFactory.createRenderers(Util.createHandlerForCurrentOrMainLooper(), new VideoRendererEventListener() { // from class: androidx.media3.exoplayer.DefaultRendererCapabilitiesList.Factory.1
                @Override // androidx.media3.exoplayer.video.VideoRendererEventListener
                public /* synthetic */ void onDroppedFrames(int i, long j) {
                    VideoRendererEventListener.CC.$default$onDroppedFrames(this, i, j);
                }

                @Override // androidx.media3.exoplayer.video.VideoRendererEventListener
                public /* synthetic */ void onRenderedFirstFrame(Object obj, long j) {
                    VideoRendererEventListener.CC.$default$onRenderedFirstFrame(this, obj, j);
                }

                @Override // androidx.media3.exoplayer.video.VideoRendererEventListener
                public /* synthetic */ void onVideoCodecError(Exception exc) {
                    VideoRendererEventListener.CC.$default$onVideoCodecError(this, exc);
                }

                @Override // androidx.media3.exoplayer.video.VideoRendererEventListener
                public /* synthetic */ void onVideoDecoderInitialized(String str, long j, long j2) {
                    VideoRendererEventListener.CC.$default$onVideoDecoderInitialized(this, str, j, j2);
                }

                @Override // androidx.media3.exoplayer.video.VideoRendererEventListener
                public /* synthetic */ void onVideoDecoderReleased(String str) {
                    VideoRendererEventListener.CC.$default$onVideoDecoderReleased(this, str);
                }

                @Override // androidx.media3.exoplayer.video.VideoRendererEventListener
                public /* synthetic */ void onVideoDisabled(DecoderCounters decoderCounters) {
                    VideoRendererEventListener.CC.$default$onVideoDisabled(this, decoderCounters);
                }

                @Override // androidx.media3.exoplayer.video.VideoRendererEventListener
                public /* synthetic */ void onVideoEnabled(DecoderCounters decoderCounters) {
                    VideoRendererEventListener.CC.$default$onVideoEnabled(this, decoderCounters);
                }

                @Override // androidx.media3.exoplayer.video.VideoRendererEventListener
                public /* synthetic */ void onVideoFrameProcessingOffset(long j, int i) {
                    VideoRendererEventListener.CC.$default$onVideoFrameProcessingOffset(this, j, i);
                }

                @Override // androidx.media3.exoplayer.video.VideoRendererEventListener
                public /* synthetic */ void onVideoInputFormatChanged(Format format, DecoderReuseEvaluation decoderReuseEvaluation) {
                    VideoRendererEventListener.CC.$default$onVideoInputFormatChanged(this, format, decoderReuseEvaluation);
                }

                @Override // androidx.media3.exoplayer.video.VideoRendererEventListener
                public /* synthetic */ void onVideoSizeChanged(VideoSize videoSize) {
                    VideoRendererEventListener.CC.$default$onVideoSizeChanged(this, videoSize);
                }
            }, new AudioRendererEventListener() { // from class: androidx.media3.exoplayer.DefaultRendererCapabilitiesList.Factory.2
                @Override // androidx.media3.exoplayer.audio.AudioRendererEventListener
                public /* synthetic */ void onAudioCodecError(Exception exc) {
                    AudioRendererEventListener.CC.$default$onAudioCodecError(this, exc);
                }

                @Override // androidx.media3.exoplayer.audio.AudioRendererEventListener
                public /* synthetic */ void onAudioDecoderInitialized(String str, long j, long j2) {
                    AudioRendererEventListener.CC.$default$onAudioDecoderInitialized(this, str, j, j2);
                }

                @Override // androidx.media3.exoplayer.audio.AudioRendererEventListener
                public /* synthetic */ void onAudioDecoderReleased(String str) {
                    AudioRendererEventListener.CC.$default$onAudioDecoderReleased(this, str);
                }

                @Override // androidx.media3.exoplayer.audio.AudioRendererEventListener
                public /* synthetic */ void onAudioDisabled(DecoderCounters decoderCounters) {
                    AudioRendererEventListener.CC.$default$onAudioDisabled(this, decoderCounters);
                }

                @Override // androidx.media3.exoplayer.audio.AudioRendererEventListener
                public /* synthetic */ void onAudioEnabled(DecoderCounters decoderCounters) {
                    AudioRendererEventListener.CC.$default$onAudioEnabled(this, decoderCounters);
                }

                @Override // androidx.media3.exoplayer.audio.AudioRendererEventListener
                public /* synthetic */ void onAudioInputFormatChanged(Format format, DecoderReuseEvaluation decoderReuseEvaluation) {
                    AudioRendererEventListener.CC.$default$onAudioInputFormatChanged(this, format, decoderReuseEvaluation);
                }

                @Override // androidx.media3.exoplayer.audio.AudioRendererEventListener
                public /* synthetic */ void onAudioPositionAdvancing(long j) {
                    AudioRendererEventListener.CC.$default$onAudioPositionAdvancing(this, j);
                }

                @Override // androidx.media3.exoplayer.audio.AudioRendererEventListener
                public /* synthetic */ void onAudioSinkError(Exception exc) {
                    AudioRendererEventListener.CC.$default$onAudioSinkError(this, exc);
                }

                @Override // androidx.media3.exoplayer.audio.AudioRendererEventListener
                public /* synthetic */ void onAudioTrackInitialized(AudioSink.AudioTrackConfig audioTrackConfig) {
                    AudioRendererEventListener.CC.$default$onAudioTrackInitialized(this, audioTrackConfig);
                }

                @Override // androidx.media3.exoplayer.audio.AudioRendererEventListener
                public /* synthetic */ void onAudioTrackReleased(AudioSink.AudioTrackConfig audioTrackConfig) {
                    AudioRendererEventListener.CC.$default$onAudioTrackReleased(this, audioTrackConfig);
                }

                @Override // androidx.media3.exoplayer.audio.AudioRendererEventListener
                public /* synthetic */ void onAudioUnderrun(int i, long j, long j2) {
                    AudioRendererEventListener.CC.$default$onAudioUnderrun(this, i, j, j2);
                }

                @Override // androidx.media3.exoplayer.audio.AudioRendererEventListener
                public /* synthetic */ void onSkipSilenceEnabledChanged(boolean z) {
                    AudioRendererEventListener.CC.$default$onSkipSilenceEnabledChanged(this, z);
                }
            }, new TextOutput() { // from class: androidx.media3.exoplayer.DefaultRendererCapabilitiesList$Factory$$ExternalSyntheticLambda0
                @Override // androidx.media3.exoplayer.text.TextOutput
                public final void onCues(CueGroup cueGroup) {
                    DefaultRendererCapabilitiesList.Factory.lambda$createRendererCapabilitiesList$0(cueGroup);
                }

                @Override // androidx.media3.exoplayer.text.TextOutput
                public /* synthetic */ void onCues(List list) {
                    TextOutput.CC.$default$onCues(this, list);
                }
            }, new MetadataOutput() { // from class: androidx.media3.exoplayer.DefaultRendererCapabilitiesList$Factory$$ExternalSyntheticLambda1
                @Override // androidx.media3.exoplayer.metadata.MetadataOutput
                public final void onMetadata(Metadata metadata) {
                    DefaultRendererCapabilitiesList.Factory.lambda$createRendererCapabilitiesList$1(metadata);
                }
            }));
        }
    }

    private DefaultRendererCapabilitiesList(Renderer[] rendererArr) {
        this.renderers = (Renderer[]) Arrays.copyOf(rendererArr, rendererArr.length);
        for (int i = 0; i < rendererArr.length; i++) {
            this.renderers[i].init(i, PlayerId.UNSET, SystemClock.DEFAULT);
        }
    }

    @Override // androidx.media3.exoplayer.RendererCapabilitiesList
    public RendererCapabilities[] getRendererCapabilities() {
        RendererCapabilities[] rendererCapabilitiesArr = new RendererCapabilities[this.renderers.length];
        int i = 0;
        while (true) {
            Renderer[] rendererArr = this.renderers;
            if (i >= rendererArr.length) {
                return rendererCapabilitiesArr;
            }
            rendererCapabilitiesArr[i] = rendererArr[i].getCapabilities();
            i++;
        }
    }

    @Override // androidx.media3.exoplayer.RendererCapabilitiesList
    public int size() {
        return this.renderers.length;
    }

    @Override // androidx.media3.exoplayer.RendererCapabilitiesList
    public void release() {
        for (Renderer renderer : this.renderers) {
            renderer.release();
        }
    }
}
