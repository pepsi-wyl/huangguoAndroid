package com.google.common.base;

import java.io.Serializable;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.WeakHashMap;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public final class Enums {
    private static final Map<Class<? extends Enum<?>>, Map<String, WeakReference<? extends Enum<?>>>> enumConstantCache = new WeakHashMap();

    private Enums() {
    }

    public static Field getField(Enum<?> enumValue) {
        try {
            return enumValue.getDeclaringClass().getDeclaredField(enumValue.name());
        } catch (NoSuchFieldException e) {
            throw new AssertionError(e);
        }
    }

    public static <T extends Enum<T>> Optional<T> getIfPresent(Class<T> enumClass, String value) {
        Preconditions.checkNotNull(enumClass);
        Preconditions.checkNotNull(value);
        return Platform.getEnumIfPresent(enumClass, value);
    }

    private static <T extends Enum<T>> Map<String, WeakReference<? extends Enum<?>>> populateCache(Class<T> enumClass) {
        HashMap map = new HashMap();
        Iterator it = EnumSet.allOf(enumClass).iterator();
        while (it.hasNext()) {
            Enum r2 = (Enum) it.next();
            map.put(r2.name(), new WeakReference(r2));
        }
        enumConstantCache.put(enumClass, map);
        return map;
    }

    static <T extends Enum<T>> Map<String, WeakReference<? extends Enum<?>>> getEnumConstants(Class<T> enumClass) {
        Map<String, WeakReference<? extends Enum<?>>> mapPopulateCache;
        Map<Class<? extends Enum<?>>, Map<String, WeakReference<? extends Enum<?>>>> map = enumConstantCache;
        synchronized (map) {
            mapPopulateCache = map.get(enumClass);
            if (mapPopulateCache == null) {
                mapPopulateCache = populateCache(enumClass);
            }
        }
        return mapPopulateCache;
    }

    public static <T extends Enum<T>> Converter<String, T> stringConverter(Class<T> enumClass) {
        return new StringConverter(enumClass);
    }

    private static final class StringConverter<T extends Enum<T>> extends Converter<String, T> implements Serializable {
        private static final long serialVersionUID = 0;
        private final Class<T> enumClass;

        StringConverter(Class<T> enumClass) {
            this.enumClass = (Class) Preconditions.checkNotNull(enumClass);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.common.base.Converter
        public T doForward(String str) {
            return (T) Enum.valueOf(this.enumClass, str);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.common.base.Converter
        public String doBackward(T enumValue) {
            return enumValue.name();
        }

        @Override // com.google.common.base.Converter, com.google.common.base.Function
        public boolean equals(@CheckForNull Object object) {
            if (object instanceof StringConverter) {
                return this.enumClass.equals(((StringConverter) object).enumClass);
            }
            return false;
        }

        public int hashCode() {
            return this.enumClass.hashCode();
        }

        public String toString() {
            return "Enums.stringConverter(" + this.enumClass.getName() + ".class)";
        }
    }
}
