package com.yosemiteyss.flutter_volume_controller;

import android.content.Context;
import android.media.AudioManager;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: Extensions.kt */
@Metadata(d1 = {"\u0000\u001a\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0006\n\u0000\n\u0002\u0018\u0002\n\u0000\u001a\u0014\u0010\u0005\u001a\u00020\u0006*\u00020\u00012\u0006\u0010\u0007\u001a\u00020\bH\u0000\"\u0018\u0010\u0000\u001a\u00020\u0001*\u00020\u00028@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b\u0003\u0010\u0004¨\u0006\t"}, d2 = {"audioManager", "Landroid/media/AudioManager;", "Landroid/content/Context;", "getAudioManager", "(Landroid/content/Context;)Landroid/media/AudioManager;", MethodName.GET_VOLUME, "", MethodArg.AUDIO_STREAM, "Lcom/yosemiteyss/flutter_volume_controller/AudioStream;", "flutter_volume_controller_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class ExtensionsKt {
    public static final double getVolume(AudioManager audioManager, AudioStream audioStream) {
        Intrinsics.checkNotNullParameter(audioManager, "<this>");
        Intrinsics.checkNotNullParameter(audioStream, "audioStream");
        return audioManager.getStreamVolume(audioStream.getStreamType()) / audioManager.getStreamMaxVolume(audioStream.getStreamType());
    }

    public static final AudioManager getAudioManager(Context context) {
        Intrinsics.checkNotNullParameter(context, "<this>");
        Object systemService = context.getSystemService("audio");
        Intrinsics.checkNotNull(systemService, "null cannot be cast to non-null type android.media.AudioManager");
        return (AudioManager) systemService;
    }
}
