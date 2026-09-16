package com.example.analytics_sdk;

import java.util.Locale;
import kotlin.Metadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.StringsKt;

/* compiled from: ClientIdentifierResolver.kt */
@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\b\u0002\bÀ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0012\u0010\u0003\u001a\u00020\u00042\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006H\u0002J/\u0010\u0007\u001a\u00020\u00062\"\u0010\b\u001a\u0012\u0012\u000e\b\u0001\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\n0\t\"\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\n¢\u0006\u0002\u0010\u000b¨\u0006\f"}, d2 = {"Lcom/example/analytics_sdk/ClientIdentifierResolver;", "", "()V", "isValid", "", "value", "", "resolve", "candidates", "", "Lkotlin/Function0;", "([Lkotlin/jvm/functions/Function0;)Ljava/lang/String;", "analytics_sdk_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class ClientIdentifierResolver {
    public static final ClientIdentifierResolver INSTANCE = new ClientIdentifierResolver();

    private ClientIdentifierResolver() {
    }

    public final String resolve(Function0<String>... candidates) {
        String str;
        Intrinsics.checkNotNullParameter(candidates, "candidates");
        int length = candidates.length;
        int i = 0;
        while (true) {
            if (i >= length) {
                return "";
            }
            try {
                String strInvoke = candidates[i].invoke();
                String string = strInvoke != null ? StringsKt.trim((CharSequence) strInvoke).toString() : null;
                str = string != null ? string : "";
            } catch (Throwable unused) {
            }
            if (isValid(str)) {
                return str;
            }
            i++;
        }
    }

    private final boolean isValid(String value) {
        String string = value != null ? StringsKt.trim((CharSequence) value).toString() : null;
        if (string == null) {
            string = "";
        }
        String str = string;
        if (str.length() == 0) {
            return false;
        }
        Locale ROOT = Locale.ROOT;
        Intrinsics.checkNotNullExpressionValue(ROOT, "ROOT");
        String lowerCase = str.toLowerCase(ROOT);
        Intrinsics.checkNotNullExpressionValue(lowerCase, "toLowerCase(...)");
        int iHashCode = lowerCase.hashCode();
        if (iHashCode != -840471212) {
            if (iHashCode != -284840886) {
                if (iHashCode == 3392903 && lowerCase.equals("null")) {
                    return false;
                }
            } else if (lowerCase.equals("unknown")) {
                return false;
            }
        } else if (lowerCase.equals("unkown")) {
            return false;
        }
        String strReplace$default = StringsKt.replace$default(str, "-", "", false, 4, (Object) null);
        if (strReplace$default.length() <= 0) {
            return false;
        }
        for (int i = 0; i < strReplace$default.length(); i++) {
            if (strReplace$default.charAt(i) != '0') {
                return true;
            }
        }
        return false;
    }
}
