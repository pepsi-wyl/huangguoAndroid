package com.google.common.reflect;

import com.google.errorprone.annotations.DoNotMock;
import java.util.Map;
import javax.annotation.CheckForNull;

@DoNotMock("Use ImmutableTypeToInstanceMap or MutableTypeToInstanceMap")
@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public interface TypeToInstanceMap<B> extends Map<TypeToken<? extends B>, B> {
    @CheckForNull
    <T extends B> T getInstance(TypeToken<T> type);

    @CheckForNull
    <T extends B> T getInstance(Class<T> type);

    @CheckForNull
    <T extends B> T putInstance(TypeToken<T> type, @ParametricNullness T value);

    @CheckForNull
    <T extends B> T putInstance(Class<T> type, @ParametricNullness T value);
}
