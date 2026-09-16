package io.flutter.plugin.platform;

import android.graphics.SurfaceTexture;
import android.os.Build;
import android.view.Surface;
import io.flutter.plugin.platform.PlatformViewRenderTarget;
import io.flutter.view.TextureRegistry;

/* loaded from: classes2.dex */
public class SurfaceTexturePlatformViewRenderTarget implements PlatformViewRenderTarget {
    private static final String TAG = "SurfaceTexturePlatformViewRenderTarget";
    private Surface surface;
    private SurfaceTexture surfaceTexture;
    private final TextureRegistry.SurfaceTextureEntry surfaceTextureEntry;
    private final TextureRegistry.OnTrimMemoryListener trimMemoryListener;
    private int bufferWidth = 0;
    private int bufferHeight = 0;
    private boolean shouldRecreateSurfaceForLowMemory = false;

    @Override // io.flutter.plugin.platform.PlatformViewRenderTarget
    public /* synthetic */ void scheduleFrame() {
        PlatformViewRenderTarget.CC.$default$scheduleFrame(this);
    }

    private void recreateSurfaceIfNeeded() {
        Surface surface = this.surface;
        if (surface == null || this.shouldRecreateSurfaceForLowMemory) {
            if (surface != null) {
                surface.release();
                this.surface = null;
            }
            this.surface = createSurface();
            this.shouldRecreateSurfaceForLowMemory = false;
        }
    }

    protected Surface createSurface() {
        return new Surface(this.surfaceTexture);
    }

    public SurfaceTexturePlatformViewRenderTarget(TextureRegistry.SurfaceTextureEntry surfaceTextureEntry) {
        TextureRegistry.OnTrimMemoryListener onTrimMemoryListener = new TextureRegistry.OnTrimMemoryListener() { // from class: io.flutter.plugin.platform.SurfaceTexturePlatformViewRenderTarget.1
            @Override // io.flutter.view.TextureRegistry.OnTrimMemoryListener
            public void onTrimMemory(int i) {
                if (i != 80 || Build.VERSION.SDK_INT < 29) {
                    return;
                }
                SurfaceTexturePlatformViewRenderTarget.this.shouldRecreateSurfaceForLowMemory = true;
            }
        };
        this.trimMemoryListener = onTrimMemoryListener;
        if (Build.VERSION.SDK_INT < 23) {
            throw new UnsupportedOperationException("Platform views cannot be displayed below API level 23You can prevent this issue by setting `minSdkVersion: 23` in build.gradle.");
        }
        this.surfaceTextureEntry = surfaceTextureEntry;
        this.surfaceTexture = surfaceTextureEntry.surfaceTexture();
        surfaceTextureEntry.setOnTrimMemoryListener(onTrimMemoryListener);
    }

    @Override // io.flutter.plugin.platform.PlatformViewRenderTarget
    public void resize(int i, int i2) {
        this.bufferWidth = i;
        this.bufferHeight = i2;
        SurfaceTexture surfaceTexture = this.surfaceTexture;
        if (surfaceTexture != null) {
            surfaceTexture.setDefaultBufferSize(i, i2);
        }
    }

    @Override // io.flutter.plugin.platform.PlatformViewRenderTarget
    public int getWidth() {
        return this.bufferWidth;
    }

    @Override // io.flutter.plugin.platform.PlatformViewRenderTarget
    public int getHeight() {
        return this.bufferHeight;
    }

    @Override // io.flutter.plugin.platform.PlatformViewRenderTarget
    public long getId() {
        return this.surfaceTextureEntry.id();
    }

    @Override // io.flutter.plugin.platform.PlatformViewRenderTarget
    public boolean isReleased() {
        return this.surfaceTexture == null;
    }

    @Override // io.flutter.plugin.platform.PlatformViewRenderTarget
    public void release() {
        this.surfaceTexture = null;
        Surface surface = this.surface;
        if (surface != null) {
            surface.release();
            this.surface = null;
        }
    }

    @Override // io.flutter.plugin.platform.PlatformViewRenderTarget
    public Surface getSurface() {
        recreateSurfaceIfNeeded();
        SurfaceTexture surfaceTexture = this.surfaceTexture;
        if (surfaceTexture == null || surfaceTexture.isReleased()) {
            return null;
        }
        return this.surface;
    }
}
