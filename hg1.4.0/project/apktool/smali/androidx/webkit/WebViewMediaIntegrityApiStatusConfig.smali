.class public Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig;
.super Ljava/lang/Object;
.source "WebViewMediaIntegrityApiStatusConfig.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig$Builder;
    }
.end annotation


# static fields
.field public static final WEBVIEW_MEDIA_INTEGRITY_API_DISABLED:I = 0x0

.field public static final WEBVIEW_MEDIA_INTEGRITY_API_ENABLED:I = 0x2

.field public static final WEBVIEW_MEDIA_INTEGRITY_API_ENABLED_WITHOUT_APP_IDENTITY:I = 0x1


# instance fields
.field private mDefaultStatus:I

.field private mOverrideRules:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig$Builder;)V
    .locals 1

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    invoke-static {p1}, Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig$Builder;->access$000(Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig$Builder;)I

    move-result v0

    iput v0, p0, Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig;->mDefaultStatus:I

    .line 86
    invoke-static {p1}, Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig$Builder;->access$100(Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig$Builder;)Ljava/util/Map;

    move-result-object p1

    iput-object p1, p0, Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig;->mOverrideRules:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public getDefaultStatus()I
    .locals 1

    .line 163
    iget v0, p0, Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig;->mDefaultStatus:I

    return v0
.end method

.method public getOverrideRules()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 173
    iget-object v0, p0, Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig;->mOverrideRules:Ljava/util/Map;

    return-object v0
.end method
