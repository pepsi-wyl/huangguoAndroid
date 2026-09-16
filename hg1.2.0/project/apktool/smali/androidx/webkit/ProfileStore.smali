.class public interface abstract Landroidx/webkit/ProfileStore;
.super Ljava/lang/Object;
.source "ProfileStore.java"


# virtual methods
.method public abstract deleteProfile(Ljava/lang/String;)Z
.end method

.method public abstract getAllProfileNames()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getOrCreateProfile(Ljava/lang/String;)Landroidx/webkit/Profile;
.end method

.method public abstract getProfile(Ljava/lang/String;)Landroidx/webkit/Profile;
.end method
