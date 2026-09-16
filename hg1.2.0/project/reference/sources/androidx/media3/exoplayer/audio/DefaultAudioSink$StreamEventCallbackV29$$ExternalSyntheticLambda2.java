package androidx.media3.exoplayer.audio;

import android.os.Handler;
import java.util.concurrent.Executor;

/* compiled from: D8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class DefaultAudioSink$StreamEventCallbackV29$$ExternalSyntheticLambda2 implements Executor {
    public final /* synthetic */ Handler f$0;

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        this.f$0.post(runnable);
    }
}
