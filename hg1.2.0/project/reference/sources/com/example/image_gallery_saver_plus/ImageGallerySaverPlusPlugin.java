package com.example.image_gallery_saver_plus;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
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
import java.util.Locale;
import kotlin.Metadata;
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
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.util.HashMap<java.lang.String, java.lang.Object> saveImageToGallery(android.graphics.Bitmap r8, java.lang.Integer r9, java.lang.String r10) throws java.lang.Throwable {
        /*
            r7 = this;
            java.lang.String r0 = "ImageGallerySaverPlugin "
            r1 = 0
            r2 = 0
            if (r8 == 0) goto Lad
            if (r9 != 0) goto La
            goto Lad
        La:
            android.content.Context r3 = r7.applicationContext
            if (r3 != 0) goto L1a
            com.example.image_gallery_saver_plus.SaveResultModel r8 = new com.example.image_gallery_saver_plus.SaveResultModel
            java.lang.String r9 = "applicationContext null"
            r8.<init>(r1, r2, r9)
            java.util.HashMap r8 = r8.toHashMap()
            return r8
        L1a:
            r4 = 1
            java.lang.String r5 = "jpg"
            android.net.Uri r10 = r7.generateUri(r5, r10)     // Catch: java.lang.Throwable -> L5c java.io.IOException -> L5e
            if (r10 == 0) goto L51
            android.content.ContentResolver r5 = r3.getContentResolver()     // Catch: java.io.IOException -> L4e java.lang.Throwable -> L5c
            java.io.OutputStream r5 = r5.openOutputStream(r10)     // Catch: java.io.IOException -> L4e java.lang.Throwable -> L5c
            if (r5 == 0) goto L52
            java.lang.StringBuilder r6 = new java.lang.StringBuilder     // Catch: java.io.IOException -> L4c java.lang.Throwable -> La2
            r6.<init>(r0)     // Catch: java.io.IOException -> L4c java.lang.Throwable -> La2
            r6.append(r9)     // Catch: java.io.IOException -> L4c java.lang.Throwable -> La2
            java.lang.String r0 = r6.toString()     // Catch: java.io.IOException -> L4c java.lang.Throwable -> La2
            java.io.PrintStream r6 = java.lang.System.out     // Catch: java.io.IOException -> L4c java.lang.Throwable -> La2
            r6.println(r0)     // Catch: java.io.IOException -> L4c java.lang.Throwable -> La2
            android.graphics.Bitmap$CompressFormat r0 = android.graphics.Bitmap.CompressFormat.JPEG     // Catch: java.io.IOException -> L4c java.lang.Throwable -> La2
            int r9 = r9.intValue()     // Catch: java.io.IOException -> L4c java.lang.Throwable -> La2
            r8.compress(r0, r9, r5)     // Catch: java.io.IOException -> L4c java.lang.Throwable -> La2
            r5.flush()     // Catch: java.io.IOException -> L4c java.lang.Throwable -> La2
            r9 = 1
            goto L53
        L4c:
            r9 = move-exception
            goto L61
        L4e:
            r9 = move-exception
            r5 = r2
            goto L61
        L51:
            r5 = r2
        L52:
            r9 = 0
        L53:
            if (r5 == 0) goto L58
            r5.close()
        L58:
            r8.recycle()
            goto L76
        L5c:
            r9 = move-exception
            goto La4
        L5e:
            r9 = move-exception
            r10 = r2
            r5 = r10
        L61:
            com.example.image_gallery_saver_plus.SaveResultModel r0 = new com.example.image_gallery_saver_plus.SaveResultModel     // Catch: java.lang.Throwable -> La2
            java.lang.String r9 = r9.toString()     // Catch: java.lang.Throwable -> La2
            r0.<init>(r1, r2, r9)     // Catch: java.lang.Throwable -> La2
            r0.toHashMap()     // Catch: java.lang.Throwable -> La2
            if (r5 == 0) goto L72
            r5.close()
        L72:
            r8.recycle()
            r9 = 0
        L76:
            if (r9 == 0) goto L96
            r7.sendBroadcast(r3, r10)
            com.example.image_gallery_saver_plus.SaveResultModel r8 = new com.example.image_gallery_saver_plus.SaveResultModel
            java.lang.String r9 = java.lang.String.valueOf(r10)
            java.lang.CharSequence r9 = (java.lang.CharSequence) r9
            int r9 = r9.length()
            if (r9 <= 0) goto L8a
            r1 = 1
        L8a:
            java.lang.String r9 = java.lang.String.valueOf(r10)
            r8.<init>(r1, r9, r2)
            java.util.HashMap r8 = r8.toHashMap()
            goto La1
        L96:
            com.example.image_gallery_saver_plus.SaveResultModel r8 = new com.example.image_gallery_saver_plus.SaveResultModel
            java.lang.String r9 = "saveImageToGallery fail"
            r8.<init>(r1, r2, r9)
            java.util.HashMap r8 = r8.toHashMap()
        La1:
            return r8
        La2:
            r9 = move-exception
            r2 = r5
        La4:
            if (r2 == 0) goto La9
            r2.close()
        La9:
            r8.recycle()
            throw r9
        Lad:
            com.example.image_gallery_saver_plus.SaveResultModel r8 = new com.example.image_gallery_saver_plus.SaveResultModel
            java.lang.String r9 = "parameters error"
            r8.<init>(r1, r2, r9)
            java.util.HashMap r8 = r8.toHashMap()
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: com.example.image_gallery_saver_plus.ImageGallerySaverPlusPlugin.saveImageToGallery(android.graphics.Bitmap, java.lang.Integer, java.lang.String):java.util.HashMap");
    }

    /* JADX WARN: Removed duplicated region for block: B:47:0x0095  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x009a  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00bf  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00dd  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x00ed  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x00f2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.util.HashMap<java.lang.String, java.lang.Object> saveFileToGallery(java.lang.String r9, java.lang.String r10) throws java.lang.Throwable {
        /*
            Method dump skipped, instructions count: 246
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.example.image_gallery_saver_plus.ImageGallerySaverPlusPlugin.saveFileToGallery(java.lang.String, java.lang.String):java.util.HashMap");
    }
}
