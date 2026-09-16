package com.google.common.reflect;

import com.google.common.base.Joiner;
import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import com.google.common.collect.FluentIterable;
import com.google.common.collect.ForwardingSet;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableSet;
import com.google.common.collect.Maps;
import com.google.common.collect.Ordering;
import com.google.common.collect.UnmodifiableIterator;
import com.google.common.primitives.Primitives;
import com.google.common.reflect.Invokable;
import com.google.common.reflect.TypeResolver;
import com.google.common.reflect.Types;
import com.google.errorprone.annotations.concurrent.LazyInit;
import java.io.Serializable;
import java.lang.reflect.Constructor;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.lang.reflect.WildcardType;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public abstract class TypeToken<T> extends TypeCapture<T> implements Serializable {
    private static final long serialVersionUID = 3637540370352322684L;

    @CheckForNull
    @LazyInit
    private transient TypeResolver covariantTypeResolver;

    @CheckForNull
    @LazyInit
    private transient TypeResolver invariantTypeResolver;
    private final Type runtimeType;

    private enum TypeFilter implements Predicate<TypeToken<?>> {
        IGNORE_TYPE_VARIABLE_OR_WILDCARD { // from class: com.google.common.reflect.TypeToken.TypeFilter.1
            @Override // com.google.common.base.Predicate
            public boolean apply(TypeToken<?> type) {
                return ((((TypeToken) type).runtimeType instanceof TypeVariable) || (((TypeToken) type).runtimeType instanceof WildcardType)) ? false : true;
            }
        },
        INTERFACE_ONLY { // from class: com.google.common.reflect.TypeToken.TypeFilter.2
            @Override // com.google.common.base.Predicate
            public boolean apply(TypeToken<?> type) {
                return type.getRawType().isInterface();
            }
        }
    }

    protected TypeToken() {
        Type typeCapture = capture();
        this.runtimeType = typeCapture;
        Preconditions.checkState(!(typeCapture instanceof TypeVariable), "Cannot construct a TypeToken for a type variable.\nYou probably meant to call new TypeToken<%s>(getClass()) that can resolve the type variable for you.\nIf you do need to create a TypeToken of a type variable, please use TypeToken.of() instead.", typeCapture);
    }

    protected TypeToken(Class<?> declaringClass) {
        Type typeCapture = super.capture();
        if (typeCapture instanceof Class) {
            this.runtimeType = typeCapture;
        } else {
            this.runtimeType = TypeResolver.covariantly(declaringClass).resolveType(typeCapture);
        }
    }

    private TypeToken(Type type) {
        this.runtimeType = (Type) Preconditions.checkNotNull(type);
    }

    public static <T> TypeToken<T> of(Class<T> type) {
        return new SimpleTypeToken(type);
    }

    public static TypeToken<?> of(Type type) {
        return new SimpleTypeToken(type);
    }

    public final Class<? super T> getRawType() {
        return getRawTypes().iterator().next();
    }

    public final Type getType() {
        return this.runtimeType;
    }

    public final <X> TypeToken<T> where(TypeParameter<X> typeParam, TypeToken<X> typeArg) {
        return new SimpleTypeToken(new TypeResolver().where(ImmutableMap.of(new TypeResolver.TypeVariableKey(typeParam.typeVariable), typeArg.runtimeType)).resolveType(this.runtimeType));
    }

    public final <X> TypeToken<T> where(TypeParameter<X> typeParam, Class<X> typeArg) {
        return where(typeParam, of((Class) typeArg));
    }

    public final TypeToken<?> resolveType(Type type) {
        Preconditions.checkNotNull(type);
        return of(getInvariantTypeResolver().resolveType(type));
    }

    private TypeToken<?> resolveSupertype(Type type) {
        TypeToken<?> typeTokenOf = of(getCovariantTypeResolver().resolveType(type));
        typeTokenOf.covariantTypeResolver = this.covariantTypeResolver;
        typeTokenOf.invariantTypeResolver = this.invariantTypeResolver;
        return typeTokenOf;
    }

    @CheckForNull
    final TypeToken<? super T> getGenericSuperclass() {
        Type type = this.runtimeType;
        if (type instanceof TypeVariable) {
            return boundAsSuperclass(((TypeVariable) type).getBounds()[0]);
        }
        if (type instanceof WildcardType) {
            return boundAsSuperclass(((WildcardType) type).getUpperBounds()[0]);
        }
        Type genericSuperclass = getRawType().getGenericSuperclass();
        if (genericSuperclass == null) {
            return null;
        }
        return (TypeToken<? super T>) resolveSupertype(genericSuperclass);
    }

    @CheckForNull
    private TypeToken<? super T> boundAsSuperclass(Type type) {
        TypeToken<? super T> typeToken = (TypeToken<? super T>) of(type);
        if (typeToken.getRawType().isInterface()) {
            return null;
        }
        return typeToken;
    }

    final ImmutableList<TypeToken<? super T>> getGenericInterfaces() {
        Type type = this.runtimeType;
        if (type instanceof TypeVariable) {
            return boundsAsInterfaces(((TypeVariable) type).getBounds());
        }
        if (type instanceof WildcardType) {
            return boundsAsInterfaces(((WildcardType) type).getUpperBounds());
        }
        ImmutableList.Builder builder = ImmutableList.builder();
        for (Type type2 : getRawType().getGenericInterfaces()) {
            builder.add((ImmutableList.Builder) resolveSupertype(type2));
        }
        return builder.build();
    }

    private ImmutableList<TypeToken<? super T>> boundsAsInterfaces(Type[] bounds) {
        ImmutableList.Builder builder = ImmutableList.builder();
        for (Type type : bounds) {
            TypeToken<?> typeTokenOf = of(type);
            if (typeTokenOf.getRawType().isInterface()) {
                builder.add((ImmutableList.Builder) typeTokenOf);
            }
        }
        return builder.build();
    }

    public final TypeToken<T>.TypeSet getTypes() {
        return new TypeSet();
    }

    public final TypeToken<? super T> getSupertype(Class<? super T> cls) {
        Preconditions.checkArgument(someRawTypeIsSubclassOf(cls), "%s is not a super class of %s", cls, this);
        Type type = this.runtimeType;
        if (type instanceof TypeVariable) {
            return getSupertypeFromUpperBounds(cls, ((TypeVariable) type).getBounds());
        }
        if (type instanceof WildcardType) {
            return getSupertypeFromUpperBounds(cls, ((WildcardType) type).getUpperBounds());
        }
        if (cls.isArray()) {
            return getArraySupertype(cls);
        }
        return (TypeToken<? super T>) resolveSupertype(toGenericType(cls).runtimeType);
    }

    public final TypeToken<? extends T> getSubtype(Class<?> cls) {
        Preconditions.checkArgument(!(this.runtimeType instanceof TypeVariable), "Cannot get subtype of type variable <%s>", this);
        Type type = this.runtimeType;
        if (type instanceof WildcardType) {
            return getSubtypeFromLowerBounds(cls, ((WildcardType) type).getLowerBounds());
        }
        if (isArray()) {
            return getArraySubtype(cls);
        }
        Preconditions.checkArgument(getRawType().isAssignableFrom(cls), "%s isn't a subclass of %s", cls, this);
        TypeToken<? extends T> typeToken = (TypeToken<? extends T>) of(resolveTypeArgsForSubclass(cls));
        Preconditions.checkArgument(typeToken.isSubtypeOf((TypeToken<?>) this), "%s does not appear to be a subtype of %s", typeToken, this);
        return typeToken;
    }

    public final boolean isSupertypeOf(TypeToken<?> type) {
        return type.isSubtypeOf(getType());
    }

    public final boolean isSupertypeOf(Type type) {
        return of(type).isSubtypeOf(getType());
    }

    public final boolean isSubtypeOf(TypeToken<?> type) {
        return isSubtypeOf(type.getType());
    }

    public final boolean isSubtypeOf(Type supertype) {
        Preconditions.checkNotNull(supertype);
        if (supertype instanceof WildcardType) {
            return any(((WildcardType) supertype).getLowerBounds()).isSupertypeOf(this.runtimeType);
        }
        Type type = this.runtimeType;
        if (type instanceof WildcardType) {
            return any(((WildcardType) type).getUpperBounds()).isSubtypeOf(supertype);
        }
        if (type instanceof TypeVariable) {
            return type.equals(supertype) || any(((TypeVariable) this.runtimeType).getBounds()).isSubtypeOf(supertype);
        }
        if (type instanceof GenericArrayType) {
            return of(supertype).isSupertypeOfArray((GenericArrayType) this.runtimeType);
        }
        if (supertype instanceof Class) {
            return someRawTypeIsSubclassOf((Class) supertype);
        }
        if (supertype instanceof ParameterizedType) {
            return isSubtypeOfParameterizedType((ParameterizedType) supertype);
        }
        if (supertype instanceof GenericArrayType) {
            return isSubtypeOfArrayType((GenericArrayType) supertype);
        }
        return false;
    }

    public final boolean isArray() {
        return getComponentType() != null;
    }

    public final boolean isPrimitive() {
        Type type = this.runtimeType;
        return (type instanceof Class) && ((Class) type).isPrimitive();
    }

    public final TypeToken<T> wrap() {
        return isPrimitive() ? of(Primitives.wrap((Class) this.runtimeType)) : this;
    }

    private boolean isWrapper() {
        return Primitives.allWrapperTypes().contains(this.runtimeType);
    }

    public final TypeToken<T> unwrap() {
        return isWrapper() ? of(Primitives.unwrap((Class) this.runtimeType)) : this;
    }

    @CheckForNull
    public final TypeToken<?> getComponentType() {
        Type componentType = Types.getComponentType(this.runtimeType);
        if (componentType == null) {
            return null;
        }
        return of(componentType);
    }

    public final Invokable<T, Object> method(Method method) {
        Preconditions.checkArgument(someRawTypeIsSubclassOf(method.getDeclaringClass()), "%s not declared by %s", method, this);
        return new Invokable.MethodInvokable<T>(method) { // from class: com.google.common.reflect.TypeToken.1
            @Override // com.google.common.reflect.Invokable.MethodInvokable, com.google.common.reflect.Invokable
            Type getGenericReturnType() {
                return TypeToken.this.getCovariantTypeResolver().resolveType(super.getGenericReturnType());
            }

            @Override // com.google.common.reflect.Invokable.MethodInvokable, com.google.common.reflect.Invokable
            Type[] getGenericParameterTypes() {
                return TypeToken.this.getInvariantTypeResolver().resolveTypesInPlace(super.getGenericParameterTypes());
            }

            @Override // com.google.common.reflect.Invokable.MethodInvokable, com.google.common.reflect.Invokable
            Type[] getGenericExceptionTypes() {
                return TypeToken.this.getCovariantTypeResolver().resolveTypesInPlace(super.getGenericExceptionTypes());
            }

            @Override // com.google.common.reflect.Invokable
            public TypeToken<T> getOwnerType() {
                return TypeToken.this;
            }

            @Override // com.google.common.reflect.Invokable
            public String toString() {
                return getOwnerType() + "." + super.toString();
            }
        };
    }

    public final Invokable<T, T> constructor(Constructor<?> constructor) {
        Preconditions.checkArgument(constructor.getDeclaringClass() == getRawType(), "%s not declared by %s", constructor, getRawType());
        return new Invokable.ConstructorInvokable<T>(constructor) { // from class: com.google.common.reflect.TypeToken.2
            @Override // com.google.common.reflect.Invokable.ConstructorInvokable, com.google.common.reflect.Invokable
            Type getGenericReturnType() {
                return TypeToken.this.getCovariantTypeResolver().resolveType(super.getGenericReturnType());
            }

            @Override // com.google.common.reflect.Invokable.ConstructorInvokable, com.google.common.reflect.Invokable
            Type[] getGenericParameterTypes() {
                return TypeToken.this.getInvariantTypeResolver().resolveTypesInPlace(super.getGenericParameterTypes());
            }

            @Override // com.google.common.reflect.Invokable.ConstructorInvokable, com.google.common.reflect.Invokable
            Type[] getGenericExceptionTypes() {
                return TypeToken.this.getCovariantTypeResolver().resolveTypesInPlace(super.getGenericExceptionTypes());
            }

            @Override // com.google.common.reflect.Invokable
            public TypeToken<T> getOwnerType() {
                return TypeToken.this;
            }

            @Override // com.google.common.reflect.Invokable
            public String toString() {
                return getOwnerType() + "(" + Joiner.on(", ").join(getGenericParameterTypes()) + ")";
            }
        };
    }

    public class TypeSet extends ForwardingSet<TypeToken<? super T>> implements Serializable {
        private static final long serialVersionUID = 0;

        @CheckForNull
        private transient ImmutableSet<TypeToken<? super T>> types;

        TypeSet() {
        }

        public TypeToken<T>.TypeSet interfaces() {
            return new InterfaceSet(this);
        }

        public TypeToken<T>.TypeSet classes() {
            return new ClassSet();
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.common.collect.ForwardingSet, com.google.common.collect.ForwardingCollection, com.google.common.collect.ForwardingObject
        public Set<TypeToken<? super T>> delegate() {
            ImmutableSet<TypeToken<? super T>> immutableSet = this.types;
            if (immutableSet != null) {
                return immutableSet;
            }
            ImmutableSet<TypeToken<? super T>> set = FluentIterable.from(TypeCollector.FOR_GENERIC_TYPE.collectTypes((TypeCollector<TypeToken<?>>) TypeToken.this)).filter(TypeFilter.IGNORE_TYPE_VARIABLE_OR_WILDCARD).toSet();
            this.types = set;
            return set;
        }

        public Set<Class<? super T>> rawTypes() {
            return ImmutableSet.copyOf((Collection) TypeCollector.FOR_RAW_TYPE.collectTypes(TypeToken.this.getRawTypes()));
        }
    }

    private final class InterfaceSet extends TypeToken<T>.TypeSet {
        private static final long serialVersionUID = 0;
        private final transient TypeToken<T>.TypeSet allTypes;

        @CheckForNull
        private transient ImmutableSet<TypeToken<? super T>> interfaces;

        @Override // com.google.common.reflect.TypeToken.TypeSet
        public TypeToken<T>.TypeSet interfaces() {
            return this;
        }

        InterfaceSet(TypeToken<T>.TypeSet allTypes) {
            super();
            this.allTypes = allTypes;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.common.reflect.TypeToken.TypeSet, com.google.common.collect.ForwardingSet, com.google.common.collect.ForwardingCollection, com.google.common.collect.ForwardingObject
        public Set<TypeToken<? super T>> delegate() {
            ImmutableSet<TypeToken<? super T>> immutableSet = this.interfaces;
            if (immutableSet != null) {
                return immutableSet;
            }
            ImmutableSet<TypeToken<? super T>> set = FluentIterable.from(this.allTypes).filter(TypeFilter.INTERFACE_ONLY).toSet();
            this.interfaces = set;
            return set;
        }

        @Override // com.google.common.reflect.TypeToken.TypeSet
        public Set<Class<? super T>> rawTypes() {
            return FluentIterable.from(TypeCollector.FOR_RAW_TYPE.collectTypes(TypeToken.this.getRawTypes())).filter(new Predicate() { // from class: com.google.common.reflect.TypeToken$InterfaceSet$$ExternalSyntheticLambda0
                @Override // com.google.common.base.Predicate
                public final boolean apply(Object obj) {
                    return ((Class) obj).isInterface();
                }
            }).toSet();
        }

        @Override // com.google.common.reflect.TypeToken.TypeSet
        public TypeToken<T>.TypeSet classes() {
            throw new UnsupportedOperationException("interfaces().classes() not supported.");
        }

        private Object readResolve() {
            return TypeToken.this.getTypes().interfaces();
        }
    }

    private final class ClassSet extends TypeToken<T>.TypeSet {
        private static final long serialVersionUID = 0;

        @CheckForNull
        private transient ImmutableSet<TypeToken<? super T>> classes;

        @Override // com.google.common.reflect.TypeToken.TypeSet
        public TypeToken<T>.TypeSet classes() {
            return this;
        }

        private ClassSet() {
            super();
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.common.reflect.TypeToken.TypeSet, com.google.common.collect.ForwardingSet, com.google.common.collect.ForwardingCollection, com.google.common.collect.ForwardingObject
        public Set<TypeToken<? super T>> delegate() {
            ImmutableSet<TypeToken<? super T>> immutableSet = this.classes;
            if (immutableSet != null) {
                return immutableSet;
            }
            ImmutableSet<TypeToken<? super T>> set = FluentIterable.from(TypeCollector.FOR_GENERIC_TYPE.classesOnly().collectTypes((TypeCollector<TypeToken<?>>) TypeToken.this)).filter(TypeFilter.IGNORE_TYPE_VARIABLE_OR_WILDCARD).toSet();
            this.classes = set;
            return set;
        }

        @Override // com.google.common.reflect.TypeToken.TypeSet
        public Set<Class<? super T>> rawTypes() {
            return ImmutableSet.copyOf((Collection) TypeCollector.FOR_RAW_TYPE.classesOnly().collectTypes(TypeToken.this.getRawTypes()));
        }

        @Override // com.google.common.reflect.TypeToken.TypeSet
        public TypeToken<T>.TypeSet interfaces() {
            throw new UnsupportedOperationException("classes().interfaces() not supported.");
        }

        private Object readResolve() {
            return TypeToken.this.getTypes().classes();
        }
    }

    public boolean equals(@CheckForNull Object o) {
        if (o instanceof TypeToken) {
            return this.runtimeType.equals(((TypeToken) o).runtimeType);
        }
        return false;
    }

    public int hashCode() {
        return this.runtimeType.hashCode();
    }

    public String toString() {
        return Types.toString(this.runtimeType);
    }

    protected Object writeReplace() {
        return of(new TypeResolver().resolveType(this.runtimeType));
    }

    final TypeToken<T> rejectTypeVariables() {
        new TypeVisitor() { // from class: com.google.common.reflect.TypeToken.3
            @Override // com.google.common.reflect.TypeVisitor
            void visitTypeVariable(TypeVariable<?> type) {
                throw new IllegalArgumentException(TypeToken.this.runtimeType + "contains a type variable and is not safe for the operation");
            }

            @Override // com.google.common.reflect.TypeVisitor
            void visitWildcardType(WildcardType type) {
                visit(type.getLowerBounds());
                visit(type.getUpperBounds());
            }

            @Override // com.google.common.reflect.TypeVisitor
            void visitParameterizedType(ParameterizedType type) {
                visit(type.getActualTypeArguments());
                visit(type.getOwnerType());
            }

            @Override // com.google.common.reflect.TypeVisitor
            void visitGenericArrayType(GenericArrayType type) {
                visit(type.getGenericComponentType());
            }
        }.visit(this.runtimeType);
        return this;
    }

    private boolean someRawTypeIsSubclassOf(Class<?> superclass) {
        UnmodifiableIterator<Class<? super T>> it = getRawTypes().iterator();
        while (it.hasNext()) {
            if (superclass.isAssignableFrom(it.next())) {
                return true;
            }
        }
        return false;
    }

    private boolean isSubtypeOfParameterizedType(ParameterizedType supertype) {
        Class<? super Object> rawType = of(supertype).getRawType();
        if (!someRawTypeIsSubclassOf(rawType)) {
            return false;
        }
        TypeVariable<Class<? super Object>>[] typeParameters = rawType.getTypeParameters();
        Type[] actualTypeArguments = supertype.getActualTypeArguments();
        for (int i = 0; i < typeParameters.length; i++) {
            if (!of(getCovariantTypeResolver().resolveType(typeParameters[i])).is(actualTypeArguments[i], typeParameters[i])) {
                return false;
            }
        }
        return Modifier.isStatic(((Class) supertype.getRawType()).getModifiers()) || supertype.getOwnerType() == null || isOwnedBySubtypeOf(supertype.getOwnerType());
    }

    private boolean isSubtypeOfArrayType(GenericArrayType supertype) {
        Type type = this.runtimeType;
        if (type instanceof Class) {
            Class cls = (Class) type;
            if (cls.isArray()) {
                return of((Class) cls.getComponentType()).isSubtypeOf(supertype.getGenericComponentType());
            }
            return false;
        }
        if (type instanceof GenericArrayType) {
            return of(((GenericArrayType) type).getGenericComponentType()).isSubtypeOf(supertype.getGenericComponentType());
        }
        return false;
    }

    private boolean isSupertypeOfArray(GenericArrayType subtype) {
        Type type = this.runtimeType;
        if (type instanceof Class) {
            Class cls = (Class) type;
            if (!cls.isArray()) {
                return cls.isAssignableFrom(Object[].class);
            }
            return of(subtype.getGenericComponentType()).isSubtypeOf(cls.getComponentType());
        }
        if (type instanceof GenericArrayType) {
            return of(subtype.getGenericComponentType()).isSubtypeOf(((GenericArrayType) this.runtimeType).getGenericComponentType());
        }
        return false;
    }

    private boolean is(Type formalType, TypeVariable<?> declaration) {
        if (this.runtimeType.equals(formalType)) {
            return true;
        }
        if (formalType instanceof WildcardType) {
            WildcardType wildcardTypeCanonicalizeWildcardType = canonicalizeWildcardType(declaration, (WildcardType) formalType);
            return every(wildcardTypeCanonicalizeWildcardType.getUpperBounds()).isSupertypeOf(this.runtimeType) && every(wildcardTypeCanonicalizeWildcardType.getLowerBounds()).isSubtypeOf(this.runtimeType);
        }
        return canonicalizeWildcardsInType(this.runtimeType).equals(canonicalizeWildcardsInType(formalType));
    }

    private static Type canonicalizeTypeArg(TypeVariable<?> declaration, Type typeArg) {
        if (typeArg instanceof WildcardType) {
            return canonicalizeWildcardType(declaration, (WildcardType) typeArg);
        }
        return canonicalizeWildcardsInType(typeArg);
    }

    private static Type canonicalizeWildcardsInType(Type type) {
        if (type instanceof ParameterizedType) {
            return canonicalizeWildcardsInParameterizedType((ParameterizedType) type);
        }
        return type instanceof GenericArrayType ? Types.newArrayType(canonicalizeWildcardsInType(((GenericArrayType) type).getGenericComponentType())) : type;
    }

    private static WildcardType canonicalizeWildcardType(TypeVariable<?> declaration, WildcardType type) {
        Type[] bounds = declaration.getBounds();
        ArrayList arrayList = new ArrayList();
        for (Type type2 : type.getUpperBounds()) {
            if (!any(bounds).isSubtypeOf(type2)) {
                arrayList.add(canonicalizeWildcardsInType(type2));
            }
        }
        return new Types.WildcardTypeImpl(type.getLowerBounds(), (Type[]) arrayList.toArray(new Type[0]));
    }

    private static ParameterizedType canonicalizeWildcardsInParameterizedType(ParameterizedType type) {
        Class cls = (Class) type.getRawType();
        TypeVariable<Class<T>>[] typeParameters = cls.getTypeParameters();
        Type[] actualTypeArguments = type.getActualTypeArguments();
        for (int i = 0; i < actualTypeArguments.length; i++) {
            actualTypeArguments[i] = canonicalizeTypeArg(typeParameters[i], actualTypeArguments[i]);
        }
        return Types.newParameterizedTypeWithOwner(type.getOwnerType(), cls, actualTypeArguments);
    }

    private static Bounds every(Type[] bounds) {
        return new Bounds(bounds, false);
    }

    private static Bounds any(Type[] bounds) {
        return new Bounds(bounds, true);
    }

    private static class Bounds {
        private final Type[] bounds;
        private final boolean target;

        Bounds(Type[] bounds, boolean target) {
            this.bounds = bounds;
            this.target = target;
        }

        boolean isSubtypeOf(Type supertype) {
            for (Type type : this.bounds) {
                boolean zIsSubtypeOf = TypeToken.of(type).isSubtypeOf(supertype);
                boolean z = this.target;
                if (zIsSubtypeOf == z) {
                    return z;
                }
            }
            return !this.target;
        }

        boolean isSupertypeOf(Type subtype) {
            TypeToken<?> typeTokenOf = TypeToken.of(subtype);
            for (Type type : this.bounds) {
                boolean zIsSubtypeOf = typeTokenOf.isSubtypeOf(type);
                boolean z = this.target;
                if (zIsSubtypeOf == z) {
                    return z;
                }
            }
            return !this.target;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public ImmutableSet<Class<? super T>> getRawTypes() {
        final ImmutableSet.Builder builder = ImmutableSet.builder();
        new TypeVisitor(this) { // from class: com.google.common.reflect.TypeToken.4
            @Override // com.google.common.reflect.TypeVisitor
            void visitTypeVariable(TypeVariable<?> t) {
                visit(t.getBounds());
            }

            @Override // com.google.common.reflect.TypeVisitor
            void visitWildcardType(WildcardType t) {
                visit(t.getUpperBounds());
            }

            @Override // com.google.common.reflect.TypeVisitor
            void visitParameterizedType(ParameterizedType t) {
                builder.add((ImmutableSet.Builder) t.getRawType());
            }

            @Override // com.google.common.reflect.TypeVisitor
            void visitClass(Class<?> t) {
                builder.add((ImmutableSet.Builder) t);
            }

            @Override // com.google.common.reflect.TypeVisitor
            void visitGenericArrayType(GenericArrayType t) {
                builder.add((ImmutableSet.Builder) Types.getArrayClass(TypeToken.of(t.getGenericComponentType()).getRawType()));
            }
        }.visit(this.runtimeType);
        return builder.build();
    }

    private boolean isOwnedBySubtypeOf(Type supertype) {
        Iterator<TypeToken<? super T>> it = getTypes().iterator();
        while (it.hasNext()) {
            Type ownerTypeIfPresent = it.next().getOwnerTypeIfPresent();
            if (ownerTypeIfPresent != null && of(ownerTypeIfPresent).isSubtypeOf(supertype)) {
                return true;
            }
        }
        return false;
    }

    @CheckForNull
    private Type getOwnerTypeIfPresent() {
        Type type = this.runtimeType;
        if (type instanceof ParameterizedType) {
            return ((ParameterizedType) type).getOwnerType();
        }
        if (type instanceof Class) {
            return ((Class) type).getEnclosingClass();
        }
        return null;
    }

    static <T> TypeToken<? extends T> toGenericType(Class<T> cls) {
        if (cls.isArray()) {
            return (TypeToken<? extends T>) of(Types.newArrayType(toGenericType(cls.getComponentType()).runtimeType));
        }
        TypeVariable<Class<T>>[] typeParameters = cls.getTypeParameters();
        Type type = (!cls.isMemberClass() || Modifier.isStatic(cls.getModifiers())) ? null : toGenericType(cls.getEnclosingClass()).runtimeType;
        if (typeParameters.length > 0 || (type != null && type != cls.getEnclosingClass())) {
            return (TypeToken<? extends T>) of(Types.newParameterizedTypeWithOwner(type, cls, typeParameters));
        }
        return of((Class) cls);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public TypeResolver getCovariantTypeResolver() {
        TypeResolver typeResolver = this.covariantTypeResolver;
        if (typeResolver != null) {
            return typeResolver;
        }
        TypeResolver typeResolverCovariantly = TypeResolver.covariantly(this.runtimeType);
        this.covariantTypeResolver = typeResolverCovariantly;
        return typeResolverCovariantly;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public TypeResolver getInvariantTypeResolver() {
        TypeResolver typeResolver = this.invariantTypeResolver;
        if (typeResolver != null) {
            return typeResolver;
        }
        TypeResolver typeResolverInvariantly = TypeResolver.invariantly(this.runtimeType);
        this.invariantTypeResolver = typeResolverInvariantly;
        return typeResolverInvariantly;
    }

    private TypeToken<? super T> getSupertypeFromUpperBounds(Class<? super T> cls, Type[] typeArr) {
        for (Type type : typeArr) {
            TypeToken<?> typeTokenOf = of(type);
            if (typeTokenOf.isSubtypeOf(cls)) {
                return (TypeToken<? super T>) typeTokenOf.getSupertype(cls);
            }
        }
        throw new IllegalArgumentException(cls + " isn't a super type of " + this);
    }

    private TypeToken<? extends T> getSubtypeFromLowerBounds(Class<?> cls, Type[] typeArr) {
        if (typeArr.length > 0) {
            return (TypeToken<? extends T>) of(typeArr[0]).getSubtype(cls);
        }
        throw new IllegalArgumentException(cls + " isn't a subclass of " + this);
    }

    private TypeToken<? super T> getArraySupertype(Class<? super T> cls) {
        TypeToken<?> componentType = getComponentType();
        if (componentType == null) {
            throw new IllegalArgumentException(cls + " isn't a super type of " + this);
        }
        return (TypeToken<? super T>) of(newArrayClassOrGenericArrayType(componentType.getSupertype((Class) Objects.requireNonNull(cls.getComponentType())).runtimeType));
    }

    private TypeToken<? extends T> getArraySubtype(Class<?> cls) {
        Class<?> componentType = cls.getComponentType();
        if (componentType == null) {
            throw new IllegalArgumentException(cls + " does not appear to be a subtype of " + this);
        }
        return (TypeToken<? extends T>) of(newArrayClassOrGenericArrayType(((TypeToken) Objects.requireNonNull(getComponentType())).getSubtype(componentType).runtimeType));
    }

    private Type resolveTypeArgsForSubclass(Class<?> subclass) {
        if ((this.runtimeType instanceof Class) && (subclass.getTypeParameters().length == 0 || getRawType().getTypeParameters().length != 0)) {
            return subclass;
        }
        TypeToken genericType = toGenericType(subclass);
        return new TypeResolver().where(genericType.getSupertype(getRawType()).runtimeType, this.runtimeType).resolveType(genericType.runtimeType);
    }

    private static Type newArrayClassOrGenericArrayType(Type componentType) {
        return Types.JavaVersion.JAVA7.newArrayType(componentType);
    }

    private static final class SimpleTypeToken<T> extends TypeToken<T> {
        private static final long serialVersionUID = 0;

        SimpleTypeToken(Type type) {
            super(type);
        }
    }

    private static abstract class TypeCollector<K> {
        static final TypeCollector<TypeToken<?>> FOR_GENERIC_TYPE = new TypeCollector<TypeToken<?>>() { // from class: com.google.common.reflect.TypeToken.TypeCollector.1
            /* JADX INFO: Access modifiers changed from: package-private */
            @Override // com.google.common.reflect.TypeToken.TypeCollector
            public Class<?> getRawType(TypeToken<?> type) {
                return type.getRawType();
            }

            /* JADX INFO: Access modifiers changed from: package-private */
            @Override // com.google.common.reflect.TypeToken.TypeCollector
            public Iterable<? extends TypeToken<?>> getInterfaces(TypeToken<?> type) {
                return type.getGenericInterfaces();
            }

            /* JADX INFO: Access modifiers changed from: package-private */
            @Override // com.google.common.reflect.TypeToken.TypeCollector
            @CheckForNull
            public TypeToken<?> getSuperclass(TypeToken<?> type) {
                return type.getGenericSuperclass();
            }
        };
        static final TypeCollector<Class<?>> FOR_RAW_TYPE = new TypeCollector<Class<?>>() { // from class: com.google.common.reflect.TypeToken.TypeCollector.2
            /* JADX INFO: Access modifiers changed from: package-private */
            @Override // com.google.common.reflect.TypeToken.TypeCollector
            public Class<?> getRawType(Class<?> type) {
                return type;
            }

            /* JADX INFO: Access modifiers changed from: package-private */
            @Override // com.google.common.reflect.TypeToken.TypeCollector
            public Iterable<? extends Class<?>> getInterfaces(Class<?> type) {
                return Arrays.asList(type.getInterfaces());
            }

            /* JADX INFO: Access modifiers changed from: package-private */
            @Override // com.google.common.reflect.TypeToken.TypeCollector
            @CheckForNull
            public Class<?> getSuperclass(Class<?> type) {
                return type.getSuperclass();
            }
        };

        abstract Iterable<? extends K> getInterfaces(K type);

        abstract Class<?> getRawType(K type);

        @CheckForNull
        abstract K getSuperclass(K type);

        private TypeCollector() {
        }

        final TypeCollector<K> classesOnly() {
            return new ForwardingTypeCollector<K>(this, this) { // from class: com.google.common.reflect.TypeToken.TypeCollector.3
                @Override // com.google.common.reflect.TypeToken.TypeCollector.ForwardingTypeCollector, com.google.common.reflect.TypeToken.TypeCollector
                Iterable<? extends K> getInterfaces(K type) {
                    return ImmutableSet.of();
                }

                @Override // com.google.common.reflect.TypeToken.TypeCollector
                ImmutableList<K> collectTypes(Iterable<? extends K> types) {
                    ImmutableList.Builder builder = ImmutableList.builder();
                    for (K k : types) {
                        if (!getRawType(k).isInterface()) {
                            builder.add((ImmutableList.Builder) k);
                        }
                    }
                    return super.collectTypes((Iterable) builder.build());
                }
            };
        }

        final ImmutableList<K> collectTypes(K type) {
            return collectTypes((Iterable) ImmutableList.of(type));
        }

        ImmutableList<K> collectTypes(Iterable<? extends K> types) {
            HashMap mapNewHashMap = Maps.newHashMap();
            Iterator<? extends K> it = types.iterator();
            while (it.hasNext()) {
                collectTypes(it.next(), mapNewHashMap);
            }
            return sortKeysByValue(mapNewHashMap, Ordering.natural().reverse());
        }

        /* JADX WARN: Multi-variable type inference failed */
        private int collectTypes(K k, Map<? super K, Integer> map) {
            Integer num = map.get(k);
            if (num != null) {
                return num.intValue();
            }
            boolean zIsInterface = getRawType(k).isInterface();
            Iterator<? extends K> it = getInterfaces(k).iterator();
            int iMax = zIsInterface;
            while (it.hasNext()) {
                iMax = Math.max(iMax, collectTypes(it.next(), map));
            }
            K superclass = getSuperclass(k);
            int iMax2 = iMax;
            if (superclass != null) {
                iMax2 = Math.max(iMax, collectTypes(superclass, map));
            }
            int i = iMax2 + 1;
            map.put(k, Integer.valueOf(i));
            return i;
        }

        private static <K, V> ImmutableList<K> sortKeysByValue(final Map<K, V> map, final Comparator<? super V> comparator) {
            return (ImmutableList<K>) new Ordering<K>() { // from class: com.google.common.reflect.TypeToken.TypeCollector.4
                /* JADX WARN: Multi-variable type inference failed */
                @Override // com.google.common.collect.Ordering, java.util.Comparator
                public int compare(K left, K right) {
                    return comparator.compare(Objects.requireNonNull(map.get(left)), Objects.requireNonNull(map.get(right)));
                }
            }.immutableSortedCopy(map.keySet());
        }

        private static class ForwardingTypeCollector<K> extends TypeCollector<K> {
            private final TypeCollector<K> delegate;

            ForwardingTypeCollector(TypeCollector<K> delegate) {
                super();
                this.delegate = delegate;
            }

            @Override // com.google.common.reflect.TypeToken.TypeCollector
            Class<?> getRawType(K type) {
                return this.delegate.getRawType(type);
            }

            @Override // com.google.common.reflect.TypeToken.TypeCollector
            Iterable<? extends K> getInterfaces(K type) {
                return this.delegate.getInterfaces(type);
            }

            @Override // com.google.common.reflect.TypeToken.TypeCollector
            @CheckForNull
            K getSuperclass(K type) {
                return this.delegate.getSuperclass(type);
            }
        }
    }
}
