.class public final Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig$Builder;
.super Ljava/lang/Object;
.source "WebViewMediaIntegrityApiStatusConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


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
.method public constructor <init>(I)V
    .locals 0

    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 112
    iput p1, p0, Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig$Builder;->mDefaultStatus:I

    .line 113
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig$Builder;->mOverrideRules:Ljava/util/Map;

    return-void
.end method

.method static synthetic access$000(Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig$Builder;)I
    .locals 0

    .line 103
    iget p0, p0, Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig$Builder;->mDefaultStatus:I

    return p0
.end method

.method static synthetic access$100(Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig$Builder;)Ljava/util/Map;
    .locals 0

    .line 103
    iget-object p0, p0, Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig$Builder;->mOverrideRules:Ljava/util/Map;

    return-object p0
.end method


# virtual methods
.method public addOverrideRule(Ljava/lang/String;I)Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig$Builder;
    .locals 1

    .line 129
    iget-object v0, p0, Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig$Builder;->mOverrideRules:Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public build()Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig;
    .locals 1

    .line 155
    new-instance v0, Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig;

    invoke-direct {v0, p0}, Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig;-><init>(Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig$Builder;)V

    return-object v0
.end method

.method public setOverrideRules(Ljava/util/Map;)Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)",
            "Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig$Builder;"
        }
    .end annotation

    .line 146
    iput-object p1, p0, Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig$Builder;->mOverrideRules:Ljava/util/Map;

    return-object p0
.end method
