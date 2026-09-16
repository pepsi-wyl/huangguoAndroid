package androidx.media3.exoplayer;

/* loaded from: classes.dex */
public final class RendererConfiguration {
    public static final RendererConfiguration DEFAULT = new RendererConfiguration(0, false);
    public final int offloadModePreferred;
    public final boolean tunneling;

    public RendererConfiguration(boolean z) {
        this.offloadModePreferred = 0;
        this.tunneling = z;
    }

    public RendererConfiguration(int i, boolean z) {
        this.offloadModePreferred = i;
        this.tunneling = z;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        RendererConfiguration rendererConfiguration = (RendererConfiguration) obj;
        return this.offloadModePreferred == rendererConfiguration.offloadModePreferred && this.tunneling == rendererConfiguration.tunneling;
    }

    public int hashCode() {
        return (this.offloadModePreferred << 1) + (this.tunneling ? 1 : 0);
    }
}
