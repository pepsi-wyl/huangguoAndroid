package androidx.webkit.internal;

import androidx.webkit.UserAgentMetadata;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* loaded from: classes.dex */
public class UserAgentMetadataInternal {
    private static final String ARCHITECTURE = "ARCHITECTURE";
    private static final String BITNESS = "BITNESS";
    private static final int BRAND_VERSION_LENGTH = 3;
    private static final String BRAND_VERSION_LIST = "BRAND_VERSION_LIST";
    private static final String FULL_VERSION = "FULL_VERSION";
    private static final String MOBILE = "MOBILE";
    private static final String MODEL = "MODEL";
    private static final String PLATFORM = "PLATFORM";
    private static final String PLATFORM_VERSION = "PLATFORM_VERSION";
    private static final String WOW64 = "WOW64";

    static Map<String, Object> convertUserAgentMetadataToMap(UserAgentMetadata userAgentMetadata) {
        HashMap map = new HashMap();
        map.put(BRAND_VERSION_LIST, getBrandVersionArray(userAgentMetadata.getBrandVersionList()));
        map.put(FULL_VERSION, userAgentMetadata.getFullVersion());
        map.put(PLATFORM, userAgentMetadata.getPlatform());
        map.put(PLATFORM_VERSION, userAgentMetadata.getPlatformVersion());
        map.put(ARCHITECTURE, userAgentMetadata.getArchitecture());
        map.put(MODEL, userAgentMetadata.getModel());
        map.put(MOBILE, Boolean.valueOf(userAgentMetadata.isMobile()));
        map.put(BITNESS, Integer.valueOf(userAgentMetadata.getBitness()));
        map.put(WOW64, Boolean.valueOf(userAgentMetadata.isWow64()));
        return map;
    }

    private static String[][] getBrandVersionArray(List<UserAgentMetadata.BrandVersion> list) {
        if (list == null || list.isEmpty()) {
            return null;
        }
        String[][] strArr = (String[][]) Array.newInstance((Class<?>) String.class, list.size(), 3);
        for (int i = 0; i < list.size(); i++) {
            strArr[i][0] = list.get(i).getBrand();
            strArr[i][1] = list.get(i).getMajorVersion();
            strArr[i][2] = list.get(i).getFullVersion();
        }
        return strArr;
    }

    static UserAgentMetadata getUserAgentMetadataFromMap(Map<String, Object> map) {
        UserAgentMetadata.Builder builder = new UserAgentMetadata.Builder();
        Object obj = map.get(BRAND_VERSION_LIST);
        if (obj != null) {
            ArrayList arrayList = new ArrayList();
            for (String[] strArr : (String[][]) obj) {
                arrayList.add(new UserAgentMetadata.BrandVersion.Builder().setBrand(strArr[0]).setMajorVersion(strArr[1]).setFullVersion(strArr[2]).build());
            }
            builder.setBrandVersionList(arrayList);
        }
        String str = (String) map.get(FULL_VERSION);
        if (str != null) {
            builder.setFullVersion(str);
        }
        String str2 = (String) map.get(PLATFORM);
        if (str2 != null) {
            builder.setPlatform(str2);
        }
        String str3 = (String) map.get(PLATFORM_VERSION);
        if (str3 != null) {
            builder.setPlatformVersion(str3);
        }
        String str4 = (String) map.get(ARCHITECTURE);
        if (str4 != null) {
            builder.setArchitecture(str4);
        }
        String str5 = (String) map.get(MODEL);
        if (str5 != null) {
            builder.setModel(str5);
        }
        Boolean bool = (Boolean) map.get(MOBILE);
        if (bool != null) {
            builder.setMobile(bool.booleanValue());
        }
        Integer num = (Integer) map.get(BITNESS);
        if (num != null) {
            builder.setBitness(num.intValue());
        }
        Boolean bool2 = (Boolean) map.get(WOW64);
        if (bool2 != null) {
            builder.setWow64(bool2.booleanValue());
        }
        return builder.build();
    }
}
