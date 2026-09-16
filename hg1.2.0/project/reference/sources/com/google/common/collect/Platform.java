package com.google.common.collect;

import java.util.Arrays;
import java.util.Map;
import java.util.Set;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
final class Platform {
    static int reduceExponentIfGwt(int exponent) {
        return exponent;
    }

    static int reduceIterationsIfGwt(int iterations) {
        return iterations;
    }

    static <K, V> Map<K, V> newHashMapWithExpectedSize(int expectedSize) {
        return CompactHashMap.createWithExpectedSize(expectedSize);
    }

    static <K, V> Map<K, V> newLinkedHashMapWithExpectedSize(int expectedSize) {
        return CompactLinkedHashMap.createWithExpectedSize(expectedSize);
    }

    static <E> Set<E> newHashSetWithExpectedSize(int expectedSize) {
        return CompactHashSet.createWithExpectedSize(expectedSize);
    }

    static <E> Set<E> newLinkedHashSetWithExpectedSize(int expectedSize) {
        return CompactLinkedHashSet.createWithExpectedSize(expectedSize);
    }

    static <K, V> Map<K, V> preservesInsertionOrderOnPutsMap() {
        return CompactHashMap.create();
    }

    static <E> Set<E> preservesInsertionOrderOnAddsSet() {
        return CompactHashSet.create();
    }

    static <T> T[] newArray(T[] tArr, int i) {
        if (tArr.length != 0) {
            tArr = (T[]) Arrays.copyOf(tArr, 0);
        }
        return (T[]) Arrays.copyOf(tArr, i);
    }

    static <T> T[] copy(Object[] objArr, int i, int i2, T[] tArr) {
        return (T[]) Arrays.copyOfRange(objArr, i, i2, tArr.getClass());
    }

    static MapMaker tryWeakKeys(MapMaker mapMaker) {
        return mapMaker.weakKeys();
    }

    static <E extends Enum<E>> Class<E> getDeclaringClassOrObjectForJ2cl(E e) {
        return e.getDeclaringClass();
    }

    private Platform() {
    }
}
