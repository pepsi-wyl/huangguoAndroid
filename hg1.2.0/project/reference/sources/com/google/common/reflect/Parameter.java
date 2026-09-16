package com.google.common.reflect;

import com.google.common.base.Preconditions;
import com.google.common.collect.FluentIterable;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.UnmodifiableIterator;
import java.lang.annotation.Annotation;
import java.lang.reflect.AnnotatedElement;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public final class Parameter implements AnnotatedElement {
    private final Object annotatedType;
    private final ImmutableList<Annotation> annotations;
    private final Invokable<?, ?> declaration;
    private final int position;
    private final TypeToken<?> type;

    Parameter(Invokable<?, ?> declaration, int position, TypeToken<?> type, Annotation[] annotations, Object annotatedType) {
        this.declaration = declaration;
        this.position = position;
        this.type = type;
        this.annotations = ImmutableList.copyOf(annotations);
        this.annotatedType = annotatedType;
    }

    public TypeToken<?> getType() {
        return this.type;
    }

    public Invokable<?, ?> getDeclaringInvokable() {
        return this.declaration;
    }

    @Override // java.lang.reflect.AnnotatedElement
    public boolean isAnnotationPresent(Class<? extends Annotation> annotationType) {
        return getAnnotation(annotationType) != null;
    }

    @Override // java.lang.reflect.AnnotatedElement
    @CheckForNull
    public <A extends Annotation> A getAnnotation(Class<A> annotationType) {
        Preconditions.checkNotNull(annotationType);
        UnmodifiableIterator<Annotation> it = this.annotations.iterator();
        while (it.hasNext()) {
            Annotation next = it.next();
            if (annotationType.isInstance(next)) {
                return annotationType.cast(next);
            }
        }
        return null;
    }

    @Override // java.lang.reflect.AnnotatedElement
    public Annotation[] getAnnotations() {
        return getDeclaredAnnotations();
    }

    @Override // java.lang.reflect.AnnotatedElement
    public <A extends Annotation> A[] getAnnotationsByType(Class<A> cls) {
        return (A[]) getDeclaredAnnotationsByType(cls);
    }

    @Override // java.lang.reflect.AnnotatedElement
    public Annotation[] getDeclaredAnnotations() {
        return (Annotation[]) this.annotations.toArray(new Annotation[0]);
    }

    @Override // java.lang.reflect.AnnotatedElement
    @CheckForNull
    public <A extends Annotation> A getDeclaredAnnotation(Class<A> annotationType) {
        Preconditions.checkNotNull(annotationType);
        return (A) FluentIterable.from(this.annotations).filter(annotationType).first().orNull();
    }

    @Override // java.lang.reflect.AnnotatedElement
    public <A extends Annotation> A[] getDeclaredAnnotationsByType(Class<A> cls) {
        return (A[]) ((Annotation[]) FluentIterable.from(this.annotations).filter(cls).toArray(cls));
    }

    public boolean equals(@CheckForNull Object obj) {
        if (!(obj instanceof Parameter)) {
            return false;
        }
        Parameter parameter = (Parameter) obj;
        return this.position == parameter.position && this.declaration.equals(parameter.declaration);
    }

    public int hashCode() {
        return this.position;
    }

    public String toString() {
        return this.type + " arg" + this.position;
    }
}
