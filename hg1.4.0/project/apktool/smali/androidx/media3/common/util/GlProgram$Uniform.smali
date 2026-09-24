.class final Landroidx/media3/common/util/GlProgram$Uniform;
.super Ljava/lang/Object;
.source "GlProgram.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media3/common/util/GlProgram;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Uniform"
.end annotation


# instance fields
.field private final floatValue:[F

.field private final intValue:[I

.field private final location:I

.field public final name:Ljava/lang/String;

.field private texIdValue:I

.field private texUnitIndex:I

.field private final type:I


# direct methods
.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0

    .line 369
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 370
    iput-object p1, p0, Landroidx/media3/common/util/GlProgram$Uniform;->name:Ljava/lang/String;

    .line 371
    iput p2, p0, Landroidx/media3/common/util/GlProgram$Uniform;->location:I

    .line 372
    iput p3, p0, Landroidx/media3/common/util/GlProgram$Uniform;->type:I

    const/16 p1, 0x10

    .line 373
    new-array p1, p1, [F

    iput-object p1, p0, Landroidx/media3/common/util/GlProgram$Uniform;->floatValue:[F

    const/4 p1, 0x4

    .line 374
    new-array p1, p1, [I

    iput-object p1, p0, Landroidx/media3/common/util/GlProgram$Uniform;->intValue:[I

    return-void
.end method

.method public static create(II)Landroidx/media3/common/util/GlProgram$Uniform;
    .locals 15

    move v11, p0

    const/4 v0, 0x1

    .line 333
    new-array v1, v0, [I

    const v2, 0x8b87

    const/4 v12, 0x0

    .line 334
    invoke-static {p0, v2, v1, v12}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 337
    new-array v13, v0, [I

    .line 338
    aget v2, v1, v12

    new-array v14, v2, [B

    .line 340
    new-array v3, v0, [I

    new-array v5, v0, [I

    const/4 v8, 0x0

    const/4 v10, 0x0

    const/4 v4, 0x0

    const/4 v6, 0x0

    move v0, p0

    move/from16 v1, p1

    move-object v7, v13

    move-object v9, v14

    invoke-static/range {v0 .. v10}, Landroid/opengl/GLES20;->glGetActiveUniform(III[II[II[II[BI)V

    .line 352
    new-instance v0, Ljava/lang/String;

    invoke-static {v14}, Landroidx/media3/common/util/GlProgram;->access$000([B)I

    move-result v1

    invoke-direct {v0, v14, v12, v1}, Ljava/lang/String;-><init>([BII)V

    .line 353
    invoke-static {p0, v0}, Landroidx/media3/common/util/GlProgram;->access$200(ILjava/lang/String;)I

    move-result v1

    .line 355
    new-instance v2, Landroidx/media3/common/util/GlProgram$Uniform;

    aget v3, v13, v12

    invoke-direct {v2, v0, v1, v3}, Landroidx/media3/common/util/GlProgram$Uniform;-><init>(Ljava/lang/String;II)V

    return-object v2
.end method


# virtual methods
.method public bind(Z)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    .line 420
    iget v0, p0, Landroidx/media3/common/util/GlProgram$Uniform;->type:I

    const/16 v1, 0x1404

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eq v0, v1, :cond_5

    const/16 v1, 0x1406

    if-eq v0, v1, :cond_4

    const v1, 0x8b5e    # 4.9996E-41f

    if-eq v0, v1, :cond_0

    const v4, 0x8be7

    if-eq v0, v4, :cond_0

    const v4, 0x8d66

    if-eq v0, v4, :cond_0

    packed-switch v0, :pswitch_data_0

    packed-switch v0, :pswitch_data_1

    .line 483
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unexpected uniform type: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Landroidx/media3/common/util/GlProgram$Uniform;->type:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 459
    :pswitch_0
    iget p1, p0, Landroidx/media3/common/util/GlProgram$Uniform;->location:I

    iget-object v0, p0, Landroidx/media3/common/util/GlProgram$Uniform;->floatValue:[F

    invoke-static {p1, v2, v3, v0, v3}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 461
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    goto/16 :goto_2

    .line 454
    :pswitch_1
    iget p1, p0, Landroidx/media3/common/util/GlProgram$Uniform;->location:I

    iget-object v0, p0, Landroidx/media3/common/util/GlProgram$Uniform;->floatValue:[F

    invoke-static {p1, v2, v3, v0, v3}, Landroid/opengl/GLES20;->glUniformMatrix3fv(IIZ[FI)V

    .line 456
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    goto/16 :goto_2

    .line 434
    :pswitch_2
    iget p1, p0, Landroidx/media3/common/util/GlProgram$Uniform;->location:I

    iget-object v0, p0, Landroidx/media3/common/util/GlProgram$Uniform;->intValue:[I

    invoke-static {p1, v2, v0, v3}, Landroid/opengl/GLES20;->glUniform4iv(II[II)V

    .line 435
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    goto/16 :goto_2

    .line 430
    :pswitch_3
    iget p1, p0, Landroidx/media3/common/util/GlProgram$Uniform;->location:I

    iget-object v0, p0, Landroidx/media3/common/util/GlProgram$Uniform;->intValue:[I

    invoke-static {p1, v2, v0, v3}, Landroid/opengl/GLES20;->glUniform3iv(II[II)V

    .line 431
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    goto/16 :goto_2

    .line 426
    :pswitch_4
    iget p1, p0, Landroidx/media3/common/util/GlProgram$Uniform;->location:I

    iget-object v0, p0, Landroidx/media3/common/util/GlProgram$Uniform;->intValue:[I

    invoke-static {p1, v2, v0, v3}, Landroid/opengl/GLES20;->glUniform2iv(II[II)V

    .line 427
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    goto/16 :goto_2

    .line 450
    :pswitch_5
    iget p1, p0, Landroidx/media3/common/util/GlProgram$Uniform;->location:I

    iget-object v0, p0, Landroidx/media3/common/util/GlProgram$Uniform;->floatValue:[F

    invoke-static {p1, v2, v0, v3}, Landroid/opengl/GLES20;->glUniform4fv(II[FI)V

    .line 451
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    goto :goto_2

    .line 446
    :pswitch_6
    iget p1, p0, Landroidx/media3/common/util/GlProgram$Uniform;->location:I

    iget-object v0, p0, Landroidx/media3/common/util/GlProgram$Uniform;->floatValue:[F

    invoke-static {p1, v2, v0, v3}, Landroid/opengl/GLES20;->glUniform3fv(II[FI)V

    .line 447
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    goto :goto_2

    .line 442
    :pswitch_7
    iget p1, p0, Landroidx/media3/common/util/GlProgram$Uniform;->location:I

    iget-object v0, p0, Landroidx/media3/common/util/GlProgram$Uniform;->floatValue:[F

    invoke-static {p1, v2, v0, v3}, Landroid/opengl/GLES20;->glUniform2fv(II[FI)V

    .line 443
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    goto :goto_2

    .line 466
    :cond_0
    iget v0, p0, Landroidx/media3/common/util/GlProgram$Uniform;->texIdValue:I

    if-eqz v0, :cond_3

    const v0, 0x84c0

    .line 469
    iget v2, p0, Landroidx/media3/common/util/GlProgram$Uniform;->texUnitIndex:I

    add-int/2addr v2, v0

    invoke-static {v2}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 470
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    .line 472
    iget v0, p0, Landroidx/media3/common/util/GlProgram$Uniform;->type:I

    if-ne v0, v1, :cond_1

    const/16 v2, 0xde1

    goto :goto_0

    :cond_1
    const v2, 0x8d65

    .line 474
    :goto_0
    iget v3, p0, Landroidx/media3/common/util/GlProgram$Uniform;->texIdValue:I

    if-ne v0, v1, :cond_2

    if-nez p1, :cond_2

    const/16 p1, 0x2601

    goto :goto_1

    :cond_2
    const/16 p1, 0x2600

    .line 471
    :goto_1
    invoke-static {v2, v3, p1}, Landroidx/media3/common/util/GlUtil;->bindTexture(III)V

    .line 479
    iget p1, p0, Landroidx/media3/common/util/GlProgram$Uniform;->location:I

    iget v0, p0, Landroidx/media3/common/util/GlProgram$Uniform;->texUnitIndex:I

    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 480
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    goto :goto_2

    .line 467
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "No call to setSamplerTexId() before bind."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 438
    :cond_4
    iget p1, p0, Landroidx/media3/common/util/GlProgram$Uniform;->location:I

    iget-object v0, p0, Landroidx/media3/common/util/GlProgram$Uniform;->floatValue:[F

    invoke-static {p1, v2, v0, v3}, Landroid/opengl/GLES20;->glUniform1fv(II[FI)V

    .line 439
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    goto :goto_2

    .line 422
    :cond_5
    iget p1, p0, Landroidx/media3/common/util/GlProgram$Uniform;->location:I

    iget-object v0, p0, Landroidx/media3/common/util/GlProgram$Uniform;->intValue:[I

    invoke-static {p1, v2, v0, v3}, Landroid/opengl/GLES20;->glUniform1iv(II[II)V

    .line 423
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    :goto_2
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x8b50
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x8b5b
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setFloat(F)V
    .locals 2

    .line 401
    iget-object v0, p0, Landroidx/media3/common/util/GlProgram$Uniform;->floatValue:[F

    const/4 v1, 0x0

    aput p1, v0, v1

    return-void
.end method

.method public setFloats([F)V
    .locals 3

    .line 406
    iget-object v0, p0, Landroidx/media3/common/util/GlProgram$Uniform;->floatValue:[F

    array-length v1, p1

    const/4 v2, 0x0

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void
.end method

.method public setInt(I)V
    .locals 2

    .line 391
    iget-object v0, p0, Landroidx/media3/common/util/GlProgram$Uniform;->intValue:[I

    const/4 v1, 0x0

    aput p1, v0, v1

    return-void
.end method

.method public setInts([I)V
    .locals 3

    .line 396
    iget-object v0, p0, Landroidx/media3/common/util/GlProgram$Uniform;->intValue:[I

    array-length v1, p1

    const/4 v2, 0x0

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void
.end method

.method public setSamplerTexId(II)V
    .locals 0

    .line 385
    iput p1, p0, Landroidx/media3/common/util/GlProgram$Uniform;->texIdValue:I

    .line 386
    iput p2, p0, Landroidx/media3/common/util/GlProgram$Uniform;->texUnitIndex:I

    return-void
.end method
