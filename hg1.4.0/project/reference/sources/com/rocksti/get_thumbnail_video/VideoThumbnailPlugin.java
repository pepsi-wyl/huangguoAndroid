package com.rocksti.get_thumbnail_video;

import android.content.Context;
import android.graphics.Bitmap;
import android.media.MediaMetadataRetriever;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import tv.danmaku.ijk.media.player.IjkMediaMeta;

/* loaded from: classes2.dex */
public class VideoThumbnailPlugin implements FlutterPlugin, MethodChannel.MethodCallHandler {
    private static final String TAG = "ThumbnailPlugin";
    private MethodChannel channel;
    private Context context;
    private ExecutorService executor;

    @Override // io.flutter.embedding.engine.plugins.FlutterPlugin
    public void onAttachedToEngine(FlutterPlugin.FlutterPluginBinding flutterPluginBinding) {
        this.context = flutterPluginBinding.getApplicationContext();
        this.executor = Executors.newCachedThreadPool();
        MethodChannel methodChannel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "video_thumbnail");
        this.channel = methodChannel;
        methodChannel.setMethodCallHandler(this);
    }

    @Override // io.flutter.embedding.engine.plugins.FlutterPlugin
    public void onDetachedFromEngine(FlutterPlugin.FlutterPluginBinding flutterPluginBinding) {
        this.channel.setMethodCallHandler(null);
        this.channel = null;
        this.executor.shutdown();
        this.executor = null;
    }

    @Override // io.flutter.plugin.common.MethodChannel.MethodCallHandler
    public void onMethodCall(MethodCall methodCall, final MethodChannel.Result result) {
        final Map map = (Map) methodCall.arguments();
        final Map map2 = (Map) map.get("headers");
        final String str = (String) map.get("video");
        final int iIntValue = ((Integer) map.get(IjkMediaMeta.IJKM_KEY_FORMAT)).intValue();
        final int iIntValue2 = ((Integer) map.get("maxh")).intValue();
        final int iIntValue3 = ((Integer) map.get("maxw")).intValue();
        final int iIntValue4 = ((Integer) map.get("timeMs")).intValue();
        final int iIntValue5 = ((Integer) map.get("quality")).intValue();
        final String str2 = methodCall.method;
        this.executor.execute(new Runnable() { // from class: com.rocksti.get_thumbnail_video.VideoThumbnailPlugin$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.m450x5400d985(str2, map, str, map2, iIntValue, iIntValue2, iIntValue3, iIntValue4, iIntValue5, result);
            }
        });
    }

    /* renamed from: lambda$onMethodCall$0$com-rocksti-get_thumbnail_video-VideoThumbnailPlugin, reason: not valid java name */
    /* synthetic */ void m450x5400d985(String str, Map map, String str2, Map map2, int i, int i2, int i3, int i4, int i5, MethodChannel.Result result) {
        MethodChannel.Result result2;
        Object objBuildThumbnailData;
        Object obj = null;
        boolean z = false;
        try {
        } catch (Exception e) {
            e = e;
            result2 = result;
        }
        if (str.equals("file")) {
            objBuildThumbnailData = buildThumbnailFile(str2, map2, (String) map.get("path"), i, i2, i3, i4, i5);
        } else {
            if (!str.equals("data")) {
                objBuildThumbnailData = null;
                result2 = result;
                obj = objBuildThumbnailData;
                e = null;
                onResult(result2, obj, z, e);
            }
            objBuildThumbnailData = buildThumbnailData(str2, map2, i, i2, i3, i4, i5);
        }
        z = true;
        result2 = result;
        obj = objBuildThumbnailData;
        e = null;
        onResult(result2, obj, z, e);
    }

    private static Bitmap.CompressFormat intToFormat(int i) {
        if (i == 1) {
            return Bitmap.CompressFormat.PNG;
        }
        if (i != 2) {
            return Bitmap.CompressFormat.JPEG;
        }
        return Bitmap.CompressFormat.WEBP_LOSSLESS;
    }

    private static String formatExt(int i) {
        if (i == 1) {
            return "png";
        }
        if (i != 2) {
            return "jpg";
        }
        return "webp";
    }

    private byte[] buildThumbnailData(String str, Map<String, String> map, int i, int i2, int i3, int i4, int i5) throws IOException {
        Bitmap bitmapCreateVideoThumbnail = createVideoThumbnail(str, map, i2, i3, i4);
        bitmapCreateVideoThumbnail.getClass();
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        bitmapCreateVideoThumbnail.compress(intToFormat(i), i5, byteArrayOutputStream);
        bitmapCreateVideoThumbnail.recycle();
        return byteArrayOutputStream.toByteArray();
    }

    private String buildThumbnailFile(String str, Map<String, String> map, String str2, int i, int i2, int i3, int i4, int i5) throws IOException {
        byte[] bArrBuildThumbnailData = buildThumbnailData(str, map, i, i2, i3, i4, i5);
        String ext = formatExt(i);
        String str3 = str.substring(0, str.lastIndexOf(".") + 1) + ext;
        String absolutePath = (str2 != null || (str.startsWith("/") || str.startsWith("file://"))) ? str2 : this.context.getCacheDir().getAbsolutePath();
        if (absolutePath != null) {
            if (absolutePath.endsWith(ext)) {
                str3 = absolutePath;
            } else {
                int iLastIndexOf = str3.lastIndexOf("/");
                if (absolutePath.endsWith("/")) {
                    str3 = absolutePath + str3.substring(iLastIndexOf + 1);
                } else {
                    str3 = absolutePath + str3.substring(iLastIndexOf);
                }
            }
        }
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(str3);
            fileOutputStream.write(bArrBuildThumbnailData);
            fileOutputStream.close();
            Log.d(TAG, String.format("buildThumbnailFile( written:%d )", Integer.valueOf(bArrBuildThumbnailData.length)));
            return str3;
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    private void onResult(final MethodChannel.Result result, final Object obj, final boolean z, final Exception exc) {
        runOnUiThread(new Runnable() { // from class: com.rocksti.get_thumbnail_video.VideoThumbnailPlugin$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() {
                VideoThumbnailPlugin.lambda$onResult$1(z, result, exc, obj);
            }
        });
    }

    static /* synthetic */ void lambda$onResult$1(boolean z, MethodChannel.Result result, Exception exc, Object obj) {
        if (!z) {
            result.notImplemented();
        } else if (exc != null) {
            exc.printStackTrace();
            result.error("exception", exc.getMessage(), null);
        } else {
            result.success(obj);
        }
    }

    private static void runOnUiThread(Runnable runnable) {
        new Handler(Looper.getMainLooper()).post(runnable);
    }

    public Bitmap createVideoThumbnail(String str, Map<String, String> map, int i, int i2, int i3) throws IOException {
        Bitmap bitmapCreateScaledBitmap;
        MediaMetadataRetriever mediaMetadataRetriever = new MediaMetadataRetriever();
        try {
            try {
                if (str.startsWith("/")) {
                    setDataSource(str, mediaMetadataRetriever);
                } else if (str.startsWith("file://")) {
                    setDataSource(str.substring(7), mediaMetadataRetriever);
                } else {
                    if (map == null) {
                        map = new HashMap<>();
                    }
                    mediaMetadataRetriever.setDataSource(str, map);
                }
                if (i != 0 || i2 != 0) {
                    if (Build.VERSION.SDK_INT >= 27 && i != 0 && i2 != 0) {
                        bitmapCreateScaledBitmap = mediaMetadataRetriever.getScaledFrameAtTime(i3 * 1000, 3, i2, i);
                    } else {
                        Bitmap frameAtTime = mediaMetadataRetriever.getFrameAtTime(i3 * 1000, 3);
                        if (frameAtTime != null) {
                            int width = frameAtTime.getWidth();
                            int height = frameAtTime.getHeight();
                            if (i2 == 0) {
                                i2 = Math.round((i / height) * width);
                            }
                            if (i == 0) {
                                i = Math.round((i2 / width) * height);
                            }
                            Log.d(TAG, String.format("original w:%d, h:%d => %d, %d", Integer.valueOf(width), Integer.valueOf(height), Integer.valueOf(i2), Integer.valueOf(i)));
                            bitmapCreateScaledBitmap = Bitmap.createScaledBitmap(frameAtTime, i2, i, true);
                        } else {
                            bitmapCreateScaledBitmap = frameAtTime;
                        }
                    }
                } else {
                    bitmapCreateScaledBitmap = mediaMetadataRetriever.getFrameAtTime(i3 * 1000, 3);
                }
                try {
                    mediaMetadataRetriever.release();
                    return bitmapCreateScaledBitmap;
                } catch (IOException | RuntimeException e) {
                    e.printStackTrace();
                    return bitmapCreateScaledBitmap;
                }
            } finally {
                try {
                    mediaMetadataRetriever.release();
                } catch (IOException | RuntimeException e2) {
                    e2.printStackTrace();
                }
            }
        } catch (IOException | RuntimeException e3) {
            e3.printStackTrace();
            return null;
        }
    }

    private static void setDataSource(String str, MediaMetadataRetriever mediaMetadataRetriever) throws IOException {
        FileInputStream fileInputStream = new FileInputStream(new File(str).getAbsolutePath());
        try {
            mediaMetadataRetriever.setDataSource(fileInputStream.getFD());
            fileInputStream.close();
        } catch (Throwable th) {
            try {
                fileInputStream.close();
            } catch (Throwable th2) {
                th.addSuppressed(th2);
            }
            throw th;
        }
    }
}
