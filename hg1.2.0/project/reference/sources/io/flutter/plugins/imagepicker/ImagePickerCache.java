package io.flutter.plugins.imagepicker;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import io.flutter.plugins.imagepicker.Messages;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/* loaded from: classes2.dex */
class ImagePickerCache {
    private static final String FLUTTER_IMAGE_PICKER_IMAGE_PATH_KEY = "flutter_image_picker_image_path";
    static final String MAP_KEY_ERROR = "error";
    static final String MAP_KEY_IMAGE_QUALITY = "imageQuality";
    static final String MAP_KEY_MAX_HEIGHT = "maxHeight";
    static final String MAP_KEY_MAX_WIDTH = "maxWidth";
    static final String MAP_KEY_PATH_LIST = "pathList";
    static final String MAP_KEY_TYPE = "type";
    private static final String MAP_TYPE_VALUE_IMAGE = "image";
    private static final String MAP_TYPE_VALUE_VIDEO = "video";
    static final String SHARED_PREFERENCES_NAME = "flutter_image_picker_shared_preference";
    private static final String SHARED_PREFERENCE_ERROR_CODE_KEY = "flutter_image_picker_error_code";
    private static final String SHARED_PREFERENCE_ERROR_MESSAGE_KEY = "flutter_image_picker_error_message";
    private static final String SHARED_PREFERENCE_IMAGE_QUALITY_KEY = "flutter_image_picker_image_quality";
    private static final String SHARED_PREFERENCE_MAX_HEIGHT_KEY = "flutter_image_picker_max_height";
    private static final String SHARED_PREFERENCE_MAX_WIDTH_KEY = "flutter_image_picker_max_width";
    private static final String SHARED_PREFERENCE_PENDING_IMAGE_URI_PATH_KEY = "flutter_image_picker_pending_image_uri";
    private static final String SHARED_PREFERENCE_TYPE_KEY = "flutter_image_picker_type";
    private final Context context;

    public enum CacheType {
        IMAGE,
        VIDEO
    }

    ImagePickerCache(Context context) {
        this.context = context;
    }

    /* renamed from: io.flutter.plugins.imagepicker.ImagePickerCache$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$io$flutter$plugins$imagepicker$ImagePickerCache$CacheType;

        static {
            int[] iArr = new int[CacheType.values().length];
            $SwitchMap$io$flutter$plugins$imagepicker$ImagePickerCache$CacheType = iArr;
            try {
                iArr[CacheType.IMAGE.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$io$flutter$plugins$imagepicker$ImagePickerCache$CacheType[CacheType.VIDEO.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
        }
    }

    void saveType(CacheType cacheType) {
        int i = AnonymousClass1.$SwitchMap$io$flutter$plugins$imagepicker$ImagePickerCache$CacheType[cacheType.ordinal()];
        if (i == 1) {
            setType("image");
        } else {
            if (i != 2) {
                return;
            }
            setType("video");
        }
    }

    private void setType(String str) {
        this.context.getSharedPreferences(SHARED_PREFERENCES_NAME, 0).edit().putString(SHARED_PREFERENCE_TYPE_KEY, str).apply();
    }

    void saveDimensionWithOutputOptions(Messages.ImageSelectionOptions imageSelectionOptions) {
        SharedPreferences.Editor editorEdit = this.context.getSharedPreferences(SHARED_PREFERENCES_NAME, 0).edit();
        if (imageSelectionOptions.getMaxWidth() != null) {
            editorEdit.putLong(SHARED_PREFERENCE_MAX_WIDTH_KEY, Double.doubleToRawLongBits(imageSelectionOptions.getMaxWidth().doubleValue()));
        }
        if (imageSelectionOptions.getMaxHeight() != null) {
            editorEdit.putLong(SHARED_PREFERENCE_MAX_HEIGHT_KEY, Double.doubleToRawLongBits(imageSelectionOptions.getMaxHeight().doubleValue()));
        }
        editorEdit.putInt(SHARED_PREFERENCE_IMAGE_QUALITY_KEY, imageSelectionOptions.getQuality().intValue());
        editorEdit.apply();
    }

    void savePendingCameraMediaUriPath(Uri uri) {
        this.context.getSharedPreferences(SHARED_PREFERENCES_NAME, 0).edit().putString(SHARED_PREFERENCE_PENDING_IMAGE_URI_PATH_KEY, uri.getPath()).apply();
    }

    String retrievePendingCameraMediaUriPath() {
        return this.context.getSharedPreferences(SHARED_PREFERENCES_NAME, 0).getString(SHARED_PREFERENCE_PENDING_IMAGE_URI_PATH_KEY, "");
    }

    void saveResult(ArrayList<String> arrayList, String str, String str2) {
        SharedPreferences.Editor editorEdit = this.context.getSharedPreferences(SHARED_PREFERENCES_NAME, 0).edit();
        if (arrayList != null) {
            editorEdit.putStringSet(FLUTTER_IMAGE_PICKER_IMAGE_PATH_KEY, new HashSet(arrayList));
        }
        if (str != null) {
            editorEdit.putString(SHARED_PREFERENCE_ERROR_CODE_KEY, str);
        }
        if (str2 != null) {
            editorEdit.putString(SHARED_PREFERENCE_ERROR_MESSAGE_KEY, str2);
        }
        editorEdit.apply();
    }

    void clear() {
        this.context.getSharedPreferences(SHARED_PREFERENCES_NAME, 0).edit().clear().apply();
    }

    Map<String, Object> getCacheMap() {
        Messages.CacheRetrievalType cacheRetrievalType;
        Set<String> stringSet;
        HashMap map = new HashMap();
        boolean z = false;
        SharedPreferences sharedPreferences = this.context.getSharedPreferences(SHARED_PREFERENCES_NAME, 0);
        if (sharedPreferences.contains(FLUTTER_IMAGE_PICKER_IMAGE_PATH_KEY) && (stringSet = sharedPreferences.getStringSet(FLUTTER_IMAGE_PICKER_IMAGE_PATH_KEY, null)) != null) {
            map.put(MAP_KEY_PATH_LIST, new ArrayList(stringSet));
            z = true;
        }
        if (!sharedPreferences.contains(SHARED_PREFERENCE_ERROR_CODE_KEY)) {
            if (z) {
            }
            return map;
        }
        Messages.CacheRetrievalError.Builder builder = new Messages.CacheRetrievalError.Builder();
        builder.setCode(sharedPreferences.getString(SHARED_PREFERENCE_ERROR_CODE_KEY, ""));
        if (sharedPreferences.contains(SHARED_PREFERENCE_ERROR_MESSAGE_KEY)) {
            builder.setMessage(sharedPreferences.getString(SHARED_PREFERENCE_ERROR_MESSAGE_KEY, ""));
        }
        map.put("error", builder.build());
        if (sharedPreferences.contains(SHARED_PREFERENCE_TYPE_KEY)) {
            if (sharedPreferences.getString(SHARED_PREFERENCE_TYPE_KEY, "").equals("video")) {
                cacheRetrievalType = Messages.CacheRetrievalType.VIDEO;
            } else {
                cacheRetrievalType = Messages.CacheRetrievalType.IMAGE;
            }
            map.put("type", cacheRetrievalType);
        }
        if (sharedPreferences.contains(SHARED_PREFERENCE_MAX_WIDTH_KEY)) {
            map.put(MAP_KEY_MAX_WIDTH, Double.valueOf(Double.longBitsToDouble(sharedPreferences.getLong(SHARED_PREFERENCE_MAX_WIDTH_KEY, 0L))));
        }
        if (sharedPreferences.contains(SHARED_PREFERENCE_MAX_HEIGHT_KEY)) {
            map.put(MAP_KEY_MAX_HEIGHT, Double.valueOf(Double.longBitsToDouble(sharedPreferences.getLong(SHARED_PREFERENCE_MAX_HEIGHT_KEY, 0L))));
        }
        map.put(MAP_KEY_IMAGE_QUALITY, Integer.valueOf(sharedPreferences.getInt(SHARED_PREFERENCE_IMAGE_QUALITY_KEY, 100)));
        return map;
    }
}
