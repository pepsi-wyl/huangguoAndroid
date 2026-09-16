package androidx.media3.exoplayer;

/* loaded from: classes.dex */
public interface RendererCapabilitiesList {

    public interface Factory {
        RendererCapabilitiesList createRendererCapabilitiesList();
    }

    RendererCapabilities[] getRendererCapabilities();

    void release();

    int size();
}
