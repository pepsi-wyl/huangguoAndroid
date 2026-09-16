.class public final Lio/flutter/plugins/imagepicker/Messages$GeneralOptions;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/imagepicker/Messages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "GeneralOptions"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/imagepicker/Messages$GeneralOptions$Builder;
    }
.end annotation


# instance fields
.field private allowMultiple:Ljava/lang/Boolean;

.field private limit:Ljava/lang/Long;

.field private usePhotoPicker:Ljava/lang/Boolean;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 139
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/imagepicker/Messages$GeneralOptions;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)",
            "Lio/flutter/plugins/imagepicker/Messages$GeneralOptions;"
        }
    .end annotation

    .line 186
    new-instance v0, Lio/flutter/plugins/imagepicker/Messages$GeneralOptions;

    invoke-direct {v0}, Lio/flutter/plugins/imagepicker/Messages$GeneralOptions;-><init>()V

    const/4 v1, 0x0

    .line 187
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 188
    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/imagepicker/Messages$GeneralOptions;->setAllowMultiple(Ljava/lang/Boolean;)V

    const/4 v1, 0x1

    .line 189
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 190
    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/imagepicker/Messages$GeneralOptions;->setUsePhotoPicker(Ljava/lang/Boolean;)V

    const/4 v1, 0x2

    .line 191
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_1

    .line 193
    :cond_0
    instance-of v1, p0, Ljava/lang/Integer;

    if-eqz v1, :cond_1

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    int-to-long v1, p0

    goto :goto_0

    :cond_1
    check-cast p0, Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    :goto_0
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    .line 192
    :goto_1
    invoke-virtual {v0, p0}, Lio/flutter/plugins/imagepicker/Messages$GeneralOptions;->setLimit(Ljava/lang/Long;)V

    return-object v0
.end method


# virtual methods
.method public getAllowMultiple()Ljava/lang/Boolean;
    .locals 1

    .line 105
    iget-object v0, p0, Lio/flutter/plugins/imagepicker/Messages$GeneralOptions;->allowMultiple:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getLimit()Ljava/lang/Long;
    .locals 1

    .line 131
    iget-object v0, p0, Lio/flutter/plugins/imagepicker/Messages$GeneralOptions;->limit:Ljava/lang/Long;

    return-object v0
.end method

.method public getUsePhotoPicker()Ljava/lang/Boolean;
    .locals 1

    .line 118
    iget-object v0, p0, Lio/flutter/plugins/imagepicker/Messages$GeneralOptions;->usePhotoPicker:Ljava/lang/Boolean;

    return-object v0
.end method

.method public setAllowMultiple(Ljava/lang/Boolean;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 112
    iput-object p1, p0, Lio/flutter/plugins/imagepicker/Messages$GeneralOptions;->allowMultiple:Ljava/lang/Boolean;

    return-void

    .line 110
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"allowMultiple\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setLimit(Ljava/lang/Long;)V
    .locals 0

    .line 135
    iput-object p1, p0, Lio/flutter/plugins/imagepicker/Messages$GeneralOptions;->limit:Ljava/lang/Long;

    return-void
.end method

.method public setUsePhotoPicker(Ljava/lang/Boolean;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 125
    iput-object p1, p0, Lio/flutter/plugins/imagepicker/Messages$GeneralOptions;->usePhotoPicker:Ljava/lang/Boolean;

    return-void

    .line 123
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"usePhotoPicker\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method toList()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 178
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 179
    iget-object v1, p0, Lio/flutter/plugins/imagepicker/Messages$GeneralOptions;->allowMultiple:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 180
    iget-object v1, p0, Lio/flutter/plugins/imagepicker/Messages$GeneralOptions;->usePhotoPicker:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 181
    iget-object v1, p0, Lio/flutter/plugins/imagepicker/Messages$GeneralOptions;->limit:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
