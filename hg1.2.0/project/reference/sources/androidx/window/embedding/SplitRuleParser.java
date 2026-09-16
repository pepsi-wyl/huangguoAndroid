package androidx.window.embedding;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.content.res.XmlResourceParser;
import androidx.webkit.ProxyConfig;
import androidx.window.R;
import java.util.HashSet;
import java.util.Set;
import kotlin.Metadata;
import kotlin.collections.SetsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.StringsKt;

/* compiled from: SplitRuleParser.kt */
@Metadata(d1 = {"\u0000Z\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\r\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0004\b\u0001\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J\u001a\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\b\u0010\u0007\u001a\u0004\u0018\u00010\bH\u0002J\u0018\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000eH\u0002J\u0018\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000eH\u0002J\u0018\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000eH\u0002J\u0018\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000eH\u0002J\u0018\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000eH\u0002J%\u0010\u0017\u001a\n\u0012\u0004\u0012\u00020\u0019\u0018\u00010\u00182\u0006\u0010\u000b\u001a\u00020\f2\u0006\u0010\u001a\u001a\u00020\u001bH\u0000¢\u0006\u0002\b\u001cJ \u0010\u001d\u001a\n\u0012\u0004\u0012\u00020\u0019\u0018\u00010\u00182\u0006\u0010\u000b\u001a\u00020\f2\u0006\u0010\u001e\u001a\u00020\u001bH\u0002¨\u0006\u001f"}, d2 = {"Landroidx/window/embedding/SplitRuleParser;", "", "()V", "buildClassName", "Landroid/content/ComponentName;", "pkg", "", "clsSeq", "", "parseActivityFilter", "Landroidx/window/embedding/ActivityFilter;", "context", "Landroid/content/Context;", "parser", "Landroid/content/res/XmlResourceParser;", "parseSplitActivityRule", "Landroidx/window/embedding/ActivityRule;", "parseSplitPairFilter", "Landroidx/window/embedding/SplitPairFilter;", "parseSplitPairRule", "Landroidx/window/embedding/SplitPairRule;", "parseSplitPlaceholderRule", "Landroidx/window/embedding/SplitPlaceholderRule;", "parseSplitRules", "", "Landroidx/window/embedding/EmbeddingRule;", "staticRuleResourceId", "", "parseSplitRules$window_release", "parseSplitXml", "splitResourceId", "window_release"}, k = 1, mv = {1, 5, 1}, xi = 48)
/* loaded from: classes.dex */
public final class SplitRuleParser {
    public final Set<EmbeddingRule> parseSplitRules$window_release(Context context, int staticRuleResourceId) {
        Intrinsics.checkNotNullParameter(context, "context");
        return parseSplitXml(context, staticRuleResourceId);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    private final Set<EmbeddingRule> parseSplitXml(Context context, int splitResourceId) throws Resources.NotFoundException {
        SplitPlaceholderRule splitPlaceholderRulePlus$window_release;
        ActivityRule activityRulePlus$window_release;
        SplitPairRule splitPairRule;
        try {
            XmlResourceParser xml = context.getResources().getXml(splitResourceId);
            Intrinsics.checkNotNullExpressionValue(xml, "resources.getXml(splitResourceId)");
            HashSet hashSet = new HashSet();
            int depth = xml.getDepth();
            int next = xml.next();
            ActivityRule activityRule = null;
            SplitPairRule splitPairRule2 = null;
            SplitPlaceholderRule splitPlaceholderRule = null;
            while (next != 1 && (next != 3 || xml.getDepth() > depth)) {
                if (xml.getEventType() != 2 || Intrinsics.areEqual("split-config", xml.getName())) {
                    next = xml.next();
                } else {
                    String name = xml.getName();
                    if (name != null) {
                        switch (name.hashCode()) {
                            case 511422343:
                                if (name.equals("ActivityFilter")) {
                                    if (activityRule != null || splitPlaceholderRule != null) {
                                        ActivityFilter activityFilter = parseActivityFilter(context, xml);
                                        if (activityRule == null) {
                                            if (splitPlaceholderRule != null) {
                                                hashSet.remove(splitPlaceholderRule);
                                                splitPlaceholderRulePlus$window_release = splitPlaceholderRule.plus$window_release(activityFilter);
                                                hashSet.add(splitPlaceholderRulePlus$window_release);
                                                splitPlaceholderRule = splitPlaceholderRulePlus$window_release;
                                                break;
                                            }
                                        } else {
                                            hashSet.remove(activityRule);
                                            activityRulePlus$window_release = activityRule.plus$window_release(activityFilter);
                                            hashSet.add(activityRulePlus$window_release);
                                            activityRule = activityRulePlus$window_release;
                                            break;
                                        }
                                    } else {
                                        throw new IllegalArgumentException("Found orphaned ActivityFilter");
                                    }
                                }
                                break;
                            case 520447504:
                                if (name.equals("SplitPairRule")) {
                                    splitPairRule = parseSplitPairRule(context, xml);
                                    hashSet.add(splitPairRule);
                                    activityRule = null;
                                    splitPlaceholderRule = null;
                                    splitPairRule2 = splitPairRule;
                                    break;
                                }
                                break;
                            case 1579230604:
                                if (name.equals("SplitPairFilter")) {
                                    if (splitPairRule2 == null) {
                                        throw new IllegalArgumentException("Found orphaned SplitPairFilter outside of SplitPairRule");
                                    }
                                    SplitPairFilter splitPairFilter = parseSplitPairFilter(context, xml);
                                    hashSet.remove(splitPairRule2);
                                    splitPairRule = splitPairRule2.plus$window_release(splitPairFilter);
                                    hashSet.add(splitPairRule);
                                    splitPairRule2 = splitPairRule;
                                    break;
                                }
                                break;
                            case 1793077963:
                                if (name.equals("ActivityRule")) {
                                    activityRulePlus$window_release = parseSplitActivityRule(context, xml);
                                    hashSet.add(activityRulePlus$window_release);
                                    splitPairRule2 = null;
                                    splitPlaceholderRule = null;
                                    activityRule = activityRulePlus$window_release;
                                    break;
                                }
                                break;
                            case 2050988213:
                                if (name.equals("SplitPlaceholderRule")) {
                                    splitPlaceholderRulePlus$window_release = parseSplitPlaceholderRule(context, xml);
                                    hashSet.add(splitPlaceholderRulePlus$window_release);
                                    activityRule = null;
                                    splitPairRule2 = null;
                                    splitPlaceholderRule = splitPlaceholderRulePlus$window_release;
                                    break;
                                }
                                break;
                        }
                    }
                    next = xml.next();
                }
            }
            return hashSet;
        } catch (Resources.NotFoundException unused) {
            return null;
        }
    }

    private final SplitPairRule parseSplitPairRule(Context context, XmlResourceParser parser) {
        TypedArray typedArrayObtainStyledAttributes = context.getTheme().obtainStyledAttributes(parser, R.styleable.SplitPairRule, 0, 0);
        float f = typedArrayObtainStyledAttributes.getFloat(R.styleable.SplitPairRule_splitRatio, 0.0f);
        int dimension = (int) typedArrayObtainStyledAttributes.getDimension(R.styleable.SplitPairRule_splitMinWidth, 0.0f);
        int dimension2 = (int) typedArrayObtainStyledAttributes.getDimension(R.styleable.SplitPairRule_splitMinSmallestWidth, 0.0f);
        int i = typedArrayObtainStyledAttributes.getInt(R.styleable.SplitPairRule_splitLayoutDirection, 3);
        return new SplitPairRule(SetsKt.emptySet(), typedArrayObtainStyledAttributes.getBoolean(R.styleable.SplitPairRule_finishPrimaryWithSecondary, false), typedArrayObtainStyledAttributes.getBoolean(R.styleable.SplitPairRule_finishSecondaryWithPrimary, true), typedArrayObtainStyledAttributes.getBoolean(R.styleable.SplitPairRule_clearTop, false), dimension, dimension2, f, i);
    }

    private final SplitPlaceholderRule parseSplitPlaceholderRule(Context context, XmlResourceParser parser) {
        TypedArray typedArrayObtainStyledAttributes = context.getTheme().obtainStyledAttributes(parser, R.styleable.SplitPlaceholderRule, 0, 0);
        String string = typedArrayObtainStyledAttributes.getString(R.styleable.SplitPlaceholderRule_placeholderActivityName);
        float f = typedArrayObtainStyledAttributes.getFloat(R.styleable.SplitPlaceholderRule_splitRatio, 0.0f);
        int dimension = (int) typedArrayObtainStyledAttributes.getDimension(R.styleable.SplitPlaceholderRule_splitMinWidth, 0.0f);
        int dimension2 = (int) typedArrayObtainStyledAttributes.getDimension(R.styleable.SplitPlaceholderRule_splitMinSmallestWidth, 0.0f);
        int i = typedArrayObtainStyledAttributes.getInt(R.styleable.SplitPlaceholderRule_splitLayoutDirection, 3);
        String packageName = context.getApplicationContext().getPackageName();
        Intrinsics.checkNotNullExpressionValue(packageName, "packageName");
        ComponentName componentNameBuildClassName = buildClassName(packageName, string);
        Set setEmptySet = SetsKt.emptySet();
        Intent component = new Intent().setComponent(componentNameBuildClassName);
        Intrinsics.checkNotNullExpressionValue(component, "Intent().setComponent(pl…eholderActivityClassName)");
        return new SplitPlaceholderRule(setEmptySet, component, dimension, dimension2, f, i);
    }

    private final SplitPairFilter parseSplitPairFilter(Context context, XmlResourceParser parser) {
        TypedArray typedArrayObtainStyledAttributes = context.getTheme().obtainStyledAttributes(parser, R.styleable.SplitPairFilter, 0, 0);
        String string = typedArrayObtainStyledAttributes.getString(R.styleable.SplitPairFilter_primaryActivityName);
        String string2 = typedArrayObtainStyledAttributes.getString(R.styleable.SplitPairFilter_secondaryActivityName);
        String string3 = typedArrayObtainStyledAttributes.getString(R.styleable.SplitPairFilter_secondaryActivityAction);
        String packageName = context.getApplicationContext().getPackageName();
        Intrinsics.checkNotNullExpressionValue(packageName, "packageName");
        return new SplitPairFilter(buildClassName(packageName, string), buildClassName(packageName, string2), string3);
    }

    private final ActivityRule parseSplitActivityRule(Context context, XmlResourceParser parser) {
        return new ActivityRule(SetsKt.emptySet(), context.getTheme().obtainStyledAttributes(parser, R.styleable.ActivityRule, 0, 0).getBoolean(R.styleable.ActivityRule_alwaysExpand, false));
    }

    private final ActivityFilter parseActivityFilter(Context context, XmlResourceParser parser) {
        TypedArray typedArrayObtainStyledAttributes = context.getTheme().obtainStyledAttributes(parser, R.styleable.ActivityFilter, 0, 0);
        String string = typedArrayObtainStyledAttributes.getString(R.styleable.ActivityFilter_activityName);
        String string2 = typedArrayObtainStyledAttributes.getString(R.styleable.ActivityFilter_activityAction);
        String packageName = context.getApplicationContext().getPackageName();
        Intrinsics.checkNotNullExpressionValue(packageName, "packageName");
        return new ActivityFilter(buildClassName(packageName, string), string2);
    }

    private final ComponentName buildClassName(String pkg, CharSequence clsSeq) {
        if (clsSeq == null || clsSeq.length() == 0) {
            throw new IllegalArgumentException("Activity name must not be null");
        }
        String string = clsSeq.toString();
        if (string.charAt(0) == '.') {
            return new ComponentName(pkg, Intrinsics.stringPlus(pkg, string));
        }
        int iIndexOf$default = StringsKt.indexOf$default((CharSequence) string, '/', 0, false, 6, (Object) null);
        if (iIndexOf$default > 0) {
            if (string == null) {
                throw new NullPointerException("null cannot be cast to non-null type java.lang.String");
            }
            String strSubstring = string.substring(0, iIndexOf$default);
            Intrinsics.checkNotNullExpressionValue(strSubstring, "(this as java.lang.Strin…ing(startIndex, endIndex)");
            int i = iIndexOf$default + 1;
            if (string == null) {
                throw new NullPointerException("null cannot be cast to non-null type java.lang.String");
            }
            string = string.substring(i);
            Intrinsics.checkNotNullExpressionValue(string, "(this as java.lang.String).substring(startIndex)");
            pkg = strSubstring;
        }
        if (!Intrinsics.areEqual(string, ProxyConfig.MATCH_ALL_SCHEMES) && StringsKt.indexOf$default((CharSequence) string, '.', 0, false, 6, (Object) null) < 0) {
            return new ComponentName(pkg, pkg + '.' + string);
        }
        return new ComponentName(pkg, string);
    }
}
