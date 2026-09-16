package com.google.common.reflect;

import com.google.common.base.Function;
import com.google.common.base.Joiner;
import com.google.common.base.Preconditions;
import com.google.common.base.Predicates;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Iterables;
import com.google.common.collect.UnmodifiableIterator;
import java.io.Serializable;
import java.lang.reflect.AnnotatedElement;
import java.lang.reflect.Array;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.GenericDeclaration;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Proxy;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.lang.reflect.WildcardType;
import java.security.AccessControlException;
import java.util.Arrays;
import java.util.Collection;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.atomic.AtomicReference;
import javax.annotation.CheckForNull;
import kotlin.text.Typography;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
final class Types {
    private static final Joiner COMMA_JOINER = Joiner.on(", ").useForNull("null");

    static Type newArrayType(Type componentType) {
        if (componentType instanceof WildcardType) {
            WildcardType wildcardType = (WildcardType) componentType;
            Type[] lowerBounds = wildcardType.getLowerBounds();
            Preconditions.checkArgument(lowerBounds.length <= 1, "Wildcard cannot have more than one lower bounds.");
            if (lowerBounds.length == 1) {
                return supertypeOf(newArrayType(lowerBounds[0]));
            }
            Type[] upperBounds = wildcardType.getUpperBounds();
            Preconditions.checkArgument(upperBounds.length == 1, "Wildcard should have only one upper bound.");
            return subtypeOf(newArrayType(upperBounds[0]));
        }
        return JavaVersion.CURRENT.newArrayType(componentType);
    }

    static ParameterizedType newParameterizedTypeWithOwner(@CheckForNull Type ownerType, Class<?> rawType, Type... arguments) {
        if (ownerType == null) {
            return newParameterizedType(rawType, arguments);
        }
        Preconditions.checkNotNull(arguments);
        Preconditions.checkArgument(rawType.getEnclosingClass() != null, "Owner type for unenclosed %s", rawType);
        return new ParameterizedTypeImpl(ownerType, rawType, arguments);
    }

    static ParameterizedType newParameterizedType(Class<?> rawType, Type... arguments) {
        return new ParameterizedTypeImpl(ClassOwnership.JVM_BEHAVIOR.getOwnerType(rawType), rawType, arguments);
    }

    private enum ClassOwnership {
        OWNED_BY_ENCLOSING_CLASS { // from class: com.google.common.reflect.Types.ClassOwnership.1
            @Override // com.google.common.reflect.Types.ClassOwnership
            @CheckForNull
            Class<?> getOwnerType(Class<?> rawType) {
                return rawType.getEnclosingClass();
            }
        },
        LOCAL_CLASS_HAS_NO_OWNER { // from class: com.google.common.reflect.Types.ClassOwnership.2
            @Override // com.google.common.reflect.Types.ClassOwnership
            @CheckForNull
            Class<?> getOwnerType(Class<?> rawType) {
                if (rawType.isLocalClass()) {
                    return null;
                }
                return rawType.getEnclosingClass();
            }
        };

        static final ClassOwnership JVM_BEHAVIOR = detectJvmBehavior();

        @CheckForNull
        abstract Class<?> getOwnerType(Class<?> rawType);

        private static ClassOwnership detectJvmBehavior() {
            ParameterizedType parameterizedType = (ParameterizedType) Objects.requireNonNull((ParameterizedType) new C1LocalClass<String>() { // from class: com.google.common.reflect.Types.ClassOwnership.3
            }.getClass().getGenericSuperclass());
            for (ClassOwnership classOwnership : values()) {
                if (classOwnership.getOwnerType(C1LocalClass.class) == parameterizedType.getOwnerType()) {
                    return classOwnership;
                }
            }
            throw new AssertionError();
        }
    }

    static <D extends GenericDeclaration> TypeVariable<D> newArtificialTypeVariable(D declaration, String name, Type... bounds) {
        if (bounds.length == 0) {
            bounds = new Type[]{Object.class};
        }
        return newTypeVariableImpl(declaration, name, bounds);
    }

    static WildcardType subtypeOf(Type upperBound) {
        return new WildcardTypeImpl(new Type[0], new Type[]{upperBound});
    }

    static WildcardType supertypeOf(Type lowerBound) {
        return new WildcardTypeImpl(new Type[]{lowerBound}, new Type[]{Object.class});
    }

    static String toString(Type type) {
        return type instanceof Class ? ((Class) type).getName() : type.toString();
    }

    @CheckForNull
    static Type getComponentType(Type type) {
        Preconditions.checkNotNull(type);
        final AtomicReference atomicReference = new AtomicReference();
        new TypeVisitor() { // from class: com.google.common.reflect.Types.1
            @Override // com.google.common.reflect.TypeVisitor
            void visitTypeVariable(TypeVariable<?> t) {
                atomicReference.set(Types.subtypeOfComponentType(t.getBounds()));
            }

            @Override // com.google.common.reflect.TypeVisitor
            void visitWildcardType(WildcardType t) {
                atomicReference.set(Types.subtypeOfComponentType(t.getUpperBounds()));
            }

            @Override // com.google.common.reflect.TypeVisitor
            void visitGenericArrayType(GenericArrayType t) {
                atomicReference.set(t.getGenericComponentType());
            }

            @Override // com.google.common.reflect.TypeVisitor
            void visitClass(Class<?> t) {
                atomicReference.set(t.getComponentType());
            }
        }.visit(type);
        return (Type) atomicReference.get();
    }

    /* JADX INFO: Access modifiers changed from: private */
    @CheckForNull
    public static Type subtypeOfComponentType(Type[] bounds) {
        for (Type type : bounds) {
            Type componentType = getComponentType(type);
            if (componentType != null) {
                if (componentType instanceof Class) {
                    Class cls = (Class) componentType;
                    if (cls.isPrimitive()) {
                        return cls;
                    }
                }
                return subtypeOf(componentType);
            }
        }
        return null;
    }

    private static final class GenericArrayTypeImpl implements GenericArrayType, Serializable {
        private static final long serialVersionUID = 0;
        private final Type componentType;

        GenericArrayTypeImpl(Type componentType) {
            this.componentType = JavaVersion.CURRENT.usedInGenericType(componentType);
        }

        @Override // java.lang.reflect.GenericArrayType
        public Type getGenericComponentType() {
            return this.componentType;
        }

        public String toString() {
            return Types.toString(this.componentType) + "[]";
        }

        public int hashCode() {
            return this.componentType.hashCode();
        }

        public boolean equals(@CheckForNull Object obj) {
            if (obj instanceof GenericArrayType) {
                return com.google.common.base.Objects.equal(getGenericComponentType(), ((GenericArrayType) obj).getGenericComponentType());
            }
            return false;
        }
    }

    private static final class ParameterizedTypeImpl implements ParameterizedType, Serializable {
        private static final long serialVersionUID = 0;
        private final ImmutableList<Type> argumentsList;

        @CheckForNull
        private final Type ownerType;
        private final Class<?> rawType;

        ParameterizedTypeImpl(@CheckForNull Type ownerType, Class<?> rawType, Type[] typeArguments) {
            Preconditions.checkNotNull(rawType);
            Preconditions.checkArgument(typeArguments.length == rawType.getTypeParameters().length);
            Types.disallowPrimitiveType(typeArguments, "type parameter");
            this.ownerType = ownerType;
            this.rawType = rawType;
            this.argumentsList = JavaVersion.CURRENT.usedInGenericType(typeArguments);
        }

        @Override // java.lang.reflect.ParameterizedType
        public Type[] getActualTypeArguments() {
            return Types.toArray(this.argumentsList);
        }

        @Override // java.lang.reflect.ParameterizedType
        public Type getRawType() {
            return this.rawType;
        }

        @Override // java.lang.reflect.ParameterizedType
        @CheckForNull
        public Type getOwnerType() {
            return this.ownerType;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            if (this.ownerType != null && JavaVersion.CURRENT.jdkTypeDuplicatesOwnerName()) {
                sb.append(JavaVersion.CURRENT.typeName(this.ownerType));
                sb.append('.');
            }
            sb.append(this.rawType.getName());
            sb.append(Typography.less);
            Joiner joiner = Types.COMMA_JOINER;
            ImmutableList<Type> immutableList = this.argumentsList;
            final JavaVersion javaVersion = JavaVersion.CURRENT;
            Objects.requireNonNull(javaVersion);
            sb.append(joiner.join(Iterables.transform(immutableList, new Function() { // from class: com.google.common.reflect.Types$ParameterizedTypeImpl$$ExternalSyntheticLambda0
                @Override // com.google.common.base.Function
                public final Object apply(Object obj) {
                    return javaVersion.typeName((Type) obj);
                }
            })));
            sb.append(Typography.greater);
            return sb.toString();
        }

        public int hashCode() {
            Type type = this.ownerType;
            return ((type == null ? 0 : type.hashCode()) ^ this.argumentsList.hashCode()) ^ this.rawType.hashCode();
        }

        public boolean equals(@CheckForNull Object other) {
            if (!(other instanceof ParameterizedType)) {
                return false;
            }
            ParameterizedType parameterizedType = (ParameterizedType) other;
            return getRawType().equals(parameterizedType.getRawType()) && com.google.common.base.Objects.equal(getOwnerType(), parameterizedType.getOwnerType()) && Arrays.equals(getActualTypeArguments(), parameterizedType.getActualTypeArguments());
        }
    }

    private static <D extends GenericDeclaration> TypeVariable<D> newTypeVariableImpl(D genericDeclaration, String name, Type[] bounds) {
        return (TypeVariable) Reflection.newProxy(TypeVariable.class, new TypeVariableInvocationHandler(new TypeVariableImpl(genericDeclaration, name, bounds)));
    }

    private static final class TypeVariableInvocationHandler implements InvocationHandler {
        private static final ImmutableMap<String, Method> typeVariableMethods;
        private final TypeVariableImpl<?> typeVariableImpl;

        static {
            ImmutableMap.Builder builder = ImmutableMap.builder();
            for (Method method : TypeVariableImpl.class.getMethods()) {
                if (method.getDeclaringClass().equals(TypeVariableImpl.class)) {
                    try {
                        method.setAccessible(true);
                    } catch (AccessControlException unused) {
                    }
                    builder.put(method.getName(), method);
                }
            }
            typeVariableMethods = builder.buildKeepingLast();
        }

        TypeVariableInvocationHandler(TypeVariableImpl<?> typeVariableImpl) {
            this.typeVariableImpl = typeVariableImpl;
        }

        @Override // java.lang.reflect.InvocationHandler
        @CheckForNull
        public Object invoke(Object proxy, Method method, @CheckForNull Object[] args) throws Throwable {
            String name = method.getName();
            Method method2 = typeVariableMethods.get(name);
            if (method2 == null) {
                throw new UnsupportedOperationException(name);
            }
            try {
                return method2.invoke(this.typeVariableImpl, args);
            } catch (InvocationTargetException e) {
                throw e.getCause();
            }
        }
    }

    private static final class TypeVariableImpl<D extends GenericDeclaration> {
        private final ImmutableList<Type> bounds;
        private final D genericDeclaration;
        private final String name;

        TypeVariableImpl(D genericDeclaration, String name, Type[] bounds) {
            Types.disallowPrimitiveType(bounds, "bound for type variable");
            this.genericDeclaration = (D) Preconditions.checkNotNull(genericDeclaration);
            this.name = (String) Preconditions.checkNotNull(name);
            this.bounds = ImmutableList.copyOf(bounds);
        }

        public Type[] getBounds() {
            return Types.toArray(this.bounds);
        }

        public D getGenericDeclaration() {
            return this.genericDeclaration;
        }

        public String getName() {
            return this.name;
        }

        public String getTypeName() {
            return this.name;
        }

        public String toString() {
            return this.name;
        }

        public int hashCode() {
            return this.genericDeclaration.hashCode() ^ this.name.hashCode();
        }

        public boolean equals(@CheckForNull Object obj) {
            if (NativeTypeVariableEquals.NATIVE_TYPE_VARIABLE_ONLY) {
                if (obj == null || !Proxy.isProxyClass(obj.getClass()) || !(Proxy.getInvocationHandler(obj) instanceof TypeVariableInvocationHandler)) {
                    return false;
                }
                TypeVariableImpl typeVariableImpl = ((TypeVariableInvocationHandler) Proxy.getInvocationHandler(obj)).typeVariableImpl;
                return this.name.equals(typeVariableImpl.getName()) && this.genericDeclaration.equals(typeVariableImpl.getGenericDeclaration()) && this.bounds.equals(typeVariableImpl.bounds);
            }
            if (!(obj instanceof TypeVariable)) {
                return false;
            }
            TypeVariable typeVariable = (TypeVariable) obj;
            return this.name.equals(typeVariable.getName()) && this.genericDeclaration.equals(typeVariable.getGenericDeclaration());
        }
    }

    static final class WildcardTypeImpl implements WildcardType, Serializable {
        private static final long serialVersionUID = 0;
        private final ImmutableList<Type> lowerBounds;
        private final ImmutableList<Type> upperBounds;

        WildcardTypeImpl(Type[] lowerBounds, Type[] upperBounds) {
            Types.disallowPrimitiveType(lowerBounds, "lower bound for wildcard");
            Types.disallowPrimitiveType(upperBounds, "upper bound for wildcard");
            this.lowerBounds = JavaVersion.CURRENT.usedInGenericType(lowerBounds);
            this.upperBounds = JavaVersion.CURRENT.usedInGenericType(upperBounds);
        }

        @Override // java.lang.reflect.WildcardType
        public Type[] getLowerBounds() {
            return Types.toArray(this.lowerBounds);
        }

        @Override // java.lang.reflect.WildcardType
        public Type[] getUpperBounds() {
            return Types.toArray(this.upperBounds);
        }

        public boolean equals(@CheckForNull Object obj) {
            if (!(obj instanceof WildcardType)) {
                return false;
            }
            WildcardType wildcardType = (WildcardType) obj;
            return this.lowerBounds.equals(Arrays.asList(wildcardType.getLowerBounds())) && this.upperBounds.equals(Arrays.asList(wildcardType.getUpperBounds()));
        }

        public int hashCode() {
            return this.lowerBounds.hashCode() ^ this.upperBounds.hashCode();
        }

        public String toString() {
            StringBuilder sb = new StringBuilder("?");
            UnmodifiableIterator<Type> it = this.lowerBounds.iterator();
            while (it.hasNext()) {
                Type next = it.next();
                sb.append(" super ");
                sb.append(JavaVersion.CURRENT.typeName(next));
            }
            for (Type type : Types.filterUpperBounds(this.upperBounds)) {
                sb.append(" extends ");
                sb.append(JavaVersion.CURRENT.typeName(type));
            }
            return sb.toString();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Type[] toArray(Collection<Type> types) {
        return (Type[]) types.toArray(new Type[0]);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Iterable<Type> filterUpperBounds(Iterable<Type> bounds) {
        return Iterables.filter(bounds, Predicates.not(Predicates.equalTo(Object.class)));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void disallowPrimitiveType(Type[] types, String usedAs) {
        for (Type type : types) {
            if (type instanceof Class) {
                Preconditions.checkArgument(!r2.isPrimitive(), "Primitive type '%s' used as %s", (Class) type, usedAs);
            }
        }
    }

    static Class<?> getArrayClass(Class<?> componentType) {
        return Array.newInstance(componentType, 0).getClass();
    }

    /* JADX WARN: Enum visitor error
    jadx.core.utils.exceptions.JadxRuntimeException: Can't remove SSA var: r0v0 com.google.common.reflect.Types$JavaVersion, still in use, count: 1, list:
      (r0v0 com.google.common.reflect.Types$JavaVersion) from 0x0063: SPUT (r0v0 com.google.common.reflect.Types$JavaVersion) (LINE:646) com.google.common.reflect.Types.JavaVersion.CURRENT com.google.common.reflect.Types$JavaVersion
    	at jadx.core.utils.InsnRemover.removeSsaVar(InsnRemover.java:162)
    	at jadx.core.utils.InsnRemover.unbindResult(InsnRemover.java:127)
    	at jadx.core.utils.InsnRemover.lambda$unbindInsns$1(InsnRemover.java:99)
    	at java.base/java.util.ArrayList.forEach(ArrayList.java:1511)
    	at jadx.core.utils.InsnRemover.unbindInsns(InsnRemover.java:98)
    	at jadx.core.utils.InsnRemover.removeAllAndUnbind(InsnRemover.java:252)
    	at jadx.core.dex.visitors.EnumVisitor.convertToEnum(EnumVisitor.java:180)
    	at jadx.core.dex.visitors.EnumVisitor.visit(EnumVisitor.java:100)
     */
    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    static abstract class JavaVersion {
        JAVA6 { // from class: com.google.common.reflect.Types.JavaVersion.1
            /* JADX INFO: Access modifiers changed from: package-private */
            @Override // com.google.common.reflect.Types.JavaVersion
            public GenericArrayType newArrayType(Type componentType) {
                return new GenericArrayTypeImpl(componentType);
            }

            @Override // com.google.common.reflect.Types.JavaVersion
            Type usedInGenericType(Type type) {
                Preconditions.checkNotNull(type);
                if (!(type instanceof Class)) {
                    return type;
                }
                Class cls = (Class) type;
                return cls.isArray() ? new GenericArrayTypeImpl(cls.getComponentType()) : type;
            }
        },
        JAVA7 { // from class: com.google.common.reflect.Types.JavaVersion.2
            @Override // com.google.common.reflect.Types.JavaVersion
            Type newArrayType(Type componentType) {
                if (componentType instanceof Class) {
                    return Types.getArrayClass((Class) componentType);
                }
                return new GenericArrayTypeImpl(componentType);
            }

            @Override // com.google.common.reflect.Types.JavaVersion
            Type usedInGenericType(Type type) {
                return (Type) Preconditions.checkNotNull(type);
            }
        },
        JAVA8 { // from class: com.google.common.reflect.Types.JavaVersion.3
            @Override // com.google.common.reflect.Types.JavaVersion
            Type newArrayType(Type componentType) {
                return JAVA7.newArrayType(componentType);
            }

            @Override // com.google.common.reflect.Types.JavaVersion
            Type usedInGenericType(Type type) {
                return JAVA7.usedInGenericType(type);
            }

            @Override // com.google.common.reflect.Types.JavaVersion
            String typeName(Type type) {
                try {
                    return (String) Type.class.getMethod("getTypeName", new Class[0]).invoke(type, new Object[0]);
                } catch (IllegalAccessException e) {
                    throw new RuntimeException(e);
                } catch (NoSuchMethodException unused) {
                    throw new AssertionError("Type.getTypeName should be available in Java 8");
                } catch (InvocationTargetException e2) {
                    throw new RuntimeException(e2);
                }
            }
        },
        JAVA9 { // from class: com.google.common.reflect.Types.JavaVersion.4
            @Override // com.google.common.reflect.Types.JavaVersion
            boolean jdkTypeDuplicatesOwnerName() {
                return false;
            }

            @Override // com.google.common.reflect.Types.JavaVersion
            Type newArrayType(Type componentType) {
                return JAVA8.newArrayType(componentType);
            }

            @Override // com.google.common.reflect.Types.JavaVersion
            Type usedInGenericType(Type type) {
                return JAVA8.usedInGenericType(type);
            }

            @Override // com.google.common.reflect.Types.JavaVersion
            String typeName(Type type) {
                return JAVA8.typeName(type);
            }
        };

        static final JavaVersion CURRENT;

        boolean jdkTypeDuplicatesOwnerName() {
            return true;
        }

        abstract Type newArrayType(Type componentType);

        abstract Type usedInGenericType(Type type);

        private JavaVersion() {
        }

        public static JavaVersion valueOf(String name) {
            return (JavaVersion) Enum.valueOf(JavaVersion.class, name);
        }

        public static JavaVersion[] values() {
            return (JavaVersion[]) $VALUES.clone();
        }

        static {
            if (AnnotatedElement.class.isAssignableFrom(TypeVariable.class)) {
                if (new TypeCapture<Map.Entry<String, int[][]>>() { // from class: com.google.common.reflect.Types.JavaVersion.5
                }.capture().toString().contains("java.util.Map.java.util.Map")) {
                    CURRENT = javaVersion;
                    return;
                } else {
                    CURRENT = javaVersion;
                    return;
                }
            }
            if (new TypeCapture<int[]>() { // from class: com.google.common.reflect.Types.JavaVersion.6
            }.capture() instanceof Class) {
                CURRENT = javaVersion;
            } else {
                CURRENT = javaVersion;
            }
        }

        final ImmutableList<Type> usedInGenericType(Type[] types) {
            ImmutableList.Builder builder = ImmutableList.builder();
            for (Type type : types) {
                builder.add((ImmutableList.Builder) usedInGenericType(type));
            }
            return builder.build();
        }

        String typeName(Type type) {
            return Types.toString(type);
        }
    }

    static final class NativeTypeVariableEquals<X> {
        static final boolean NATIVE_TYPE_VARIABLE_ONLY = !NativeTypeVariableEquals.class.getTypeParameters()[0].equals(Types.newArtificialTypeVariable(NativeTypeVariableEquals.class, "X", new Type[0]));

        NativeTypeVariableEquals() {
        }
    }

    private Types() {
    }
}
