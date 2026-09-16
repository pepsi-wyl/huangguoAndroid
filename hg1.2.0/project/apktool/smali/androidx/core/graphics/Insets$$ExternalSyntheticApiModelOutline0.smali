.class public final synthetic Landroidx/core/graphics/Insets$$ExternalSyntheticApiModelOutline0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"


# direct methods
.method public static bridge synthetic m(I)F
    .locals 0

    .line 0
    invoke-static {p0}, Landroid/graphics/Color;->luminance(I)F

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(J)F
    .locals 0

    .line 0
    invoke-static {p0, p1}, Landroid/graphics/Color;->luminance(J)F

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/graphics/Color;I)F
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/graphics/Color;->getComponent(I)F

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/location/GnssStatus;I)F
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/location/GnssStatus;->getCn0DbHz(I)F

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(J)I
    .locals 0

    .line 0
    invoke-static {p0, p1}, Landroid/graphics/Color;->toArgb(J)I

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/graphics/Color;)I
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/graphics/Color;->toArgb()I

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/graphics/Insets;)I
    .locals 0

    .line 0
    iget p0, p0, Landroid/graphics/Insets;->left:I

    return p0
.end method

.method public static bridge synthetic m(Landroid/icu/text/DateFormat$HourCycle;)I
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/icu/text/DateFormat$HourCycle;->ordinal()I

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/location/GnssStatus;)I
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/location/GnssStatus;->hashCode()I

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/location/GnssStatus;I)I
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/location/GnssStatus;->getSvid(I)I

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/os/LocaleList;)I
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/os/LocaleList;->size()I

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/os/LocaleList;Ljava/util/Locale;)I
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/os/LocaleList;->indexOf(Ljava/util/Locale;)I

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/text/PrecomputedText$Params;)I
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/text/PrecomputedText$Params;->getBreakStrategy()I

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/text/PrecomputedText;)I
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/text/PrecomputedText;->getParagraphCount()I

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/text/PrecomputedText;I)I
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/text/PrecomputedText;->getParagraphEnd(I)I

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(I)J
    .locals 2

    .line 0
    invoke-static {p0}, Landroid/graphics/Color;->pack(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public static bridge synthetic m(ILandroid/graphics/ColorSpace;)J
    .locals 0

    .line 0
    invoke-static {p0, p1}, Landroid/graphics/Color;->convert(ILandroid/graphics/ColorSpace;)J

    move-result-wide p0

    return-wide p0
.end method

.method public static bridge synthetic m(JLandroid/graphics/ColorSpace;)J
    .locals 0

    .line 0
    invoke-static {p0, p1, p2}, Landroid/graphics/Color;->convert(JLandroid/graphics/ColorSpace;)J

    move-result-wide p0

    return-wide p0
.end method

.method public static bridge synthetic m(IILandroid/graphics/Bitmap$Config;ZLandroid/graphics/ColorSpace;)Landroid/graphics/Bitmap;
    .locals 0

    .line 0
    invoke-static {p0, p1, p2, p3, p4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;ZLandroid/graphics/ColorSpace;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/graphics/ImageDecoder$Source;Landroid/graphics/ImageDecoder$OnHeaderDecodedListener;)Landroid/graphics/Bitmap;
    .locals 0

    .line 0
    invoke-static {p0, p1}, Landroid/graphics/ImageDecoder;->decodeBitmap(Landroid/graphics/ImageDecoder$Source;Landroid/graphics/ImageDecoder$OnHeaderDecodedListener;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(I)Landroid/graphics/Color;
    .locals 0

    .line 0
    invoke-static {p0}, Landroid/graphics/Color;->valueOf(I)Landroid/graphics/Color;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(J)Landroid/graphics/Color;
    .locals 0

    .line 0
    invoke-static {p0, p1}, Landroid/graphics/Color;->valueOf(J)Landroid/graphics/Color;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/graphics/Color;Landroid/graphics/ColorSpace;)Landroid/graphics/Color;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/graphics/Color;->convert(Landroid/graphics/ColorSpace;)Landroid/graphics/Color;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m()Landroid/graphics/ColorSpace$Named;
    .locals 1

    .line 0
    sget-object v0, Landroid/graphics/ColorSpace$Named;->SRGB:Landroid/graphics/ColorSpace$Named;

    return-object v0
.end method

.method public static bridge synthetic m(J)Landroid/graphics/ColorSpace;
    .locals 0

    .line 0
    invoke-static {p0, p1}, Landroid/graphics/Color;->colorSpace(J)Landroid/graphics/ColorSpace;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/graphics/ColorSpace$Named;)Landroid/graphics/ColorSpace;
    .locals 0

    .line 0
    invoke-static {p0}, Landroid/graphics/ColorSpace;->get(Landroid/graphics/ColorSpace$Named;)Landroid/graphics/ColorSpace;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/lang/Object;)Landroid/graphics/ImageDecoder$OnHeaderDecodedListener;
    .locals 0

    .line 0
    check-cast p0, Landroid/graphics/ImageDecoder$OnHeaderDecodedListener;

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/graphics/ImageDecoder$Source;Landroid/graphics/ImageDecoder$OnHeaderDecodedListener;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 0
    invoke-static {p0, p1}, Landroid/graphics/ImageDecoder;->decodeDrawable(Landroid/graphics/ImageDecoder$Source;Landroid/graphics/ImageDecoder$OnHeaderDecodedListener;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Icon;
    .locals 0

    .line 0
    invoke-static {p0}, Landroid/graphics/drawable/Icon;->createWithAdaptiveBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Icon;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/net/Uri;)Landroid/graphics/drawable/Icon;
    .locals 0

    .line 0
    invoke-static {p0}, Landroid/graphics/drawable/Icon;->createWithContentUri(Landroid/net/Uri;)Landroid/graphics/drawable/Icon;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m([BII)Landroid/graphics/drawable/Icon;
    .locals 0

    .line 0
    invoke-static {p0, p1, p2}, Landroid/graphics/drawable/Icon;->createWithData([BII)Landroid/graphics/drawable/Icon;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m()Landroid/icu/text/DateFormat$HourCycle;
    .locals 1

    .line 0
    sget-object v0, Landroid/icu/text/DateFormat$HourCycle;->HOUR_CYCLE_11:Landroid/icu/text/DateFormat$HourCycle;

    return-object v0
.end method

.method public static bridge synthetic m(Ljava/lang/Object;)Landroid/location/GnssMeasurementsEvent$Callback;
    .locals 0

    .line 0
    check-cast p0, Landroid/location/GnssMeasurementsEvent$Callback;

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/lang/Object;)Landroid/location/GnssStatus;
    .locals 0

    .line 0
    check-cast p0, Landroid/location/GnssStatus;

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/lang/Object;)Landroid/location/LocationRequest;
    .locals 0

    .line 0
    check-cast p0, Landroid/location/LocationRequest;

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/text/TextPaint;)Landroid/os/LocaleList;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/text/TextPaint;->getTextLocales()Landroid/os/LocaleList;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/lang/Object;)Landroid/os/LocaleList;
    .locals 0

    .line 0
    check-cast p0, Landroid/os/LocaleList;

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/lang/Object;)Landroid/os/OutcomeReceiver;
    .locals 0

    .line 0
    check-cast p0, Landroid/os/OutcomeReceiver;

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/text/PrecomputedText$Params$Builder;I)Landroid/text/PrecomputedText$Params$Builder;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/text/PrecomputedText$Params$Builder;->setBreakStrategy(I)Landroid/text/PrecomputedText$Params$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/text/PrecomputedText$Params$Builder;Landroid/text/TextDirectionHeuristic;)Landroid/text/PrecomputedText$Params$Builder;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/text/PrecomputedText$Params$Builder;->setTextDirection(Landroid/text/TextDirectionHeuristic;)Landroid/text/PrecomputedText$Params$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m(Landroid/text/TextPaint;)Landroid/text/PrecomputedText$Params$Builder;
    .locals 1

    .line 0
    new-instance v0, Landroid/text/PrecomputedText$Params$Builder;

    invoke-direct {v0, p0}, Landroid/text/PrecomputedText$Params$Builder;-><init>(Landroid/text/TextPaint;)V

    return-object v0
.end method

.method public static bridge synthetic m(Landroid/text/PrecomputedText$Params$Builder;)Landroid/text/PrecomputedText$Params;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/text/PrecomputedText$Params$Builder;->build()Landroid/text/PrecomputedText$Params;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/lang/CharSequence;Landroid/text/PrecomputedText$Params;)Landroid/text/PrecomputedText;
    .locals 0

    .line 0
    invoke-static {p0, p1}, Landroid/text/PrecomputedText;->create(Ljava/lang/CharSequence;Landroid/text/PrecomputedText$Params;)Landroid/text/PrecomputedText;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/lang/Object;)Landroid/text/PrecomputedText;
    .locals 0

    .line 0
    check-cast p0, Landroid/text/PrecomputedText;

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/text/StaticLayout$Builder;I)Landroid/text/StaticLayout$Builder;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/text/StaticLayout$Builder;->setBreakStrategy(I)Landroid/text/StaticLayout$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/text/StaticLayout$Builder;Landroid/text/TextDirectionHeuristic;)Landroid/text/StaticLayout$Builder;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/text/StaticLayout$Builder;->setTextDirection(Landroid/text/TextDirectionHeuristic;)Landroid/text/StaticLayout$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/lang/CharSequence;IILandroid/text/TextPaint;I)Landroid/text/StaticLayout$Builder;
    .locals 0

    .line 0
    invoke-static {p0, p1, p2, p3, p4}, Landroid/text/StaticLayout$Builder;->obtain(Ljava/lang/CharSequence;IILandroid/text/TextPaint;I)Landroid/text/StaticLayout$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/text/StaticLayout$Builder;)Landroid/text/StaticLayout;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/text/StaticLayout$Builder;->build()Landroid/text/StaticLayout;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/text/PrecomputedText$Params;)Landroid/text/TextDirectionHeuristic;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/text/PrecomputedText$Params;->getTextDirection()Landroid/text/TextDirectionHeuristic;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/text/PrecomputedText$Params;)Landroid/text/TextPaint;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/text/PrecomputedText$Params;->getTextPaint()Landroid/text/TextPaint;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m()Ljava/lang/Class;
    .locals 1

    .line 0
    const-class v0, Landroid/location/GnssMeasurementsEvent$Callback;

    return-object v0
.end method

.method public static bridge synthetic m(Landroid/os/LocaleList;)Ljava/lang/String;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/os/LocaleList;->toLanguageTags()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/text/TextPaint;)Ljava/lang/String;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/text/TextPaint;->getFontVariationSettings()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutManager;)Ljava/util/List;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/content/pm/ShortcutManager;->getDynamicShortcuts()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutManager;I)Ljava/util/List;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/content/pm/ShortcutManager;->getShortcuts(I)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/os/LocaleList;I)Ljava/util/Locale;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/os/LocaleList;->get(I)Ljava/util/Locale;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/os/LocaleList;[Ljava/lang/String;)Ljava/util/Locale;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/os/LocaleList;->getFirstMatch([Ljava/lang/String;)Ljava/util/Locale;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutManager;)V
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/content/pm/ShortcutManager;->removeAllDynamicShortcuts()V

    return-void
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutManager;Landroid/content/pm/ShortcutInfo;)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/content/pm/ShortcutManager;->pushDynamicShortcut(Landroid/content/pm/ShortcutInfo;)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutManager;Ljava/lang/String;)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/content/pm/ShortcutManager;->reportShortcutUsed(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/location/GnssMeasurementsEvent$Callback;I)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/location/GnssMeasurementsEvent$Callback;->onStatusChanged(I)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/location/GnssMeasurementsEvent$Callback;Landroid/location/GnssMeasurementsEvent;)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/location/GnssMeasurementsEvent$Callback;->onGnssMeasurementsReceived(Landroid/location/GnssMeasurementsEvent;)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/text/PrecomputedText;Ljava/lang/Object;)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/text/PrecomputedText;->removeSpan(Ljava/lang/Object;)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/text/PrecomputedText;Ljava/lang/Object;III)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/text/PrecomputedText;->setSpan(Ljava/lang/Object;III)V

    return-void
.end method

.method public static bridge synthetic m(J)Z
    .locals 0

    .line 0
    invoke-static {p0, p1}, Landroid/graphics/Color;->isWideGamut(J)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutManager;)Z
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/content/pm/ShortcutManager;->isRequestPinShortcutSupported()Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutManager;Ljava/util/List;)Z
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/content/pm/ShortcutManager;->addDynamicShortcuts(Ljava/util/List;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/location/GnssStatus;I)Z
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/location/GnssStatus;->usedInFix(I)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/location/GnssStatus;Ljava/lang/Object;)Z
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/location/GnssStatus;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/os/LocaleList;)Z
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/os/LocaleList;->isEmpty()Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/os/LocaleList;Ljava/lang/Object;)Z
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/os/LocaleList;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Ljava/lang/Object;)Z
    .locals 0

    .line 0
    instance-of p0, p0, Landroid/text/PrecomputedText;

    return p0
.end method

.method public static bridge synthetic m(Ljava/util/Locale;Ljava/util/Locale;)Z
    .locals 0

    .line 0
    invoke-static {p0, p1}, Landroid/os/LocaleList;->matchesLanguageAndScript(Ljava/util/Locale;Ljava/util/Locale;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m()[Landroid/icu/text/DateFormat$HourCycle;
    .locals 1

    .line 0
    invoke-static {}, Landroid/icu/text/DateFormat$HourCycle;->values()[Landroid/icu/text/DateFormat$HourCycle;

    move-result-object v0

    return-object v0
.end method

.method public static bridge synthetic m(Landroid/text/PrecomputedText;IILjava/lang/Class;)[Ljava/lang/Object;
    .locals 0

    .line 0
    invoke-virtual {p0, p1, p2, p3}, Landroid/text/PrecomputedText;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m$1(J)F
    .locals 0

    .line 0
    invoke-static {p0, p1}, Landroid/graphics/Color;->green(J)F

    move-result p0

    return p0
.end method

.method public static bridge synthetic m$1(Landroid/location/GnssStatus;I)F
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/location/GnssStatus;->getAzimuthDegrees(I)F

    move-result p0

    return p0
.end method

.method public static bridge synthetic m$1(Landroid/graphics/Insets;)I
    .locals 0

    .line 0
    iget p0, p0, Landroid/graphics/Insets;->top:I

    return p0
.end method

.method public static bridge synthetic m$1(Landroid/location/GnssStatus;)I
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/location/GnssStatus;->getSatelliteCount()I

    move-result p0

    return p0
.end method

.method public static bridge synthetic m$1(Landroid/location/GnssStatus;I)I
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/location/GnssStatus;->getConstellationType(I)I

    move-result p0

    return p0
.end method

.method public static bridge synthetic m$1(Landroid/os/LocaleList;)I
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/os/LocaleList;->hashCode()I

    move-result p0

    return p0
.end method

.method public static bridge synthetic m$1(Landroid/text/PrecomputedText$Params;)I
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/text/PrecomputedText$Params;->getHyphenationFrequency()I

    move-result p0

    return p0
.end method

.method public static bridge synthetic m$1(Landroid/text/PrecomputedText;I)I
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/text/PrecomputedText;->getParagraphStart(I)I

    move-result p0

    return p0
.end method

.method public static bridge synthetic m$1(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Icon;
    .locals 0

    .line 0
    invoke-static {p0}, Landroid/graphics/drawable/Icon;->createWithBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Icon;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m$1()Landroid/icu/text/DateFormat$HourCycle;
    .locals 1

    .line 0
    sget-object v0, Landroid/icu/text/DateFormat$HourCycle;->HOUR_CYCLE_12:Landroid/icu/text/DateFormat$HourCycle;

    return-object v0
.end method

.method public static bridge synthetic m$1(Landroid/text/PrecomputedText$Params$Builder;I)Landroid/text/PrecomputedText$Params$Builder;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/text/PrecomputedText$Params$Builder;->setHyphenationFrequency(I)Landroid/text/PrecomputedText$Params$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m$1(Landroid/text/StaticLayout$Builder;I)Landroid/text/StaticLayout$Builder;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/text/StaticLayout$Builder;->setHyphenationFrequency(I)Landroid/text/StaticLayout$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m$1(Landroid/os/LocaleList;)Ljava/lang/String;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/os/LocaleList;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m$1(Landroid/content/pm/ShortcutManager;)Ljava/util/List;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/content/pm/ShortcutManager;->getManifestShortcuts()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m$1(J)Z
    .locals 0

    .line 0
    invoke-static {p0, p1}, Landroid/graphics/Color;->isSrgb(J)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m$1(Landroid/content/pm/ShortcutManager;Ljava/util/List;)Z
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/content/pm/ShortcutManager;->updateShortcuts(Ljava/util/List;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m$1(Landroid/location/GnssStatus;I)Z
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/location/GnssStatus;->hasEphemerisData(I)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m$2(J)F
    .locals 0

    .line 0
    invoke-static {p0, p1}, Landroid/graphics/Color;->alpha(J)F

    move-result p0

    return p0
.end method

.method public static bridge synthetic m$2(Landroid/location/GnssStatus;I)F
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/location/GnssStatus;->getElevationDegrees(I)F

    move-result p0

    return p0
.end method

.method public static bridge synthetic m$2(Landroid/graphics/Insets;)I
    .locals 0

    .line 0
    iget p0, p0, Landroid/graphics/Insets;->right:I

    return p0
.end method

.method public static bridge synthetic m$2(Landroid/content/pm/ShortcutManager;)Ljava/util/List;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/content/pm/ShortcutManager;->getPinnedShortcuts()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m$2(Landroid/location/GnssStatus;I)Z
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/location/GnssStatus;->hasAlmanacData(I)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m$3(J)F
    .locals 0

    .line 0
    invoke-static {p0, p1}, Landroid/graphics/Color;->red(J)F

    move-result p0

    return p0
.end method

.method public static bridge synthetic m$3(Landroid/graphics/Insets;)I
    .locals 0

    .line 0
    iget p0, p0, Landroid/graphics/Insets;->bottom:I

    return p0
.end method

.method public static bridge synthetic m$4(J)F
    .locals 0

    .line 0
    invoke-static {p0, p1}, Landroid/graphics/Color;->blue(J)F

    move-result p0

    return p0
.end method
