.class public Lio/flutter/embedding/android/KeyEmbedderResponder;
.super Ljava/lang/Object;
.source "KeyEmbedderResponder.java"

# interfaces
.implements Lio/flutter/embedding/android/KeyboardManager$Responder;


# static fields
.field private static final TAG:Ljava/lang/String; = "KeyEmbedderResponder"


# instance fields
.field private final characterCombiner:Lio/flutter/embedding/android/KeyboardManager$CharacterCombiner;

.field private final messenger:Lio/flutter/plugin/common/BinaryMessenger;

.field private final pressingRecords:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private final togglingGoals:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Long;",
            "Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/flutter/plugin/common/BinaryMessenger;)V
    .locals 6

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/android/KeyEmbedderResponder;->pressingRecords:Ljava/util/HashMap;

    .line 53
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/android/KeyEmbedderResponder;->togglingGoals:Ljava/util/HashMap;

    .line 55
    new-instance v0, Lio/flutter/embedding/android/KeyboardManager$CharacterCombiner;

    invoke-direct {v0}, Lio/flutter/embedding/android/KeyboardManager$CharacterCombiner;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/android/KeyEmbedderResponder;->characterCombiner:Lio/flutter/embedding/android/KeyboardManager$CharacterCombiner;

    .line 60
    iput-object p1, p0, Lio/flutter/embedding/android/KeyEmbedderResponder;->messenger:Lio/flutter/plugin/common/BinaryMessenger;

    .line 61
    invoke-static {}, Lio/flutter/embedding/android/KeyboardMap;->getTogglingGoals()[Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;

    move-result-object p1

    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    .line 62
    iget-object v3, p0, Lio/flutter/embedding/android/KeyEmbedderResponder;->togglingGoals:Ljava/util/HashMap;

    iget-wide v4, v2, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;->logicalKey:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v3, v4, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private static getEventType(Landroid/view/KeyEvent;)Lio/flutter/embedding/android/KeyData$Type;
    .locals 2

    .line 31
    invoke-virtual {p0}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    const/4 v1, 0x1

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 32
    :goto_0
    invoke-virtual {p0}, Landroid/view/KeyEvent;->getAction()I

    move-result p0

    if-eqz p0, :cond_2

    if-ne p0, v1, :cond_1

    .line 36
    sget-object p0, Lio/flutter/embedding/android/KeyData$Type;->kUp:Lio/flutter/embedding/android/KeyData$Type;

    return-object p0

    .line 38
    :cond_1
    new-instance p0, Ljava/lang/AssertionError;

    const-string v0, "Unexpected event type"

    invoke-direct {p0, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p0

    :cond_2
    if-eqz v0, :cond_3

    .line 34
    sget-object p0, Lio/flutter/embedding/android/KeyData$Type;->kRepeat:Lio/flutter/embedding/android/KeyData$Type;

    goto :goto_1

    :cond_3
    sget-object p0, Lio/flutter/embedding/android/KeyData$Type;->kDown:Lio/flutter/embedding/android/KeyData$Type;

    :goto_1
    return-object p0
.end method

.method private getLogicalKey(Landroid/view/KeyEvent;)Ljava/lang/Long;
    .locals 4

    .line 93
    sget-object v0, Lio/flutter/embedding/android/KeyboardMap;->keyCodeToLogical:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    int-to-long v1, v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    if-eqz v0, :cond_0

    return-object v0

    .line 97
    :cond_0
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result p1

    int-to-long v0, p1

    const-wide v2, 0x1100000000L

    invoke-static {v0, v1, v2, v3}, Lio/flutter/embedding/android/KeyEmbedderResponder;->keyOfPlane(JJ)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method

.method private getPhysicalKey(Landroid/view/KeyEvent;)Ljava/lang/Long;
    .locals 7

    .line 75
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getScanCode()I

    move-result v0

    int-to-long v0, v0

    const-wide/16 v2, 0x0

    const-wide v4, 0x1100000000L

    cmp-long v6, v0, v2

    if-nez v6, :cond_0

    .line 80
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result p1

    int-to-long v0, p1

    invoke-static {v0, v1, v4, v5}, Lio/flutter/embedding/android/KeyEmbedderResponder;->keyOfPlane(JJ)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    return-object p1

    .line 82
    :cond_0
    sget-object v2, Lio/flutter/embedding/android/KeyboardMap;->scanCodeToPhysical:Ljava/util/HashMap;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    if-eqz v0, :cond_1

    return-object v0

    .line 86
    :cond_1
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getScanCode()I

    move-result p1

    int-to-long v0, p1

    invoke-static {v0, v1, v4, v5}, Lio/flutter/embedding/android/KeyEmbedderResponder;->keyOfPlane(JJ)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method

.method private handleEventImpl(Landroid/view/KeyEvent;Lio/flutter/embedding/android/KeyboardManager$Responder$OnKeyEventHandledCallback;)Z
    .locals 17

    move-object/from16 v9, p0

    .line 272
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getScanCode()I

    move-result v0

    const/4 v10, 0x0

    if-nez v0, :cond_0

    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    if-nez v0, :cond_0

    return v10

    .line 275
    :cond_0
    invoke-direct/range {p0 .. p1}, Lio/flutter/embedding/android/KeyEmbedderResponder;->getPhysicalKey(Landroid/view/KeyEvent;)Ljava/lang/Long;

    move-result-object v11

    .line 276
    invoke-direct/range {p0 .. p1}, Lio/flutter/embedding/android/KeyEmbedderResponder;->getLogicalKey(Landroid/view/KeyEvent;)Ljava/lang/Long;

    move-result-object v12

    .line 278
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 279
    sget-object v14, Lio/flutter/embedding/android/KeyboardMap;->pressingGoals:[Lio/flutter/embedding/android/KeyboardMap$PressingGoal;

    array-length v15, v14

    const/4 v8, 0x0

    :goto_0
    const/4 v6, 0x1

    if-ge v8, v15, :cond_2

    aget-object v1, v14, v8

    .line 282
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getMetaState()I

    move-result v0

    iget v2, v1, Lio/flutter/embedding/android/KeyboardMap$PressingGoal;->mask:I

    and-int/2addr v0, v2

    if-eqz v0, :cond_1

    const/4 v2, 0x1

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    .line 283
    :goto_1
    invoke-virtual {v12}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    .line 284
    invoke-virtual {v11}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    move-object/from16 v0, p0

    move-object/from16 v7, p1

    move/from16 v16, v8

    move-object v8, v13

    .line 280
    invoke-virtual/range {v0 .. v8}, Lio/flutter/embedding/android/KeyEmbedderResponder;->synchronizePressingKey(Lio/flutter/embedding/android/KeyboardMap$PressingGoal;ZJJLandroid/view/KeyEvent;Ljava/util/ArrayList;)V

    add-int/lit8 v8, v16, 0x1

    goto :goto_0

    .line 289
    :cond_2
    iget-object v0, v9, Lio/flutter/embedding/android/KeyEmbedderResponder;->togglingGoals:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;

    .line 290
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getMetaState()I

    move-result v0

    iget v2, v1, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;->mask:I

    and-int/2addr v0, v2

    if-eqz v0, :cond_3

    const/4 v2, 0x1

    goto :goto_3

    :cond_3
    const/4 v2, 0x0

    :goto_3
    invoke-virtual {v12}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    move-object/from16 v0, p0

    move-object/from16 v5, p1

    invoke-virtual/range {v0 .. v5}, Lio/flutter/embedding/android/KeyEmbedderResponder;->synchronizeTogglingKey(Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;ZJLandroid/view/KeyEvent;)V

    goto :goto_2

    .line 294
    :cond_4
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-eqz v0, :cond_6

    if-eq v0, v6, :cond_5

    return v10

    :cond_5
    const/4 v7, 0x0

    goto :goto_4

    :cond_6
    const/4 v7, 0x1

    .line 307
    :goto_4
    iget-object v0, v9, Lio/flutter/embedding/android/KeyEmbedderResponder;->pressingRecords:Ljava/util/HashMap;

    invoke-virtual {v0, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Ljava/lang/Long;

    const/4 v8, 0x0

    if-eqz v7, :cond_9

    if-nez v2, :cond_7

    .line 310
    sget-object v0, Lio/flutter/embedding/android/KeyData$Type;->kDown:Lio/flutter/embedding/android/KeyData$Type;

    goto :goto_5

    .line 314
    :cond_7
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-lez v0, :cond_8

    .line 315
    sget-object v0, Lio/flutter/embedding/android/KeyData$Type;->kRepeat:Lio/flutter/embedding/android/KeyData$Type;

    goto :goto_5

    :cond_8
    const/4 v1, 0x0

    .line 317
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v4

    move-object/from16 v0, p0

    move-object v3, v11

    invoke-direct/range {v0 .. v5}, Lio/flutter/embedding/android/KeyEmbedderResponder;->synthesizeEvent(ZLjava/lang/Long;Ljava/lang/Long;J)V

    .line 318
    sget-object v0, Lio/flutter/embedding/android/KeyData$Type;->kDown:Lio/flutter/embedding/android/KeyData$Type;

    .line 321
    :goto_5
    iget-object v1, v9, Lio/flutter/embedding/android/KeyEmbedderResponder;->characterCombiner:Lio/flutter/embedding/android/KeyboardManager$CharacterCombiner;

    .line 322
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getUnicodeChar()I

    move-result v2

    invoke-virtual {v1, v2}, Lio/flutter/embedding/android/KeyboardManager$CharacterCombiner;->applyCombiningCharacterToBaseCharacter(I)Ljava/lang/Character;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Character;->charValue()C

    move-result v1

    if-eqz v1, :cond_b

    .line 324
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, ""

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_6

    :cond_9
    if-nez v2, :cond_a

    return v10

    .line 331
    :cond_a
    sget-object v0, Lio/flutter/embedding/android/KeyData$Type;->kUp:Lio/flutter/embedding/android/KeyData$Type;

    :cond_b
    move-object v1, v8

    .line 335
    :goto_6
    sget-object v2, Lio/flutter/embedding/android/KeyData$Type;->kRepeat:Lio/flutter/embedding/android/KeyData$Type;

    if-eq v0, v2, :cond_d

    if-eqz v7, :cond_c

    move-object v8, v12

    .line 336
    :cond_c
    invoke-virtual {v9, v11, v8}, Lio/flutter/embedding/android/KeyEmbedderResponder;->updatePressingState(Ljava/lang/Long;Ljava/lang/Long;)V

    .line 338
    :cond_d
    sget-object v2, Lio/flutter/embedding/android/KeyData$Type;->kDown:Lio/flutter/embedding/android/KeyData$Type;

    if-ne v0, v2, :cond_e

    .line 339
    iget-object v2, v9, Lio/flutter/embedding/android/KeyEmbedderResponder;->togglingGoals:Ljava/util/HashMap;

    invoke-virtual {v2, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;

    if-eqz v2, :cond_e

    .line 341
    iget-boolean v3, v2, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;->enabled:Z

    xor-int/2addr v3, v6

    iput-boolean v3, v2, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;->enabled:Z

    .line 345
    :cond_e
    new-instance v2, Lio/flutter/embedding/android/KeyData;

    invoke-direct {v2}, Lio/flutter/embedding/android/KeyData;-><init>()V

    .line 347
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getSource()I

    move-result v3

    const/16 v4, 0x201

    if-eq v3, v4, :cond_12

    const/16 v4, 0x401

    if-eq v3, v4, :cond_11

    const v4, 0x1000010

    if-eq v3, v4, :cond_10

    const v4, 0x2000001

    if-eq v3, v4, :cond_f

    .line 350
    sget-object v3, Lio/flutter/embedding/android/KeyData$DeviceType;->kKeyboard:Lio/flutter/embedding/android/KeyData$DeviceType;

    iput-object v3, v2, Lio/flutter/embedding/android/KeyData;->deviceType:Lio/flutter/embedding/android/KeyData$DeviceType;

    goto :goto_7

    .line 362
    :cond_f
    sget-object v3, Lio/flutter/embedding/android/KeyData$DeviceType;->kHdmi:Lio/flutter/embedding/android/KeyData$DeviceType;

    iput-object v3, v2, Lio/flutter/embedding/android/KeyData;->deviceType:Lio/flutter/embedding/android/KeyData$DeviceType;

    goto :goto_7

    .line 359
    :cond_10
    sget-object v3, Lio/flutter/embedding/android/KeyData$DeviceType;->kJoystick:Lio/flutter/embedding/android/KeyData$DeviceType;

    iput-object v3, v2, Lio/flutter/embedding/android/KeyData;->deviceType:Lio/flutter/embedding/android/KeyData$DeviceType;

    goto :goto_7

    .line 356
    :cond_11
    sget-object v3, Lio/flutter/embedding/android/KeyData$DeviceType;->kGamepad:Lio/flutter/embedding/android/KeyData$DeviceType;

    iput-object v3, v2, Lio/flutter/embedding/android/KeyData;->deviceType:Lio/flutter/embedding/android/KeyData$DeviceType;

    goto :goto_7

    .line 353
    :cond_12
    sget-object v3, Lio/flutter/embedding/android/KeyData$DeviceType;->kDirectionalPad:Lio/flutter/embedding/android/KeyData$DeviceType;

    iput-object v3, v2, Lio/flutter/embedding/android/KeyData;->deviceType:Lio/flutter/embedding/android/KeyData$DeviceType;

    .line 366
    :goto_7
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v3

    iput-wide v3, v2, Lio/flutter/embedding/android/KeyData;->timestamp:J

    .line 367
    iput-object v0, v2, Lio/flutter/embedding/android/KeyData;->type:Lio/flutter/embedding/android/KeyData$Type;

    .line 368
    invoke-virtual {v12}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    iput-wide v3, v2, Lio/flutter/embedding/android/KeyData;->logicalKey:J

    .line 369
    invoke-virtual {v11}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    iput-wide v3, v2, Lio/flutter/embedding/android/KeyData;->physicalKey:J

    .line 370
    iput-object v1, v2, Lio/flutter/embedding/android/KeyData;->character:Ljava/lang/String;

    .line 371
    iput-boolean v10, v2, Lio/flutter/embedding/android/KeyData;->synthesized:Z

    .line 372
    sget-object v0, Lio/flutter/embedding/android/KeyData$DeviceType;->kKeyboard:Lio/flutter/embedding/android/KeyData$DeviceType;

    iput-object v0, v2, Lio/flutter/embedding/android/KeyData;->deviceType:Lio/flutter/embedding/android/KeyData$DeviceType;

    move-object/from16 v0, p2

    .line 374
    invoke-direct {v9, v2, v0}, Lio/flutter/embedding/android/KeyEmbedderResponder;->sendKeyEvent(Lio/flutter/embedding/android/KeyData;Lio/flutter/embedding/android/KeyboardManager$Responder$OnKeyEventHandledCallback;)V

    .line 375
    invoke-virtual {v13}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_13

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    .line 376
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    goto :goto_8

    :cond_13
    return v6
.end method

.method private static keyOfPlane(JJ)J
    .locals 2

    const-wide v0, 0xffffffffL

    and-long/2addr p0, v0

    or-long/2addr p0, p2

    return-wide p0
.end method

.method static synthetic lambda$sendKeyEvent$2(Lio/flutter/embedding/android/KeyboardManager$Responder$OnKeyEventHandledCallback;Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v0, 0x0

    .line 401
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    if-eqz p1, :cond_1

    .line 403
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 404
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v2

    if-eqz v2, :cond_2

    .line 405
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result p1

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    :cond_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    goto :goto_0

    .line 408
    :cond_1
    const-string p1, "KeyEmbedderResponder"

    const-string v0, "A null reply was received when sending a key event to the framework."

    invoke-static {p1, v0}, Lio/flutter/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 410
    :cond_2
    :goto_0
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-interface {p0, p1}, Lio/flutter/embedding/android/KeyboardManager$Responder$OnKeyEventHandledCallback;->onKeyEventHandled(Z)V

    return-void
.end method

.method private sendKeyEvent(Lio/flutter/embedding/android/KeyData;Lio/flutter/embedding/android/KeyboardManager$Responder$OnKeyEventHandledCallback;)V
    .locals 2

    if-nez p2, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    .line 400
    :cond_0
    new-instance v0, Lio/flutter/embedding/android/KeyEmbedderResponder$$ExternalSyntheticLambda0;

    invoke-direct {v0, p2}, Lio/flutter/embedding/android/KeyEmbedderResponder$$ExternalSyntheticLambda0;-><init>(Lio/flutter/embedding/android/KeyboardManager$Responder$OnKeyEventHandledCallback;)V

    move-object p2, v0

    .line 413
    :goto_0
    iget-object v0, p0, Lio/flutter/embedding/android/KeyEmbedderResponder;->messenger:Lio/flutter/plugin/common/BinaryMessenger;

    const-string v1, "flutter/keydata"

    invoke-virtual {p1}, Lio/flutter/embedding/android/KeyData;->toBytes()Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-interface {v0, v1, p1, p2}, Lio/flutter/plugin/common/BinaryMessenger;->send(Ljava/lang/String;Ljava/nio/ByteBuffer;Lio/flutter/plugin/common/BinaryMessenger$BinaryReply;)V

    return-void
.end method

.method private synthesizeEvent(ZLjava/lang/Long;Ljava/lang/Long;J)V
    .locals 5

    .line 382
    new-instance v0, Lio/flutter/embedding/android/KeyData;

    invoke-direct {v0}, Lio/flutter/embedding/android/KeyData;-><init>()V

    .line 383
    iput-wide p4, v0, Lio/flutter/embedding/android/KeyData;->timestamp:J

    if-eqz p1, :cond_0

    .line 384
    sget-object p4, Lio/flutter/embedding/android/KeyData$Type;->kDown:Lio/flutter/embedding/android/KeyData$Type;

    goto :goto_0

    :cond_0
    sget-object p4, Lio/flutter/embedding/android/KeyData$Type;->kUp:Lio/flutter/embedding/android/KeyData$Type;

    :goto_0
    iput-object p4, v0, Lio/flutter/embedding/android/KeyData;->type:Lio/flutter/embedding/android/KeyData$Type;

    .line 385
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide p4

    iput-wide p4, v0, Lio/flutter/embedding/android/KeyData;->logicalKey:J

    .line 386
    invoke-virtual {p3}, Ljava/lang/Long;->longValue()J

    move-result-wide p4

    iput-wide p4, v0, Lio/flutter/embedding/android/KeyData;->physicalKey:J

    const/4 p4, 0x0

    .line 387
    iput-object p4, v0, Lio/flutter/embedding/android/KeyData;->character:Ljava/lang/String;

    const/4 p5, 0x1

    .line 388
    iput-boolean p5, v0, Lio/flutter/embedding/android/KeyData;->synthesized:Z

    .line 389
    sget-object p5, Lio/flutter/embedding/android/KeyData$DeviceType;->kKeyboard:Lio/flutter/embedding/android/KeyData$DeviceType;

    iput-object p5, v0, Lio/flutter/embedding/android/KeyData;->deviceType:Lio/flutter/embedding/android/KeyData$DeviceType;

    .line 390
    invoke-virtual {p3}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long p5, v1, v3

    if-eqz p5, :cond_2

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    cmp-long p5, v1, v3

    if-eqz p5, :cond_2

    if-eqz p1, :cond_1

    goto :goto_1

    :cond_1
    move-object p2, p4

    .line 391
    :goto_1
    invoke-virtual {p0, p3, p2}, Lio/flutter/embedding/android/KeyEmbedderResponder;->updatePressingState(Ljava/lang/Long;Ljava/lang/Long;)V

    .line 393
    :cond_2
    invoke-direct {p0, v0, p4}, Lio/flutter/embedding/android/KeyEmbedderResponder;->sendKeyEvent(Lio/flutter/embedding/android/KeyData;Lio/flutter/embedding/android/KeyboardManager$Responder$OnKeyEventHandledCallback;)V

    return-void
.end method


# virtual methods
.method public getPressedState()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 446
    iget-object v0, p0, Lio/flutter/embedding/android/KeyEmbedderResponder;->pressingRecords:Ljava/util/HashMap;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public handleEvent(Landroid/view/KeyEvent;Lio/flutter/embedding/android/KeyboardManager$Responder$OnKeyEventHandledCallback;)V
    .locals 8

    .line 432
    invoke-direct {p0, p1, p2}, Lio/flutter/embedding/android/KeyEmbedderResponder;->handleEventImpl(Landroid/view/KeyEvent;Lio/flutter/embedding/android/KeyboardManager$Responder$OnKeyEventHandledCallback;)Z

    move-result p1

    if-nez p1, :cond_0

    const-wide/16 v0, 0x0

    .line 434
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    const-wide/16 v6, 0x0

    const/4 v3, 0x1

    move-object v2, p0

    invoke-direct/range {v2 .. v7}, Lio/flutter/embedding/android/KeyEmbedderResponder;->synthesizeEvent(ZLjava/lang/Long;Ljava/lang/Long;J)V

    const/4 p1, 0x1

    .line 435
    invoke-interface {p2, p1}, Lio/flutter/embedding/android/KeyboardManager$Responder$OnKeyEventHandledCallback;->onKeyEventHandled(Z)V

    :cond_0
    return-void
.end method

.method synthetic lambda$synchronizePressingKey$0$io-flutter-embedding-android-KeyEmbedderResponder(Lio/flutter/embedding/android/KeyboardMap$KeyPair;JLandroid/view/KeyEvent;)V
    .locals 8

    .line 168
    iget-wide v0, p1, Lio/flutter/embedding/android/KeyboardMap$KeyPair;->logicalKey:J

    .line 169
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {p4}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v6

    const/4 v3, 0x0

    move-object v2, p0

    .line 168
    invoke-direct/range {v2 .. v7}, Lio/flutter/embedding/android/KeyEmbedderResponder;->synthesizeEvent(ZLjava/lang/Long;Ljava/lang/Long;J)V

    return-void
.end method

.method synthetic lambda$synchronizePressingKey$1$io-flutter-embedding-android-KeyEmbedderResponder(Lio/flutter/embedding/android/KeyboardMap$KeyPair;Landroid/view/KeyEvent;)V
    .locals 8

    .line 185
    iget-wide v0, p1, Lio/flutter/embedding/android/KeyboardMap$KeyPair;->logicalKey:J

    .line 186
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    iget-wide v0, p1, Lio/flutter/embedding/android/KeyboardMap$KeyPair;->physicalKey:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v6

    const/4 v3, 0x0

    move-object v2, p0

    .line 185
    invoke-direct/range {v2 .. v7}, Lio/flutter/embedding/android/KeyEmbedderResponder;->synthesizeEvent(ZLjava/lang/Long;Ljava/lang/Long;J)V

    return-void
.end method

.method synchronizePressingKey(Lio/flutter/embedding/android/KeyboardMap$PressingGoal;ZJJLandroid/view/KeyEvent;Ljava/util/ArrayList;)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/embedding/android/KeyboardMap$PressingGoal;",
            "ZJJ",
            "Landroid/view/KeyEvent;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Runnable;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v6, p0

    move-object/from16 v7, p1

    move-object/from16 v8, p8

    .line 152
    iget-object v0, v7, Lio/flutter/embedding/android/KeyboardMap$PressingGoal;->keys:[Lio/flutter/embedding/android/KeyboardMap$KeyPair;

    array-length v0, v0

    new-array v9, v0, [Z

    .line 153
    iget-object v0, v7, Lio/flutter/embedding/android/KeyboardMap$PressingGoal;->keys:[Lio/flutter/embedding/android/KeyboardMap$KeyPair;

    array-length v0, v0

    new-array v10, v0, [Ljava/lang/Boolean;

    const/4 v11, 0x0

    .line 163
    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v12

    const/4 v0, 0x0

    const/4 v13, 0x0

    .line 157
    :goto_0
    iget-object v1, v7, Lio/flutter/embedding/android/KeyboardMap$PressingGoal;->keys:[Lio/flutter/embedding/android/KeyboardMap$KeyPair;

    array-length v1, v1

    const/4 v14, 0x1

    if-ge v13, v1, :cond_8

    .line 158
    iget-object v1, v7, Lio/flutter/embedding/android/KeyboardMap$PressingGoal;->keys:[Lio/flutter/embedding/android/KeyboardMap$KeyPair;

    aget-object v2, v1, v13

    .line 159
    iget-object v1, v6, Lio/flutter/embedding/android/KeyEmbedderResponder;->pressingRecords:Ljava/util/HashMap;

    iget-wide v3, v2, Lio/flutter/embedding/android/KeyboardMap$KeyPair;->physicalKey:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    aput-boolean v1, v9, v13

    .line 160
    iget-wide v3, v2, Lio/flutter/embedding/android/KeyboardMap$KeyPair;->logicalKey:J

    cmp-long v1, v3, p3

    if-nez v1, :cond_5

    .line 161
    sget-object v1, Lio/flutter/embedding/android/KeyEmbedderResponder$1;->$SwitchMap$io$flutter$embedding$android$KeyData$Type:[I

    invoke-static/range {p7 .. p7}, Lio/flutter/embedding/android/KeyEmbedderResponder;->getEventType(Landroid/view/KeyEvent;)Lio/flutter/embedding/android/KeyData$Type;

    move-result-object v3

    invoke-virtual {v3}, Lio/flutter/embedding/android/KeyData$Type;->ordinal()I

    move-result v3

    aget v1, v1, v3

    if-eq v1, v14, :cond_3

    const/4 v3, 0x2

    if-eq v1, v3, :cond_2

    const/4 v3, 0x3

    if-eq v1, v3, :cond_0

    move-object/from16 v15, p7

    goto :goto_4

    :cond_0
    if-nez p2, :cond_1

    .line 183
    new-instance v0, Lio/flutter/embedding/android/KeyEmbedderResponder$$ExternalSyntheticLambda2;

    move-object/from16 v15, p7

    invoke-direct {v0, v6, v2, v15}, Lio/flutter/embedding/android/KeyEmbedderResponder$$ExternalSyntheticLambda2;-><init>(Lio/flutter/embedding/android/KeyEmbedderResponder;Lio/flutter/embedding/android/KeyboardMap$KeyPair;Landroid/view/KeyEvent;)V

    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_1
    move-object/from16 v15, p7

    .line 188
    :goto_1
    aget-boolean v0, v9, v13

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    aput-object v0, v10, v13

    goto :goto_2

    :cond_2
    move-object/from16 v15, p7

    .line 176
    aget-boolean v1, v9, v13

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    aput-object v1, v10, v13

    goto :goto_4

    :cond_3
    move-object/from16 v15, p7

    .line 163
    aput-object v12, v10, v13

    if-nez p2, :cond_4

    .line 166
    new-instance v5, Lio/flutter/embedding/android/KeyEmbedderResponder$$ExternalSyntheticLambda1;

    move-object v0, v5

    move-object/from16 v1, p0

    move-wide/from16 v3, p5

    move-object v11, v5

    move-object/from16 v5, p7

    invoke-direct/range {v0 .. v5}, Lio/flutter/embedding/android/KeyEmbedderResponder$$ExternalSyntheticLambda1;-><init>(Lio/flutter/embedding/android/KeyEmbedderResponder;Lio/flutter/embedding/android/KeyboardMap$KeyPair;JLandroid/view/KeyEvent;)V

    invoke-virtual {v8, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_4
    :goto_2
    const/4 v0, 0x1

    goto :goto_4

    :cond_5
    move-object/from16 v15, p7

    if-nez v0, :cond_7

    .line 193
    aget-boolean v0, v9, v13

    if-eqz v0, :cond_6

    goto :goto_3

    :cond_6
    const/4 v14, 0x0

    :cond_7
    :goto_3
    move v0, v14

    :goto_4
    add-int/lit8 v13, v13, 0x1

    const/4 v11, 0x0

    goto :goto_0

    :cond_8
    move-object/from16 v15, p7

    if-eqz p2, :cond_d

    const/4 v1, 0x0

    .line 200
    :goto_5
    iget-object v2, v7, Lio/flutter/embedding/android/KeyboardMap$PressingGoal;->keys:[Lio/flutter/embedding/android/KeyboardMap$KeyPair;

    array-length v2, v2

    if-ge v1, v2, :cond_b

    .line 201
    aget-object v2, v10, v1

    if-eqz v2, :cond_9

    goto :goto_6

    :cond_9
    if-eqz v0, :cond_a

    .line 205
    aget-boolean v2, v9, v1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    aput-object v2, v10, v1

    goto :goto_6

    .line 207
    :cond_a
    invoke-static {v14}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    aput-object v0, v10, v1

    const/4 v0, 0x1

    :goto_6
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_b
    if-nez v0, :cond_c

    .line 212
    invoke-static {v14}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const/4 v1, 0x0

    aput-object v0, v10, v1

    goto :goto_9

    :cond_c
    const/4 v1, 0x0

    goto :goto_9

    :cond_d
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 215
    :goto_7
    iget-object v2, v7, Lio/flutter/embedding/android/KeyboardMap$PressingGoal;->keys:[Lio/flutter/embedding/android/KeyboardMap$KeyPair;

    array-length v2, v2

    if-ge v0, v2, :cond_f

    .line 216
    aget-object v2, v10, v0

    if-eqz v2, :cond_e

    goto :goto_8

    .line 219
    :cond_e
    aput-object v12, v10, v0

    :goto_8
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    :cond_f
    :goto_9
    const/4 v11, 0x0

    .line 224
    :goto_a
    iget-object v0, v7, Lio/flutter/embedding/android/KeyboardMap$PressingGoal;->keys:[Lio/flutter/embedding/android/KeyboardMap$KeyPair;

    array-length v0, v0

    if-ge v11, v0, :cond_11

    .line 225
    aget-boolean v0, v9, v11

    aget-object v1, v10, v11

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eq v0, v1, :cond_10

    .line 226
    iget-object v0, v7, Lio/flutter/embedding/android/KeyboardMap$PressingGoal;->keys:[Lio/flutter/embedding/android/KeyboardMap$KeyPair;

    aget-object v0, v0, v11

    .line 227
    aget-object v1, v10, v11

    .line 228
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iget-wide v2, v0, Lio/flutter/embedding/android/KeyboardMap$KeyPair;->logicalKey:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    iget-wide v3, v0, Lio/flutter/embedding/android/KeyboardMap$KeyPair;->physicalKey:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual/range {p7 .. p7}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v4

    move-object/from16 v0, p0

    .line 227
    invoke-direct/range {v0 .. v5}, Lio/flutter/embedding/android/KeyEmbedderResponder;->synthesizeEvent(ZLjava/lang/Long;Ljava/lang/Long;J)V

    :cond_10
    add-int/lit8 v11, v11, 0x1

    goto :goto_a

    :cond_11
    return-void
.end method

.method synchronizeTogglingKey(Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;ZJLandroid/view/KeyEvent;)V
    .locals 8

    .line 248
    iget-wide v0, p1, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;->logicalKey:J

    cmp-long v2, v0, p3

    if-nez v2, :cond_0

    return-void

    .line 253
    :cond_0
    iget-boolean p3, p1, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;->enabled:Z

    if-eq p3, p2, :cond_3

    .line 254
    iget-object p2, p0, Lio/flutter/embedding/android/KeyEmbedderResponder;->pressingRecords:Ljava/util/HashMap;

    iget-wide p3, p1, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;->physicalKey:J

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    xor-int/lit8 p2, v1, 0x1

    if-eqz p2, :cond_1

    .line 256
    iget-boolean p3, p1, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;->enabled:Z

    xor-int/lit8 p3, p3, 0x1

    iput-boolean p3, p1, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;->enabled:Z

    .line 258
    :cond_1
    iget-wide p3, p1, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;->logicalKey:J

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    iget-wide p3, p1, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;->physicalKey:J

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {p5}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v6

    move-object v2, p0

    move v3, p2

    invoke-direct/range {v2 .. v7}, Lio/flutter/embedding/android/KeyEmbedderResponder;->synthesizeEvent(ZLjava/lang/Long;Ljava/lang/Long;J)V

    if-nez p2, :cond_2

    .line 260
    iget-boolean p2, p1, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;->enabled:Z

    xor-int/lit8 p2, p2, 0x1

    iput-boolean p2, p1, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;->enabled:Z

    .line 262
    :cond_2
    iget-wide p2, p1, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;->logicalKey:J

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    iget-wide p1, p1, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;->physicalKey:J

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {p5}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v4

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lio/flutter/embedding/android/KeyEmbedderResponder;->synthesizeEvent(ZLjava/lang/Long;Ljava/lang/Long;J)V

    :cond_3
    return-void
.end method

.method updatePressingState(Ljava/lang/Long;Ljava/lang/Long;)V
    .locals 1

    if-eqz p2, :cond_1

    .line 109
    iget-object v0, p0, Lio/flutter/embedding/android/KeyEmbedderResponder;->pressingRecords:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    if-nez p1, :cond_0

    goto :goto_0

    .line 111
    :cond_0
    new-instance p1, Ljava/lang/AssertionError;

    const-string p2, "The key was not empty"

    invoke-direct {p1, p2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1

    .line 114
    :cond_1
    iget-object p2, p0, Lio/flutter/embedding/android/KeyEmbedderResponder;->pressingRecords:Ljava/util/HashMap;

    invoke-virtual {p2, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    if-eqz p1, :cond_2

    :goto_0
    return-void

    .line 116
    :cond_2
    new-instance p1, Ljava/lang/AssertionError;

    const-string p2, "The key was empty"

    invoke-direct {p1, p2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1
.end method
