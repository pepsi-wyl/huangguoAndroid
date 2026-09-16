.class final enum Lio/flutter/view/AccessibilityBridge$Flag;
.super Ljava/lang/Enum;
.source "AccessibilityBridge.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/view/AccessibilityBridge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "Flag"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/flutter/view/AccessibilityBridge$Flag;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/flutter/view/AccessibilityBridge$Flag;

.field public static final enum HAS_CHECKED_STATE:Lio/flutter/view/AccessibilityBridge$Flag;

.field public static final enum HAS_ENABLED_STATE:Lio/flutter/view/AccessibilityBridge$Flag;

.field public static final enum HAS_EXPANDED_STATE:Lio/flutter/view/AccessibilityBridge$Flag;

.field public static final enum HAS_IMPLICIT_SCROLLING:Lio/flutter/view/AccessibilityBridge$Flag;

.field public static final enum HAS_TOGGLED_STATE:Lio/flutter/view/AccessibilityBridge$Flag;

.field public static final enum IS_BUTTON:Lio/flutter/view/AccessibilityBridge$Flag;

.field public static final enum IS_CHECKED:Lio/flutter/view/AccessibilityBridge$Flag;

.field public static final enum IS_CHECK_STATE_MIXED:Lio/flutter/view/AccessibilityBridge$Flag;

.field public static final enum IS_ENABLED:Lio/flutter/view/AccessibilityBridge$Flag;

.field public static final enum IS_EXPANDED:Lio/flutter/view/AccessibilityBridge$Flag;

.field public static final enum IS_FOCUSABLE:Lio/flutter/view/AccessibilityBridge$Flag;

.field public static final enum IS_FOCUSED:Lio/flutter/view/AccessibilityBridge$Flag;

.field public static final enum IS_HEADER:Lio/flutter/view/AccessibilityBridge$Flag;

.field public static final enum IS_HIDDEN:Lio/flutter/view/AccessibilityBridge$Flag;

.field public static final enum IS_IMAGE:Lio/flutter/view/AccessibilityBridge$Flag;

.field public static final enum IS_IN_MUTUALLY_EXCLUSIVE_GROUP:Lio/flutter/view/AccessibilityBridge$Flag;

.field public static final enum IS_KEYBOARD_KEY:Lio/flutter/view/AccessibilityBridge$Flag;

.field public static final enum IS_LINK:Lio/flutter/view/AccessibilityBridge$Flag;

.field public static final enum IS_LIVE_REGION:Lio/flutter/view/AccessibilityBridge$Flag;

.field public static final enum IS_MULTILINE:Lio/flutter/view/AccessibilityBridge$Flag;

.field public static final enum IS_OBSCURED:Lio/flutter/view/AccessibilityBridge$Flag;

.field public static final enum IS_READ_ONLY:Lio/flutter/view/AccessibilityBridge$Flag;

.field public static final enum IS_SELECTED:Lio/flutter/view/AccessibilityBridge$Flag;

.field public static final enum IS_SLIDER:Lio/flutter/view/AccessibilityBridge$Flag;

.field public static final enum IS_TEXT_FIELD:Lio/flutter/view/AccessibilityBridge$Flag;

.field public static final enum IS_TOGGLED:Lio/flutter/view/AccessibilityBridge$Flag;

.field public static final enum NAMES_ROUTE:Lio/flutter/view/AccessibilityBridge$Flag;

.field public static final enum SCOPES_ROUTE:Lio/flutter/view/AccessibilityBridge$Flag;


# instance fields
.field final value:I


# direct methods
.method private static synthetic $values()[Lio/flutter/view/AccessibilityBridge$Flag;
    .locals 3

    const/16 v0, 0x1c

    .line 2124
    new-array v0, v0, [Lio/flutter/view/AccessibilityBridge$Flag;

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Flag;->HAS_CHECKED_STATE:Lio/flutter/view/AccessibilityBridge$Flag;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Flag;->IS_CHECKED:Lio/flutter/view/AccessibilityBridge$Flag;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Flag;->IS_SELECTED:Lio/flutter/view/AccessibilityBridge$Flag;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Flag;->IS_BUTTON:Lio/flutter/view/AccessibilityBridge$Flag;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Flag;->IS_TEXT_FIELD:Lio/flutter/view/AccessibilityBridge$Flag;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Flag;->IS_FOCUSED:Lio/flutter/view/AccessibilityBridge$Flag;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Flag;->HAS_ENABLED_STATE:Lio/flutter/view/AccessibilityBridge$Flag;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Flag;->IS_ENABLED:Lio/flutter/view/AccessibilityBridge$Flag;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Flag;->IS_IN_MUTUALLY_EXCLUSIVE_GROUP:Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Flag;->IS_HEADER:Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v2, 0x9

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Flag;->IS_OBSCURED:Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v2, 0xa

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Flag;->SCOPES_ROUTE:Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v2, 0xb

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Flag;->NAMES_ROUTE:Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v2, 0xc

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Flag;->IS_HIDDEN:Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v2, 0xd

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Flag;->IS_IMAGE:Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v2, 0xe

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Flag;->IS_LIVE_REGION:Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v2, 0xf

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Flag;->HAS_TOGGLED_STATE:Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v2, 0x10

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Flag;->IS_TOGGLED:Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v2, 0x11

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Flag;->HAS_IMPLICIT_SCROLLING:Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v2, 0x12

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Flag;->IS_MULTILINE:Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v2, 0x13

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Flag;->IS_READ_ONLY:Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v2, 0x14

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Flag;->IS_FOCUSABLE:Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v2, 0x15

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Flag;->IS_LINK:Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v2, 0x16

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Flag;->IS_SLIDER:Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v2, 0x17

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Flag;->IS_KEYBOARD_KEY:Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v2, 0x18

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Flag;->IS_CHECK_STATE_MIXED:Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v2, 0x19

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Flag;->HAS_EXPANDED_STATE:Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v2, 0x1a

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Flag;->IS_EXPANDED:Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v2, 0x1b

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 6

    .line 2125
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Flag;

    const-string v1, "HAS_CHECKED_STATE"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lio/flutter/view/AccessibilityBridge$Flag;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->HAS_CHECKED_STATE:Lio/flutter/view/AccessibilityBridge$Flag;

    .line 2126
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Flag;

    const-string v1, "IS_CHECKED"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v3, v2}, Lio/flutter/view/AccessibilityBridge$Flag;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->IS_CHECKED:Lio/flutter/view/AccessibilityBridge$Flag;

    .line 2127
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Flag;

    const-string v1, "IS_SELECTED"

    const/4 v3, 0x4

    invoke-direct {v0, v1, v2, v3}, Lio/flutter/view/AccessibilityBridge$Flag;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->IS_SELECTED:Lio/flutter/view/AccessibilityBridge$Flag;

    .line 2128
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Flag;

    const-string v1, "IS_BUTTON"

    const/4 v2, 0x3

    const/16 v4, 0x8

    invoke-direct {v0, v1, v2, v4}, Lio/flutter/view/AccessibilityBridge$Flag;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->IS_BUTTON:Lio/flutter/view/AccessibilityBridge$Flag;

    .line 2129
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Flag;

    const-string v1, "IS_TEXT_FIELD"

    const/16 v2, 0x10

    invoke-direct {v0, v1, v3, v2}, Lio/flutter/view/AccessibilityBridge$Flag;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->IS_TEXT_FIELD:Lio/flutter/view/AccessibilityBridge$Flag;

    .line 2130
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Flag;

    const/4 v1, 0x5

    const/16 v3, 0x20

    const-string v5, "IS_FOCUSED"

    invoke-direct {v0, v5, v1, v3}, Lio/flutter/view/AccessibilityBridge$Flag;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->IS_FOCUSED:Lio/flutter/view/AccessibilityBridge$Flag;

    .line 2131
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Flag;

    const/4 v1, 0x6

    const/16 v3, 0x40

    const-string v5, "HAS_ENABLED_STATE"

    invoke-direct {v0, v5, v1, v3}, Lio/flutter/view/AccessibilityBridge$Flag;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->HAS_ENABLED_STATE:Lio/flutter/view/AccessibilityBridge$Flag;

    .line 2132
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Flag;

    const/4 v1, 0x7

    const/16 v3, 0x80

    const-string v5, "IS_ENABLED"

    invoke-direct {v0, v5, v1, v3}, Lio/flutter/view/AccessibilityBridge$Flag;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->IS_ENABLED:Lio/flutter/view/AccessibilityBridge$Flag;

    .line 2133
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Flag;

    const-string v1, "IS_IN_MUTUALLY_EXCLUSIVE_GROUP"

    const/16 v3, 0x100

    invoke-direct {v0, v1, v4, v3}, Lio/flutter/view/AccessibilityBridge$Flag;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->IS_IN_MUTUALLY_EXCLUSIVE_GROUP:Lio/flutter/view/AccessibilityBridge$Flag;

    .line 2134
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v1, 0x9

    const/16 v3, 0x200

    const-string v4, "IS_HEADER"

    invoke-direct {v0, v4, v1, v3}, Lio/flutter/view/AccessibilityBridge$Flag;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->IS_HEADER:Lio/flutter/view/AccessibilityBridge$Flag;

    .line 2135
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v1, 0xa

    const/16 v3, 0x400

    const-string v4, "IS_OBSCURED"

    invoke-direct {v0, v4, v1, v3}, Lio/flutter/view/AccessibilityBridge$Flag;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->IS_OBSCURED:Lio/flutter/view/AccessibilityBridge$Flag;

    .line 2136
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v1, 0xb

    const/16 v3, 0x800

    const-string v4, "SCOPES_ROUTE"

    invoke-direct {v0, v4, v1, v3}, Lio/flutter/view/AccessibilityBridge$Flag;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->SCOPES_ROUTE:Lio/flutter/view/AccessibilityBridge$Flag;

    .line 2137
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v1, 0xc

    const/16 v3, 0x1000

    const-string v4, "NAMES_ROUTE"

    invoke-direct {v0, v4, v1, v3}, Lio/flutter/view/AccessibilityBridge$Flag;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->NAMES_ROUTE:Lio/flutter/view/AccessibilityBridge$Flag;

    .line 2138
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v1, 0xd

    const/16 v3, 0x2000

    const-string v4, "IS_HIDDEN"

    invoke-direct {v0, v4, v1, v3}, Lio/flutter/view/AccessibilityBridge$Flag;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->IS_HIDDEN:Lio/flutter/view/AccessibilityBridge$Flag;

    .line 2139
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v1, 0xe

    const/16 v3, 0x4000

    const-string v4, "IS_IMAGE"

    invoke-direct {v0, v4, v1, v3}, Lio/flutter/view/AccessibilityBridge$Flag;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->IS_IMAGE:Lio/flutter/view/AccessibilityBridge$Flag;

    .line 2140
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v1, 0xf

    const v3, 0x8000

    const-string v4, "IS_LIVE_REGION"

    invoke-direct {v0, v4, v1, v3}, Lio/flutter/view/AccessibilityBridge$Flag;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->IS_LIVE_REGION:Lio/flutter/view/AccessibilityBridge$Flag;

    .line 2141
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Flag;

    const-string v1, "HAS_TOGGLED_STATE"

    const/high16 v3, 0x10000

    invoke-direct {v0, v1, v2, v3}, Lio/flutter/view/AccessibilityBridge$Flag;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->HAS_TOGGLED_STATE:Lio/flutter/view/AccessibilityBridge$Flag;

    .line 2142
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v1, 0x11

    const/high16 v2, 0x20000

    const-string v3, "IS_TOGGLED"

    invoke-direct {v0, v3, v1, v2}, Lio/flutter/view/AccessibilityBridge$Flag;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->IS_TOGGLED:Lio/flutter/view/AccessibilityBridge$Flag;

    .line 2143
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v1, 0x12

    const/high16 v2, 0x40000

    const-string v3, "HAS_IMPLICIT_SCROLLING"

    invoke-direct {v0, v3, v1, v2}, Lio/flutter/view/AccessibilityBridge$Flag;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->HAS_IMPLICIT_SCROLLING:Lio/flutter/view/AccessibilityBridge$Flag;

    .line 2144
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v1, 0x13

    const/high16 v2, 0x80000

    const-string v3, "IS_MULTILINE"

    invoke-direct {v0, v3, v1, v2}, Lio/flutter/view/AccessibilityBridge$Flag;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->IS_MULTILINE:Lio/flutter/view/AccessibilityBridge$Flag;

    .line 2145
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v1, 0x14

    const/high16 v2, 0x100000

    const-string v3, "IS_READ_ONLY"

    invoke-direct {v0, v3, v1, v2}, Lio/flutter/view/AccessibilityBridge$Flag;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->IS_READ_ONLY:Lio/flutter/view/AccessibilityBridge$Flag;

    .line 2146
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v1, 0x15

    const/high16 v2, 0x200000

    const-string v3, "IS_FOCUSABLE"

    invoke-direct {v0, v3, v1, v2}, Lio/flutter/view/AccessibilityBridge$Flag;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->IS_FOCUSABLE:Lio/flutter/view/AccessibilityBridge$Flag;

    .line 2147
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v1, 0x16

    const/high16 v2, 0x400000

    const-string v3, "IS_LINK"

    invoke-direct {v0, v3, v1, v2}, Lio/flutter/view/AccessibilityBridge$Flag;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->IS_LINK:Lio/flutter/view/AccessibilityBridge$Flag;

    .line 2148
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v1, 0x17

    const/high16 v2, 0x800000

    const-string v3, "IS_SLIDER"

    invoke-direct {v0, v3, v1, v2}, Lio/flutter/view/AccessibilityBridge$Flag;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->IS_SLIDER:Lio/flutter/view/AccessibilityBridge$Flag;

    .line 2149
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v1, 0x18

    const/high16 v2, 0x1000000

    const-string v3, "IS_KEYBOARD_KEY"

    invoke-direct {v0, v3, v1, v2}, Lio/flutter/view/AccessibilityBridge$Flag;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->IS_KEYBOARD_KEY:Lio/flutter/view/AccessibilityBridge$Flag;

    .line 2150
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v1, 0x19

    const/high16 v2, 0x2000000

    const-string v3, "IS_CHECK_STATE_MIXED"

    invoke-direct {v0, v3, v1, v2}, Lio/flutter/view/AccessibilityBridge$Flag;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->IS_CHECK_STATE_MIXED:Lio/flutter/view/AccessibilityBridge$Flag;

    .line 2151
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v1, 0x1a

    const/high16 v2, 0x4000000

    const-string v3, "HAS_EXPANDED_STATE"

    invoke-direct {v0, v3, v1, v2}, Lio/flutter/view/AccessibilityBridge$Flag;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->HAS_EXPANDED_STATE:Lio/flutter/view/AccessibilityBridge$Flag;

    .line 2152
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Flag;

    const/16 v1, 0x1b

    const/high16 v2, 0x8000000

    const-string v3, "IS_EXPANDED"

    invoke-direct {v0, v3, v1, v2}, Lio/flutter/view/AccessibilityBridge$Flag;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->IS_EXPANDED:Lio/flutter/view/AccessibilityBridge$Flag;

    .line 2124
    invoke-static {}, Lio/flutter/view/AccessibilityBridge$Flag;->$values()[Lio/flutter/view/AccessibilityBridge$Flag;

    move-result-object v0

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->$VALUES:[Lio/flutter/view/AccessibilityBridge$Flag;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 2156
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2157
    iput p3, p0, Lio/flutter/view/AccessibilityBridge$Flag;->value:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/flutter/view/AccessibilityBridge$Flag;
    .locals 1

    .line 2124
    const-class v0, Lio/flutter/view/AccessibilityBridge$Flag;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/flutter/view/AccessibilityBridge$Flag;

    return-object p0
.end method

.method public static values()[Lio/flutter/view/AccessibilityBridge$Flag;
    .locals 1

    .line 2124
    sget-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->$VALUES:[Lio/flutter/view/AccessibilityBridge$Flag;

    invoke-virtual {v0}, [Lio/flutter/view/AccessibilityBridge$Flag;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/flutter/view/AccessibilityBridge$Flag;

    return-object v0
.end method
