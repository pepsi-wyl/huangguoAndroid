package io.flutter.plugins.imagepicker;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Log;
import androidx.core.util.SizeFCompat;
import androidx.exifinterface.media.ExifInterface;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

/* loaded from: classes2.dex */
class ImageResizer {
    private final Context context;
    private final ExifDataCopier exifDataCopier;

    ImageResizer(Context context, ExifDataCopier exifDataCopier) {
        this.context = context;
        this.exifDataCopier = exifDataCopier;
    }

    String resizeImageIfNeeded(String str, Double d, Double d2, int i) throws Throwable {
        SizeFCompat fileDimensions = readFileDimensions(str);
        if (fileDimensions.getWidth() == -1.0f || fileDimensions.getHeight() == -1.0f) {
            return str;
        }
        if (d == null && d2 == null && i >= 100) {
            return str;
        }
        try {
            String str2 = str.split("/")[r2.length - 1];
            SizeFCompat sizeFCompatCalculateTargetSize = calculateTargetSize(fileDimensions.getWidth(), fileDimensions.getHeight(), d, d2);
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inSampleSize = calculateSampleSize(options, (int) sizeFCompatCalculateTargetSize.getWidth(), (int) sizeFCompatCalculateTargetSize.getHeight());
            Bitmap bitmapDecodeFile = decodeFile(str, options);
            if (bitmapDecodeFile == null) {
                return str;
            }
            File fileResizedImage = resizedImage(bitmapDecodeFile, Double.valueOf(sizeFCompatCalculateTargetSize.getWidth()), Double.valueOf(sizeFCompatCalculateTargetSize.getHeight()), i, str2);
            copyExif(str, fileResizedImage.getPath());
            return fileResizedImage.getPath();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private File resizedImage(Bitmap bitmap, Double d, Double d2, int i, String str) throws IOException {
        return createImageOnExternalDirectory("/scaled_" + str, createScaledBitmap(bitmap, d.intValue(), d2.intValue(), false), i);
    }

    private SizeFCompat calculateTargetSize(double d, double d2, Double d3, Double d4) {
        double d5 = d / d2;
        boolean z = d3 != null;
        boolean z2 = d4 != null;
        double dMin = z ? Math.min(d, Math.round(d3.doubleValue())) : d;
        double dMin2 = z2 ? Math.min(d2, Math.round(d4.doubleValue())) : d2;
        boolean z3 = z && d3.doubleValue() < d;
        boolean z4 = z2 && d4.doubleValue() < d2;
        if (z3 || z4) {
            double d6 = dMin2 * d5;
            double d7 = dMin / d5;
            if (d7 > dMin2) {
                dMin = Math.round(d6);
            } else {
                dMin2 = Math.round(d7);
            }
        }
        return new SizeFCompat((float) dMin, (float) dMin2);
    }

    private File createFile(File file, String str) {
        File file2 = new File(file, str);
        if (!file2.getParentFile().exists()) {
            file2.getParentFile().mkdirs();
        }
        return file2;
    }

    private FileOutputStream createOutputStream(File file) throws IOException {
        return new FileOutputStream(file);
    }

    private void copyExif(String str, String str2) throws Throwable {
        try {
            this.exifDataCopier.copyExif(new ExifInterface(str), new ExifInterface(str2));
        } catch (Exception e) {
            Log.e("ImageResizer", "Error preserving Exif data on selected image: " + e);
        }
    }

    SizeFCompat readFileDimensions(String str) {
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inJustDecodeBounds = true;
        decodeFile(str, options);
        return new SizeFCompat(options.outWidth, options.outHeight);
    }

    private Bitmap decodeFile(String str, BitmapFactory.Options options) {
        return BitmapFactory.decodeFile(str, options);
    }

    private Bitmap createScaledBitmap(Bitmap bitmap, int i, int i2, boolean z) {
        return Bitmap.createScaledBitmap(bitmap, i, i2, z);
    }

    private int calculateSampleSize(BitmapFactory.Options options, int i, int i2) {
        int i3 = options.outHeight;
        int i4 = options.outWidth;
        int i5 = 1;
        if (i3 > i2 || i4 > i) {
            int i6 = i3 / 2;
            int i7 = i4 / 2;
            while (i6 / i5 >= i2 && i7 / i5 >= i) {
                i5 *= 2;
            }
        }
        return i5;
    }

    private File createImageOnExternalDirectory(String str, Bitmap bitmap, int i) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        boolean zHasAlpha = bitmap.hasAlpha();
        if (zHasAlpha) {
            Log.d("ImageResizer", "image_picker: compressing is not supported for type PNG. Returning the image with original quality");
        }
        bitmap.compress(zHasAlpha ? Bitmap.CompressFormat.PNG : Bitmap.CompressFormat.JPEG, i, byteArrayOutputStream);
        File fileCreateFile = createFile(this.context.getCacheDir(), str);
        FileOutputStream fileOutputStreamCreateOutputStream = createOutputStream(fileCreateFile);
        fileOutputStreamCreateOutputStream.write(byteArrayOutputStream.toByteArray());
        fileOutputStreamCreateOutputStream.close();
        return fileCreateFile;
    }
}
