.class Landroidx/browser/customtabs/CustomTabsClient$2$8;
.super Ljava/lang/Object;
.source "CustomTabsClient.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/browser/customtabs/CustomTabsClient$2;->onActivityLayout(IIIIILandroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/browser/customtabs/CustomTabsClient$2;

.field final synthetic val$bottom:I

.field final synthetic val$extras:Landroid/os/Bundle;

.field final synthetic val$left:I

.field final synthetic val$right:I

.field final synthetic val$state:I

.field final synthetic val$top:I


# direct methods
.method constructor <init>(Landroidx/browser/customtabs/CustomTabsClient$2;IIIIILandroid/os/Bundle;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 429
    iput-object p1, p0, Landroidx/browser/customtabs/CustomTabsClient$2$8;->this$1:Landroidx/browser/customtabs/CustomTabsClient$2;

    iput p2, p0, Landroidx/browser/customtabs/CustomTabsClient$2$8;->val$left:I

    iput p3, p0, Landroidx/browser/customtabs/CustomTabsClient$2$8;->val$top:I

    iput p4, p0, Landroidx/browser/customtabs/CustomTabsClient$2$8;->val$right:I

    iput p5, p0, Landroidx/browser/customtabs/CustomTabsClient$2$8;->val$bottom:I

    iput p6, p0, Landroidx/browser/customtabs/CustomTabsClient$2$8;->val$state:I

    iput-object p7, p0, Landroidx/browser/customtabs/CustomTabsClient$2$8;->val$extras:Landroid/os/Bundle;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 432
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsClient$2$8;->this$1:Landroidx/browser/customtabs/CustomTabsClient$2;

    iget-object v1, v0, Landroidx/browser/customtabs/CustomTabsClient$2;->val$callback:Landroidx/browser/customtabs/CustomTabsCallback;

    iget v2, p0, Landroidx/browser/customtabs/CustomTabsClient$2$8;->val$left:I

    iget v3, p0, Landroidx/browser/customtabs/CustomTabsClient$2$8;->val$top:I

    iget v4, p0, Landroidx/browser/customtabs/CustomTabsClient$2$8;->val$right:I

    iget v5, p0, Landroidx/browser/customtabs/CustomTabsClient$2$8;->val$bottom:I

    iget v6, p0, Landroidx/browser/customtabs/CustomTabsClient$2$8;->val$state:I

    iget-object v7, p0, Landroidx/browser/customtabs/CustomTabsClient$2$8;->val$extras:Landroid/os/Bundle;

    invoke-virtual/range {v1 .. v7}, Landroidx/browser/customtabs/CustomTabsCallback;->onActivityLayout(IIIIILandroid/os/Bundle;)V

    return-void
.end method
