.class public final Landroidx/media3/extractor/text/tx3g/Tx3gParser;
.super Ljava/lang/Object;
.source "Tx3gParser.java"

# interfaces
.implements Landroidx/media3/extractor/text/SubtitleParser;


# static fields
.field public static final CUE_REPLACEMENT_BEHAVIOR:I = 0x2

.field private static final DEFAULT_COLOR:I = -0x1

.field private static final DEFAULT_FONT_FACE:I = 0x0

.field private static final DEFAULT_FONT_FAMILY:Ljava/lang/String; = "sans-serif"

.field private static final DEFAULT_VERTICAL_PLACEMENT:F = 0.85f

.field private static final FONT_FACE_BOLD:I = 0x1

.field private static final FONT_FACE_ITALIC:I = 0x2

.field private static final FONT_FACE_UNDERLINE:I = 0x4

.field private static final SIZE_ATOM_HEADER:I = 0x8

.field private static final SIZE_SHORT:I = 0x2

.field private static final SIZE_STYLE_RECORD:I = 0xc

.field private static final SPAN_PRIORITY_HIGH:I = 0x0

.field private static final SPAN_PRIORITY_LOW:I = 0xff0000

.field private static final TAG:Ljava/lang/String; = "Tx3gParser"

.field private static final TX3G_SERIF:Ljava/lang/String; = "Serif"

.field private static final TYPE_STYL:I = 0x7374796c

.field private static final TYPE_TBOX:I = 0x74626f78


# instance fields
.field private final calculatedVideoTrackHeight:I

.field private final customVerticalPlacement:Z

.field private final defaultColorRgba:I

.field private final defaultFontFace:I

.field private final defaultFontFamily:Ljava/lang/String;

.field private final defaultVerticalPlacement:F

.field private final parsableByteArray:Landroidx/media3/common/util/ParsableByteArray;


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "[B>;)V"
        }
    .end annotation

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    new-instance v0, Landroidx/media3/common/util/ParsableByteArray;

    invoke-direct {v0}, Landroidx/media3/common/util/ParsableByteArray;-><init>()V

    iput-object v0, p0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->parsableByteArray:Landroidx/media3/common/util/ParsableByteArray;

    .line 101
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const v1, 0x3f59999a    # 0.85f

    const-string v2, "sans-serif"

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne v0, v4, :cond_4

    .line 102
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    array-length v0, v0

    const/16 v5, 0x30

    if-eq v0, v5, :cond_0

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    array-length v0, v0

    const/16 v5, 0x35

    if-ne v0, v5, :cond_4

    .line 103
    :cond_0
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [B

    const/16 v0, 0x18

    .line 104
    aget-byte v5, p1, v0

    iput v5, p0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->defaultFontFace:I

    const/16 v5, 0x1a

    .line 105
    aget-byte v5, p1, v5

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v0, v5, 0x18

    const/16 v5, 0x1b

    aget-byte v5, p1, v5

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v5, v5, 0x10

    or-int/2addr v0, v5

    const/16 v5, 0x1c

    aget-byte v5, p1, v5

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v5, v5, 0x8

    or-int/2addr v0, v5

    const/16 v5, 0x1d

    aget-byte v5, p1, v5

    and-int/lit16 v5, v5, 0xff

    or-int/2addr v0, v5

    iput v0, p0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->defaultColorRgba:I

    .line 110
    array-length v0, p1

    const/16 v5, 0x2b

    sub-int/2addr v0, v5

    .line 111
    invoke-static {p1, v5, v0}, Landroidx/media3/common/util/Util;->fromUtf8Bytes([BII)Ljava/lang/String;

    move-result-object v0

    .line 112
    const-string v5, "Serif"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v2, "serif"

    :cond_1
    iput-object v2, p0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->defaultFontFamily:Ljava/lang/String;

    const/16 v0, 0x19

    .line 114
    aget-byte v0, p1, v0

    mul-int/lit8 v0, v0, 0x14

    iput v0, p0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->calculatedVideoTrackHeight:I

    .line 115
    aget-byte v2, p1, v3

    and-int/lit8 v2, v2, 0x20

    if-eqz v2, :cond_2

    const/4 v3, 0x1

    :cond_2
    iput-boolean v3, p0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->customVerticalPlacement:Z

    if-eqz v3, :cond_3

    const/16 v1, 0xa

    .line 117
    aget-byte v1, p1, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    const/16 v2, 0xb

    aget-byte p1, p1, v2

    and-int/lit16 p1, p1, 0xff

    or-int/2addr p1, v1

    int-to-float p1, p1

    int-to-float v0, v0

    div-float/2addr p1, v0

    const/4 v0, 0x0

    const v1, 0x3f733333    # 0.95f

    .line 120
    invoke-static {p1, v0, v1}, Landroidx/media3/common/util/Util;->constrainValue(FFF)F

    move-result p1

    iput p1, p0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->defaultVerticalPlacement:F

    goto :goto_0

    .line 123
    :cond_3
    iput v1, p0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->defaultVerticalPlacement:F

    goto :goto_0

    .line 126
    :cond_4
    iput v3, p0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->defaultFontFace:I

    const/4 p1, -0x1

    .line 127
    iput p1, p0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->defaultColorRgba:I

    .line 128
    iput-object v2, p0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->defaultFontFamily:Ljava/lang/String;

    .line 129
    iput-boolean v3, p0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->customVerticalPlacement:Z

    .line 130
    iput v1, p0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->defaultVerticalPlacement:F

    .line 131
    iput p1, p0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->calculatedVideoTrackHeight:I

    :goto_0
    return-void
.end method

.method private applyStyleRecord(Landroidx/media3/common/util/ParsableByteArray;Landroid/text/SpannableStringBuilder;)V
    .locals 9

    .line 212
    invoke-virtual {p1}, Landroidx/media3/common/util/ParsableByteArray;->bytesLeft()I

    move-result v0

    const/16 v1, 0xc

    const/4 v2, 0x1

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkArgument(Z)V

    .line 213
    invoke-virtual {p1}, Landroidx/media3/common/util/ParsableByteArray;->readUnsignedShort()I

    move-result v0

    .line 214
    invoke-virtual {p1}, Landroidx/media3/common/util/ParsableByteArray;->readUnsignedShort()I

    move-result v1

    const/4 v3, 0x2

    .line 215
    invoke-virtual {p1, v3}, Landroidx/media3/common/util/ParsableByteArray;->skipBytes(I)V

    .line 216
    invoke-virtual {p1}, Landroidx/media3/common/util/ParsableByteArray;->readUnsignedByte()I

    move-result v4

    .line 217
    invoke-virtual {p1, v2}, Landroidx/media3/common/util/ParsableByteArray;->skipBytes(I)V

    .line 218
    invoke-virtual {p1}, Landroidx/media3/common/util/ParsableByteArray;->readInt()I

    move-result p1

    .line 220
    invoke-virtual {p2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2

    const-string v3, ")."

    const-string v5, "Tx3gParser"

    if-le v1, v2, :cond_1

    .line 221
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v6, "Truncating styl end ("

    invoke-direct {v2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ") to cueText.length() ("

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    invoke-virtual {p2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 221
    invoke-static {v5, v1}, Landroidx/media3/common/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 223
    invoke-virtual {p2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v1

    :cond_1
    if-lt v0, v1, :cond_2

    .line 226
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Ignoring styl with start ("

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ") >= end ("

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v5, p1}, Landroidx/media3/common/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 229
    :cond_2
    iget v5, p0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->defaultFontFace:I

    const/4 v8, 0x0

    move-object v3, p2

    move v6, v0

    move v7, v1

    invoke-static/range {v3 .. v8}, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->attachFontFace(Landroid/text/SpannableStringBuilder;IIIII)V

    .line 230
    iget v5, p0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->defaultColorRgba:I

    move v4, p1

    invoke-static/range {v3 .. v8}, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->attachColor(Landroid/text/SpannableStringBuilder;IIIII)V

    return-void
.end method

.method private static attachColor(Landroid/text/SpannableStringBuilder;IIIII)V
    .locals 0

    if-eq p1, p2, :cond_0

    and-int/lit16 p2, p1, 0xff

    shl-int/lit8 p2, p2, 0x18

    ushr-int/lit8 p1, p1, 0x8

    or-int/2addr p1, p2

    .line 272
    new-instance p2, Landroid/text/style/ForegroundColorSpan;

    invoke-direct {p2, p1}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    or-int/lit8 p1, p5, 0x21

    invoke-virtual {p0, p2, p3, p4, p1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    :cond_0
    return-void
.end method

.method private static attachFontFace(Landroid/text/SpannableStringBuilder;IIIII)V
    .locals 5

    if-eq p1, p2, :cond_7

    or-int/lit8 p2, p5, 0x21

    and-int/lit8 p5, p1, 0x1

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p5, :cond_0

    const/4 p5, 0x1

    goto :goto_0

    :cond_0
    const/4 p5, 0x0

    :goto_0
    and-int/lit8 v2, p1, 0x2

    if-eqz v2, :cond_1

    const/4 v2, 0x1

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    :goto_1
    if-eqz p5, :cond_3

    if-eqz v2, :cond_2

    .line 246
    new-instance v3, Landroid/text/style/StyleSpan;

    const/4 v4, 0x3

    invoke-direct {v3, v4}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {p0, v3, p3, p4, p2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    goto :goto_2

    .line 248
    :cond_2
    new-instance v3, Landroid/text/style/StyleSpan;

    invoke-direct {v3, v1}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {p0, v3, p3, p4, p2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    goto :goto_2

    :cond_3
    if-eqz v2, :cond_4

    .line 251
    new-instance v3, Landroid/text/style/StyleSpan;

    const/4 v4, 0x2

    invoke-direct {v3, v4}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {p0, v3, p3, p4, p2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    :cond_4
    :goto_2
    and-int/lit8 p1, p1, 0x4

    if-eqz p1, :cond_5

    goto :goto_3

    :cond_5
    const/4 v1, 0x0

    :goto_3
    if-eqz v1, :cond_6

    .line 255
    new-instance p1, Landroid/text/style/UnderlineSpan;

    invoke-direct {p1}, Landroid/text/style/UnderlineSpan;-><init>()V

    invoke-virtual {p0, p1, p3, p4, p2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    :cond_6
    if-nez v1, :cond_7

    if-nez p5, :cond_7

    if-nez v2, :cond_7

    .line 258
    new-instance p1, Landroid/text/style/StyleSpan;

    invoke-direct {p1, v0}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {p0, p1, p3, p4, p2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    :cond_7
    return-void
.end method

.method private static attachFontFamily(Landroid/text/SpannableStringBuilder;Ljava/lang/String;II)V
    .locals 1

    .line 283
    const-string v0, "sans-serif"

    if-eq p1, v0, :cond_0

    .line 284
    new-instance v0, Landroid/text/style/TypefaceSpan;

    invoke-direct {v0, p1}, Landroid/text/style/TypefaceSpan;-><init>(Ljava/lang/String;)V

    const p1, 0xff0021

    invoke-virtual {p0, v0, p2, p3, p1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    :cond_0
    return-void
.end method

.method private static readSubtitleText(Landroidx/media3/common/util/ParsableByteArray;)Ljava/lang/String;
    .locals 4

    .line 198
    invoke-virtual {p0}, Landroidx/media3/common/util/ParsableByteArray;->bytesLeft()I

    move-result v0

    const/4 v1, 0x2

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkArgument(Z)V

    .line 199
    invoke-virtual {p0}, Landroidx/media3/common/util/ParsableByteArray;->readUnsignedShort()I

    move-result v0

    if-nez v0, :cond_1

    .line 201
    const-string p0, ""

    return-object p0

    .line 203
    :cond_1
    invoke-virtual {p0}, Landroidx/media3/common/util/ParsableByteArray;->getPosition()I

    move-result v1

    .line 204
    invoke-virtual {p0}, Landroidx/media3/common/util/ParsableByteArray;->readUtfCharsetFromBom()Ljava/nio/charset/Charset;

    move-result-object v2

    .line 205
    invoke-virtual {p0}, Landroidx/media3/common/util/ParsableByteArray;->getPosition()I

    move-result v3

    sub-int/2addr v3, v1

    sub-int/2addr v0, v3

    if-eqz v2, :cond_2

    goto :goto_1

    .line 207
    :cond_2
    sget-object v2, Lcom/google/common/base/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 206
    :goto_1
    invoke-virtual {p0, v0, v2}, Landroidx/media3/common/util/ParsableByteArray;->readString(ILjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public getCueReplacementBehavior()I
    .locals 1

    const/4 v0, 0x2

    return v0
.end method

.method public parse([BIILandroidx/media3/extractor/text/SubtitleParser$OutputOptions;Landroidx/media3/common/util/Consumer;)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([BII",
            "Landroidx/media3/extractor/text/SubtitleParser$OutputOptions;",
            "Landroidx/media3/common/util/Consumer<",
            "Landroidx/media3/extractor/text/CuesWithTiming;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v0, p0

    move/from16 v1, p2

    move-object/from16 v2, p5

    .line 147
    iget-object v3, v0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->parsableByteArray:Landroidx/media3/common/util/ParsableByteArray;

    add-int v4, v1, p3

    move-object/from16 v5, p1

    invoke-virtual {v3, v5, v4}, Landroidx/media3/common/util/ParsableByteArray;->reset([BI)V

    .line 148
    iget-object v3, v0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->parsableByteArray:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {v3, v1}, Landroidx/media3/common/util/ParsableByteArray;->setPosition(I)V

    .line 149
    iget-object v1, v0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->parsableByteArray:Landroidx/media3/common/util/ParsableByteArray;

    invoke-static {v1}, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->readSubtitleText(Landroidx/media3/common/util/ParsableByteArray;)Ljava/lang/String;

    move-result-object v1

    .line 150
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 151
    new-instance v1, Landroidx/media3/extractor/text/CuesWithTiming;

    .line 153
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v5

    const-wide v6, -0x7fffffffffffffffL    # -4.9E-324

    const-wide v8, -0x7fffffffffffffffL    # -4.9E-324

    move-object v4, v1

    invoke-direct/range {v4 .. v9}, Landroidx/media3/extractor/text/CuesWithTiming;-><init>(Ljava/util/List;JJ)V

    .line 151
    invoke-interface {v2, v1}, Landroidx/media3/common/util/Consumer;->accept(Ljava/lang/Object;)V

    return-void

    .line 159
    :cond_0
    new-instance v3, Landroid/text/SpannableStringBuilder;

    invoke-direct {v3, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 160
    iget v11, v0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->defaultFontFace:I

    .line 161
    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v14

    const/high16 v15, 0xff0000

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object v10, v3

    .line 160
    invoke-static/range {v10 .. v15}, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->attachFontFace(Landroid/text/SpannableStringBuilder;IIIII)V

    .line 162
    iget v11, v0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->defaultColorRgba:I

    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v14

    const/4 v12, -0x1

    invoke-static/range {v10 .. v15}, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->attachColor(Landroid/text/SpannableStringBuilder;IIIII)V

    .line 163
    iget-object v1, v0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->defaultFontFamily:Ljava/lang/String;

    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v4

    const/4 v5, 0x0

    invoke-static {v3, v1, v5, v4}, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->attachFontFamily(Landroid/text/SpannableStringBuilder;Ljava/lang/String;II)V

    .line 164
    iget v1, v0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->defaultVerticalPlacement:F

    .line 166
    :goto_0
    iget-object v4, v0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->parsableByteArray:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {v4}, Landroidx/media3/common/util/ParsableByteArray;->bytesLeft()I

    move-result v4

    const/16 v6, 0x8

    if-lt v4, v6, :cond_5

    .line 167
    iget-object v4, v0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->parsableByteArray:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {v4}, Landroidx/media3/common/util/ParsableByteArray;->getPosition()I

    move-result v4

    .line 168
    iget-object v6, v0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->parsableByteArray:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {v6}, Landroidx/media3/common/util/ParsableByteArray;->readInt()I

    move-result v6

    .line 169
    iget-object v7, v0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->parsableByteArray:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {v7}, Landroidx/media3/common/util/ParsableByteArray;->readInt()I

    move-result v7

    const v8, 0x7374796c

    const/4 v9, 0x2

    const/4 v10, 0x1

    if-ne v7, v8, :cond_2

    .line 171
    iget-object v7, v0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->parsableByteArray:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {v7}, Landroidx/media3/common/util/ParsableByteArray;->bytesLeft()I

    move-result v7

    if-lt v7, v9, :cond_1

    goto :goto_1

    :cond_1
    const/4 v10, 0x0

    :goto_1
    invoke-static {v10}, Landroidx/media3/common/util/Assertions;->checkArgument(Z)V

    .line 172
    iget-object v7, v0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->parsableByteArray:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {v7}, Landroidx/media3/common/util/ParsableByteArray;->readUnsignedShort()I

    move-result v7

    const/4 v8, 0x0

    :goto_2
    if-ge v8, v7, :cond_4

    .line 174
    iget-object v9, v0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->parsableByteArray:Landroidx/media3/common/util/ParsableByteArray;

    invoke-direct {v0, v9, v3}, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->applyStyleRecord(Landroidx/media3/common/util/ParsableByteArray;Landroid/text/SpannableStringBuilder;)V

    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    :cond_2
    const v8, 0x74626f78

    if-ne v7, v8, :cond_4

    .line 176
    iget-boolean v7, v0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->customVerticalPlacement:Z

    if-eqz v7, :cond_4

    .line 177
    iget-object v1, v0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->parsableByteArray:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {v1}, Landroidx/media3/common/util/ParsableByteArray;->bytesLeft()I

    move-result v1

    if-lt v1, v9, :cond_3

    goto :goto_3

    :cond_3
    const/4 v10, 0x0

    :goto_3
    invoke-static {v10}, Landroidx/media3/common/util/Assertions;->checkArgument(Z)V

    .line 178
    iget-object v1, v0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->parsableByteArray:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {v1}, Landroidx/media3/common/util/ParsableByteArray;->readUnsignedShort()I

    move-result v1

    int-to-float v1, v1

    .line 179
    iget v7, v0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->calculatedVideoTrackHeight:I

    int-to-float v7, v7

    div-float/2addr v1, v7

    const/4 v7, 0x0

    const v8, 0x3f733333    # 0.95f

    .line 180
    invoke-static {v1, v7, v8}, Landroidx/media3/common/util/Util;->constrainValue(FFF)F

    move-result v1

    .line 182
    :cond_4
    iget-object v7, v0, Landroidx/media3/extractor/text/tx3g/Tx3gParser;->parsableByteArray:Landroidx/media3/common/util/ParsableByteArray;

    add-int/2addr v4, v6

    invoke-virtual {v7, v4}, Landroidx/media3/common/util/ParsableByteArray;->setPosition(I)V

    goto :goto_0

    .line 184
    :cond_5
    new-instance v4, Landroidx/media3/common/text/Cue$Builder;

    invoke-direct {v4}, Landroidx/media3/common/text/Cue$Builder;-><init>()V

    .line 186
    invoke-virtual {v4, v3}, Landroidx/media3/common/text/Cue$Builder;->setText(Ljava/lang/CharSequence;)Landroidx/media3/common/text/Cue$Builder;

    move-result-object v3

    .line 187
    invoke-virtual {v3, v1, v5}, Landroidx/media3/common/text/Cue$Builder;->setLine(FI)Landroidx/media3/common/text/Cue$Builder;

    move-result-object v1

    .line 188
    invoke-virtual {v1, v5}, Landroidx/media3/common/text/Cue$Builder;->setLineAnchor(I)Landroidx/media3/common/text/Cue$Builder;

    move-result-object v1

    .line 189
    invoke-virtual {v1}, Landroidx/media3/common/text/Cue$Builder;->build()Landroidx/media3/common/text/Cue;

    move-result-object v1

    .line 190
    new-instance v9, Landroidx/media3/extractor/text/CuesWithTiming;

    .line 192
    invoke-static {v1}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object v4

    const-wide v5, -0x7fffffffffffffffL    # -4.9E-324

    const-wide v7, -0x7fffffffffffffffL    # -4.9E-324

    move-object v3, v9

    invoke-direct/range {v3 .. v8}, Landroidx/media3/extractor/text/CuesWithTiming;-><init>(Ljava/util/List;JJ)V

    .line 190
    invoke-interface {v2, v9}, Landroidx/media3/common/util/Consumer;->accept(Ljava/lang/Object;)V

    return-void
.end method

.method public synthetic parse([BLandroidx/media3/extractor/text/SubtitleParser$OutputOptions;Landroidx/media3/common/util/Consumer;)V
    .locals 0

    invoke-static {p0, p1, p2, p3}, Landroidx/media3/extractor/text/SubtitleParser$-CC;->$default$parse(Landroidx/media3/extractor/text/SubtitleParser;[BLandroidx/media3/extractor/text/SubtitleParser$OutputOptions;Landroidx/media3/common/util/Consumer;)V

    return-void
.end method

.method public synthetic parseToLegacySubtitle([BII)Landroidx/media3/extractor/text/Subtitle;
    .locals 0

    invoke-static {p0, p1, p2, p3}, Landroidx/media3/extractor/text/SubtitleParser$-CC;->$default$parseToLegacySubtitle(Landroidx/media3/extractor/text/SubtitleParser;[BII)Landroidx/media3/extractor/text/Subtitle;

    move-result-object p1

    return-object p1
.end method

.method public synthetic reset()V
    .locals 0

    invoke-static {p0}, Landroidx/media3/extractor/text/SubtitleParser$-CC;->$default$reset(Landroidx/media3/extractor/text/SubtitleParser;)V

    return-void
.end method
