.class public final Landroidx/media3/common/Format$Builder;
.super Ljava/lang/Object;
.source "Format.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media3/common/Format;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private accessibilityChannel:I

.field private averageBitrate:I

.field private channelCount:I

.field private codecs:Ljava/lang/String;

.field private colorInfo:Landroidx/media3/common/ColorInfo;

.field private containerMimeType:Ljava/lang/String;

.field private cryptoType:I

.field private cueReplacementBehavior:I

.field private customData:Ljava/lang/Object;

.field private drmInitData:Landroidx/media3/common/DrmInitData;

.field private encoderDelay:I

.field private encoderPadding:I

.field private frameRate:F

.field private height:I

.field private id:Ljava/lang/String;

.field private initializationData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[B>;"
        }
    .end annotation
.end field

.field private label:Ljava/lang/String;

.field private labels:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/media3/common/Label;",
            ">;"
        }
    .end annotation
.end field

.field private language:Ljava/lang/String;

.field private maxInputSize:I

.field private maxNumReorderSamples:I

.field private metadata:Landroidx/media3/common/Metadata;

.field private pcmEncoding:I

.field private peakBitrate:I

.field private pixelWidthHeightRatio:F

.field private projectionData:[B

.field private roleFlags:I

.field private rotationDegrees:I

.field private sampleMimeType:Ljava/lang/String;

.field private sampleRate:I

.field private selectionFlags:I

.field private stereoMode:I

.field private subsampleOffsetUs:J

.field private tileCountHorizontal:I

.field private tileCountVertical:I

.field private width:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 202
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 203
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Landroidx/media3/common/Format$Builder;->labels:Ljava/util/List;

    const/4 v0, -0x1

    .line 204
    iput v0, p0, Landroidx/media3/common/Format$Builder;->averageBitrate:I

    .line 205
    iput v0, p0, Landroidx/media3/common/Format$Builder;->peakBitrate:I

    .line 207
    iput v0, p0, Landroidx/media3/common/Format$Builder;->maxInputSize:I

    .line 208
    iput v0, p0, Landroidx/media3/common/Format$Builder;->maxNumReorderSamples:I

    const-wide v1, 0x7fffffffffffffffL

    .line 209
    iput-wide v1, p0, Landroidx/media3/common/Format$Builder;->subsampleOffsetUs:J

    .line 211
    iput v0, p0, Landroidx/media3/common/Format$Builder;->width:I

    .line 212
    iput v0, p0, Landroidx/media3/common/Format$Builder;->height:I

    const/high16 v1, -0x40800000    # -1.0f

    .line 213
    iput v1, p0, Landroidx/media3/common/Format$Builder;->frameRate:F

    const/high16 v1, 0x3f800000    # 1.0f

    .line 214
    iput v1, p0, Landroidx/media3/common/Format$Builder;->pixelWidthHeightRatio:F

    .line 215
    iput v0, p0, Landroidx/media3/common/Format$Builder;->stereoMode:I

    .line 217
    iput v0, p0, Landroidx/media3/common/Format$Builder;->channelCount:I

    .line 218
    iput v0, p0, Landroidx/media3/common/Format$Builder;->sampleRate:I

    .line 219
    iput v0, p0, Landroidx/media3/common/Format$Builder;->pcmEncoding:I

    .line 221
    iput v0, p0, Landroidx/media3/common/Format$Builder;->accessibilityChannel:I

    const/4 v1, 0x1

    .line 222
    iput v1, p0, Landroidx/media3/common/Format$Builder;->cueReplacementBehavior:I

    .line 224
    iput v0, p0, Landroidx/media3/common/Format$Builder;->tileCountHorizontal:I

    .line 225
    iput v0, p0, Landroidx/media3/common/Format$Builder;->tileCountVertical:I

    const/4 v0, 0x0

    .line 227
    iput v0, p0, Landroidx/media3/common/Format$Builder;->cryptoType:I

    return-void
.end method

.method private constructor <init>(Landroidx/media3/common/Format;)V
    .locals 2

    .line 235
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 236
    iget-object v0, p1, Landroidx/media3/common/Format;->id:Ljava/lang/String;

    iput-object v0, p0, Landroidx/media3/common/Format$Builder;->id:Ljava/lang/String;

    .line 237
    iget-object v0, p1, Landroidx/media3/common/Format;->label:Ljava/lang/String;

    iput-object v0, p0, Landroidx/media3/common/Format$Builder;->label:Ljava/lang/String;

    .line 238
    iget-object v0, p1, Landroidx/media3/common/Format;->labels:Ljava/util/List;

    iput-object v0, p0, Landroidx/media3/common/Format$Builder;->labels:Ljava/util/List;

    .line 239
    iget-object v0, p1, Landroidx/media3/common/Format;->language:Ljava/lang/String;

    iput-object v0, p0, Landroidx/media3/common/Format$Builder;->language:Ljava/lang/String;

    .line 240
    iget v0, p1, Landroidx/media3/common/Format;->selectionFlags:I

    iput v0, p0, Landroidx/media3/common/Format$Builder;->selectionFlags:I

    .line 241
    iget v0, p1, Landroidx/media3/common/Format;->roleFlags:I

    iput v0, p0, Landroidx/media3/common/Format$Builder;->roleFlags:I

    .line 242
    iget v0, p1, Landroidx/media3/common/Format;->averageBitrate:I

    iput v0, p0, Landroidx/media3/common/Format$Builder;->averageBitrate:I

    .line 243
    iget v0, p1, Landroidx/media3/common/Format;->peakBitrate:I

    iput v0, p0, Landroidx/media3/common/Format$Builder;->peakBitrate:I

    .line 244
    iget-object v0, p1, Landroidx/media3/common/Format;->codecs:Ljava/lang/String;

    iput-object v0, p0, Landroidx/media3/common/Format$Builder;->codecs:Ljava/lang/String;

    .line 245
    iget-object v0, p1, Landroidx/media3/common/Format;->metadata:Landroidx/media3/common/Metadata;

    iput-object v0, p0, Landroidx/media3/common/Format$Builder;->metadata:Landroidx/media3/common/Metadata;

    .line 246
    iget-object v0, p1, Landroidx/media3/common/Format;->customData:Ljava/lang/Object;

    iput-object v0, p0, Landroidx/media3/common/Format$Builder;->customData:Ljava/lang/Object;

    .line 248
    iget-object v0, p1, Landroidx/media3/common/Format;->containerMimeType:Ljava/lang/String;

    iput-object v0, p0, Landroidx/media3/common/Format$Builder;->containerMimeType:Ljava/lang/String;

    .line 250
    iget-object v0, p1, Landroidx/media3/common/Format;->sampleMimeType:Ljava/lang/String;

    iput-object v0, p0, Landroidx/media3/common/Format$Builder;->sampleMimeType:Ljava/lang/String;

    .line 251
    iget v0, p1, Landroidx/media3/common/Format;->maxInputSize:I

    iput v0, p0, Landroidx/media3/common/Format$Builder;->maxInputSize:I

    .line 252
    iget v0, p1, Landroidx/media3/common/Format;->maxNumReorderSamples:I

    iput v0, p0, Landroidx/media3/common/Format$Builder;->maxNumReorderSamples:I

    .line 253
    iget-object v0, p1, Landroidx/media3/common/Format;->initializationData:Ljava/util/List;

    iput-object v0, p0, Landroidx/media3/common/Format$Builder;->initializationData:Ljava/util/List;

    .line 254
    iget-object v0, p1, Landroidx/media3/common/Format;->drmInitData:Landroidx/media3/common/DrmInitData;

    iput-object v0, p0, Landroidx/media3/common/Format$Builder;->drmInitData:Landroidx/media3/common/DrmInitData;

    .line 255
    iget-wide v0, p1, Landroidx/media3/common/Format;->subsampleOffsetUs:J

    iput-wide v0, p0, Landroidx/media3/common/Format$Builder;->subsampleOffsetUs:J

    .line 257
    iget v0, p1, Landroidx/media3/common/Format;->width:I

    iput v0, p0, Landroidx/media3/common/Format$Builder;->width:I

    .line 258
    iget v0, p1, Landroidx/media3/common/Format;->height:I

    iput v0, p0, Landroidx/media3/common/Format$Builder;->height:I

    .line 259
    iget v0, p1, Landroidx/media3/common/Format;->frameRate:F

    iput v0, p0, Landroidx/media3/common/Format$Builder;->frameRate:F

    .line 260
    iget v0, p1, Landroidx/media3/common/Format;->rotationDegrees:I

    iput v0, p0, Landroidx/media3/common/Format$Builder;->rotationDegrees:I

    .line 261
    iget v0, p1, Landroidx/media3/common/Format;->pixelWidthHeightRatio:F

    iput v0, p0, Landroidx/media3/common/Format$Builder;->pixelWidthHeightRatio:F

    .line 262
    iget-object v0, p1, Landroidx/media3/common/Format;->projectionData:[B

    iput-object v0, p0, Landroidx/media3/common/Format$Builder;->projectionData:[B

    .line 263
    iget v0, p1, Landroidx/media3/common/Format;->stereoMode:I

    iput v0, p0, Landroidx/media3/common/Format$Builder;->stereoMode:I

    .line 264
    iget-object v0, p1, Landroidx/media3/common/Format;->colorInfo:Landroidx/media3/common/ColorInfo;

    iput-object v0, p0, Landroidx/media3/common/Format$Builder;->colorInfo:Landroidx/media3/common/ColorInfo;

    .line 266
    iget v0, p1, Landroidx/media3/common/Format;->channelCount:I

    iput v0, p0, Landroidx/media3/common/Format$Builder;->channelCount:I

    .line 267
    iget v0, p1, Landroidx/media3/common/Format;->sampleRate:I

    iput v0, p0, Landroidx/media3/common/Format$Builder;->sampleRate:I

    .line 268
    iget v0, p1, Landroidx/media3/common/Format;->pcmEncoding:I

    iput v0, p0, Landroidx/media3/common/Format$Builder;->pcmEncoding:I

    .line 269
    iget v0, p1, Landroidx/media3/common/Format;->encoderDelay:I

    iput v0, p0, Landroidx/media3/common/Format$Builder;->encoderDelay:I

    .line 270
    iget v0, p1, Landroidx/media3/common/Format;->encoderPadding:I

    iput v0, p0, Landroidx/media3/common/Format$Builder;->encoderPadding:I

    .line 272
    iget v0, p1, Landroidx/media3/common/Format;->accessibilityChannel:I

    iput v0, p0, Landroidx/media3/common/Format$Builder;->accessibilityChannel:I

    .line 273
    iget v0, p1, Landroidx/media3/common/Format;->cueReplacementBehavior:I

    iput v0, p0, Landroidx/media3/common/Format$Builder;->cueReplacementBehavior:I

    .line 275
    iget v0, p1, Landroidx/media3/common/Format;->tileCountHorizontal:I

    iput v0, p0, Landroidx/media3/common/Format$Builder;->tileCountHorizontal:I

    .line 276
    iget v0, p1, Landroidx/media3/common/Format;->tileCountVertical:I

    iput v0, p0, Landroidx/media3/common/Format$Builder;->tileCountVertical:I

    .line 278
    iget p1, p1, Landroidx/media3/common/Format;->cryptoType:I

    iput p1, p0, Landroidx/media3/common/Format$Builder;->cryptoType:I

    return-void
.end method

.method synthetic constructor <init>(Landroidx/media3/common/Format;Landroidx/media3/common/Format$1;)V
    .locals 0

    .line 141
    invoke-direct {p0, p1}, Landroidx/media3/common/Format$Builder;-><init>(Landroidx/media3/common/Format;)V

    return-void
.end method

.method static synthetic access$100(Landroidx/media3/common/Format$Builder;)Ljava/util/List;
    .locals 0

    .line 141
    iget-object p0, p0, Landroidx/media3/common/Format$Builder;->labels:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$1000(Landroidx/media3/common/Format$Builder;)Landroidx/media3/common/Metadata;
    .locals 0

    .line 141
    iget-object p0, p0, Landroidx/media3/common/Format$Builder;->metadata:Landroidx/media3/common/Metadata;

    return-object p0
.end method

.method static synthetic access$1100(Landroidx/media3/common/Format$Builder;)Ljava/lang/Object;
    .locals 0

    .line 141
    iget-object p0, p0, Landroidx/media3/common/Format$Builder;->customData:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$1200(Landroidx/media3/common/Format$Builder;)Ljava/lang/String;
    .locals 0

    .line 141
    iget-object p0, p0, Landroidx/media3/common/Format$Builder;->containerMimeType:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1300(Landroidx/media3/common/Format$Builder;)Ljava/lang/String;
    .locals 0

    .line 141
    iget-object p0, p0, Landroidx/media3/common/Format$Builder;->sampleMimeType:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1400(Landroidx/media3/common/Format$Builder;)I
    .locals 0

    .line 141
    iget p0, p0, Landroidx/media3/common/Format$Builder;->maxInputSize:I

    return p0
.end method

.method static synthetic access$1500(Landroidx/media3/common/Format$Builder;)I
    .locals 0

    .line 141
    iget p0, p0, Landroidx/media3/common/Format$Builder;->maxNumReorderSamples:I

    return p0
.end method

.method static synthetic access$1600(Landroidx/media3/common/Format$Builder;)Ljava/util/List;
    .locals 0

    .line 141
    iget-object p0, p0, Landroidx/media3/common/Format$Builder;->initializationData:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$1700(Landroidx/media3/common/Format$Builder;)Landroidx/media3/common/DrmInitData;
    .locals 0

    .line 141
    iget-object p0, p0, Landroidx/media3/common/Format$Builder;->drmInitData:Landroidx/media3/common/DrmInitData;

    return-object p0
.end method

.method static synthetic access$1800(Landroidx/media3/common/Format$Builder;)J
    .locals 2

    .line 141
    iget-wide v0, p0, Landroidx/media3/common/Format$Builder;->subsampleOffsetUs:J

    return-wide v0
.end method

.method static synthetic access$1900(Landroidx/media3/common/Format$Builder;)I
    .locals 0

    .line 141
    iget p0, p0, Landroidx/media3/common/Format$Builder;->width:I

    return p0
.end method

.method static synthetic access$200(Landroidx/media3/common/Format$Builder;)Ljava/lang/String;
    .locals 0

    .line 141
    iget-object p0, p0, Landroidx/media3/common/Format$Builder;->label:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$2000(Landroidx/media3/common/Format$Builder;)I
    .locals 0

    .line 141
    iget p0, p0, Landroidx/media3/common/Format$Builder;->height:I

    return p0
.end method

.method static synthetic access$2100(Landroidx/media3/common/Format$Builder;)F
    .locals 0

    .line 141
    iget p0, p0, Landroidx/media3/common/Format$Builder;->frameRate:F

    return p0
.end method

.method static synthetic access$2200(Landroidx/media3/common/Format$Builder;)I
    .locals 0

    .line 141
    iget p0, p0, Landroidx/media3/common/Format$Builder;->rotationDegrees:I

    return p0
.end method

.method static synthetic access$2300(Landroidx/media3/common/Format$Builder;)F
    .locals 0

    .line 141
    iget p0, p0, Landroidx/media3/common/Format$Builder;->pixelWidthHeightRatio:F

    return p0
.end method

.method static synthetic access$2400(Landroidx/media3/common/Format$Builder;)[B
    .locals 0

    .line 141
    iget-object p0, p0, Landroidx/media3/common/Format$Builder;->projectionData:[B

    return-object p0
.end method

.method static synthetic access$2500(Landroidx/media3/common/Format$Builder;)I
    .locals 0

    .line 141
    iget p0, p0, Landroidx/media3/common/Format$Builder;->stereoMode:I

    return p0
.end method

.method static synthetic access$2600(Landroidx/media3/common/Format$Builder;)Landroidx/media3/common/ColorInfo;
    .locals 0

    .line 141
    iget-object p0, p0, Landroidx/media3/common/Format$Builder;->colorInfo:Landroidx/media3/common/ColorInfo;

    return-object p0
.end method

.method static synthetic access$2700(Landroidx/media3/common/Format$Builder;)I
    .locals 0

    .line 141
    iget p0, p0, Landroidx/media3/common/Format$Builder;->channelCount:I

    return p0
.end method

.method static synthetic access$2800(Landroidx/media3/common/Format$Builder;)I
    .locals 0

    .line 141
    iget p0, p0, Landroidx/media3/common/Format$Builder;->sampleRate:I

    return p0
.end method

.method static synthetic access$2900(Landroidx/media3/common/Format$Builder;)I
    .locals 0

    .line 141
    iget p0, p0, Landroidx/media3/common/Format$Builder;->pcmEncoding:I

    return p0
.end method

.method static synthetic access$300(Landroidx/media3/common/Format$Builder;)Ljava/lang/String;
    .locals 0

    .line 141
    iget-object p0, p0, Landroidx/media3/common/Format$Builder;->id:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$3000(Landroidx/media3/common/Format$Builder;)I
    .locals 0

    .line 141
    iget p0, p0, Landroidx/media3/common/Format$Builder;->encoderDelay:I

    return p0
.end method

.method static synthetic access$3100(Landroidx/media3/common/Format$Builder;)I
    .locals 0

    .line 141
    iget p0, p0, Landroidx/media3/common/Format$Builder;->encoderPadding:I

    return p0
.end method

.method static synthetic access$3200(Landroidx/media3/common/Format$Builder;)I
    .locals 0

    .line 141
    iget p0, p0, Landroidx/media3/common/Format$Builder;->accessibilityChannel:I

    return p0
.end method

.method static synthetic access$3300(Landroidx/media3/common/Format$Builder;)I
    .locals 0

    .line 141
    iget p0, p0, Landroidx/media3/common/Format$Builder;->cueReplacementBehavior:I

    return p0
.end method

.method static synthetic access$3400(Landroidx/media3/common/Format$Builder;)I
    .locals 0

    .line 141
    iget p0, p0, Landroidx/media3/common/Format$Builder;->tileCountHorizontal:I

    return p0
.end method

.method static synthetic access$3500(Landroidx/media3/common/Format$Builder;)I
    .locals 0

    .line 141
    iget p0, p0, Landroidx/media3/common/Format$Builder;->tileCountVertical:I

    return p0
.end method

.method static synthetic access$3600(Landroidx/media3/common/Format$Builder;)I
    .locals 0

    .line 141
    iget p0, p0, Landroidx/media3/common/Format$Builder;->cryptoType:I

    return p0
.end method

.method static synthetic access$400(Landroidx/media3/common/Format$Builder;)Ljava/lang/String;
    .locals 0

    .line 141
    iget-object p0, p0, Landroidx/media3/common/Format$Builder;->language:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$500(Landroidx/media3/common/Format$Builder;)I
    .locals 0

    .line 141
    iget p0, p0, Landroidx/media3/common/Format$Builder;->selectionFlags:I

    return p0
.end method

.method static synthetic access$600(Landroidx/media3/common/Format$Builder;)I
    .locals 0

    .line 141
    iget p0, p0, Landroidx/media3/common/Format$Builder;->roleFlags:I

    return p0
.end method

.method static synthetic access$700(Landroidx/media3/common/Format$Builder;)I
    .locals 0

    .line 141
    iget p0, p0, Landroidx/media3/common/Format$Builder;->averageBitrate:I

    return p0
.end method

.method static synthetic access$800(Landroidx/media3/common/Format$Builder;)I
    .locals 0

    .line 141
    iget p0, p0, Landroidx/media3/common/Format$Builder;->peakBitrate:I

    return p0
.end method

.method static synthetic access$900(Landroidx/media3/common/Format$Builder;)Ljava/lang/String;
    .locals 0

    .line 141
    iget-object p0, p0, Landroidx/media3/common/Format$Builder;->codecs:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public build()Landroidx/media3/common/Format;
    .locals 2

    .line 754
    new-instance v0, Landroidx/media3/common/Format;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroidx/media3/common/Format;-><init>(Landroidx/media3/common/Format$Builder;Landroidx/media3/common/Format$1;)V

    return-object v0
.end method

.method public setAccessibilityChannel(I)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 694
    iput p1, p0, Landroidx/media3/common/Format$Builder;->accessibilityChannel:I

    return-object p0
.end method

.method public setAverageBitrate(I)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 380
    iput p1, p0, Landroidx/media3/common/Format$Builder;->averageBitrate:I

    return-object p0
.end method

.method public setChannelCount(I)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 632
    iput p1, p0, Landroidx/media3/common/Format$Builder;->channelCount:I

    return-object p0
.end method

.method public setCodecs(Ljava/lang/String;)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 404
    iput-object p1, p0, Landroidx/media3/common/Format$Builder;->codecs:Ljava/lang/String;

    return-object p0
.end method

.method public setColorInfo(Landroidx/media3/common/ColorInfo;)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 618
    iput-object p1, p0, Landroidx/media3/common/Format$Builder;->colorInfo:Landroidx/media3/common/ColorInfo;

    return-object p0
.end method

.method public setContainerMimeType(Ljava/lang/String;)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 446
    invoke-static {p1}, Landroidx/media3/common/MimeTypes;->normalizeMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Landroidx/media3/common/Format$Builder;->containerMimeType:Ljava/lang/String;

    return-object p0
.end method

.method public setCryptoType(I)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 747
    iput p1, p0, Landroidx/media3/common/Format$Builder;->cryptoType:I

    return-object p0
.end method

.method public setCueReplacementBehavior(I)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 707
    iput p1, p0, Landroidx/media3/common/Format$Builder;->cueReplacementBehavior:I

    return-object p0
.end method

.method public setCustomData(Ljava/lang/Object;)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 432
    iput-object p1, p0, Landroidx/media3/common/Format$Builder;->customData:Ljava/lang/Object;

    return-object p0
.end method

.method public setDrmInitData(Landroidx/media3/common/DrmInitData;)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 508
    iput-object p1, p0, Landroidx/media3/common/Format$Builder;->drmInitData:Landroidx/media3/common/DrmInitData;

    return-object p0
.end method

.method public setEncoderDelay(I)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 668
    iput p1, p0, Landroidx/media3/common/Format$Builder;->encoderDelay:I

    return-object p0
.end method

.method public setEncoderPadding(I)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 680
    iput p1, p0, Landroidx/media3/common/Format$Builder;->encoderPadding:I

    return-object p0
.end method

.method public setFrameRate(F)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 558
    iput p1, p0, Landroidx/media3/common/Format$Builder;->frameRate:F

    return-object p0
.end method

.method public setHeight(I)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 546
    iput p1, p0, Landroidx/media3/common/Format$Builder;->height:I

    return-object p0
.end method

.method public setId(I)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 302
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Landroidx/media3/common/Format$Builder;->id:Ljava/lang/String;

    return-object p0
.end method

.method public setId(Ljava/lang/String;)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 289
    iput-object p1, p0, Landroidx/media3/common/Format$Builder;->id:Ljava/lang/String;

    return-object p0
.end method

.method public setInitializationData(Ljava/util/List;)Landroidx/media3/common/Format$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "[B>;)",
            "Landroidx/media3/common/Format$Builder;"
        }
    .end annotation

    .line 496
    iput-object p1, p0, Landroidx/media3/common/Format$Builder;->initializationData:Ljava/util/List;

    return-object p0
.end method

.method public setLabel(Ljava/lang/String;)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 317
    iput-object p1, p0, Landroidx/media3/common/Format$Builder;->label:Ljava/lang/String;

    return-object p0
.end method

.method public setLabels(Ljava/util/List;)Landroidx/media3/common/Format$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/media3/common/Label;",
            ">;)",
            "Landroidx/media3/common/Format$Builder;"
        }
    .end annotation

    .line 332
    invoke-static {p1}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;

    move-result-object p1

    iput-object p1, p0, Landroidx/media3/common/Format$Builder;->labels:Ljava/util/List;

    return-object p0
.end method

.method public setLanguage(Ljava/lang/String;)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 344
    iput-object p1, p0, Landroidx/media3/common/Format$Builder;->language:Ljava/lang/String;

    return-object p0
.end method

.method public setMaxInputSize(I)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 472
    iput p1, p0, Landroidx/media3/common/Format$Builder;->maxInputSize:I

    return-object p0
.end method

.method public setMaxNumReorderSamples(I)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 484
    iput p1, p0, Landroidx/media3/common/Format$Builder;->maxNumReorderSamples:I

    return-object p0
.end method

.method public setMetadata(Landroidx/media3/common/Metadata;)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 416
    iput-object p1, p0, Landroidx/media3/common/Format$Builder;->metadata:Landroidx/media3/common/Metadata;

    return-object p0
.end method

.method public setPcmEncoding(I)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 656
    iput p1, p0, Landroidx/media3/common/Format$Builder;->pcmEncoding:I

    return-object p0
.end method

.method public setPeakBitrate(I)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 392
    iput p1, p0, Landroidx/media3/common/Format$Builder;->peakBitrate:I

    return-object p0
.end method

.method public setPixelWidthHeightRatio(F)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 582
    iput p1, p0, Landroidx/media3/common/Format$Builder;->pixelWidthHeightRatio:F

    return-object p0
.end method

.method public setProjectionData([B)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 594
    iput-object p1, p0, Landroidx/media3/common/Format$Builder;->projectionData:[B

    return-object p0
.end method

.method public setRoleFlags(I)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 368
    iput p1, p0, Landroidx/media3/common/Format$Builder;->roleFlags:I

    return-object p0
.end method

.method public setRotationDegrees(I)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 570
    iput p1, p0, Landroidx/media3/common/Format$Builder;->rotationDegrees:I

    return-object p0
.end method

.method public setSampleMimeType(Ljava/lang/String;)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 460
    invoke-static {p1}, Landroidx/media3/common/MimeTypes;->normalizeMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Landroidx/media3/common/Format$Builder;->sampleMimeType:Ljava/lang/String;

    return-object p0
.end method

.method public setSampleRate(I)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 644
    iput p1, p0, Landroidx/media3/common/Format$Builder;->sampleRate:I

    return-object p0
.end method

.method public setSelectionFlags(I)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 356
    iput p1, p0, Landroidx/media3/common/Format$Builder;->selectionFlags:I

    return-object p0
.end method

.method public setStereoMode(I)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 606
    iput p1, p0, Landroidx/media3/common/Format$Builder;->stereoMode:I

    return-object p0
.end method

.method public setSubsampleOffsetUs(J)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 520
    iput-wide p1, p0, Landroidx/media3/common/Format$Builder;->subsampleOffsetUs:J

    return-object p0
.end method

.method public setTileCountHorizontal(I)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 721
    iput p1, p0, Landroidx/media3/common/Format$Builder;->tileCountHorizontal:I

    return-object p0
.end method

.method public setTileCountVertical(I)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 733
    iput p1, p0, Landroidx/media3/common/Format$Builder;->tileCountVertical:I

    return-object p0
.end method

.method public setWidth(I)Landroidx/media3/common/Format$Builder;
    .locals 0

    .line 534
    iput p1, p0, Landroidx/media3/common/Format$Builder;->width:I

    return-object p0
.end method
