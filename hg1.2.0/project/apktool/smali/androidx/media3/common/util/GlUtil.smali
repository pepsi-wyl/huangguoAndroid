.class public final Landroidx/media3/common/util/GlUtil;
.super Ljava/lang/Object;
.source "GlUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media3/common/util/GlUtil$GlException;
    }
.end annotation


# static fields
.field public static final EGL_CONFIG_ATTRIBUTES_RGBA_1010102:[I

.field public static final EGL_CONFIG_ATTRIBUTES_RGBA_8888:[I

.field private static final EGL_GL_COLORSPACE_BT2020_HLG_EXT:I = 0x3540

.field private static final EGL_GL_COLORSPACE_BT2020_PQ_EXT:I = 0x3340

.field private static final EGL_GL_COLORSPACE_KHR:I = 0x309d

.field private static final EGL_WINDOW_SURFACE_ATTRIBUTES_BT2020_HLG:[I

.field private static final EGL_WINDOW_SURFACE_ATTRIBUTES_BT2020_PQ:[I

.field private static final EGL_WINDOW_SURFACE_ATTRIBUTES_NONE:[I

.field private static final EXTENSION_COLORSPACE_BT2020_HLG:Ljava/lang/String; = "EGL_EXT_gl_colorspace_bt2020_hlg"

.field private static final EXTENSION_COLORSPACE_BT2020_PQ:Ljava/lang/String; = "EGL_EXT_gl_colorspace_bt2020_pq"

.field private static final EXTENSION_PROTECTED_CONTENT:Ljava/lang/String; = "EGL_EXT_protected_content"

.field private static final EXTENSION_SURFACELESS_CONTEXT:Ljava/lang/String; = "EGL_KHR_surfaceless_context"

.field private static final EXTENSION_YUV_TARGET:Ljava/lang/String; = "GL_EXT_YUV_target"

.field private static final GL_FENCE_SYNC_FAILED:J = 0x0L

.field public static final HOMOGENEOUS_COORDINATE_VECTOR_SIZE:I = 0x4

.field public static final LENGTH_NDC:F = 2.0f


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/16 v0, 0xf

    .line 65
    new-array v1, v0, [I

    fill-array-data v1, :array_0

    sput-object v1, Landroidx/media3/common/util/GlUtil;->EGL_CONFIG_ATTRIBUTES_RGBA_8888:[I

    .line 76
    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Landroidx/media3/common/util/GlUtil;->EGL_CONFIG_ATTRIBUTES_RGBA_1010102:[I

    const/16 v0, 0x3340

    const/16 v1, 0x309d

    const/16 v2, 0x3038

    .line 103
    filled-new-array {v1, v0, v2, v2}, [I

    move-result-object v0

    sput-object v0, Landroidx/media3/common/util/GlUtil;->EGL_WINDOW_SURFACE_ATTRIBUTES_BT2020_PQ:[I

    const/16 v0, 0x3540

    .line 108
    filled-new-array {v1, v0, v2, v2}, [I

    move-result-object v0

    sput-object v0, Landroidx/media3/common/util/GlUtil;->EGL_WINDOW_SURFACE_ATTRIBUTES_BT2020_HLG:[I

    .line 112
    filled-new-array {v2}, [I

    move-result-object v0

    sput-object v0, Landroidx/media3/common/util/GlUtil;->EGL_WINDOW_SURFACE_ATTRIBUTES_NONE:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x3040
        0x4
        0x3024
        0x8
        0x3023
        0x8
        0x3022
        0x8
        0x3021
        0x8
        0x3025
        0x0
        0x3026
        0x0
        0x3038
    .end array-data

    :array_1
    .array-data 4
        0x3040
        0x4
        0x3024
        0xa
        0x3023
        0xa
        0x3022
        0xa
        0x3021
        0x2
        0x3025
        0x0
        0x3026
        0x0
        0x3038
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static assertValidTextureSize(II)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 531
    new-array v1, v0, [I

    const/16 v2, 0xd33

    const/4 v3, 0x0

    .line 532
    invoke-static {v2, v1, v3}, Landroid/opengl/GLES20;->glGetIntegerv(I[II)V

    .line 533
    aget v1, v1, v3

    if-lez v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 534
    :goto_0
    const-string v2, "Create a OpenGL context first or run the GL methods on an OpenGL thread."

    invoke-static {v0, v2}, Landroidx/media3/common/util/Assertions;->checkState(ZLjava/lang/Object;)V

    if-ltz p0, :cond_2

    if-ltz p1, :cond_2

    if-gt p0, v1, :cond_1

    if-gt p1, v1, :cond_1

    return-void

    .line 542
    :cond_1
    new-instance p0, Landroidx/media3/common/util/GlUtil$GlException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "width or height is greater than GL_MAX_TEXTURE_SIZE "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Landroidx/media3/common/util/GlUtil$GlException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 539
    :cond_2
    new-instance p0, Landroidx/media3/common/util/GlUtil$GlException;

    const-string p1, "width or height is less than 0"

    invoke-direct {p0, p1}, Landroidx/media3/common/util/GlUtil$GlException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static awaitSyncObject(J)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-nez v2, :cond_0

    .line 482
    invoke-static {}, Landroid/opengl/GLES20;->glFinish()V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    const-wide/16 v1, -0x1

    .line 484
    invoke-static {p0, p1, v0, v1, v2}, Landroid/opengl/GLES30;->glWaitSync(JIJ)V

    .line 485
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    :goto_0
    return-void
.end method

.method public static bindTexture(III)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    .line 733
    invoke-static {p0, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 734
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    const/16 p1, 0x2800

    .line 735
    invoke-static {p0, p1, p2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 736
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    const/16 p1, 0x2801

    .line 737
    invoke-static {p0, p1, p2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 738
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    const/16 p1, 0x2802

    const p2, 0x812f

    .line 739
    invoke-static {p0, p1, p2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 740
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    const/16 p1, 0x2803

    .line 741
    invoke-static {p0, p1, p2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 742
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    return-void
.end method

.method private static checkEglException(Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    .line 871
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    move-result v0

    const/16 v1, 0x3000

    if-ne v0, v1, :cond_0

    return-void

    .line 873
    :cond_0
    new-instance v1, Landroidx/media3/common/util/GlUtil$GlException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ", error code: 0x"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Landroidx/media3/common/util/GlUtil$GlException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static checkGlError()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    .line 499
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    .line 502
    :goto_0
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    move-result v2

    if-eqz v2, :cond_2

    if-eqz v1, :cond_0

    const/16 v1, 0xa

    .line 504
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 506
    :cond_0
    invoke-static {v2}, Landroid/opengl/GLU;->gluErrorString(I)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1

    .line 508
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "error code: 0x"

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 510
    :cond_1
    const-string v2, "glError: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x1

    goto :goto_0

    :cond_2
    if-nez v1, :cond_3

    return-void

    .line 514
    :cond_3
    new-instance v1, Landroidx/media3/common/util/GlUtil$GlException;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Landroidx/media3/common/util/GlUtil$GlException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static checkGlException(ZLjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    if-eqz p0, :cond_0

    return-void

    .line 830
    :cond_0
    new-instance p0, Landroidx/media3/common/util/GlUtil$GlException;

    invoke-direct {p0, p1}, Landroidx/media3/common/util/GlUtil$GlException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static clearFocusedBuffers()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 555
    invoke-static {v0, v0, v0, v0}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 556
    invoke-static {v0}, Landroid/opengl/GLES20;->glClearDepthf(F)V

    const/16 v0, 0x4100

    .line 557
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 558
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    return-void
.end method

.method public static create4x4IdentityMatrix()[F
    .locals 1

    const/16 v0, 0x10

    .line 139
    new-array v0, v0, [F

    .line 140
    invoke-static {v0}, Landroidx/media3/common/util/GlUtil;->setToIdentity([F)V

    return-object v0
.end method

.method private static createBuffer(I)Ljava/nio/FloatBuffer;
    .locals 1

    mul-int/lit8 p0, p0, 0x4

    .line 624
    invoke-static {p0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object p0

    .line 625
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object p0

    return-object p0
.end method

.method public static createBuffer([F)Ljava/nio/FloatBuffer;
    .locals 1

    .line 615
    array-length v0, p0

    invoke-static {v0}, Landroidx/media3/common/util/GlUtil;->createBuffer(I)Ljava/nio/FloatBuffer;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/nio/FloatBuffer;->flip()Ljava/nio/Buffer;

    move-result-object p0

    check-cast p0, Ljava/nio/FloatBuffer;

    return-object p0
.end method

.method public static createEglContext(Landroid/opengl/EGLContext;Landroid/opengl/EGLDisplay;I[I)Landroid/opengl/EGLContext;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    .line 284
    sget-object v0, Landroidx/media3/common/util/GlUtil;->EGL_CONFIG_ATTRIBUTES_RGBA_8888:[I

    .line 285
    invoke-static {p3, v0}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_1

    sget-object v0, Landroidx/media3/common/util/GlUtil;->EGL_CONFIG_ATTRIBUTES_RGBA_1010102:[I

    .line 286
    invoke-static {p3, v0}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 284
    :goto_1
    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkArgument(Z)V

    const/4 v0, 0x2

    if-eq p2, v0, :cond_3

    const/4 v0, 0x3

    if-ne p2, v0, :cond_2

    goto :goto_2

    :cond_2
    const/4 v1, 0x0

    .line 287
    :cond_3
    :goto_2
    invoke-static {v1}, Landroidx/media3/common/util/Assertions;->checkArgument(Z)V

    const/16 v0, 0x3098

    const/16 v1, 0x3038

    .line 288
    filled-new-array {v0, p2, v1}, [I

    move-result-object v0

    .line 292
    invoke-static {p1, p3}, Landroidx/media3/common/util/GlUtil;->getEglConfig(Landroid/opengl/EGLDisplay;[I)Landroid/opengl/EGLConfig;

    move-result-object p3

    .line 290
    invoke-static {p1, p3, p0, v0, v2}, Landroid/opengl/EGL14;->eglCreateContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Landroid/opengl/EGLContext;[II)Landroid/opengl/EGLContext;

    move-result-object p0

    if-eqz p0, :cond_4

    .line 303
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    return-object p0

    .line 297
    :cond_4
    invoke-static {p1}, Landroid/opengl/EGL14;->eglTerminate(Landroid/opengl/EGLDisplay;)Z

    .line 298
    new-instance p0, Landroidx/media3/common/util/GlUtil$GlException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p3, "eglCreateContext() failed to create a valid context. The device may not support EGL version "

    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Landroidx/media3/common/util/GlUtil$GlException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static createEglContext(Landroid/opengl/EGLDisplay;)Landroid/opengl/EGLContext;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    .line 264
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    const/4 v1, 0x2

    sget-object v2, Landroidx/media3/common/util/GlUtil;->EGL_CONFIG_ATTRIBUTES_RGBA_8888:[I

    invoke-static {v0, p0, v1, v2}, Landroidx/media3/common/util/GlUtil;->createEglContext(Landroid/opengl/EGLContext;Landroid/opengl/EGLDisplay;I[I)Landroid/opengl/EGLContext;

    move-result-object p0

    return-object p0
.end method

.method public static createEglSurface(Landroid/opengl/EGLDisplay;Ljava/lang/Object;IZ)Landroid/opengl/EGLSurface;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    const/4 v0, 0x3

    if-eq p2, v0, :cond_7

    const/16 v0, 0xa

    if-ne p2, v0, :cond_0

    goto :goto_1

    :cond_0
    const/4 v0, 0x7

    const/4 v1, 0x6

    if-eq p2, v0, :cond_2

    if-ne p2, v1, :cond_1

    goto :goto_0

    .line 353
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p3, "Unsupported color transfer: "

    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 331
    :cond_2
    :goto_0
    sget-object v0, Landroidx/media3/common/util/GlUtil;->EGL_CONFIG_ATTRIBUTES_RGBA_1010102:[I

    if-eqz p3, :cond_3

    .line 339
    sget-object p2, Landroidx/media3/common/util/GlUtil;->EGL_WINDOW_SURFACE_ATTRIBUTES_NONE:[I

    goto :goto_2

    :cond_3
    if-ne p2, v1, :cond_5

    .line 341
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->isBt2020PqExtensionSupported()Z

    move-result p2

    if-eqz p2, :cond_4

    .line 345
    sget-object p2, Landroidx/media3/common/util/GlUtil;->EGL_WINDOW_SURFACE_ATTRIBUTES_BT2020_PQ:[I

    goto :goto_2

    .line 342
    :cond_4
    new-instance p0, Landroidx/media3/common/util/GlUtil$GlException;

    const-string p1, "BT.2020 PQ OpenGL output isn\'t supported."

    invoke-direct {p0, p1}, Landroidx/media3/common/util/GlUtil$GlException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 347
    :cond_5
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->isBt2020HlgExtensionSupported()Z

    move-result p2

    if-eqz p2, :cond_6

    .line 350
    sget-object p2, Landroidx/media3/common/util/GlUtil;->EGL_WINDOW_SURFACE_ATTRIBUTES_BT2020_HLG:[I

    goto :goto_2

    .line 348
    :cond_6
    new-instance p0, Landroidx/media3/common/util/GlUtil$GlException;

    const-string p1, "BT.2020 HLG OpenGL output isn\'t supported."

    invoke-direct {p0, p1}, Landroidx/media3/common/util/GlUtil$GlException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 328
    :cond_7
    :goto_1
    sget-object v0, Landroidx/media3/common/util/GlUtil;->EGL_CONFIG_ATTRIBUTES_RGBA_8888:[I

    .line 329
    sget-object p2, Landroidx/media3/common/util/GlUtil;->EGL_WINDOW_SURFACE_ATTRIBUTES_NONE:[I

    .line 358
    :goto_2
    invoke-static {p0, v0}, Landroidx/media3/common/util/GlUtil;->getEglConfig(Landroid/opengl/EGLDisplay;[I)Landroid/opengl/EGLConfig;

    move-result-object p3

    const/4 v0, 0x0

    .line 356
    invoke-static {p0, p3, p1, p2, v0}, Landroid/opengl/EGL14;->eglCreateWindowSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Ljava/lang/Object;[II)Landroid/opengl/EGLSurface;

    move-result-object p0

    .line 362
    const-string p1, "Error creating a new EGL surface"

    invoke-static {p1}, Landroidx/media3/common/util/GlUtil;->checkEglException(Ljava/lang/String;)V

    return-object p0
.end method

.method public static createExternalTexture()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    .line 633
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->generateTexture()I

    move-result v0

    const v1, 0x8d65

    const/16 v2, 0x2601

    .line 634
    invoke-static {v1, v0, v2}, Landroidx/media3/common/util/GlUtil;->bindTexture(III)V

    return v0
.end method

.method public static createFboForTexture(I)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 751
    new-array v1, v0, [I

    const/4 v2, 0x0

    .line 752
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    .line 753
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    .line 754
    aget v0, v1, v2

    const v3, 0x8d40

    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 755
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    const v0, 0x8ce0

    const/16 v4, 0xde1

    .line 756
    invoke-static {v3, v0, v4, p0, v2}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 758
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    .line 759
    aget p0, v1, v2

    return p0
.end method

.method public static createFocusedPlaceholderEglSurface(Landroid/opengl/EGLContext;Landroid/opengl/EGLDisplay;)Landroid/opengl/EGLSurface;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    .line 408
    sget-object v0, Landroidx/media3/common/util/GlUtil;->EGL_CONFIG_ATTRIBUTES_RGBA_8888:[I

    .line 410
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->isSurfacelessContextExtensionSupported()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    .line 411
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    goto :goto_0

    .line 412
    :cond_0
    invoke-static {p1, v2, v2, v0}, Landroidx/media3/common/util/GlUtil;->createPbufferSurface(Landroid/opengl/EGLDisplay;II[I)Landroid/opengl/EGLSurface;

    move-result-object v0

    .line 414
    :goto_0
    invoke-static {p1, p0, v0, v2, v2}, Landroidx/media3/common/util/GlUtil;->focusEglSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;Landroid/opengl/EGLSurface;II)V

    return-object v0
.end method

.method public static createGlSyncFence()J
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    .line 444
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->getContextMajorVersion()J

    move-result-wide v0

    const-wide/16 v2, 0x3

    cmp-long v4, v0, v2

    if-ltz v4, :cond_0

    const v0, 0x9117

    const/4 v1, 0x0

    .line 445
    invoke-static {v0, v1}, Landroid/opengl/GLES30;->glFenceSync(II)J

    move-result-wide v0

    .line 446
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    .line 451
    invoke-static {}, Landroid/opengl/GLES20;->glFlush()V

    .line 452
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    return-wide v0

    :cond_0
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method private static createPbufferSurface(Landroid/opengl/EGLDisplay;II[I)Landroid/opengl/EGLSurface;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    const/16 v0, 0x3056

    const/16 v1, 0x3038

    const/16 v2, 0x3057

    .line 377
    filled-new-array {v2, p1, v0, p2, v1}, [I

    move-result-object p1

    .line 386
    invoke-static {p0, p3}, Landroidx/media3/common/util/GlUtil;->getEglConfig(Landroid/opengl/EGLDisplay;[I)Landroid/opengl/EGLConfig;

    move-result-object p2

    const/4 p3, 0x0

    .line 384
    invoke-static {p0, p2, p1, p3}, Landroid/opengl/EGL14;->eglCreatePbufferSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;[II)Landroid/opengl/EGLSurface;

    move-result-object p0

    .line 389
    const-string p1, "Error creating a new EGL Pbuffer surface"

    invoke-static {p1}, Landroidx/media3/common/util/GlUtil;->checkEglException(Ljava/lang/String;)V

    return-object p0
.end method

.method public static createTexture(IIZ)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    if-eqz p2, :cond_0

    const p2, 0x881a

    const/16 v0, 0x140b

    .line 670
    invoke-static {p0, p1, p2, v0}, Landroidx/media3/common/util/GlUtil;->createTextureUninitialized(IIII)I

    move-result p0

    return p0

    :cond_0
    const/16 p2, 0x1908

    const/16 v0, 0x1401

    .line 672
    invoke-static {p0, p1, p2, v0}, Landroidx/media3/common/util/GlUtil;->createTextureUninitialized(IIII)I

    move-result p0

    return p0
.end method

.method public static createTexture(Landroid/graphics/Bitmap;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    .line 646
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->generateTexture()I

    move-result v0

    .line 647
    invoke-static {v0, p0}, Landroidx/media3/common/util/GlUtil;->setTexture(ILandroid/graphics/Bitmap;)V

    return v0
.end method

.method private static createTextureUninitialized(IIII)I
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    .line 687
    invoke-static {p0, p1}, Landroidx/media3/common/util/GlUtil;->assertValidTextureSize(II)V

    .line 688
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->generateTexture()I

    move-result v0

    const/16 v1, 0xde1

    const/16 v2, 0x2601

    .line 689
    invoke-static {v1, v0, v2}, Landroidx/media3/common/util/GlUtil;->bindTexture(III)V

    const/16 v9, 0x1908

    const/4 v11, 0x0

    const/16 v3, 0xde1

    const/4 v4, 0x0

    const/4 v8, 0x0

    move v5, p2

    move v6, p0

    move v7, p1

    move v10, p3

    .line 690
    invoke-static/range {v3 .. v11}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 700
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    return v0
.end method

.method public static createVertexBuffer(Ljava/util/List;)[F
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "[F>;)[F"
        }
    .end annotation

    .line 151
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x4

    mul-int/lit8 v0, v0, 0x4

    new-array v0, v0, [F

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 152
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_0

    .line 154
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    mul-int/lit8 v5, v3, 0x4

    .line 153
    invoke-static {v4, v2, v0, v5, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static deleteFbo(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    .line 813
    filled-new-array {p0}, [I

    move-result-object p0

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {v1, p0, v0}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    .line 814
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    return-void
.end method

.method public static deleteRbo(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    .line 819
    filled-new-array {p0}, [I

    move-result-object p0

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {v1, p0, v0}, Landroid/opengl/GLES20;->glDeleteRenderbuffers(I[II)V

    .line 821
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    return-void
.end method

.method public static deleteSyncObject(J)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    .line 465
    invoke-static {p0, p1}, Landroidx/media3/common/util/GlUtil;->deleteSyncObjectQuietly(J)V

    .line 466
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    return-void
.end method

.method public static deleteSyncObjectQuietly(J)V
    .locals 0

    .line 471
    invoke-static {p0, p1}, Landroid/opengl/GLES30;->glDeleteSync(J)V

    return-void
.end method

.method public static deleteTexture(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    .line 768
    filled-new-array {p0}, [I

    move-result-object p0

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {v1, p0, v0}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 769
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    return-void
.end method

.method public static destroyEglContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    if-nez p0, :cond_0

    return-void

    .line 784
    :cond_0
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    invoke-static {p0, v0, v1, v2}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 786
    const-string v0, "Error releasing context"

    invoke-static {v0}, Landroidx/media3/common/util/GlUtil;->checkEglException(Ljava/lang/String;)V

    if-eqz p1, :cond_1

    .line 788
    invoke-static {p0, p1}, Landroid/opengl/EGL14;->eglDestroyContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;)Z

    .line 789
    const-string p1, "Error destroying context"

    invoke-static {p1}, Landroidx/media3/common/util/GlUtil;->checkEglException(Ljava/lang/String;)V

    .line 791
    :cond_1
    invoke-static {}, Landroid/opengl/EGL14;->eglReleaseThread()Z

    .line 792
    const-string p1, "Error releasing thread"

    invoke-static {p1}, Landroidx/media3/common/util/GlUtil;->checkEglException(Ljava/lang/String;)V

    .line 793
    invoke-static {p0}, Landroid/opengl/EGL14;->eglTerminate(Landroid/opengl/EGLDisplay;)Z

    .line 794
    const-string p0, "Error terminating display"

    invoke-static {p0}, Landroidx/media3/common/util/GlUtil;->checkEglException(Ljava/lang/String;)V

    return-void
.end method

.method public static destroyEglSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    if-eqz p0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    .line 807
    :cond_0
    invoke-static {p0, p1}, Landroid/opengl/EGL14;->eglDestroySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    .line 808
    const-string p0, "Error destroying surface"

    invoke-static {p0}, Landroidx/media3/common/util/GlUtil;->checkEglException(Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public static focusEglSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;Landroid/opengl/EGLSurface;II)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v4, p3

    move v5, p4

    .line 568
    invoke-static/range {v0 .. v5}, Landroidx/media3/common/util/GlUtil;->focusRenderTarget(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;Landroid/opengl/EGLSurface;III)V

    return-void
.end method

.method public static focusFramebuffer(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;Landroid/opengl/EGLSurface;III)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    .line 583
    invoke-static/range {p0 .. p5}, Landroidx/media3/common/util/GlUtil;->focusRenderTarget(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;Landroid/opengl/EGLSurface;III)V

    return-void
.end method

.method public static focusFramebufferUsingCurrentContext(III)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 599
    new-array v0, v0, [I

    const v1, 0x8ca6

    const/4 v2, 0x0

    .line 600
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glGetIntegerv(I[II)V

    .line 601
    aget v0, v0, v2

    if-eq v0, p0, :cond_0

    const v0, 0x8d40

    .line 602
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 604
    :cond_0
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    .line 605
    invoke-static {v2, v2, p1, p2}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 606
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    return-void
.end method

.method private static focusRenderTarget(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;Landroid/opengl/EGLSurface;III)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    .line 865
    invoke-static {p0, p2, p2, p1}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 866
    const-string p0, "Error making context current"

    invoke-static {p0}, Landroidx/media3/common/util/GlUtil;->checkEglException(Ljava/lang/String;)V

    .line 867
    invoke-static {p3, p4, p5}, Landroidx/media3/common/util/GlUtil;->focusFramebufferUsingCurrentContext(III)V

    return-void
.end method

.method public static generateTexture()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 706
    new-array v1, v0, [I

    const/4 v2, 0x0

    .line 707
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 708
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    .line 709
    aget v0, v1, v2

    return v0
.end method

.method public static getContextMajorVersion()J
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 425
    new-array v0, v0, [I

    const/4 v1, 0x0

    .line 427
    invoke-static {v1}, Landroid/opengl/EGL14;->eglGetDisplay(I)Landroid/opengl/EGLDisplay;

    move-result-object v2

    .line 428
    invoke-static {}, Landroid/opengl/EGL14;->eglGetCurrentContext()Landroid/opengl/EGLContext;

    move-result-object v3

    const/16 v4, 0x3098

    .line 426
    invoke-static {v2, v3, v4, v0, v1}, Landroid/opengl/EGL14;->eglQueryContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;I[II)Z

    .line 432
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    .line 433
    aget v0, v0, v1

    int-to-long v0, v0

    return-wide v0
.end method

.method public static getCurrentContext()Landroid/opengl/EGLContext;
    .locals 1

    .line 491
    invoke-static {}, Landroid/opengl/EGL14;->eglGetCurrentContext()Landroid/opengl/EGLContext;

    move-result-object v0

    return-object v0
.end method

.method public static getDefaultEglDisplay()Landroid/opengl/EGLDisplay;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 241
    invoke-static {v0}, Landroid/opengl/EGL14;->eglGetDisplay(I)Landroid/opengl/EGLDisplay;

    move-result-object v1

    .line 242
    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    invoke-virtual {v1, v2}, Landroid/opengl/EGLDisplay;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x1

    xor-int/2addr v2, v3

    const-string v4, "No EGL display."

    invoke-static {v2, v4}, Landroidx/media3/common/util/GlUtil;->checkGlException(ZLjava/lang/String;)V

    .line 243
    new-array v2, v3, [I

    new-array v3, v3, [I

    .line 244
    invoke-static {v1, v2, v0, v3, v0}, Landroid/opengl/EGL14;->eglInitialize(Landroid/opengl/EGLDisplay;[II[II)Z

    move-result v0

    const-string v2, "Error in eglInitialize."

    .line 243
    invoke-static {v0, v2}, Landroidx/media3/common/util/GlUtil;->checkGlException(ZLjava/lang/String;)V

    .line 251
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    return-object v1
.end method

.method private static getEglConfig(Landroid/opengl/EGLDisplay;[I)Landroid/opengl/EGLConfig;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 836
    new-array v9, v0, [Landroid/opengl/EGLConfig;

    .line 837
    new-array v7, v0, [I

    const/4 v8, 0x0

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x1

    move-object v1, p0

    move-object v2, p1

    move-object v4, v9

    invoke-static/range {v1 .. v8}, Landroid/opengl/EGL14;->eglChooseConfig(Landroid/opengl/EGLDisplay;[II[Landroid/opengl/EGLConfig;II[II)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x0

    .line 848
    aget-object p0, v9, p0

    return-object p0

    .line 846
    :cond_0
    new-instance p0, Landroidx/media3/common/util/GlUtil$GlException;

    const-string p1, "eglChooseConfig failed."

    invoke-direct {p0, p1}, Landroidx/media3/common/util/GlUtil$GlException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static getNormalizedCoordinateBounds()[F
    .locals 1

    const/16 v0, 0x10

    .line 119
    new-array v0, v0, [F

    fill-array-data v0, :array_0

    return-object v0

    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x0
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static getTextureCoordinateBounds()[F
    .locals 1

    const/16 v0, 0x10

    .line 129
    new-array v0, v0, [F

    fill-array-data v0, :array_0

    return-object v0

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static isBt2020HlgExtensionSupported()Z
    .locals 1

    .line 236
    const-string v0, "EGL_EXT_gl_colorspace_bt2020_hlg"

    invoke-static {v0}, Landroidx/media3/common/util/GlUtil;->isExtensionSupported(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isBt2020PqExtensionSupported()Z
    .locals 2

    .line 231
    sget v0, Landroidx/media3/common/util/Util;->SDK_INT:I

    const/16 v1, 0x21

    if-lt v0, v1, :cond_0

    const-string v0, "EGL_EXT_gl_colorspace_bt2020_pq"

    invoke-static {v0}, Landroidx/media3/common/util/GlUtil;->isExtensionSupported(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static isExtensionSupported(Ljava/lang/String;)Z
    .locals 3

    const/4 v0, 0x0

    .line 852
    invoke-static {v0}, Landroid/opengl/EGL14;->eglGetDisplay(I)Landroid/opengl/EGLDisplay;

    move-result-object v1

    const/16 v2, 0x3055

    .line 853
    invoke-static {v1, v2}, Landroid/opengl/EGL14;->eglQueryString(Landroid/opengl/EGLDisplay;I)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 854
    invoke-virtual {v1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public static isProtectedContentExtensionSupported(Landroid/content/Context;)Z
    .locals 4

    .line 169
    sget v0, Landroidx/media3/common/util/Util;->SDK_INT:I

    const/16 v1, 0x18

    const/4 v2, 0x0

    if-ge v0, v1, :cond_0

    return v2

    .line 172
    :cond_0
    sget v0, Landroidx/media3/common/util/Util;->SDK_INT:I

    const/16 v1, 0x1a

    if-ge v0, v1, :cond_2

    const-string v0, "samsung"

    sget-object v3, Landroidx/media3/common/util/Util;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "XT1650"

    sget-object v3, Landroidx/media3/common/util/Util;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    return v2

    .line 179
    :cond_2
    sget v0, Landroidx/media3/common/util/Util;->SDK_INT:I

    if-ge v0, v1, :cond_3

    .line 181
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const-string v0, "android.hardware.vr.high_performance"

    .line 182
    invoke-virtual {p0, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_3

    return v2

    .line 187
    :cond_3
    const-string p0, "EGL_EXT_protected_content"

    invoke-static {p0}, Landroidx/media3/common/util/GlUtil;->isExtensionSupported(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static isSurfacelessContextExtensionSupported()Z
    .locals 1

    .line 198
    const-string v0, "EGL_KHR_surfaceless_context"

    invoke-static {v0}, Landroidx/media3/common/util/GlUtil;->isExtensionSupported(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isYuvTargetExtensionSupported()Z
    .locals 4

    .line 209
    invoke-static {}, Landroid/opengl/EGL14;->eglGetCurrentContext()Landroid/opengl/EGLContext;

    move-result-object v0

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    invoke-static {v0, v1}, Landroidx/media3/common/util/Util;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    const/16 v2, 0x1f03

    if-eqz v0, :cond_0

    .line 212
    :try_start_0
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->getDefaultEglDisplay()Landroid/opengl/EGLDisplay;

    move-result-object v0

    .line 213
    invoke-static {v0}, Landroidx/media3/common/util/GlUtil;->createEglContext(Landroid/opengl/EGLDisplay;)Landroid/opengl/EGLContext;

    move-result-object v3

    .line 214
    invoke-static {v3, v0}, Landroidx/media3/common/util/GlUtil;->createFocusedPlaceholderEglSurface(Landroid/opengl/EGLContext;Landroid/opengl/EGLDisplay;)Landroid/opengl/EGLSurface;

    .line 215
    invoke-static {v2}, Landroid/opengl/GLES20;->glGetString(I)Ljava/lang/String;

    move-result-object v2

    .line 216
    invoke-static {v0, v3}, Landroidx/media3/common/util/GlUtil;->destroyEglContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;)V
    :try_end_0
    .catch Landroidx/media3/common/util/GlUtil$GlException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    return v1

    .line 221
    :cond_0
    invoke-static {v2}, Landroid/opengl/GLES20;->glGetString(I)Ljava/lang/String;

    move-result-object v2

    :goto_0
    if-eqz v2, :cond_1

    .line 224
    const-string v0, "GL_EXT_YUV_target"

    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method public static setTexture(ILandroid/graphics/Bitmap;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/util/GlUtil$GlException;
        }
    .end annotation

    .line 714
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-static {v0, v1}, Landroidx/media3/common/util/GlUtil;->assertValidTextureSize(II)V

    const/16 v0, 0x2601

    const/16 v1, 0xde1

    .line 715
    invoke-static {v1, p0, v0}, Landroidx/media3/common/util/GlUtil;->bindTexture(III)V

    const/4 p0, 0x0

    .line 716
    invoke-static {v1, p0, p1, p0}, Landroid/opengl/GLUtils;->texImage2D(IILandroid/graphics/Bitmap;I)V

    .line 717
    invoke-static {}, Landroidx/media3/common/util/GlUtil;->checkGlError()V

    return-void
.end method

.method public static setToIdentity([F)V
    .locals 1

    const/4 v0, 0x0

    .line 146
    invoke-static {p0, v0}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    return-void
.end method
