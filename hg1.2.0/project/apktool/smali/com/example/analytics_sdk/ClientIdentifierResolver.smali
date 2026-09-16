.class public final Lcom/example/analytics_sdk/ClientIdentifierResolver;
.super Ljava/lang/Object;
.source "ClientIdentifierResolver.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nClientIdentifierResolver.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ClientIdentifierResolver.kt\ncom/example/analytics_sdk/ClientIdentifierResolver\n+ 2 _Strings.kt\nkotlin/text/StringsKt___StringsKt\n*L\n1#1,28:1\n1064#2,2:29\n*S KotlinDebug\n*F\n+ 1 ClientIdentifierResolver.kt\ncom/example/analytics_sdk/ClientIdentifierResolver\n*L\n25#1:29,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0012\u0010\u0003\u001a\u00020\u00042\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0006H\u0002J/\u0010\u0007\u001a\u00020\u00062\"\u0010\u0008\u001a\u0012\u0012\u000e\u0008\u0001\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\n0\t\"\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\n\u00a2\u0006\u0002\u0010\u000b\u00a8\u0006\u000c"
    }
    d2 = {
        "Lcom/example/analytics_sdk/ClientIdentifierResolver;",
        "",
        "()V",
        "isValid",
        "",
        "value",
        "",
        "resolve",
        "candidates",
        "",
        "Lkotlin/Function0;",
        "([Lkotlin/jvm/functions/Function0;)Ljava/lang/String;",
        "analytics_sdk_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lcom/example/analytics_sdk/ClientIdentifierResolver;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/example/analytics_sdk/ClientIdentifierResolver;

    invoke-direct {v0}, Lcom/example/analytics_sdk/ClientIdentifierResolver;-><init>()V

    sput-object v0, Lcom/example/analytics_sdk/ClientIdentifierResolver;->INSTANCE:Lcom/example/analytics_sdk/ClientIdentifierResolver;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final isValid(Ljava/lang/String;)Z
    .locals 7

    if-eqz p1, :cond_0

    .line 19
    check-cast p1, Ljava/lang/CharSequence;

    invoke-static {p1}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    if-nez p1, :cond_1

    const-string p1, ""

    :cond_1
    move-object v0, p1

    .line 20
    move-object p1, v0

    check-cast p1, Ljava/lang/CharSequence;

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    const/4 v6, 0x0

    if-nez p1, :cond_2

    return v6

    .line 21
    :cond_2
    sget-object p1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v1, "ROOT"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "toLowerCase(...)"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v1

    const v2, -0x321892ac

    if-eq v1, v2, :cond_5

    const v2, -0x10fa53b6

    if-eq v1, v2, :cond_4

    const v2, 0x33c587

    if-eq v1, v2, :cond_3

    goto :goto_1

    :cond_3
    const-string v1, "null"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_8

    goto :goto_1

    :cond_4
    const-string v1, "unknown"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    goto :goto_3

    :cond_5
    const-string v1, "unkown"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_8

    :cond_6
    :goto_1
    const/4 v4, 0x4

    const/4 v5, 0x0

    .line 24
    const-string v1, "-"

    const-string v2, ""

    const/4 v3, 0x0

    invoke-static/range {v0 .. v5}, Lkotlin/text/StringsKt;->replace$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 25
    check-cast p1, Ljava/lang/CharSequence;

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-lez v0, :cond_8

    const/4 v0, 0x0

    .line 29
    :goto_2
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-ge v0, v1, :cond_8

    invoke-interface {p1, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    const/16 v2, 0x30

    if-ne v1, v2, :cond_7

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_7
    const/4 v6, 0x1

    :cond_8
    :goto_3
    return v6
.end method


# virtual methods
.method public final varargs resolve([Lkotlin/jvm/functions/Function0;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lkotlin/jvm/functions/Function0<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    const-string v0, "candidates"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 7
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    const-string v2, ""

    if-ge v1, v0, :cond_3

    aget-object v3, p1, v1

    .line 9
    :try_start_0
    invoke-interface {v3}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-eqz v3, :cond_0

    check-cast v3, Ljava/lang/CharSequence;

    invoke-static {v3}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :cond_0
    const/4 v3, 0x0

    :goto_1
    if-nez v3, :cond_1

    goto :goto_2

    :cond_1
    move-object v2, v3

    .line 13
    :goto_2
    invoke-direct {p0, v2}, Lcom/example/analytics_sdk/ClientIdentifierResolver;->isValid(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    return-object v2

    :catchall_0
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    return-object v2
.end method
