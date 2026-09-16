package io.flutter.plugins.videoplayer;

/* loaded from: classes2.dex */
interface VideoPlayerCallbacks {
    void onBufferingEnd();

    void onBufferingStart();

    void onBufferingUpdate(long j);

    void onCompleted();

    void onError(String str, String str2, Object obj);

    void onInitialized(int i, int i2, long j, int i3);

    void onIsPlayingStateUpdate(boolean z);
}
