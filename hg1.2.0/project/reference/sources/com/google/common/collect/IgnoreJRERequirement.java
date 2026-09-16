package com.google.common.collect;

import java.lang.annotation.ElementType;
import java.lang.annotation.Target;

@Target({ElementType.METHOD, ElementType.CONSTRUCTOR, ElementType.TYPE})
@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
@interface IgnoreJRERequirement {
}
