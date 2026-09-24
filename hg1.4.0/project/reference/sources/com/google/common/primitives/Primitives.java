package com.google.common.primitives;

import com.google.common.base.Preconditions;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public final class Primitives {
    private static final Map<Class<?>, Class<?>> PRIMITIVE_TO_WRAPPER_TYPE;
    private static final Map<Class<?>, Class<?>> WRAPPER_TO_PRIMITIVE_TYPE;

    private Primitives() {
    }

    static {
        LinkedHashMap linkedHashMap = new LinkedHashMap(16);
        LinkedHashMap linkedHashMap2 = new LinkedHashMap(16);
        add(linkedHashMap, linkedHashMap2, Boolean.TYPE, Boolean.class);
        add(linkedHashMap, linkedHashMap2, Byte.TYPE, Byte.class);
        add(linkedHashMap, linkedHashMap2, Character.TYPE, Character.class);
        add(linkedHashMap, linkedHashMap2, Double.TYPE, Double.class);
        add(linkedHashMap, linkedHashMap2, Float.TYPE, Float.class);
        add(linkedHashMap, linkedHashMap2, Integer.TYPE, Integer.class);
        add(linkedHashMap, linkedHashMap2, Long.TYPE, Long.class);
        add(linkedHashMap, linkedHashMap2, Short.TYPE, Short.class);
        add(linkedHashMap, linkedHashMap2, Void.TYPE, Void.class);
        PRIMITIVE_TO_WRAPPER_TYPE = Collections.unmodifiableMap(linkedHashMap);
        WRAPPER_TO_PRIMITIVE_TYPE = Collections.unmodifiableMap(linkedHashMap2);
    }

    private static void add(Map<Class<?>, Class<?>> forward, Map<Class<?>, Class<?>> backward, Class<?> key, Class<?> value) {
        forward.put(key, value);
        backward.put(value, key);
    }

    public static Set<Class<?>> allPrimitiveTypes() {
        return PRIMITIVE_TO_WRAPPER_TYPE.keySet();
    }

    public static Set<Class<?>> allWrapperTypes() {
        return WRAPPER_TO_PRIMITIVE_TYPE.keySet();
    }

    public static boolean isWrapperType(Class<?> type) {
        return WRAPPER_TO_PRIMITIVE_TYPE.containsKey(Preconditions.checkNotNull(type));
    }

    public static <T> Class<T> wrap(Class<T> type) {
        Preconditions.checkNotNull(type);
        Class<T> cls = (Class) PRIMITIVE_TO_WRAPPER_TYPE.get(type);
        return cls == null ? type : cls;
    }

    public static <T> Class<T> unwrap(Class<T> type) {
        Preconditions.checkNotNull(type);
        Class<T> cls = (Class) WRAPPER_TO_PRIMITIVE_TYPE.get(type);
        return cls == null ? type : cls;
    }
}
