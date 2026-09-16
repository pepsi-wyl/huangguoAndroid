package com.ryanheise.just_audio;

import android.content.Context;
import android.media.audiofx.AudioEffect;
import android.media.audiofx.Equalizer;
import android.media.audiofx.LoudnessEnhancer;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import androidx.media3.common.AudioAttributes;
import androidx.media3.common.C;
import androidx.media3.common.DeviceInfo;
import androidx.media3.common.MediaItem;
import androidx.media3.common.MediaMetadata;
import androidx.media3.common.Metadata;
import androidx.media3.common.MimeTypes;
import androidx.media3.common.PlaybackException;
import androidx.media3.common.PlaybackParameters;
import androidx.media3.common.Player;
import androidx.media3.common.Timeline;
import androidx.media3.common.TrackGroup;
import androidx.media3.common.TrackSelectionParameters;
import androidx.media3.common.Tracks;
import androidx.media3.common.VideoSize;
import androidx.media3.common.text.CueGroup;
import androidx.media3.common.util.Util;
import androidx.media3.datasource.DataSource;
import androidx.media3.datasource.DefaultDataSource;
import androidx.media3.datasource.DefaultHttpDataSource;
import androidx.media3.exoplayer.DefaultLivePlaybackSpeedControl;
import androidx.media3.exoplayer.DefaultLoadControl;
import androidx.media3.exoplayer.ExoPlaybackException;
import androidx.media3.exoplayer.ExoPlayer;
import androidx.media3.exoplayer.LivePlaybackSpeedControl;
import androidx.media3.exoplayer.LoadControl;
import androidx.media3.exoplayer.dash.DashMediaSource;
import androidx.media3.exoplayer.hls.HlsMediaSource;
import androidx.media3.exoplayer.metadata.MetadataOutput;
import androidx.media3.exoplayer.source.ClippingMediaSource;
import androidx.media3.exoplayer.source.ConcatenatingMediaSource;
import androidx.media3.exoplayer.source.MediaSource;
import androidx.media3.exoplayer.source.ProgressiveMediaSource;
import androidx.media3.exoplayer.source.ShuffleOrder;
import androidx.media3.exoplayer.source.SilenceMediaSource;
import androidx.media3.extractor.DefaultExtractorsFactory;
import androidx.media3.extractor.metadata.icy.IcyHeaders;
import androidx.media3.extractor.metadata.icy.IcyInfo;
import androidx.media3.extractor.text.ttml.TtmlNode;
import io.flutter.Log;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodChannel;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import tv.danmaku.ijk.media.player.IjkMediaMeta;
import tv.danmaku.ijk.media.player.IjkMediaPlayer;

/* loaded from: classes2.dex */
public class AudioPlayer implements MethodChannel.MethodCallHandler, Player.Listener, MetadataOutput {
    static final String TAG = "AudioPlayer";
    private static Random random = new Random();
    private Integer audioSessionId;
    private long bufferedPosition;
    private final Context context;
    private Integer currentIndex;
    private final BetterEventChannel dataEventChannel;
    private int errorCount;
    private final BetterEventChannel eventChannel;
    private IcyHeaders icyHeaders;
    private IcyInfo icyInfo;
    private Integer initialIndex;
    private long initialPos;
    private LivePlaybackSpeedControl livePlaybackSpeedControl;
    private LoadControl loadControl;
    private MediaSource mediaSource;
    private final MethodChannel methodChannel;
    private boolean offloadSchedulingEnabled;
    private AudioAttributes pendingAudioAttributes;
    private Map<String, Object> pendingPlaybackEvent;
    private MethodChannel.Result playResult;
    private ExoPlayer player;
    private MethodChannel.Result prepareResult;
    private ProcessingState processingState;
    private List<Object> rawAudioEffects;
    private Long seekPos;
    private MethodChannel.Result seekResult;
    private long updatePosition;
    private long updateTime;
    private Map<String, MediaSource> mediaSources = new HashMap();
    private List<AudioEffect> audioEffects = new ArrayList();
    private Map<String, AudioEffect> audioEffectsMap = new HashMap();
    private int lastPlaylistLength = 0;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private final Runnable bufferWatcher = new Runnable() { // from class: com.ryanheise.just_audio.AudioPlayer.1
        @Override // java.lang.Runnable
        public void run() {
            if (AudioPlayer.this.player == null) {
                return;
            }
            if (AudioPlayer.this.player.getBufferedPosition() != AudioPlayer.this.bufferedPosition) {
                AudioPlayer.this.broadcastImmediatePlaybackEvent();
            }
            int playbackState = AudioPlayer.this.player.getPlaybackState();
            if (playbackState == 2) {
                AudioPlayer.this.handler.postDelayed(this, 200L);
            } else {
                if (playbackState != 3) {
                    return;
                }
                if (AudioPlayer.this.player.getPlayWhenReady()) {
                    AudioPlayer.this.handler.postDelayed(this, 500L);
                } else {
                    AudioPlayer.this.handler.postDelayed(this, 1000L);
                }
            }
        }
    };

    enum ProcessingState {
        none,
        loading,
        buffering,
        ready,
        completed
    }

    @Override // androidx.media3.common.Player.Listener
    public /* synthetic */ void onAudioAttributesChanged(AudioAttributes audioAttributes) {
        Player.Listener.CC.$default$onAudioAttributesChanged(this, audioAttributes);
    }

    @Override // androidx.media3.common.Player.Listener
    public /* synthetic */ void onAvailableCommandsChanged(Player.Commands commands) {
        Player.Listener.CC.$default$onAvailableCommandsChanged(this, commands);
    }

    @Override // androidx.media3.common.Player.Listener
    public /* synthetic */ void onCues(CueGroup cueGroup) {
        Player.Listener.CC.$default$onCues(this, cueGroup);
    }

    @Override // androidx.media3.common.Player.Listener
    public /* synthetic */ void onCues(List list) {
        Player.Listener.CC.$default$onCues(this, list);
    }

    @Override // androidx.media3.common.Player.Listener
    public /* synthetic */ void onDeviceInfoChanged(DeviceInfo deviceInfo) {
        Player.Listener.CC.$default$onDeviceInfoChanged(this, deviceInfo);
    }

    @Override // androidx.media3.common.Player.Listener
    public /* synthetic */ void onDeviceVolumeChanged(int i, boolean z) {
        Player.Listener.CC.$default$onDeviceVolumeChanged(this, i, z);
    }

    @Override // androidx.media3.common.Player.Listener
    public /* synthetic */ void onEvents(Player player, Player.Events events) {
        Player.Listener.CC.$default$onEvents(this, player, events);
    }

    @Override // androidx.media3.common.Player.Listener
    public /* synthetic */ void onIsLoadingChanged(boolean z) {
        Player.Listener.CC.$default$onIsLoadingChanged(this, z);
    }

    @Override // androidx.media3.common.Player.Listener
    public /* synthetic */ void onIsPlayingChanged(boolean z) {
        Player.Listener.CC.$default$onIsPlayingChanged(this, z);
    }

    @Override // androidx.media3.common.Player.Listener
    public /* synthetic */ void onLoadingChanged(boolean z) {
        Player.Listener.CC.$default$onLoadingChanged(this, z);
    }

    @Override // androidx.media3.common.Player.Listener
    public /* synthetic */ void onMaxSeekToPreviousPositionChanged(long j) {
        Player.Listener.CC.$default$onMaxSeekToPreviousPositionChanged(this, j);
    }

    @Override // androidx.media3.common.Player.Listener
    public /* synthetic */ void onMediaItemTransition(MediaItem mediaItem, int i) {
        Player.Listener.CC.$default$onMediaItemTransition(this, mediaItem, i);
    }

    @Override // androidx.media3.common.Player.Listener
    public /* synthetic */ void onMediaMetadataChanged(MediaMetadata mediaMetadata) {
        Player.Listener.CC.$default$onMediaMetadataChanged(this, mediaMetadata);
    }

    @Override // androidx.media3.common.Player.Listener
    public /* synthetic */ void onPlayWhenReadyChanged(boolean z, int i) {
        Player.Listener.CC.$default$onPlayWhenReadyChanged(this, z, i);
    }

    @Override // androidx.media3.common.Player.Listener
    public /* synthetic */ void onPlaybackParametersChanged(PlaybackParameters playbackParameters) {
        Player.Listener.CC.$default$onPlaybackParametersChanged(this, playbackParameters);
    }

    @Override // androidx.media3.common.Player.Listener
    public /* synthetic */ void onPlaybackSuppressionReasonChanged(int i) {
        Player.Listener.CC.$default$onPlaybackSuppressionReasonChanged(this, i);
    }

    @Override // androidx.media3.common.Player.Listener
    public /* synthetic */ void onPlayerErrorChanged(PlaybackException playbackException) {
        Player.Listener.CC.$default$onPlayerErrorChanged(this, playbackException);
    }

    @Override // androidx.media3.common.Player.Listener
    public /* synthetic */ void onPlayerStateChanged(boolean z, int i) {
        Player.Listener.CC.$default$onPlayerStateChanged(this, z, i);
    }

    @Override // androidx.media3.common.Player.Listener
    public /* synthetic */ void onPlaylistMetadataChanged(MediaMetadata mediaMetadata) {
        Player.Listener.CC.$default$onPlaylistMetadataChanged(this, mediaMetadata);
    }

    @Override // androidx.media3.common.Player.Listener
    public /* synthetic */ void onPositionDiscontinuity(int i) {
        Player.Listener.CC.$default$onPositionDiscontinuity(this, i);
    }

    @Override // androidx.media3.common.Player.Listener
    public /* synthetic */ void onRenderedFirstFrame() {
        Player.Listener.CC.$default$onRenderedFirstFrame(this);
    }

    @Override // androidx.media3.common.Player.Listener
    public /* synthetic */ void onRepeatModeChanged(int i) {
        Player.Listener.CC.$default$onRepeatModeChanged(this, i);
    }

    @Override // androidx.media3.common.Player.Listener
    public /* synthetic */ void onSeekBackIncrementChanged(long j) {
        Player.Listener.CC.$default$onSeekBackIncrementChanged(this, j);
    }

    @Override // androidx.media3.common.Player.Listener
    public /* synthetic */ void onSeekForwardIncrementChanged(long j) {
        Player.Listener.CC.$default$onSeekForwardIncrementChanged(this, j);
    }

    @Override // androidx.media3.common.Player.Listener
    public /* synthetic */ void onShuffleModeEnabledChanged(boolean z) {
        Player.Listener.CC.$default$onShuffleModeEnabledChanged(this, z);
    }

    @Override // androidx.media3.common.Player.Listener
    public /* synthetic */ void onSkipSilenceEnabledChanged(boolean z) {
        Player.Listener.CC.$default$onSkipSilenceEnabledChanged(this, z);
    }

    @Override // androidx.media3.common.Player.Listener
    public /* synthetic */ void onSurfaceSizeChanged(int i, int i2) {
        Player.Listener.CC.$default$onSurfaceSizeChanged(this, i, i2);
    }

    @Override // androidx.media3.common.Player.Listener
    public /* synthetic */ void onTrackSelectionParametersChanged(TrackSelectionParameters trackSelectionParameters) {
        Player.Listener.CC.$default$onTrackSelectionParametersChanged(this, trackSelectionParameters);
    }

    @Override // androidx.media3.common.Player.Listener
    public /* synthetic */ void onVideoSizeChanged(VideoSize videoSize) {
        Player.Listener.CC.$default$onVideoSizeChanged(this, videoSize);
    }

    @Override // androidx.media3.common.Player.Listener
    public /* synthetic */ void onVolumeChanged(float f) {
        Player.Listener.CC.$default$onVolumeChanged(this, f);
    }

    public AudioPlayer(Context context, BinaryMessenger binaryMessenger, String str, Map<?, ?> map, List<Object> list, Boolean bool) {
        this.context = context;
        this.rawAudioEffects = list;
        this.offloadSchedulingEnabled = bool != null ? bool.booleanValue() : false;
        MethodChannel methodChannel = new MethodChannel(binaryMessenger, "com.ryanheise.just_audio.methods." + str);
        this.methodChannel = methodChannel;
        methodChannel.setMethodCallHandler(this);
        this.eventChannel = new BetterEventChannel(binaryMessenger, "com.ryanheise.just_audio.events." + str);
        this.dataEventChannel = new BetterEventChannel(binaryMessenger, "com.ryanheise.just_audio.data." + str);
        this.processingState = ProcessingState.none;
        if (map != null) {
            Map map2 = (Map) map.get("androidLoadControl");
            if (map2 != null) {
                DefaultLoadControl.Builder backBuffer = new DefaultLoadControl.Builder().setBufferDurationsMs((int) (getLong(map2.get("minBufferDuration")).longValue() / 1000), (int) (getLong(map2.get("maxBufferDuration")).longValue() / 1000), (int) (getLong(map2.get("bufferForPlaybackDuration")).longValue() / 1000), (int) (getLong(map2.get("bufferForPlaybackAfterRebufferDuration")).longValue() / 1000)).setPrioritizeTimeOverSizeThresholds(((Boolean) map2.get("prioritizeTimeOverSizeThresholds")).booleanValue()).setBackBuffer((int) (getLong(map2.get("backBufferDuration")).longValue() / 1000), false);
                if (map2.get("targetBufferBytes") != null) {
                    backBuffer.setTargetBufferBytes(((Integer) map2.get("targetBufferBytes")).intValue());
                }
                this.loadControl = backBuffer.build();
            }
            Map map3 = (Map) map.get("androidLivePlaybackSpeedControl");
            if (map3 != null) {
                this.livePlaybackSpeedControl = new DefaultLivePlaybackSpeedControl.Builder().setFallbackMinPlaybackSpeed((float) ((Double) map3.get("fallbackMinPlaybackSpeed")).doubleValue()).setFallbackMaxPlaybackSpeed((float) ((Double) map3.get("fallbackMaxPlaybackSpeed")).doubleValue()).setMinUpdateIntervalMs(getLong(map3.get("minUpdateInterval")).longValue() / 1000).setProportionalControlFactor((float) ((Double) map3.get("proportionalControlFactor")).doubleValue()).setMaxLiveOffsetErrorMsForUnitSpeed(getLong(map3.get("maxLiveOffsetErrorForUnitSpeed")).longValue() / 1000).setTargetLiveOffsetIncrementOnRebufferMs(getLong(map3.get("targetLiveOffsetIncrementOnRebuffer")).longValue() / 1000).setMinPossibleLiveOffsetSmoothingFactor((float) ((Double) map3.get("minPossibleLiveOffsetSmoothingFactor")).doubleValue()).build();
            }
        }
    }

    private void startWatchingBuffer() {
        this.handler.removeCallbacks(this.bufferWatcher);
        this.handler.post(this.bufferWatcher);
    }

    private void setAudioSessionId(int i) throws IllegalStateException, UnsupportedOperationException, IllegalArgumentException {
        if (i == 0) {
            this.audioSessionId = null;
        } else {
            this.audioSessionId = Integer.valueOf(i);
        }
        clearAudioEffects();
        if (this.audioSessionId != null) {
            for (Object obj : this.rawAudioEffects) {
                Map map = (Map) obj;
                AudioEffect audioEffectDecodeAudioEffect = decodeAudioEffect(obj, this.audioSessionId.intValue());
                if (((Boolean) map.get("enabled")).booleanValue()) {
                    audioEffectDecodeAudioEffect.setEnabled(true);
                }
                this.audioEffects.add(audioEffectDecodeAudioEffect);
                this.audioEffectsMap.put((String) map.get("type"), audioEffectDecodeAudioEffect);
            }
        }
        enqueuePlaybackEvent();
    }

    @Override // androidx.media3.common.Player.Listener
    public void onAudioSessionIdChanged(int i) throws IllegalStateException, UnsupportedOperationException, IllegalArgumentException {
        setAudioSessionId(i);
        broadcastPendingPlaybackEvent();
    }

    @Override // androidx.media3.common.Player.Listener
    public void onMetadata(Metadata metadata) {
        for (int i = 0; i < metadata.length(); i++) {
            Metadata.Entry entry = metadata.get(i);
            if (entry instanceof IcyInfo) {
                this.icyInfo = (IcyInfo) entry;
                broadcastImmediatePlaybackEvent();
            }
        }
    }

    @Override // androidx.media3.common.Player.Listener
    public void onTracksChanged(Tracks tracks) {
        for (int i = 0; i < tracks.getGroups().size(); i++) {
            TrackGroup mediaTrackGroup = tracks.getGroups().get(i).getMediaTrackGroup();
            for (int i2 = 0; i2 < mediaTrackGroup.length; i2++) {
                Metadata metadata = mediaTrackGroup.getFormat(i2).metadata;
                if (metadata != null) {
                    for (int i3 = 0; i3 < metadata.length(); i3++) {
                        Metadata.Entry entry = metadata.get(i3);
                        if (entry instanceof IcyHeaders) {
                            this.icyHeaders = (IcyHeaders) entry;
                            broadcastImmediatePlaybackEvent();
                        }
                    }
                }
            }
        }
    }

    private boolean updatePositionIfChanged() {
        if (getCurrentPosition() == this.updatePosition) {
            return false;
        }
        this.updatePosition = getCurrentPosition();
        this.updateTime = System.currentTimeMillis();
        return true;
    }

    private void updatePosition() {
        this.updatePosition = getCurrentPosition();
        this.updateTime = System.currentTimeMillis();
    }

    @Override // androidx.media3.common.Player.Listener
    public void onPositionDiscontinuity(Player.PositionInfo positionInfo, Player.PositionInfo positionInfo2, int i) {
        updatePosition();
        if (i == 0 || i == 1) {
            updateCurrentIndex();
        }
        broadcastImmediatePlaybackEvent();
    }

    @Override // androidx.media3.common.Player.Listener
    public void onTimelineChanged(Timeline timeline, int i) {
        if (this.initialPos != C.TIME_UNSET || this.initialIndex != null) {
            Integer num = this.initialIndex;
            this.player.seekTo(num != null ? num.intValue() : 0, this.initialPos);
            this.initialIndex = null;
            this.initialPos = C.TIME_UNSET;
        }
        if (updateCurrentIndex()) {
            broadcastImmediatePlaybackEvent();
        }
        if (this.player.getPlaybackState() == 4) {
            try {
                if (this.player.getPlayWhenReady()) {
                    if (this.lastPlaylistLength == 0 && this.player.getMediaItemCount() > 0) {
                        this.player.seekTo(0, 0L);
                    } else if (this.player.hasNextMediaItem()) {
                        this.player.seekToNextMediaItem();
                    }
                } else if (this.player.getCurrentMediaItemIndex() < this.player.getMediaItemCount()) {
                    ExoPlayer exoPlayer = this.player;
                    exoPlayer.seekTo(exoPlayer.getCurrentMediaItemIndex(), 0L);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        this.lastPlaylistLength = this.player.getMediaItemCount();
    }

    private boolean updateCurrentIndex() {
        Integer numValueOf = Integer.valueOf(this.player.getCurrentMediaItemIndex());
        if (numValueOf.equals(this.currentIndex)) {
            return false;
        }
        this.currentIndex = numValueOf;
        return true;
    }

    @Override // androidx.media3.common.Player.Listener
    public void onPlaybackStateChanged(int i) {
        if (i == 2) {
            updatePositionIfChanged();
            if (this.processingState != ProcessingState.buffering && this.processingState != ProcessingState.loading) {
                this.processingState = ProcessingState.buffering;
                broadcastImmediatePlaybackEvent();
            }
            startWatchingBuffer();
            return;
        }
        if (i == 3) {
            if (this.player.getPlayWhenReady()) {
                updatePosition();
            }
            this.processingState = ProcessingState.ready;
            broadcastImmediatePlaybackEvent();
            if (this.prepareResult != null) {
                HashMap map = new HashMap();
                map.put("duration", getDuration() == C.TIME_UNSET ? null : Long.valueOf(getDuration() * 1000));
                this.prepareResult.success(map);
                this.prepareResult = null;
                AudioAttributes audioAttributes = this.pendingAudioAttributes;
                if (audioAttributes != null) {
                    this.player.setAudioAttributes(audioAttributes, false);
                    this.pendingAudioAttributes = null;
                }
            }
            if (this.seekResult != null) {
                completeSeek();
                return;
            }
            return;
        }
        if (i != 4) {
            return;
        }
        if (this.processingState != ProcessingState.completed) {
            updatePosition();
            this.processingState = ProcessingState.completed;
            broadcastImmediatePlaybackEvent();
        }
        if (this.prepareResult != null) {
            this.prepareResult.success(new HashMap());
            this.prepareResult = null;
            AudioAttributes audioAttributes2 = this.pendingAudioAttributes;
            if (audioAttributes2 != null) {
                this.player.setAudioAttributes(audioAttributes2, false);
                this.pendingAudioAttributes = null;
            }
        }
        MethodChannel.Result result = this.playResult;
        if (result != null) {
            result.success(new HashMap());
            this.playResult = null;
        }
    }

    @Override // androidx.media3.common.Player.Listener
    public void onPlayerError(PlaybackException playbackException) {
        Integer num;
        int iIntValue;
        if (playbackException instanceof ExoPlaybackException) {
            ExoPlaybackException exoPlaybackException = (ExoPlaybackException) playbackException;
            int i = exoPlaybackException.type;
            if (i == 0) {
                Log.e(TAG, "TYPE_SOURCE: " + exoPlaybackException.getSourceException().getMessage());
            } else if (i == 1) {
                Log.e(TAG, "TYPE_RENDERER: " + exoPlaybackException.getRendererException().getMessage());
            } else if (i == 2) {
                Log.e(TAG, "TYPE_UNEXPECTED: " + exoPlaybackException.getUnexpectedException().getMessage());
            } else {
                Log.e(TAG, "default ExoPlaybackException: " + exoPlaybackException.getUnexpectedException().getMessage());
            }
            sendError(String.valueOf(exoPlaybackException.type), exoPlaybackException.getMessage(), mapOf("index", this.currentIndex));
        } else {
            Log.e(TAG, "default PlaybackException: " + playbackException.getMessage());
            sendError(String.valueOf(playbackException.errorCode), playbackException.getMessage(), mapOf("index", this.currentIndex));
        }
        this.errorCount++;
        if (!this.player.hasNextMediaItem() || (num = this.currentIndex) == null || this.errorCount > 5 || (iIntValue = num.intValue() + 1) >= this.player.getCurrentTimeline().getWindowCount()) {
            return;
        }
        this.player.setMediaSource(this.mediaSource);
        this.player.prepare();
        this.player.seekTo(iIntValue, 0L);
    }

    private void completeSeek() {
        this.seekPos = null;
        this.seekResult.success(new HashMap());
        this.seekResult = null;
    }

    /* JADX WARN: Removed duplicated region for block: B:72:0x0111  */
    @Override // io.flutter.plugin.common.MethodChannel.MethodCallHandler
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void onMethodCall(io.flutter.plugin.common.MethodCall r19, final io.flutter.plugin.common.MethodChannel.Result r20) throws java.lang.IllegalStateException, java.lang.UnsupportedOperationException, java.lang.IllegalArgumentException {
        /*
            Method dump skipped, instructions count: 1144
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.ryanheise.just_audio.AudioPlayer.onMethodCall(io.flutter.plugin.common.MethodCall, io.flutter.plugin.common.MethodChannel$Result):void");
    }

    private ShuffleOrder decodeShuffleOrder(List<Integer> list) {
        int size = list.size();
        int[] iArr = new int[size];
        for (int i = 0; i < size; i++) {
            iArr[i] = list.get(i).intValue();
        }
        return new ShuffleOrder.DefaultShuffleOrder(iArr, random.nextLong());
    }

    private static int[] shuffle(int i, Integer num) {
        int[] iArr = new int[i];
        int i2 = 0;
        while (i2 < i) {
            int i3 = i2 + 1;
            int iNextInt = random.nextInt(i3);
            iArr[i2] = iArr[iNextInt];
            iArr[iNextInt] = i2;
            i2 = i3;
        }
        if (num != null) {
            int i4 = 1;
            while (true) {
                if (i4 >= i) {
                    break;
                }
                if (iArr[i4] == num.intValue()) {
                    int i5 = iArr[0];
                    iArr[0] = iArr[i4];
                    iArr[i4] = i5;
                    break;
                }
                i4++;
            }
        }
        return iArr;
    }

    private ShuffleOrder createShuffleOrder(int i, Integer num) {
        return new ShuffleOrder.DefaultShuffleOrder(shuffle(i, num), random.nextLong());
    }

    private ConcatenatingMediaSource concatenating(Object obj) {
        return (ConcatenatingMediaSource) this.mediaSources.get((String) obj);
    }

    private void setShuffleOrder(Object obj) {
        Map map = (Map) obj;
        MediaSource mediaSource = this.mediaSources.get((String) mapGet(map, TtmlNode.ATTR_ID));
        if (mediaSource == null) {
            return;
        }
        String str = (String) mapGet(map, "type");
        str.hashCode();
        if (!str.equals("concatenating")) {
            if (str.equals("looping")) {
                setShuffleOrder(mapGet(map, "child"));
            }
        } else {
            ((ConcatenatingMediaSource) mediaSource).setShuffleOrder(decodeShuffleOrder((List) mapGet(map, "shuffleOrder")));
            Iterator it = ((List) mapGet(map, "children")).iterator();
            while (it.hasNext()) {
                setShuffleOrder(it.next());
            }
        }
    }

    private MediaSource getAudioSource(Object obj) {
        Map map = (Map) obj;
        String str = (String) map.get(TtmlNode.ATTR_ID);
        MediaSource mediaSource = this.mediaSources.get(str);
        if (mediaSource != null) {
            return mediaSource;
        }
        MediaSource mediaSourceDecodeAudioSource = decodeAudioSource(map);
        this.mediaSources.put(str, mediaSourceDecodeAudioSource);
        return mediaSourceDecodeAudioSource;
    }

    private DefaultExtractorsFactory buildExtractorsFactory(Map<?, ?> map) {
        boolean zBooleanValue;
        boolean zBooleanValue2;
        int iIntValue;
        Map map2;
        DefaultExtractorsFactory defaultExtractorsFactory = new DefaultExtractorsFactory();
        if (map == null || (map2 = (Map) map.get("androidExtractorOptions")) == null) {
            zBooleanValue = true;
            zBooleanValue2 = false;
            iIntValue = 0;
        } else {
            zBooleanValue = ((Boolean) map2.get("constantBitrateSeekingEnabled")).booleanValue();
            zBooleanValue2 = ((Boolean) map2.get("constantBitrateSeekingAlwaysEnabled")).booleanValue();
            iIntValue = ((Integer) map2.get("mp3Flags")).intValue();
        }
        defaultExtractorsFactory.setConstantBitrateSeekingEnabled(zBooleanValue);
        defaultExtractorsFactory.setConstantBitrateSeekingAlwaysEnabled(zBooleanValue2);
        defaultExtractorsFactory.setMp3ExtractorFlags(iIntValue);
        return defaultExtractorsFactory;
    }

    private MediaSource decodeAudioSource(Object obj) {
        Map map;
        String str;
        int i;
        map = (Map) obj;
        str = (String) map.get(TtmlNode.ATTR_ID);
        String str2 = (String) map.get("type");
        str2.hashCode();
        switch (str2) {
            case "concatenating":
                return new ConcatenatingMediaSource(false, ((Boolean) map.get("useLazyPreparation")).booleanValue(), decodeShuffleOrder((List) mapGet(map, "shuffleOrder")), getAudioSourcesArray(map.get("children")));
            case "hls":
                return new HlsMediaSource.Factory(buildDataSourceFactory((Map) mapGet(map, "headers"))).createMediaSource(new MediaItem.Builder().setUri(Uri.parse((String) map.get("uri"))).setMimeType(MimeTypes.APPLICATION_M3U8).build());
            case "dash":
                return new DashMediaSource.Factory(buildDataSourceFactory((Map) mapGet(map, "headers"))).createMediaSource(new MediaItem.Builder().setUri(Uri.parse((String) map.get("uri"))).setMimeType(MimeTypes.APPLICATION_MPD).setTag(str).build());
            case "looping":
                Integer num = (Integer) map.get("count");
                MediaSource audioSource = getAudioSource(map.get("child"));
                int iIntValue = num.intValue();
                MediaSource[] mediaSourceArr = new MediaSource[iIntValue];
                for (i = 0; i < iIntValue; i++) {
                    mediaSourceArr[i] = audioSource;
                }
                return new ConcatenatingMediaSource(mediaSourceArr);
            case "clipping":
                Long l = getLong(map.get(TtmlNode.START));
                Long l2 = getLong(map.get(TtmlNode.END));
                return new ClippingMediaSource(getAudioSource(map.get("child")), l != null ? l.longValue() : 0L, l2 != null ? l2.longValue() : Long.MIN_VALUE);
            case "progressive":
                return new ProgressiveMediaSource.Factory(buildDataSourceFactory((Map) mapGet(map, "headers")), buildExtractorsFactory((Map) mapGet(map, "options"))).createMediaSource(new MediaItem.Builder().setUri(Uri.parse((String) map.get("uri"))).setTag(str).build());
            case "silence":
                return new SilenceMediaSource.Factory().setDurationUs(getLong(map.get("duration")).longValue()).setTag(str).createMediaSource();
            default:
                throw new IllegalArgumentException("Unknown AudioSource type: " + map.get("type"));
        }
    }

    private MediaSource[] getAudioSourcesArray(Object obj) {
        List<MediaSource> audioSources = getAudioSources(obj);
        MediaSource[] mediaSourceArr = new MediaSource[audioSources.size()];
        audioSources.toArray(mediaSourceArr);
        return mediaSourceArr;
    }

    private List<MediaSource> getAudioSources(Object obj) {
        if (!(obj instanceof List)) {
            throw new RuntimeException("List expected: " + obj);
        }
        List list = (List) obj;
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < list.size(); i++) {
            arrayList.add(getAudioSource(list.get(i)));
        }
        return arrayList;
    }

    private AudioEffect decodeAudioEffect(Object obj, int i) throws IllegalStateException, UnsupportedOperationException, IllegalArgumentException {
        Map map = (Map) obj;
        String str = (String) map.get("type");
        str.hashCode();
        if (str.equals("AndroidEqualizer")) {
            return new Equalizer(0, i);
        }
        if (!str.equals("AndroidLoudnessEnhancer")) {
            throw new IllegalArgumentException("Unknown AudioEffect type: " + map.get("type"));
        }
        int iRound = (int) Math.round(((Double) map.get("targetGain")).doubleValue() * 1000.0d);
        LoudnessEnhancer loudnessEnhancer = new LoudnessEnhancer(i);
        loudnessEnhancer.setTargetGain(iRound);
        return loudnessEnhancer;
    }

    private void clearAudioEffects() {
        Iterator<AudioEffect> it = this.audioEffects.iterator();
        while (it.hasNext()) {
            it.next().release();
            it.remove();
        }
        this.audioEffectsMap.clear();
    }

    private DataSource.Factory buildDataSourceFactory(Map<?, ?> map) {
        String userAgent;
        Map<String, String> mapCastToStringMap = castToStringMap(map);
        if (mapCastToStringMap != null) {
            userAgent = mapCastToStringMap.remove("User-Agent");
            if (userAgent == null) {
                userAgent = mapCastToStringMap.remove("user-agent");
            }
        } else {
            userAgent = null;
        }
        if (userAgent == null) {
            userAgent = Util.getUserAgent(this.context, "just_audio");
        }
        DefaultHttpDataSource.Factory allowCrossProtocolRedirects = new DefaultHttpDataSource.Factory().setUserAgent(userAgent).setAllowCrossProtocolRedirects(true);
        if (mapCastToStringMap != null && mapCastToStringMap.size() > 0) {
            allowCrossProtocolRedirects.setDefaultRequestProperties(mapCastToStringMap);
        }
        return new DefaultDataSource.Factory(this.context, allowCrossProtocolRedirects);
    }

    private void load(MediaSource mediaSource, long j, Integer num, MethodChannel.Result result) {
        this.initialPos = j;
        this.initialIndex = num;
        this.currentIndex = Integer.valueOf(num != null ? num.intValue() : 0);
        int i = AnonymousClass2.$SwitchMap$com$ryanheise$just_audio$AudioPlayer$ProcessingState[this.processingState.ordinal()];
        if (i != 1) {
            if (i == 2) {
                abortExistingConnection();
                this.player.stop();
            } else {
                this.player.stop();
            }
        }
        this.errorCount = 0;
        this.prepareResult = result;
        updatePosition();
        this.processingState = ProcessingState.loading;
        enqueuePlaybackEvent();
        this.mediaSource = mediaSource;
        this.player.setMediaSource(mediaSource);
        this.player.prepare();
    }

    /* renamed from: com.ryanheise.just_audio.AudioPlayer$2, reason: invalid class name */
    static /* synthetic */ class AnonymousClass2 {
        static final /* synthetic */ int[] $SwitchMap$com$ryanheise$just_audio$AudioPlayer$ProcessingState;

        static {
            int[] iArr = new int[ProcessingState.values().length];
            $SwitchMap$com$ryanheise$just_audio$AudioPlayer$ProcessingState = iArr;
            try {
                iArr[ProcessingState.none.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$ryanheise$just_audio$AudioPlayer$ProcessingState[ProcessingState.loading.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
        }
    }

    private void ensurePlayerInitialized() throws IllegalStateException, UnsupportedOperationException, IllegalArgumentException {
        if (this.player == null) {
            ExoPlayer.Builder builder = new ExoPlayer.Builder(this.context);
            LoadControl loadControl = this.loadControl;
            if (loadControl != null) {
                builder.setLoadControl(loadControl);
            }
            LivePlaybackSpeedControl livePlaybackSpeedControl = this.livePlaybackSpeedControl;
            if (livePlaybackSpeedControl != null) {
                builder.setLivePlaybackSpeedControl(livePlaybackSpeedControl);
            }
            ExoPlayer exoPlayerBuild = builder.build();
            this.player = exoPlayerBuild;
            exoPlayerBuild.setTrackSelectionParameters(exoPlayerBuild.getTrackSelectionParameters().buildUpon().setAudioOffloadPreferences(new TrackSelectionParameters.AudioOffloadPreferences.Builder().setIsGaplessSupportRequired(!this.offloadSchedulingEnabled).setIsSpeedChangeSupportRequired(!this.offloadSchedulingEnabled).setAudioOffloadMode(1).build()).build());
            setAudioSessionId(this.player.getAudioSessionId());
            this.player.addListener(this);
        }
    }

    private void setAudioAttributes(int i, int i2, int i3) {
        AudioAttributes.Builder builder = new AudioAttributes.Builder();
        builder.setContentType(i);
        builder.setFlags(i2);
        builder.setUsage(i3);
        AudioAttributes audioAttributesBuild = builder.build();
        if (this.processingState == ProcessingState.loading) {
            this.pendingAudioAttributes = audioAttributesBuild;
        } else {
            this.player.setAudioAttributes(audioAttributesBuild, false);
        }
    }

    private void audioEffectSetEnabled(String str, boolean z) throws IllegalStateException {
        this.audioEffectsMap.get(str).setEnabled(z);
    }

    private void loudnessEnhancerSetTargetGain(double d) throws IllegalStateException, UnsupportedOperationException, IllegalArgumentException {
        ((LoudnessEnhancer) this.audioEffectsMap.get("AndroidLoudnessEnhancer")).setTargetGain((int) Math.round(d * 1000.0d));
    }

    private Map<String, Object> equalizerAudioEffectGetParameters() {
        Equalizer equalizer = (Equalizer) this.audioEffectsMap.get("AndroidEqualizer");
        ArrayList arrayList = new ArrayList();
        for (short s = 0; s < equalizer.getNumberOfBands(); s = (short) (s + 1)) {
            arrayList.add(mapOf("index", Short.valueOf(s), "lowerFrequency", Double.valueOf(equalizer.getBandFreqRange(s)[0] / 1000.0d), "upperFrequency", Double.valueOf(equalizer.getBandFreqRange(s)[1] / 1000.0d), "centerFrequency", Double.valueOf(equalizer.getCenterFreq(s) / 1000.0d), "gain", Double.valueOf(equalizer.getBandLevel(s) / 1000.0d)));
        }
        return mapOf("parameters", mapOf("minDecibels", Double.valueOf(equalizer.getBandLevelRange()[0] / 1000.0d), "maxDecibels", Double.valueOf(equalizer.getBandLevelRange()[1] / 1000.0d), "bands", arrayList));
    }

    private void equalizerBandSetGain(int i, double d) throws IllegalStateException, UnsupportedOperationException, IllegalArgumentException {
        ((Equalizer) this.audioEffectsMap.get("AndroidEqualizer")).setBandLevel((short) i, (short) Math.round(d * 1000.0d));
    }

    private Map<String, Object> createPlaybackEvent() {
        HashMap map = new HashMap();
        Long lValueOf = getDuration() == C.TIME_UNSET ? null : Long.valueOf(getDuration() * 1000);
        ExoPlayer exoPlayer = this.player;
        this.bufferedPosition = exoPlayer != null ? exoPlayer.getBufferedPosition() : 0L;
        map.put("processingState", Integer.valueOf(this.processingState.ordinal()));
        map.put("updatePosition", Long.valueOf(this.updatePosition * 1000));
        map.put("updateTime", Long.valueOf(this.updateTime));
        map.put("bufferedPosition", Long.valueOf(Math.max(this.updatePosition, this.bufferedPosition) * 1000));
        map.put("icyMetadata", collectIcyMetadata());
        map.put("duration", lValueOf);
        map.put("currentIndex", this.currentIndex);
        map.put("androidAudioSessionId", this.audioSessionId);
        return map;
    }

    private void broadcastPendingPlaybackEvent() {
        Map<String, Object> map = this.pendingPlaybackEvent;
        if (map != null) {
            this.eventChannel.success(map);
            this.pendingPlaybackEvent = null;
        }
    }

    private void enqueuePlaybackEvent() {
        new HashMap();
        this.pendingPlaybackEvent = createPlaybackEvent();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void broadcastImmediatePlaybackEvent() {
        enqueuePlaybackEvent();
        broadcastPendingPlaybackEvent();
    }

    private Map<String, Object> collectIcyMetadata() {
        HashMap map = new HashMap();
        if (this.icyInfo != null) {
            HashMap map2 = new HashMap();
            map2.put("title", this.icyInfo.title);
            map2.put(IjkMediaPlayer.OnNativeInvokeListener.ARG_URL, this.icyInfo.url);
            map.put("info", map2);
        }
        if (this.icyHeaders != null) {
            HashMap map3 = new HashMap();
            map3.put(IjkMediaMeta.IJKM_KEY_BITRATE, Integer.valueOf(this.icyHeaders.bitrate));
            map3.put("genre", this.icyHeaders.genre);
            map3.put("name", this.icyHeaders.name);
            map3.put("metadataInterval", Integer.valueOf(this.icyHeaders.metadataInterval));
            map3.put(IjkMediaPlayer.OnNativeInvokeListener.ARG_URL, this.icyHeaders.url);
            map3.put("isPublic", Boolean.valueOf(this.icyHeaders.isPublic));
            map.put("headers", map3);
        }
        return map;
    }

    private long getCurrentPosition() {
        long j = this.initialPos;
        if (j != C.TIME_UNSET) {
            return j;
        }
        if (this.processingState == ProcessingState.none || this.processingState == ProcessingState.loading) {
            long currentPosition = this.player.getCurrentPosition();
            if (currentPosition < 0) {
                return 0L;
            }
            return currentPosition;
        }
        Long l = this.seekPos;
        if (l != null && l.longValue() != C.TIME_UNSET) {
            return this.seekPos.longValue();
        }
        return this.player.getCurrentPosition();
    }

    private long getDuration() {
        ExoPlayer exoPlayer;
        return (this.processingState == ProcessingState.none || this.processingState == ProcessingState.loading || (exoPlayer = this.player) == null) ? C.TIME_UNSET : exoPlayer.getDuration();
    }

    private void sendError(String str, String str2) {
        sendError(str, str2, null);
    }

    private void sendError(String str, String str2, Object obj) {
        MethodChannel.Result result = this.prepareResult;
        if (result != null) {
            result.error(str, str2, obj);
            this.prepareResult = null;
        }
        this.eventChannel.error(str, str2, obj);
    }

    private String getLowerCaseExtension(Uri uri) {
        String fragment = uri.getFragment();
        if (fragment == null || !fragment.contains(".")) {
            fragment = uri.getPath();
        }
        return fragment.replaceAll("^.*\\.", "").toLowerCase();
    }

    public void play(MethodChannel.Result result) {
        MethodChannel.Result result2;
        if (this.player.getPlayWhenReady()) {
            result.success(new HashMap());
            return;
        }
        MethodChannel.Result result3 = this.playResult;
        if (result3 != null) {
            result3.success(new HashMap());
        }
        this.playResult = result;
        this.player.setPlayWhenReady(true);
        updatePosition();
        if (this.processingState != ProcessingState.completed || (result2 = this.playResult) == null) {
            return;
        }
        result2.success(new HashMap());
        this.playResult = null;
    }

    public void pause() {
        if (this.player.getPlayWhenReady()) {
            this.player.setPlayWhenReady(false);
            updatePosition();
            MethodChannel.Result result = this.playResult;
            if (result != null) {
                result.success(new HashMap());
                this.playResult = null;
            }
        }
    }

    public void setVolume(float f) {
        this.player.setVolume(f);
    }

    public void setSpeed(float f) {
        PlaybackParameters playbackParameters = this.player.getPlaybackParameters();
        if (playbackParameters.speed == f) {
            return;
        }
        this.player.setPlaybackParameters(new PlaybackParameters(f, playbackParameters.pitch));
        if (this.player.getPlayWhenReady()) {
            updatePosition();
        }
        enqueuePlaybackEvent();
    }

    public void setPitch(float f) {
        PlaybackParameters playbackParameters = this.player.getPlaybackParameters();
        if (playbackParameters.pitch == f) {
            return;
        }
        this.player.setPlaybackParameters(new PlaybackParameters(playbackParameters.speed, f));
        enqueuePlaybackEvent();
    }

    public void setSkipSilenceEnabled(boolean z) {
        this.player.setSkipSilenceEnabled(z);
    }

    public void setLoopMode(int i) {
        this.player.setRepeatMode(i);
    }

    public void setShuffleModeEnabled(boolean z) {
        this.player.setShuffleModeEnabled(z);
    }

    public void seek(long j, Integer num, MethodChannel.Result result) {
        if (this.processingState == ProcessingState.none || this.processingState == ProcessingState.loading) {
            result.success(new HashMap());
            return;
        }
        abortSeek();
        this.seekPos = Long.valueOf(j);
        this.seekResult = result;
        try {
            this.player.seekTo(num != null ? num.intValue() : this.player.getCurrentMediaItemIndex(), j);
        } catch (RuntimeException e) {
            this.seekResult = null;
            this.seekPos = null;
            throw e;
        }
    }

    public void dispose() {
        if (this.processingState == ProcessingState.loading) {
            abortExistingConnection();
        }
        MethodChannel.Result result = this.playResult;
        if (result != null) {
            result.success(new HashMap());
            this.playResult = null;
        }
        this.mediaSources.clear();
        this.mediaSource = null;
        clearAudioEffects();
        ExoPlayer exoPlayer = this.player;
        if (exoPlayer != null) {
            exoPlayer.release();
            this.player = null;
            this.processingState = ProcessingState.none;
            broadcastImmediatePlaybackEvent();
        }
        this.eventChannel.endOfStream();
        this.dataEventChannel.endOfStream();
    }

    private void abortSeek() {
        MethodChannel.Result result = this.seekResult;
        if (result != null) {
            try {
                result.success(new HashMap());
            } catch (RuntimeException unused) {
            }
            this.seekResult = null;
            this.seekPos = null;
        }
    }

    private void abortExistingConnection() {
        sendError("abort", "Connection aborted");
    }

    public static Long getLong(Object obj) {
        return (obj == null || (obj instanceof Long)) ? (Long) obj : Long.valueOf(((Integer) obj).intValue());
    }

    static <T> T mapGet(Object obj, String str) {
        if (obj instanceof Map) {
            return (T) ((Map) obj).get(str);
        }
        return null;
    }

    static Map<String, Object> mapOf(Object... objArr) {
        HashMap map = new HashMap();
        for (int i = 0; i < objArr.length; i += 2) {
            map.put((String) objArr[i], objArr[i + 1]);
        }
        return map;
    }

    static Map<String, String> castToStringMap(Map<?, ?> map) {
        if (map == null) {
            return null;
        }
        HashMap map2 = new HashMap();
        for (Object obj : map.keySet()) {
            map2.put((String) obj, (String) map.get(obj));
        }
        return map2;
    }
}
