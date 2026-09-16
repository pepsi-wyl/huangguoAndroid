package kotlin.ranges;

import androidx.media3.exoplayer.rtsp.SessionDescription;
import com.yosemiteyss.flutter_volume_controller.MethodArg;
import io.flutter.embedding.android.KeyboardMap;
import java.util.NoSuchElementException;
import kotlin.Metadata;
import kotlin.UByte;
import kotlin.UInt;
import kotlin.ULong;
import kotlin.UShort;
import kotlin.jvm.internal.Intrinsics;
import kotlin.random.Random;
import kotlin.random.URandomKt;
import kotlin.ranges.UIntProgression;
import kotlin.ranges.ULongProgression;

/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: _URanges.kt */
@Metadata(d1 = {"\u0000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u000b\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\u0010\t\n\u0002\b\n\u001a\u001b\u0010\u0000\u001a\u00020\u0001*\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0001H\u0007¢\u0006\u0004\b\u0003\u0010\u0004\u001a\u001b\u0010\u0000\u001a\u00020\u0005*\u00020\u00052\u0006\u0010\u0002\u001a\u00020\u0005H\u0007¢\u0006\u0004\b\u0006\u0010\u0007\u001a\u001b\u0010\u0000\u001a\u00020\b*\u00020\b2\u0006\u0010\u0002\u001a\u00020\bH\u0007¢\u0006\u0004\b\t\u0010\n\u001a\u001b\u0010\u0000\u001a\u00020\u000b*\u00020\u000b2\u0006\u0010\u0002\u001a\u00020\u000bH\u0007¢\u0006\u0004\b\f\u0010\r\u001a\u001b\u0010\u000e\u001a\u00020\u0001*\u00020\u00012\u0006\u0010\u000f\u001a\u00020\u0001H\u0007¢\u0006\u0004\b\u0010\u0010\u0004\u001a\u001b\u0010\u000e\u001a\u00020\u0005*\u00020\u00052\u0006\u0010\u000f\u001a\u00020\u0005H\u0007¢\u0006\u0004\b\u0011\u0010\u0007\u001a\u001b\u0010\u000e\u001a\u00020\b*\u00020\b2\u0006\u0010\u000f\u001a\u00020\bH\u0007¢\u0006\u0004\b\u0012\u0010\n\u001a\u001b\u0010\u000e\u001a\u00020\u000b*\u00020\u000b2\u0006\u0010\u000f\u001a\u00020\u000bH\u0007¢\u0006\u0004\b\u0013\u0010\r\u001a#\u0010\u0014\u001a\u00020\u0001*\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00012\u0006\u0010\u000f\u001a\u00020\u0001H\u0007¢\u0006\u0004\b\u0015\u0010\u0016\u001a#\u0010\u0014\u001a\u00020\u0005*\u00020\u00052\u0006\u0010\u0002\u001a\u00020\u00052\u0006\u0010\u000f\u001a\u00020\u0005H\u0007¢\u0006\u0004\b\u0017\u0010\u0018\u001a!\u0010\u0014\u001a\u00020\u0005*\u00020\u00052\f\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\u00050\u001aH\u0007¢\u0006\u0004\b\u001b\u0010\u001c\u001a#\u0010\u0014\u001a\u00020\b*\u00020\b2\u0006\u0010\u0002\u001a\u00020\b2\u0006\u0010\u000f\u001a\u00020\bH\u0007¢\u0006\u0004\b\u001d\u0010\u001e\u001a!\u0010\u0014\u001a\u00020\b*\u00020\b2\f\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\b0\u001aH\u0007¢\u0006\u0004\b\u001f\u0010 \u001a#\u0010\u0014\u001a\u00020\u000b*\u00020\u000b2\u0006\u0010\u0002\u001a\u00020\u000b2\u0006\u0010\u000f\u001a\u00020\u000bH\u0007¢\u0006\u0004\b!\u0010\"\u001a\u001c\u0010#\u001a\u00020$*\u00020%2\u0006\u0010&\u001a\u00020\u0001H\u0087\u0002¢\u0006\u0004\b'\u0010(\u001a\u001c\u0010#\u001a\u00020$*\u00020%2\b\u0010)\u001a\u0004\u0018\u00010\u0005H\u0087\n¢\u0006\u0002\b*\u001a\u001c\u0010#\u001a\u00020$*\u00020%2\u0006\u0010&\u001a\u00020\bH\u0087\u0002¢\u0006\u0004\b+\u0010,\u001a\u001c\u0010#\u001a\u00020$*\u00020%2\u0006\u0010&\u001a\u00020\u000bH\u0087\u0002¢\u0006\u0004\b-\u0010.\u001a\u001c\u0010#\u001a\u00020$*\u00020/2\u0006\u0010&\u001a\u00020\u0001H\u0087\u0002¢\u0006\u0004\b0\u00101\u001a\u001c\u0010#\u001a\u00020$*\u00020/2\u0006\u0010&\u001a\u00020\u0005H\u0087\u0002¢\u0006\u0004\b2\u00103\u001a\u001c\u0010#\u001a\u00020$*\u00020/2\b\u0010)\u001a\u0004\u0018\u00010\bH\u0087\n¢\u0006\u0002\b4\u001a\u001c\u0010#\u001a\u00020$*\u00020/2\u0006\u0010&\u001a\u00020\u000bH\u0087\u0002¢\u0006\u0004\b5\u00106\u001a\u001c\u00107\u001a\u000208*\u00020\u00012\u0006\u00109\u001a\u00020\u0001H\u0087\u0004¢\u0006\u0004\b:\u0010;\u001a\u001c\u00107\u001a\u000208*\u00020\u00052\u0006\u00109\u001a\u00020\u0005H\u0087\u0004¢\u0006\u0004\b<\u0010=\u001a\u001c\u00107\u001a\u00020>*\u00020\b2\u0006\u00109\u001a\u00020\bH\u0087\u0004¢\u0006\u0004\b?\u0010@\u001a\u001c\u00107\u001a\u000208*\u00020\u000b2\u0006\u00109\u001a\u00020\u000bH\u0087\u0004¢\u0006\u0004\bA\u0010B\u001a\u0011\u0010C\u001a\u00020\u0005*\u000208H\u0007¢\u0006\u0002\u0010D\u001a\u0011\u0010C\u001a\u00020\b*\u00020>H\u0007¢\u0006\u0002\u0010E\u001a\u000e\u0010F\u001a\u0004\u0018\u00010\u0005*\u000208H\u0007\u001a\u000e\u0010F\u001a\u0004\u0018\u00010\b*\u00020>H\u0007\u001a\u0011\u0010G\u001a\u00020\u0005*\u000208H\u0007¢\u0006\u0002\u0010D\u001a\u0011\u0010G\u001a\u00020\b*\u00020>H\u0007¢\u0006\u0002\u0010E\u001a\u000e\u0010H\u001a\u0004\u0018\u00010\u0005*\u000208H\u0007\u001a\u000e\u0010H\u001a\u0004\u0018\u00010\b*\u00020>H\u0007\u001a\u0012\u0010I\u001a\u00020\u0005*\u00020%H\u0087\b¢\u0006\u0002\u0010J\u001a\u0019\u0010I\u001a\u00020\u0005*\u00020%2\u0006\u0010I\u001a\u00020KH\u0007¢\u0006\u0002\u0010L\u001a\u0012\u0010I\u001a\u00020\b*\u00020/H\u0087\b¢\u0006\u0002\u0010M\u001a\u0019\u0010I\u001a\u00020\b*\u00020/2\u0006\u0010I\u001a\u00020KH\u0007¢\u0006\u0002\u0010N\u001a\u000f\u0010O\u001a\u0004\u0018\u00010\u0005*\u00020%H\u0087\b\u001a\u0016\u0010O\u001a\u0004\u0018\u00010\u0005*\u00020%2\u0006\u0010I\u001a\u00020KH\u0007\u001a\u000f\u0010O\u001a\u0004\u0018\u00010\b*\u00020/H\u0087\b\u001a\u0016\u0010O\u001a\u0004\u0018\u00010\b*\u00020/2\u0006\u0010I\u001a\u00020KH\u0007\u001a\f\u0010P\u001a\u000208*\u000208H\u0007\u001a\f\u0010P\u001a\u00020>*\u00020>H\u0007\u001a\u0015\u0010Q\u001a\u000208*\u0002082\u0006\u0010Q\u001a\u00020RH\u0087\u0004\u001a\u0015\u0010Q\u001a\u00020>*\u00020>2\u0006\u0010Q\u001a\u00020SH\u0087\u0004\u001a\u001c\u0010T\u001a\u00020%*\u00020\u00012\u0006\u00109\u001a\u00020\u0001H\u0087\u0004¢\u0006\u0004\bU\u0010V\u001a\u001c\u0010T\u001a\u00020%*\u00020\u00052\u0006\u00109\u001a\u00020\u0005H\u0087\u0004¢\u0006\u0004\bW\u0010X\u001a\u001c\u0010T\u001a\u00020/*\u00020\b2\u0006\u00109\u001a\u00020\bH\u0087\u0004¢\u0006\u0004\bY\u0010Z\u001a\u001c\u0010T\u001a\u00020%*\u00020\u000b2\u0006\u00109\u001a\u00020\u000bH\u0087\u0004¢\u0006\u0004\b[\u0010\\¨\u0006]"}, d2 = {"coerceAtLeast", "Lkotlin/UByte;", "minimumValue", "coerceAtLeast-Kr8caGY", "(BB)B", "Lkotlin/UInt;", "coerceAtLeast-J1ME1BU", "(II)I", "Lkotlin/ULong;", "coerceAtLeast-eb3DHEI", "(JJ)J", "Lkotlin/UShort;", "coerceAtLeast-5PvTz6A", "(SS)S", "coerceAtMost", "maximumValue", "coerceAtMost-Kr8caGY", "coerceAtMost-J1ME1BU", "coerceAtMost-eb3DHEI", "coerceAtMost-5PvTz6A", "coerceIn", "coerceIn-b33U2AM", "(BBB)B", "coerceIn-WZ9TVnA", "(III)I", SessionDescription.ATTR_RANGE, "Lkotlin/ranges/ClosedRange;", "coerceIn-wuiCnnA", "(ILkotlin/ranges/ClosedRange;)I", "coerceIn-sambcqE", "(JJJ)J", "coerceIn-JPwROB0", "(JLkotlin/ranges/ClosedRange;)J", "coerceIn-VKSA0NQ", "(SSS)S", "contains", "", "Lkotlin/ranges/UIntRange;", "value", "contains-68kG9v0", "(Lkotlin/ranges/UIntRange;B)Z", "element", "contains-biwQdVI", "contains-fz5IDCE", "(Lkotlin/ranges/UIntRange;J)Z", "contains-ZsK3CEQ", "(Lkotlin/ranges/UIntRange;S)Z", "Lkotlin/ranges/ULongRange;", "contains-ULb-yJY", "(Lkotlin/ranges/ULongRange;B)Z", "contains-Gab390E", "(Lkotlin/ranges/ULongRange;I)Z", "contains-GYNo2lE", "contains-uhHAxoY", "(Lkotlin/ranges/ULongRange;S)Z", "downTo", "Lkotlin/ranges/UIntProgression;", "to", "downTo-Kr8caGY", "(BB)Lkotlin/ranges/UIntProgression;", "downTo-J1ME1BU", "(II)Lkotlin/ranges/UIntProgression;", "Lkotlin/ranges/ULongProgression;", "downTo-eb3DHEI", "(JJ)Lkotlin/ranges/ULongProgression;", "downTo-5PvTz6A", "(SS)Lkotlin/ranges/UIntProgression;", "first", "(Lkotlin/ranges/UIntProgression;)I", "(Lkotlin/ranges/ULongProgression;)J", "firstOrNull", "last", "lastOrNull", "random", "(Lkotlin/ranges/UIntRange;)I", "Lkotlin/random/Random;", "(Lkotlin/ranges/UIntRange;Lkotlin/random/Random;)I", "(Lkotlin/ranges/ULongRange;)J", "(Lkotlin/ranges/ULongRange;Lkotlin/random/Random;)J", "randomOrNull", "reversed", MethodArg.STEP, "", "", "until", "until-Kr8caGY", "(BB)Lkotlin/ranges/UIntRange;", "until-J1ME1BU", "(II)Lkotlin/ranges/UIntRange;", "until-eb3DHEI", "(JJ)Lkotlin/ranges/ULongRange;", "until-5PvTz6A", "(SS)Lkotlin/ranges/UIntRange;", "kotlin-stdlib"}, k = 5, mv = {1, 9, 0}, xi = 49, xs = "kotlin/ranges/URangesKt")
/* loaded from: classes2.dex */
public class URangesKt___URangesKt {
    public static final int first(UIntProgression uIntProgression) {
        Intrinsics.checkNotNullParameter(uIntProgression, "<this>");
        if (uIntProgression.isEmpty()) {
            throw new NoSuchElementException("Progression " + uIntProgression + " is empty.");
        }
        return uIntProgression.getFirst();
    }

    public static final long first(ULongProgression uLongProgression) {
        Intrinsics.checkNotNullParameter(uLongProgression, "<this>");
        if (uLongProgression.isEmpty()) {
            throw new NoSuchElementException("Progression " + uLongProgression + " is empty.");
        }
        return uLongProgression.getFirst();
    }

    public static final UInt firstOrNull(UIntProgression uIntProgression) {
        Intrinsics.checkNotNullParameter(uIntProgression, "<this>");
        if (uIntProgression.isEmpty()) {
            return null;
        }
        return UInt.m587boximpl(uIntProgression.getFirst());
    }

    public static final ULong firstOrNull(ULongProgression uLongProgression) {
        Intrinsics.checkNotNullParameter(uLongProgression, "<this>");
        if (uLongProgression.isEmpty()) {
            return null;
        }
        return ULong.m666boximpl(uLongProgression.getFirst());
    }

    public static final int last(UIntProgression uIntProgression) {
        Intrinsics.checkNotNullParameter(uIntProgression, "<this>");
        if (uIntProgression.isEmpty()) {
            throw new NoSuchElementException("Progression " + uIntProgression + " is empty.");
        }
        return uIntProgression.getLast();
    }

    public static final long last(ULongProgression uLongProgression) {
        Intrinsics.checkNotNullParameter(uLongProgression, "<this>");
        if (uLongProgression.isEmpty()) {
            throw new NoSuchElementException("Progression " + uLongProgression + " is empty.");
        }
        return uLongProgression.getLast();
    }

    public static final UInt lastOrNull(UIntProgression uIntProgression) {
        Intrinsics.checkNotNullParameter(uIntProgression, "<this>");
        if (uIntProgression.isEmpty()) {
            return null;
        }
        return UInt.m587boximpl(uIntProgression.getLast());
    }

    public static final ULong lastOrNull(ULongProgression uLongProgression) {
        Intrinsics.checkNotNullParameter(uLongProgression, "<this>");
        if (uLongProgression.isEmpty()) {
            return null;
        }
        return ULong.m666boximpl(uLongProgression.getLast());
    }

    private static final int random(UIntRange uIntRange) {
        Intrinsics.checkNotNullParameter(uIntRange, "<this>");
        return URangesKt.random(uIntRange, Random.INSTANCE);
    }

    private static final long random(ULongRange uLongRange) {
        Intrinsics.checkNotNullParameter(uLongRange, "<this>");
        return URangesKt.random(uLongRange, Random.INSTANCE);
    }

    public static final int random(UIntRange uIntRange, Random random) {
        Intrinsics.checkNotNullParameter(uIntRange, "<this>");
        Intrinsics.checkNotNullParameter(random, "random");
        try {
            return URandomKt.nextUInt(random, uIntRange);
        } catch (IllegalArgumentException e) {
            throw new NoSuchElementException(e.getMessage());
        }
    }

    public static final long random(ULongRange uLongRange, Random random) {
        Intrinsics.checkNotNullParameter(uLongRange, "<this>");
        Intrinsics.checkNotNullParameter(random, "random");
        try {
            return URandomKt.nextULong(random, uLongRange);
        } catch (IllegalArgumentException e) {
            throw new NoSuchElementException(e.getMessage());
        }
    }

    private static final UInt randomOrNull(UIntRange uIntRange) {
        Intrinsics.checkNotNullParameter(uIntRange, "<this>");
        return URangesKt.randomOrNull(uIntRange, Random.INSTANCE);
    }

    private static final ULong randomOrNull(ULongRange uLongRange) {
        Intrinsics.checkNotNullParameter(uLongRange, "<this>");
        return URangesKt.randomOrNull(uLongRange, Random.INSTANCE);
    }

    public static final UInt randomOrNull(UIntRange uIntRange, Random random) {
        Intrinsics.checkNotNullParameter(uIntRange, "<this>");
        Intrinsics.checkNotNullParameter(random, "random");
        if (uIntRange.isEmpty()) {
            return null;
        }
        return UInt.m587boximpl(URandomKt.nextUInt(random, uIntRange));
    }

    public static final ULong randomOrNull(ULongRange uLongRange, Random random) {
        Intrinsics.checkNotNullParameter(uLongRange, "<this>");
        Intrinsics.checkNotNullParameter(random, "random");
        if (uLongRange.isEmpty()) {
            return null;
        }
        return ULong.m666boximpl(URandomKt.nextULong(random, uLongRange));
    }

    /* renamed from: contains-biwQdVI, reason: not valid java name */
    private static final boolean m1805containsbiwQdVI(UIntRange contains, UInt uInt) {
        Intrinsics.checkNotNullParameter(contains, "$this$contains");
        return uInt != null && contains.m1773containsWZ4Q5Ns(uInt.getData());
    }

    /* renamed from: contains-GYNo2lE, reason: not valid java name */
    private static final boolean m1801containsGYNo2lE(ULongRange contains, ULong uLong) {
        Intrinsics.checkNotNullParameter(contains, "$this$contains");
        return uLong != null && contains.m1782containsVKZWuLQ(uLong.getData());
    }

    /* renamed from: contains-68kG9v0, reason: not valid java name */
    public static final boolean m1800contains68kG9v0(UIntRange contains, byte b) {
        Intrinsics.checkNotNullParameter(contains, "$this$contains");
        return contains.m1773containsWZ4Q5Ns(UInt.m593constructorimpl(b & 255));
    }

    /* renamed from: contains-ULb-yJY, reason: not valid java name */
    public static final boolean m1803containsULbyJY(ULongRange contains, byte b) {
        Intrinsics.checkNotNullParameter(contains, "$this$contains");
        return contains.m1782containsVKZWuLQ(ULong.m672constructorimpl(b & 255));
    }

    /* renamed from: contains-Gab390E, reason: not valid java name */
    public static final boolean m1802containsGab390E(ULongRange contains, int i) {
        Intrinsics.checkNotNullParameter(contains, "$this$contains");
        return contains.m1782containsVKZWuLQ(ULong.m672constructorimpl(i & KeyboardMap.kValueMask));
    }

    /* renamed from: contains-fz5IDCE, reason: not valid java name */
    public static final boolean m1806containsfz5IDCE(UIntRange contains, long j) {
        Intrinsics.checkNotNullParameter(contains, "$this$contains");
        return ULong.m672constructorimpl(j >>> 32) == 0 && contains.m1773containsWZ4Q5Ns(UInt.m593constructorimpl((int) j));
    }

    /* renamed from: contains-ZsK3CEQ, reason: not valid java name */
    public static final boolean m1804containsZsK3CEQ(UIntRange contains, short s) {
        Intrinsics.checkNotNullParameter(contains, "$this$contains");
        return contains.m1773containsWZ4Q5Ns(UInt.m593constructorimpl(s & UShort.MAX_VALUE));
    }

    /* renamed from: contains-uhHAxoY, reason: not valid java name */
    public static final boolean m1807containsuhHAxoY(ULongRange contains, short s) {
        Intrinsics.checkNotNullParameter(contains, "$this$contains");
        return contains.m1782containsVKZWuLQ(ULong.m672constructorimpl(s & 65535));
    }

    /* renamed from: downTo-Kr8caGY, reason: not valid java name */
    public static final UIntProgression m1810downToKr8caGY(byte b, byte b2) {
        return UIntProgression.INSTANCE.m1770fromClosedRangeNkh28Cs(UInt.m593constructorimpl(b & 255), UInt.m593constructorimpl(b2 & 255), -1);
    }

    /* renamed from: downTo-J1ME1BU, reason: not valid java name */
    public static final UIntProgression m1809downToJ1ME1BU(int i, int i2) {
        return UIntProgression.INSTANCE.m1770fromClosedRangeNkh28Cs(i, i2, -1);
    }

    /* renamed from: downTo-eb3DHEI, reason: not valid java name */
    public static final ULongProgression m1811downToeb3DHEI(long j, long j2) {
        return ULongProgression.INSTANCE.m1779fromClosedRange7ftBX0g(j, j2, -1L);
    }

    /* renamed from: downTo-5PvTz6A, reason: not valid java name */
    public static final UIntProgression m1808downTo5PvTz6A(short s, short s2) {
        return UIntProgression.INSTANCE.m1770fromClosedRangeNkh28Cs(UInt.m593constructorimpl(s & UShort.MAX_VALUE), UInt.m593constructorimpl(s2 & UShort.MAX_VALUE), -1);
    }

    public static final UIntProgression reversed(UIntProgression uIntProgression) {
        Intrinsics.checkNotNullParameter(uIntProgression, "<this>");
        return UIntProgression.INSTANCE.m1770fromClosedRangeNkh28Cs(uIntProgression.getLast(), uIntProgression.getFirst(), -uIntProgression.getStep());
    }

    public static final ULongProgression reversed(ULongProgression uLongProgression) {
        Intrinsics.checkNotNullParameter(uLongProgression, "<this>");
        return ULongProgression.INSTANCE.m1779fromClosedRange7ftBX0g(uLongProgression.getLast(), uLongProgression.getFirst(), -uLongProgression.getStep());
    }

    public static final UIntProgression step(UIntProgression uIntProgression, int i) {
        Intrinsics.checkNotNullParameter(uIntProgression, "<this>");
        RangesKt.checkStepIsPositive(i > 0, Integer.valueOf(i));
        UIntProgression.Companion companion = UIntProgression.INSTANCE;
        int iM1768getFirstpVg5ArA = uIntProgression.getFirst();
        int iM1769getLastpVg5ArA = uIntProgression.getLast();
        if (uIntProgression.getStep() <= 0) {
            i = -i;
        }
        return companion.m1770fromClosedRangeNkh28Cs(iM1768getFirstpVg5ArA, iM1769getLastpVg5ArA, i);
    }

    public static final ULongProgression step(ULongProgression uLongProgression, long j) {
        Intrinsics.checkNotNullParameter(uLongProgression, "<this>");
        RangesKt.checkStepIsPositive(j > 0, Long.valueOf(j));
        ULongProgression.Companion companion = ULongProgression.INSTANCE;
        long jM1777getFirstsVKNKU = uLongProgression.getFirst();
        long jM1778getLastsVKNKU = uLongProgression.getLast();
        if (uLongProgression.getStep() <= 0) {
            j = -j;
        }
        return companion.m1779fromClosedRange7ftBX0g(jM1777getFirstsVKNKU, jM1778getLastsVKNKU, j);
    }

    /* renamed from: until-Kr8caGY, reason: not valid java name */
    public static final UIntRange m1814untilKr8caGY(byte b, byte b2) {
        return Intrinsics.compare(b2 & 255, 0) <= 0 ? UIntRange.INSTANCE.getEMPTY() : new UIntRange(UInt.m593constructorimpl(b & 255), UInt.m593constructorimpl(UInt.m593constructorimpl(r3) - 1), null);
    }

    /* renamed from: until-J1ME1BU, reason: not valid java name */
    public static final UIntRange m1813untilJ1ME1BU(int i, int i2) {
        return Integer.compare(i2 ^ Integer.MIN_VALUE, 0 ^ Integer.MIN_VALUE) <= 0 ? UIntRange.INSTANCE.getEMPTY() : new UIntRange(i, UInt.m593constructorimpl(i2 - 1), null);
    }

    /* renamed from: until-eb3DHEI, reason: not valid java name */
    public static final ULongRange m1815untileb3DHEI(long j, long j2) {
        return Long.compare(j2 ^ Long.MIN_VALUE, 0 ^ Long.MIN_VALUE) <= 0 ? ULongRange.INSTANCE.getEMPTY() : new ULongRange(j, ULong.m672constructorimpl(j2 - ULong.m672constructorimpl(1 & KeyboardMap.kValueMask)), null);
    }

    /* renamed from: until-5PvTz6A, reason: not valid java name */
    public static final UIntRange m1812until5PvTz6A(short s, short s2) {
        return Intrinsics.compare(s2 & UShort.MAX_VALUE, 0) <= 0 ? UIntRange.INSTANCE.getEMPTY() : new UIntRange(UInt.m593constructorimpl(s & UShort.MAX_VALUE), UInt.m593constructorimpl(UInt.m593constructorimpl(r3) - 1), null);
    }

    /* renamed from: coerceAtLeast-J1ME1BU, reason: not valid java name */
    public static final int m1787coerceAtLeastJ1ME1BU(int i, int i2) {
        return Integer.compare(i ^ Integer.MIN_VALUE, i2 ^ Integer.MIN_VALUE) < 0 ? i2 : i;
    }

    /* renamed from: coerceAtLeast-eb3DHEI, reason: not valid java name */
    public static final long m1789coerceAtLeasteb3DHEI(long j, long j2) {
        return Long.compare(j ^ Long.MIN_VALUE, j2 ^ Long.MIN_VALUE) < 0 ? j2 : j;
    }

    /* renamed from: coerceAtLeast-Kr8caGY, reason: not valid java name */
    public static final byte m1788coerceAtLeastKr8caGY(byte b, byte b2) {
        return Intrinsics.compare(b & 255, b2 & 255) < 0 ? b2 : b;
    }

    /* renamed from: coerceAtLeast-5PvTz6A, reason: not valid java name */
    public static final short m1786coerceAtLeast5PvTz6A(short s, short s2) {
        return Intrinsics.compare(s & UShort.MAX_VALUE, 65535 & s2) < 0 ? s2 : s;
    }

    /* renamed from: coerceAtMost-J1ME1BU, reason: not valid java name */
    public static final int m1791coerceAtMostJ1ME1BU(int i, int i2) {
        return Integer.compare(i ^ Integer.MIN_VALUE, i2 ^ Integer.MIN_VALUE) > 0 ? i2 : i;
    }

    /* renamed from: coerceAtMost-eb3DHEI, reason: not valid java name */
    public static final long m1793coerceAtMosteb3DHEI(long j, long j2) {
        return Long.compare(j ^ Long.MIN_VALUE, j2 ^ Long.MIN_VALUE) > 0 ? j2 : j;
    }

    /* renamed from: coerceAtMost-Kr8caGY, reason: not valid java name */
    public static final byte m1792coerceAtMostKr8caGY(byte b, byte b2) {
        return Intrinsics.compare(b & 255, b2 & 255) > 0 ? b2 : b;
    }

    /* renamed from: coerceAtMost-5PvTz6A, reason: not valid java name */
    public static final short m1790coerceAtMost5PvTz6A(short s, short s2) {
        return Intrinsics.compare(s & UShort.MAX_VALUE, 65535 & s2) > 0 ? s2 : s;
    }

    /* renamed from: coerceIn-WZ9TVnA, reason: not valid java name */
    public static final int m1796coerceInWZ9TVnA(int i, int i2, int i3) {
        if (Integer.compare(i2 ^ Integer.MIN_VALUE, i3 ^ Integer.MIN_VALUE) <= 0) {
            return Integer.compare(i ^ Integer.MIN_VALUE, i2 ^ Integer.MIN_VALUE) < 0 ? i2 : Integer.compare(i ^ Integer.MIN_VALUE, i3 ^ Integer.MIN_VALUE) > 0 ? i3 : i;
        }
        throw new IllegalArgumentException("Cannot coerce value to an empty range: maximum " + ((Object) UInt.m639toStringimpl(i3)) + " is less than minimum " + ((Object) UInt.m639toStringimpl(i2)) + '.');
    }

    /* renamed from: coerceIn-sambcqE, reason: not valid java name */
    public static final long m1798coerceInsambcqE(long j, long j2, long j3) {
        if (Long.compare(j2 ^ Long.MIN_VALUE, j3 ^ Long.MIN_VALUE) <= 0) {
            return Long.compare(j ^ Long.MIN_VALUE, j2 ^ Long.MIN_VALUE) < 0 ? j2 : Long.compare(j ^ Long.MIN_VALUE, j3 ^ Long.MIN_VALUE) > 0 ? j3 : j;
        }
        throw new IllegalArgumentException("Cannot coerce value to an empty range: maximum " + ((Object) ULong.m718toStringimpl(j3)) + " is less than minimum " + ((Object) ULong.m718toStringimpl(j2)) + '.');
    }

    /* renamed from: coerceIn-b33U2AM, reason: not valid java name */
    public static final byte m1797coerceInb33U2AM(byte b, byte b2, byte b3) {
        int i = b2 & 255;
        int i2 = b3 & 255;
        if (Intrinsics.compare(i, i2) <= 0) {
            int i3 = b & 255;
            return Intrinsics.compare(i3, i) < 0 ? b2 : Intrinsics.compare(i3, i2) > 0 ? b3 : b;
        }
        throw new IllegalArgumentException("Cannot coerce value to an empty range: maximum " + ((Object) UByte.m559toStringimpl(b3)) + " is less than minimum " + ((Object) UByte.m559toStringimpl(b2)) + '.');
    }

    /* renamed from: coerceIn-VKSA0NQ, reason: not valid java name */
    public static final short m1795coerceInVKSA0NQ(short s, short s2, short s3) {
        int i = s2 & UShort.MAX_VALUE;
        int i2 = s3 & UShort.MAX_VALUE;
        if (Intrinsics.compare(i, i2) <= 0) {
            int i3 = 65535 & s;
            return Intrinsics.compare(i3, i) < 0 ? s2 : Intrinsics.compare(i3, i2) > 0 ? s3 : s;
        }
        throw new IllegalArgumentException("Cannot coerce value to an empty range: maximum " + ((Object) UShort.m823toStringimpl(s3)) + " is less than minimum " + ((Object) UShort.m823toStringimpl(s2)) + '.');
    }

    /* renamed from: coerceIn-wuiCnnA, reason: not valid java name */
    public static final int m1799coerceInwuiCnnA(int i, ClosedRange<UInt> range) {
        Intrinsics.checkNotNullParameter(range, "range");
        if (range instanceof ClosedFloatingPointRange) {
            return ((UInt) RangesKt.coerceIn(UInt.m587boximpl(i), (ClosedFloatingPointRange<UInt>) range)).getData();
        }
        if (!range.isEmpty()) {
            return Integer.compare(i ^ Integer.MIN_VALUE, ((UInt) range.getStart()).getData() ^ Integer.MIN_VALUE) < 0 ? ((UInt) range.getStart()).getData() : Integer.compare(i ^ Integer.MIN_VALUE, ((UInt) range.getEndInclusive()).getData() ^ Integer.MIN_VALUE) > 0 ? ((UInt) range.getEndInclusive()).getData() : i;
        }
        throw new IllegalArgumentException("Cannot coerce value to an empty range: " + range + '.');
    }

    /* renamed from: coerceIn-JPwROB0, reason: not valid java name */
    public static final long m1794coerceInJPwROB0(long j, ClosedRange<ULong> range) {
        Intrinsics.checkNotNullParameter(range, "range");
        if (range instanceof ClosedFloatingPointRange) {
            return ((ULong) RangesKt.coerceIn(ULong.m666boximpl(j), (ClosedFloatingPointRange<ULong>) range)).getData();
        }
        if (!range.isEmpty()) {
            return Long.compare(j ^ Long.MIN_VALUE, ((ULong) range.getStart()).getData() ^ Long.MIN_VALUE) < 0 ? ((ULong) range.getStart()).getData() : Long.compare(j ^ Long.MIN_VALUE, ((ULong) range.getEndInclusive()).getData() ^ Long.MIN_VALUE) > 0 ? ((ULong) range.getEndInclusive()).getData() : j;
        }
        throw new IllegalArgumentException("Cannot coerce value to an empty range: " + range + '.');
    }
}
