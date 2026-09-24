package io.flutter.plugins.webviewflutter;

/* compiled from: D8$$SyntheticClass */
/* loaded from: classes2.dex */
public final /* synthetic */ class InstanceManager$$ExternalSyntheticLambda0 implements Runnable {
    public final /* synthetic */ InstanceManager f$0;

    public /* synthetic */ InstanceManager$$ExternalSyntheticLambda0(InstanceManager instanceManager) {
        this.f$0 = instanceManager;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.f$0.releaseAllFinalizedInstances();
    }
}
