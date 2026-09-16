package io.flutter.embedding.engine.renderer;

import android.graphics.SurfaceTexture;
import android.os.Handler;
import android.view.Surface;
import io.flutter.embedding.engine.FlutterJNI;
import io.flutter.embedding.engine.renderer.FlutterRenderer;
import io.flutter.view.TextureRegistry;

/* loaded from: classes2.dex */
final class SurfaceTextureSurfaceProducer implements TextureRegistry.SurfaceProducer, TextureRegistry.GLTextureConsumer {
    private final FlutterJNI flutterJNI;
    private final Handler handler;
    private final long id;
    private boolean released;
    private int requestBufferWidth;
    private int requestedBufferHeight;
    private Surface surface;
    private final TextureRegistry.SurfaceTextureEntry texture;

    SurfaceTextureSurfaceProducer(long j, Handler handler, FlutterJNI flutterJNI, TextureRegistry.SurfaceTextureEntry surfaceTextureEntry) {
        this.id = j;
        this.handler = handler;
        this.flutterJNI = flutterJNI;
        this.texture = surfaceTextureEntry;
    }

    protected void finalize() throws Throwable {
        try {
            if (this.released) {
                return;
            }
            release();
            this.handler.post(new FlutterRenderer.TextureFinalizerRunnable(this.id, this.flutterJNI));
        } finally {
            super.finalize();
        }
    }

    @Override // io.flutter.view.TextureRegistry.TextureEntry
    public long id() {
        return this.id;
    }

    @Override // io.flutter.view.TextureRegistry.TextureEntry
    public void release() {
        this.texture.release();
        this.released = true;
    }

    @Override // io.flutter.view.TextureRegistry.GLTextureConsumer
    public SurfaceTexture getSurfaceTexture() {
        return this.texture.surfaceTexture();
    }

    @Override // io.flutter.view.TextureRegistry.SurfaceProducer
    public void setSize(int i, int i2) {
        this.requestBufferWidth = i;
        this.requestedBufferHeight = i2;
        getSurfaceTexture().setDefaultBufferSize(i, i2);
    }

    @Override // io.flutter.view.TextureRegistry.SurfaceProducer
    public int getWidth() {
        return this.requestBufferWidth;
    }

    @Override // io.flutter.view.TextureRegistry.SurfaceProducer
    public int getHeight() {
        return this.requestedBufferHeight;
    }

    @Override // io.flutter.view.TextureRegistry.SurfaceProducer
    public Surface getSurface() {
        if (this.surface == null) {
            this.surface = new Surface(this.texture.surfaceTexture());
        }
        return this.surface;
    }

    @Override // io.flutter.view.TextureRegistry.SurfaceProducer
    public void scheduleFrame() {
        this.flutterJNI.markTextureFrameAvailable(this.id);
    }
}
