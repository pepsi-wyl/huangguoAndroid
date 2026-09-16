.class public interface abstract Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$CookieManagerHostApi;
.super Ljava/lang/Object;
.source "GeneratedAndroidWebView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "CookieManagerHostApi"
.end annotation


# virtual methods
.method public abstract attachInstance(Ljava/lang/Long;)V
.end method

.method public abstract removeAllCookies(Ljava/lang/Long;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Long;",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$Result<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract setAcceptThirdPartyCookies(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;)V
.end method

.method public abstract setCookie(Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;)V
.end method
