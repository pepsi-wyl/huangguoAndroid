package com.example.image_gallery_saver_plus;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.provider.MediaStore;
import android.text.TextUtils;
import android.webkit.MimeTypeMap;
import androidx.core.app.NotificationCompat;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Locale;
import kotlin.Metadata;
import kotlin.io.FilesKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.StringsKt;

/* compiled from: ImageGallerySaverPlusPlugin.kt */
@Metadata(d1 = {"\u0000b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0005\u0018\u00002\u00020\u00012\u00020\u0002B\u0005¢\u0006\u0002\u0010\u0003J \u0010\b\u001a\u0004\u0018\u00010\t2\b\b\u0002\u0010\n\u001a\u00020\u000b2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000bH\u0002J\u0012\u0010\r\u001a\u0004\u0018\u00010\u000b2\u0006\u0010\n\u001a\u00020\u000bH\u0002J\u0012\u0010\u000e\u001a\u00020\u000f2\b\b\u0001\u0010\u0010\u001a\u00020\u0011H\u0016J\u0012\u0010\u0012\u001a\u00020\u000f2\b\b\u0001\u0010\u0010\u001a\u00020\u0011H\u0016J\u001c\u0010\u0013\u001a\u00020\u000f2\b\b\u0001\u0010\u0014\u001a\u00020\u00152\b\b\u0001\u0010\u0016\u001a\u00020\u0017H\u0016J<\u0010\u0018\u001a\"\u0012\u0004\u0012\u00020\u000b\u0012\u0006\u0012\u0004\u0018\u00010\u001a0\u0019j\u0010\u0012\u0004\u0012\u00020\u000b\u0012\u0006\u0012\u0004\u0018\u00010\u001a`\u001b2\b\u0010\u001c\u001a\u0004\u0018\u00010\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u000bH\u0002JK\u0010\u001d\u001a\"\u0012\u0004\u0012\u00020\u000b\u0012\u0006\u0012\u0004\u0018\u00010\u001a0\u0019j\u0010\u0012\u0004\u0012\u00020\u000b\u0012\u0006\u0012\u0004\u0018\u00010\u001a`\u001b2\b\u0010\u001e\u001a\u0004\u0018\u00010\u001f2\b\u0010 \u001a\u0004\u0018\u00010!2\b\u0010\f\u001a\u0004\u0018\u00010\u000bH\u0002¢\u0006\u0002\u0010\"J\u001a\u0010#\u001a\u00020\u000f2\u0006\u0010$\u001a\u00020\u00052\b\u0010%\u001a\u0004\u0018\u00010\tH\u0002R\u0010\u0010\u0004\u001a\u0004\u0018\u00010\u0005X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082.¢\u0006\u0002\n\u0000¨\u0006&"}, d2 = {"Lcom/example/image_gallery_saver_plus/ImageGallerySaverPlusPlugin;", "Lio/flutter/embedding/engine/plugins/FlutterPlugin;", "Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;", "()V", "applicationContext", "Landroid/content/Context;", "methodChannel", "Lio/flutter/plugin/common/MethodChannel;", "generateUri", "Landroid/net/Uri;", "extension", "", "name", "getMIMEType", "onAttachedToEngine", "", "binding", "Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;", "onDetachedFromEngine", "onMethodCall", NotificationCompat.CATEGORY_CALL, "Lio/flutter/plugin/common/MethodCall;", "result", "Lio/flutter/plugin/common/MethodChannel$Result;", "saveFileToGallery", "Ljava/util/HashMap;", "", "Lkotlin/collections/HashMap;", "filePath", "saveImageToGallery", "bmp", "Landroid/graphics/Bitmap;", "quality", "", "(Landroid/graphics/Bitmap;Ljava/lang/Integer;Ljava/lang/String;)Ljava/util/HashMap;", "sendBroadcast", "context", "fileUri", "image_gallery_saver_plus_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class ImageGallerySaverPlusPlugin implements FlutterPlugin, MethodChannel.MethodCallHandler {
    private Context applicationContext;
    private MethodChannel methodChannel;

    @Override // io.flutter.embedding.engine.plugins.FlutterPlugin
    public void onAttachedToEngine(FlutterPlugin.FlutterPluginBinding binding) {
        Intrinsics.checkNotNullParameter(binding, "binding");
        this.applicationContext = binding.getApplicationContext();
        MethodChannel methodChannel = new MethodChannel(binding.getBinaryMessenger(), "image_gallery_saver_plus");
        this.methodChannel = methodChannel;
        methodChannel.setMethodCallHandler(this);
    }

    @Override // io.flutter.plugin.common.MethodChannel.MethodCallHandler
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        Intrinsics.checkNotNullParameter(call, "call");
        Intrinsics.checkNotNullParameter(result, "result");
        String str = call.method;
        if (Intrinsics.areEqual(str, "saveImageToGallery")) {
            byte[] bArr = (byte[]) call.argument("imageBytes");
            result.success(saveImageToGallery(BitmapFactory.decodeByteArray(bArr == null ? new byte[0] : bArr, 0, bArr != null ? bArr.length : 0), (Integer) call.argument("quality"), (String) call.argument("name")));
        } else if (Intrinsics.areEqual(str, "saveFileToGallery")) {
            result.success(saveFileToGallery((String) call.argument("file"), (String) call.argument("name")));
        } else {
            result.notImplemented();
        }
    }

    @Override // io.flutter.embedding.engine.plugins.FlutterPlugin
    public void onDetachedFromEngine(FlutterPlugin.FlutterPluginBinding binding) {
        Intrinsics.checkNotNullParameter(binding, "binding");
        this.applicationContext = null;
        MethodChannel methodChannel = this.methodChannel;
        if (methodChannel == null) {
            Intrinsics.throwUninitializedPropertyAccessException("methodChannel");
            methodChannel = null;
        }
        methodChannel.setMethodCallHandler(null);
    }

    static /* synthetic */ Uri generateUri$default(ImageGallerySaverPlusPlugin imageGallerySaverPlusPlugin, String str, String str2, int i, Object obj) {
        if ((i & 1) != 0) {
            str = "";
        }
        if ((i & 2) != 0) {
            str2 = null;
        }
        return imageGallerySaverPlusPlugin.generateUri(str, str2);
    }

    private final Uri generateUri(String extension, String name) {
        String str;
        Uri uri;
        String str2;
        ContentResolver contentResolver;
        if (name == null) {
            name = String.valueOf(System.currentTimeMillis());
        }
        String mIMEType = getMIMEType(extension);
        boolean z = false;
        if (mIMEType != null && StringsKt.startsWith$default(mIMEType, "video", false, 2, (Object) null)) {
            z = true;
        }
        if (Build.VERSION.SDK_INT >= 29) {
            if (z) {
                uri = MediaStore.Video.Media.EXTERNAL_CONTENT_URI;
            } else {
                uri = MediaStore.Images.Media.EXTERNAL_CONTENT_URI;
            }
            ContentValues contentValues = new ContentValues();
            contentValues.put("_display_name", name);
            if (z) {
                str2 = Environment.DIRECTORY_MOVIES;
            } else {
                str2 = Environment.DIRECTORY_PICTURES;
            }
            contentValues.put("relative_path", str2);
            if (!TextUtils.isEmpty(mIMEType)) {
                contentValues.put("mime_type", mIMEType);
            }
            Context context = this.applicationContext;
            if (context == null || (contentResolver = context.getContentResolver()) == null) {
                return null;
            }
            return contentResolver.insert(uri, contentValues);
        }
        if (z) {
            str = Environment.DIRECTORY_MOVIES;
        } else {
            str = Environment.DIRECTORY_PICTURES;
        }
        File file = new File(Environment.getExternalStoragePublicDirectory(str).getAbsolutePath());
        if (!file.exists()) {
            file.mkdir();
        }
        if (extension.length() > 0) {
            name = name + '.' + extension;
        }
        return Uri.fromFile(new File(file, name));
    }

    private final String getMIMEType(String extension) {
        if (TextUtils.isEmpty(extension)) {
            return null;
        }
        MimeTypeMap singleton = MimeTypeMap.getSingleton();
        String lowerCase = extension.toLowerCase(Locale.ROOT);
        Intrinsics.checkNotNullExpressionValue(lowerCase, "toLowerCase(...)");
        return singleton.getMimeTypeFromExtension(lowerCase);
    }

    private final void sendBroadcast(Context context, Uri fileUri) {
        if (Build.VERSION.SDK_INT < 29) {
            Intent intent = new Intent("android.intent.action.MEDIA_SCANNER_SCAN_FILE");
            intent.setData(fileUri);
            context.sendBroadcast(intent);
        }
    }

    /* JADX WARN: Not initialized variable reg: 5, insn: 0x00a3: MOVE (r2 I:??[OBJECT, ARRAY]) = (r5 I:??[OBJECT, ARRAY]), block:B:42:0x00a3 */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0055  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0078  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0096  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00a6  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final HashMap<String, Object> saveImageToGallery(Bitmap bmp, Integer quality, String name) throws Throwable {
        Uri uriGenerateUri;
        OutputStream outputStreamOpenOutputStream;
        OutputStream outputStream;
        boolean z;
        OutputStream outputStream2 = null;
        if (bmp == null || quality == null) {
            return new SaveResultModel(false, null, "parameters error").toHashMap();
        }
        Context context = this.applicationContext;
        if (context == null) {
            return new SaveResultModel(false, null, "applicationContext null").toHashMap();
        }
        try {
            try {
                try {
                    uriGenerateUri = generateUri("jpg", name);
                } catch (Throwable th) {
                    th = th;
                    outputStream2 = outputStream;
                    if (outputStream2 != null) {
                        outputStream2.close();
                    }
                    bmp.recycle();
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                if (outputStream2 != null) {
                }
                bmp.recycle();
                throw th;
            }
        } catch (IOException e) {
            e = e;
            uriGenerateUri = null;
            outputStreamOpenOutputStream = null;
        }
        if (uriGenerateUri != null) {
            try {
                outputStreamOpenOutputStream = context.getContentResolver().openOutputStream(uriGenerateUri);
                if (outputStreamOpenOutputStream != null) {
                    try {
                        System.out.println((Object) ("ImageGallerySaverPlugin " + quality));
                        bmp.compress(Bitmap.CompressFormat.JPEG, quality.intValue(), outputStreamOpenOutputStream);
                        outputStreamOpenOutputStream.flush();
                        z = true;
                    } catch (IOException e2) {
                        e = e2;
                        new SaveResultModel(false, null, e.toString()).toHashMap();
                        if (outputStreamOpenOutputStream != null) {
                            outputStreamOpenOutputStream.close();
                        }
                        bmp.recycle();
                        z = false;
                        if (z) {
                        }
                    }
                }
                if (outputStreamOpenOutputStream != null) {
                    outputStreamOpenOutputStream.close();
                }
                bmp.recycle();
            } catch (IOException e3) {
                e = e3;
                outputStreamOpenOutputStream = null;
            }
            if (z) {
                sendBroadcast(context, uriGenerateUri);
                return new SaveResultModel(String.valueOf(uriGenerateUri).length() > 0, String.valueOf(uriGenerateUri), null).toHashMap();
            }
            return new SaveResultModel(false, null, "saveImageToGallery fail").toHashMap();
        }
        outputStreamOpenOutputStream = null;
        z = false;
        if (outputStreamOpenOutputStream != null) {
        }
        bmp.recycle();
        if (z) {
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:47:0x0095  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x009a  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00bf  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00dd  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x00ed  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x00f2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final HashMap<String, Object> saveFileToGallery(String filePath, String name) throws Throwable {
        FileInputStream fileInputStream;
        Uri uri;
        OutputStream outputStream;
        boolean z;
        File file;
        OutputStream outputStreamOpenOutputStream;
        OutputStream outputStream2 = null;
        if (filePath == null) {
            return new SaveResultModel(false, null, "parameters error").toHashMap();
        }
        Context context = this.applicationContext;
        if (context == null) {
            return new SaveResultModel(false, null, "applicationContext null").toHashMap();
        }
        try {
            try {
                file = new File(filePath);
            } catch (IOException e) {
                e = e;
                uri = null;
                outputStream = null;
                fileInputStream = null;
            }
            if (!file.exists()) {
                return new SaveResultModel(false, null, filePath + " does not exist").toHashMap();
            }
            Uri uriGenerateUri = generateUri(FilesKt.getExtension(file), name);
            if (uriGenerateUri != null) {
                try {
                    ContentResolver contentResolver = context.getContentResolver();
                    outputStreamOpenOutputStream = contentResolver != null ? contentResolver.openOutputStream(uriGenerateUri) : null;
                } catch (IOException e2) {
                    outputStream = null;
                    fileInputStream = null;
                    uri = uriGenerateUri;
                    e = e2;
                }
                if (outputStreamOpenOutputStream != null) {
                    try {
                        fileInputStream = new FileInputStream(file);
                        try {
                            byte[] bArr = new byte[10240];
                            while (true) {
                                int i = fileInputStream.read(bArr);
                                if (i <= 0) {
                                    break;
                                }
                                outputStreamOpenOutputStream.write(bArr, 0, i);
                            }
                            outputStreamOpenOutputStream.flush();
                            z = true;
                            if (outputStreamOpenOutputStream != null) {
                                outputStreamOpenOutputStream.close();
                            }
                            if (fileInputStream != null) {
                                fileInputStream.close();
                            }
                        } catch (IOException e3) {
                            e = e3;
                            OutputStream outputStream3 = outputStreamOpenOutputStream;
                            uri = uriGenerateUri;
                            e = e;
                            outputStream = outputStream3;
                            try {
                                new SaveResultModel(false, null, e.toString()).toHashMap();
                                if (outputStream != null) {
                                    outputStream.close();
                                }
                                if (fileInputStream != null) {
                                    fileInputStream.close();
                                }
                                uriGenerateUri = uri;
                                z = false;
                                if (z) {
                                }
                            } catch (Throwable th) {
                                th = th;
                                outputStream2 = outputStream;
                                if (outputStream2 != null) {
                                    outputStream2.close();
                                }
                                if (fileInputStream != null) {
                                    fileInputStream.close();
                                }
                                throw th;
                            }
                        } catch (Throwable th2) {
                            th = th2;
                            outputStream2 = outputStreamOpenOutputStream;
                            if (outputStream2 != null) {
                            }
                            if (fileInputStream != null) {
                            }
                            throw th;
                        }
                    } catch (IOException e4) {
                        e = e4;
                        fileInputStream = null;
                    } catch (Throwable th3) {
                        th = th3;
                        fileInputStream = null;
                    }
                    if (z) {
                        sendBroadcast(context, uriGenerateUri);
                        return new SaveResultModel(String.valueOf(uriGenerateUri).length() > 0, String.valueOf(uriGenerateUri), null).toHashMap();
                    }
                    return new SaveResultModel(false, null, "saveFileToGallery fail").toHashMap();
                }
                fileInputStream = null;
            } else {
                outputStreamOpenOutputStream = null;
                fileInputStream = null;
            }
            z = false;
            if (outputStreamOpenOutputStream != null) {
            }
            if (fileInputStream != null) {
            }
            if (z) {
            }
        } catch (Throwable th4) {
            th = th4;
            fileInputStream = null;
        }
    }
}
