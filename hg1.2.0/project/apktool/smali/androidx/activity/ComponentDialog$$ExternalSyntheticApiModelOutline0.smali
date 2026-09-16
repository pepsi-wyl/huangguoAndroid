.class public final synthetic Landroidx/activity/ComponentDialog$$ExternalSyntheticApiModelOutline0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"


# direct methods
.method public static bridge synthetic m()I
    .locals 1

    .line 0
    invoke-static {}, Landroid/provider/MediaStore;->getPickImagesMaxLimit()I

    move-result v0

    return v0
.end method

.method public static bridge synthetic m(I)I
    .locals 0

    .line 0
    invoke-static {p0}, Landroid/os/ext/SdkExtensions;->getExtensionVersion(I)I

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/app/NotificationChannel;)I
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/app/NotificationChannel;->getImportance()I

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/app/job/JobScheduler;Landroid/app/job/JobInfo;Landroid/app/job/JobWorkItem;)I
    .locals 0

    .line 0
    invoke-virtual {p0, p1, p2}, Landroid/app/job/JobScheduler;->enqueue(Landroid/app/job/JobInfo;Landroid/app/job/JobWorkItem;)I

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/content/Context;Ljava/lang/String;)I
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutInfo;)I
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/content/pm/ShortcutInfo;->getRank()I

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutManager;)I
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/content/pm/ShortcutManager;->getMaxShortcutCountPerActivity()I

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutInfo;)J
    .locals 2

    .line 0
    invoke-virtual {p0}, Landroid/content/pm/ShortcutInfo;->getLastChangedTimestamp()J

    move-result-wide v0

    return-wide v0
.end method

.method public static bridge synthetic m(Landroid/app/Notification$Builder;Ljava/lang/String;)Landroid/app/Notification$Builder;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/app/Notification$Builder;->setChannelId(Ljava/lang/String;)Landroid/app/Notification$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/content/Context;Landroid/app/Notification;)Landroid/app/Notification$Builder;
    .locals 0

    .line 0
    invoke-static {p0, p1}, Landroid/app/Notification$Builder;->recoverBuilder(Landroid/content/Context;Landroid/app/Notification;)Landroid/app/Notification$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/lang/Object;)Landroid/app/Notification$MessagingStyle;
    .locals 0

    .line 0
    check-cast p0, Landroid/app/Notification$MessagingStyle;

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/app/NotificationManager;Ljava/lang/String;)Landroid/app/NotificationChannel;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/app/NotificationManager;->getNotificationChannel(Ljava/lang/String;)Landroid/app/NotificationChannel;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/lang/Object;)Landroid/app/NotificationChannel;
    .locals 0

    .line 0
    check-cast p0, Landroid/app/NotificationChannel;

    return-object p0
.end method

.method public static synthetic m(Ljava/lang/String;Ljava/lang/CharSequence;I)Landroid/app/NotificationChannel;
    .locals 1

    .line 0
    new-instance v0, Landroid/app/NotificationChannel;

    invoke-direct {v0, p0, p1, p2}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    return-object v0
.end method

.method public static bridge synthetic m(Ljava/lang/Object;)Landroid/app/NotificationChannelGroup;
    .locals 0

    .line 0
    check-cast p0, Landroid/app/NotificationChannelGroup;

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/lang/Object;)Landroid/app/Person;
    .locals 0

    .line 0
    check-cast p0, Landroid/app/Person;

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/app/job/JobParameters;)Landroid/app/job/JobWorkItem;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/app/job/JobParameters;->dequeueWork()Landroid/app/job/JobWorkItem;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m(Landroid/content/Intent;)Landroid/app/job/JobWorkItem;
    .locals 1

    .line 0
    new-instance v0, Landroid/app/job/JobWorkItem;

    invoke-direct {v0, p0}, Landroid/app/job/JobWorkItem;-><init>(Landroid/content/Intent;)V

    return-object v0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutInfo;)Landroid/content/ComponentName;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/content/pm/ShortcutInfo;->getActivity()Landroid/content/ComponentName;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/app/job/JobWorkItem;)Landroid/content/Intent;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/app/job/JobWorkItem;->getIntent()Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutManager;Landroid/content/pm/ShortcutInfo;)Landroid/content/Intent;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/content/pm/ShortcutManager;->createShortcutResultIntent(Landroid/content/pm/ShortcutInfo;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutInfo;)Landroid/content/LocusId;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/content/pm/ShortcutInfo;->getLocusId()Landroid/content/LocusId;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m(Landroid/content/Context;Ljava/lang/String;)Landroid/content/pm/ShortcutInfo$Builder;
    .locals 1

    .line 0
    new-instance v0, Landroid/content/pm/ShortcutInfo$Builder;

    invoke-direct {v0, p0, p1}, Landroid/content/pm/ShortcutInfo$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-object v0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutInfo$Builder;I)Landroid/content/pm/ShortcutInfo$Builder;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/content/pm/ShortcutInfo$Builder;->setRank(I)Landroid/content/pm/ShortcutInfo$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutInfo$Builder;Landroid/content/ComponentName;)Landroid/content/pm/ShortcutInfo$Builder;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/content/pm/ShortcutInfo$Builder;->setActivity(Landroid/content/ComponentName;)Landroid/content/pm/ShortcutInfo$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutInfo$Builder;Landroid/content/LocusId;)Landroid/content/pm/ShortcutInfo$Builder;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/content/pm/ShortcutInfo$Builder;->setLocusId(Landroid/content/LocusId;)Landroid/content/pm/ShortcutInfo$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutInfo$Builder;Landroid/graphics/drawable/Icon;)Landroid/content/pm/ShortcutInfo$Builder;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/content/pm/ShortcutInfo$Builder;->setIcon(Landroid/graphics/drawable/Icon;)Landroid/content/pm/ShortcutInfo$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutInfo$Builder;Landroid/os/PersistableBundle;)Landroid/content/pm/ShortcutInfo$Builder;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/content/pm/ShortcutInfo$Builder;->setExtras(Landroid/os/PersistableBundle;)Landroid/content/pm/ShortcutInfo$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutInfo$Builder;Ljava/lang/CharSequence;)Landroid/content/pm/ShortcutInfo$Builder;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/content/pm/ShortcutInfo$Builder;->setShortLabel(Ljava/lang/CharSequence;)Landroid/content/pm/ShortcutInfo$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutInfo$Builder;Ljava/util/Set;)Landroid/content/pm/ShortcutInfo$Builder;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/content/pm/ShortcutInfo$Builder;->setCategories(Ljava/util/Set;)Landroid/content/pm/ShortcutInfo$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutInfo$Builder;Z)Landroid/content/pm/ShortcutInfo$Builder;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/content/pm/ShortcutInfo$Builder;->setLongLived(Z)Landroid/content/pm/ShortcutInfo$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutInfo$Builder;[Landroid/app/Person;)Landroid/content/pm/ShortcutInfo$Builder;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/content/pm/ShortcutInfo$Builder;->setPersons([Landroid/app/Person;)Landroid/content/pm/ShortcutInfo$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutInfo$Builder;[Landroid/content/Intent;)Landroid/content/pm/ShortcutInfo$Builder;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/content/pm/ShortcutInfo$Builder;->setIntents([Landroid/content/Intent;)Landroid/content/pm/ShortcutInfo$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutInfo$Builder;)Landroid/content/pm/ShortcutInfo;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/content/pm/ShortcutInfo$Builder;->build()Landroid/content/pm/ShortcutInfo;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/lang/Object;)Landroid/content/pm/ShortcutInfo;
    .locals 0

    .line 0
    check-cast p0, Landroid/content/pm/ShortcutInfo;

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/lang/Object;)Landroid/content/pm/ShortcutManager;
    .locals 0

    .line 0
    check-cast p0, Landroid/content/pm/ShortcutManager;

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/PackageInfo;)Landroid/content/pm/SigningInfo;
    .locals 0

    .line 0
    iget-object p0, p0, Landroid/content/pm/PackageInfo;->signingInfo:Landroid/content/pm/SigningInfo;

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/lang/Object;)Landroid/graphics/drawable/Icon;
    .locals 0

    .line 0
    check-cast p0, Landroid/graphics/drawable/Icon;

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/media/MediaDescription$Builder;Landroid/net/Uri;)Landroid/media/MediaDescription$Builder;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/media/MediaDescription$Builder;->setMediaUri(Landroid/net/Uri;)Landroid/media/MediaDescription$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/media/session/MediaSession;
    .locals 1

    .line 0
    new-instance v0, Landroid/media/session/MediaSession;

    invoke-direct {v0, p0, p1, p2}, Landroid/media/session/MediaSession;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)V

    return-object v0
.end method

.method public static bridge synthetic m(Landroid/media/session/MediaSession;)Landroid/media/session/MediaSessionManager$RemoteUserInfo;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/media/session/MediaSession;->getCurrentControllerInfo()Landroid/media/session/MediaSessionManager$RemoteUserInfo;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/media/session/PlaybackState$Builder;Landroid/os/Bundle;)Landroid/media/session/PlaybackState$Builder;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/media/session/PlaybackState$Builder;->setExtras(Landroid/os/Bundle;)Landroid/media/session/PlaybackState$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/media/MediaDescription;)Landroid/net/Uri;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/media/MediaDescription;->getMediaUri()Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/media/session/MediaController;)Landroid/os/Bundle;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/media/session/MediaController;->getSessionInfo()Landroid/os/Bundle;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/media/session/PlaybackState;)Landroid/os/Bundle;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/media/session/PlaybackState;->getExtras()Landroid/os/Bundle;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutInfo;)Landroid/os/PersistableBundle;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/content/pm/ShortcutInfo;->getExtras()Landroid/os/PersistableBundle;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutInfo;)Landroid/os/UserHandle;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/content/pm/ShortcutInfo;->getUserHandle()Landroid/os/UserHandle;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroidx/activity/ComponentDialog;)Landroid/window/OnBackInvokedDispatcher;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroidx/activity/ComponentDialog;->getOnBackInvokedDispatcher()Landroid/window/OnBackInvokedDispatcher;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutInfo;)Ljava/lang/CharSequence;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/content/pm/ShortcutInfo;->getShortLabel()Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m()Ljava/lang/Class;
    .locals 1

    .line 0
    const-class v0, Landroid/app/Notification$MessagingStyle;

    return-object v0
.end method

.method public static bridge synthetic m(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutInfo;)Ljava/lang/String;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/content/pm/ShortcutInfo;->getId()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutInfo;)Ljava/util/Set;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/content/pm/ShortcutInfo;->getCategories()Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m()V
    .locals 1

    .line 0
    new-instance v0, Landroid/content/pm/ShortcutInfo$Builder;

    return-void
.end method

.method public static bridge synthetic m(Landroid/app/Notification$CallStyle;Landroid/app/Notification$Builder;)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/app/Notification$CallStyle;->setBuilder(Landroid/app/Notification$Builder;)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/app/NotificationManager;Landroid/app/NotificationChannel;)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/app/job/JobParameters;Landroid/app/job/JobWorkItem;)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/app/job/JobParameters;->completeWork(Landroid/app/job/JobWorkItem;)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutManager;Ljava/util/List;)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/content/pm/ShortcutManager;->enableShortcuts(Ljava/util/List;)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutManager;Ljava/util/List;Ljava/lang/CharSequence;)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1, p2}, Landroid/content/pm/ShortcutManager;->disableShortcuts(Ljava/util/List;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/media/browse/MediaBrowser;Ljava/lang/String;Landroid/media/browse/MediaBrowser$ItemCallback;)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1, p2}, Landroid/media/browse/MediaBrowser;->getItem(Ljava/lang/String;Landroid/media/browse/MediaBrowser$ItemCallback;)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/media/browse/MediaBrowser;Ljava/lang/String;Landroid/media/browse/MediaBrowser$SubscriptionCallback;)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1, p2}, Landroid/media/browse/MediaBrowser;->unsubscribe(Ljava/lang/String;Landroid/media/browse/MediaBrowser$SubscriptionCallback;)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/media/browse/MediaBrowser;Ljava/lang/String;Landroid/os/Bundle;Landroid/media/browse/MediaBrowser$SubscriptionCallback;)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1, p2, p3}, Landroid/media/browse/MediaBrowser;->subscribe(Ljava/lang/String;Landroid/os/Bundle;Landroid/media/browse/MediaBrowser$SubscriptionCallback;)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/media/session/MediaController$TransportControls;)V
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/media/session/MediaController$TransportControls;->prepare()V

    return-void
.end method

.method public static bridge synthetic m(Landroid/media/session/MediaController$TransportControls;F)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/media/session/MediaController$TransportControls;->setPlaybackSpeed(F)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/media/session/MediaController$TransportControls;Landroid/net/Uri;Landroid/os/Bundle;)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1, p2}, Landroid/media/session/MediaController$TransportControls;->playFromUri(Landroid/net/Uri;Landroid/os/Bundle;)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/media/session/MediaController$TransportControls;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1, p2}, Landroid/media/session/MediaController$TransportControls;->prepareFromMediaId(Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/media/session/MediaSession;I)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/media/session/MediaSession;->setRatingType(I)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/os/PersistableBundle;Ljava/lang/String;Z)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1, p2}, Landroid/os/PersistableBundle;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/view/Window;Z)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/view/Window;->setStatusBarContrastEnforced(Z)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/view/WindowManager$LayoutParams;I)V
    .locals 0

    .line 0
    iput p1, p0, Landroid/view/WindowManager$LayoutParams;->layoutInDisplayCutoutMode:I

    return-void
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutInfo;)Z
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/content/pm/ShortcutInfo;->isCached()Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutManager;)Z
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/content/pm/ShortcutManager;->isRateLimitingActive()Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutManager;Landroid/content/pm/ShortcutInfo;Landroid/content/IntentSender;)Z
    .locals 0

    .line 0
    invoke-virtual {p0, p1, p2}, Landroid/content/pm/ShortcutManager;->requestPinShortcut(Landroid/content/pm/ShortcutInfo;Landroid/content/IntentSender;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutManager;Ljava/util/List;)Z
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/content/pm/ShortcutManager;->setDynamicShortcuts(Ljava/util/List;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/os/PersistableBundle;Ljava/lang/String;)Z
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/os/PersistableBundle;->getBoolean(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Ljava/lang/Object;)Z
    .locals 0

    .line 0
    instance-of p0, p0, Landroid/graphics/drawable/Icon;

    return p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutInfo;)[Landroid/content/Intent;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/content/pm/ShortcutInfo;->getIntents()[Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/app/NotificationManager;)[Landroid/service/notification/StatusBarNotification;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/app/NotificationManager;->getActiveNotifications()[Landroid/service/notification/StatusBarNotification;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m$1(Landroid/content/pm/ShortcutInfo;)I
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/content/pm/ShortcutInfo;->getDisabledReason()I

    move-result p0

    return p0
.end method

.method public static bridge synthetic m$1(Landroid/content/pm/ShortcutManager;)I
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/content/pm/ShortcutManager;->getIconMaxHeight()I

    move-result p0

    return p0
.end method

.method public static bridge synthetic m$1(Landroid/content/pm/ShortcutInfo$Builder;Ljava/lang/CharSequence;)Landroid/content/pm/ShortcutInfo$Builder;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/content/pm/ShortcutInfo$Builder;->setLongLabel(Ljava/lang/CharSequence;)Landroid/content/pm/ShortcutInfo$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m$1(Landroid/content/pm/ShortcutInfo;)Ljava/lang/CharSequence;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/content/pm/ShortcutInfo;->getLongLabel()Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m$1()Ljava/lang/Class;
    .locals 1

    .line 0
    const-class v0, Landroid/app/Notification$DecoratedCustomViewStyle;

    return-object v0
.end method

.method public static bridge synthetic m$1(Landroid/content/pm/ShortcutInfo;)Ljava/lang/String;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/content/pm/ShortcutInfo;->getPackage()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m$1(Landroid/content/pm/ShortcutManager;Ljava/util/List;)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/content/pm/ShortcutManager;->removeDynamicShortcuts(Ljava/util/List;)V

    return-void
.end method

.method public static bridge synthetic m$1(Landroid/media/session/MediaController$TransportControls;Landroid/net/Uri;Landroid/os/Bundle;)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1, p2}, Landroid/media/session/MediaController$TransportControls;->prepareFromUri(Landroid/net/Uri;Landroid/os/Bundle;)V

    return-void
.end method

.method public static bridge synthetic m$1(Landroid/media/session/MediaController$TransportControls;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1, p2}, Landroid/media/session/MediaController$TransportControls;->prepareFromSearch(Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method public static bridge synthetic m$1(Landroid/view/Window;Z)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/view/Window;->setNavigationBarContrastEnforced(Z)V

    return-void
.end method

.method public static bridge synthetic m$1(Landroid/content/pm/ShortcutInfo;)Z
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/content/pm/ShortcutInfo;->isDynamic()Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m$2(Landroid/content/pm/ShortcutManager;)I
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/content/pm/ShortcutManager;->getIconMaxWidth()I

    move-result p0

    return p0
.end method

.method public static bridge synthetic m$2(Landroid/content/pm/ShortcutInfo$Builder;Ljava/lang/CharSequence;)Landroid/content/pm/ShortcutInfo$Builder;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/content/pm/ShortcutInfo$Builder;->setDisabledMessage(Ljava/lang/CharSequence;)Landroid/content/pm/ShortcutInfo$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m$2(Landroid/content/pm/ShortcutInfo;)Ljava/lang/CharSequence;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/content/pm/ShortcutInfo;->getDisabledMessage()Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m$2()Ljava/lang/Class;
    .locals 1

    .line 0
    const-class v0, Landroid/telephony/SubscriptionManager;

    return-object v0
.end method

.method public static bridge synthetic m$2(Landroid/content/pm/ShortcutManager;Ljava/util/List;)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/content/pm/ShortcutManager;->removeLongLivedShortcuts(Ljava/util/List;)V

    return-void
.end method

.method public static bridge synthetic m$2(Landroid/content/pm/ShortcutInfo;)Z
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/content/pm/ShortcutInfo;->isPinned()Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m$3()Ljava/lang/Class;
    .locals 1

    .line 0
    const-class v0, Landroid/content/pm/ShortcutManager;

    return-object v0
.end method

.method public static bridge synthetic m$3(Landroid/content/pm/ShortcutInfo;)Z
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/content/pm/ShortcutInfo;->isDeclaredInManifest()Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m$4(Landroid/content/pm/ShortcutInfo;)Z
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/content/pm/ShortcutInfo;->isImmutable()Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m$5(Landroid/content/pm/ShortcutInfo;)Z
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/content/pm/ShortcutInfo;->isEnabled()Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m$6(Landroid/content/pm/ShortcutInfo;)Z
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/content/pm/ShortcutInfo;->hasKeyFieldsOnly()Z

    move-result p0

    return p0
.end method
