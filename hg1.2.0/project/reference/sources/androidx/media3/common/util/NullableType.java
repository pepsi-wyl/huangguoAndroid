package androidx.media3.common.util;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import javax.annotation.Nonnull;
import javax.annotation.meta.When;

@Target({ElementType.TYPE_USE})
@Nonnull(when = When.MAYBE)
@Documented
@Retention(RetentionPolicy.CLASS)
/* loaded from: classes.dex */
public @interface NullableType {
}
