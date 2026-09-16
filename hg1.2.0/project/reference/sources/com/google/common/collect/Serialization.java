package com.google.common.collect;

import com.google.common.collect.Multiset;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.lang.reflect.Field;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
final class Serialization {
    private Serialization() {
    }

    static int readCount(ObjectInputStream stream) throws IOException {
        return stream.readInt();
    }

    static <K, V> void writeMap(Map<K, V> map, ObjectOutputStream stream) throws IOException {
        stream.writeInt(map.size());
        for (Map.Entry<K, V> entry : map.entrySet()) {
            stream.writeObject(entry.getKey());
            stream.writeObject(entry.getValue());
        }
    }

    static <K, V> void populateMap(Map<K, V> map, ObjectInputStream stream) throws IOException, ClassNotFoundException {
        populateMap(map, stream, stream.readInt());
    }

    /* JADX WARN: Multi-variable type inference failed */
    static <K, V> void populateMap(Map<K, V> map, ObjectInputStream stream, int size) throws IOException, ClassNotFoundException {
        for (int i = 0; i < size; i++) {
            map.put(stream.readObject(), stream.readObject());
        }
    }

    static <E> void writeMultiset(Multiset<E> multiset, ObjectOutputStream stream) throws IOException {
        stream.writeInt(multiset.entrySet().size());
        for (Multiset.Entry<E> entry : multiset.entrySet()) {
            stream.writeObject(entry.getElement());
            stream.writeInt(entry.getCount());
        }
    }

    static <E> void populateMultiset(Multiset<E> multiset, ObjectInputStream stream) throws IOException, ClassNotFoundException {
        populateMultiset(multiset, stream, stream.readInt());
    }

    /* JADX WARN: Multi-variable type inference failed */
    static <E> void populateMultiset(Multiset<E> multiset, ObjectInputStream stream, int distinctElements) throws IOException, ClassNotFoundException {
        for (int i = 0; i < distinctElements; i++) {
            multiset.add(stream.readObject(), stream.readInt());
        }
    }

    static <K, V> void writeMultimap(Multimap<K, V> multimap, ObjectOutputStream stream) throws IOException {
        stream.writeInt(multimap.asMap().size());
        for (Map.Entry<K, Collection<V>> entry : multimap.asMap().entrySet()) {
            stream.writeObject(entry.getKey());
            stream.writeInt(entry.getValue().size());
            Iterator<V> it = entry.getValue().iterator();
            while (it.hasNext()) {
                stream.writeObject(it.next());
            }
        }
    }

    static <K, V> void populateMultimap(Multimap<K, V> multimap, ObjectInputStream stream) throws IOException, ClassNotFoundException {
        populateMultimap(multimap, stream, stream.readInt());
    }

    /* JADX WARN: Multi-variable type inference failed */
    static <K, V> void populateMultimap(Multimap<K, V> multimap, ObjectInputStream stream, int distinctKeys) throws IOException, ClassNotFoundException {
        for (int i = 0; i < distinctKeys; i++) {
            Collection collection = multimap.get(stream.readObject());
            int i2 = stream.readInt();
            for (int i3 = 0; i3 < i2; i3++) {
                collection.add(stream.readObject());
            }
        }
    }

    static <T> FieldSetter<T> getFieldSetter(Class<T> clazz, String fieldName) {
        try {
            return new FieldSetter<>(clazz.getDeclaredField(fieldName));
        } catch (NoSuchFieldException e) {
            throw new AssertionError(e);
        }
    }

    static final class FieldSetter<T> {
        private final Field field;

        private FieldSetter(Field field) {
            this.field = field;
            field.setAccessible(true);
        }

        void set(T instance, Object value) throws IllegalAccessException, IllegalArgumentException {
            try {
                this.field.set(instance, value);
            } catch (IllegalAccessException e) {
                throw new AssertionError(e);
            }
        }

        void set(T instance, int value) throws IllegalAccessException, IllegalArgumentException {
            try {
                this.field.set(instance, Integer.valueOf(value));
            } catch (IllegalAccessException e) {
                throw new AssertionError(e);
            }
        }
    }
}
