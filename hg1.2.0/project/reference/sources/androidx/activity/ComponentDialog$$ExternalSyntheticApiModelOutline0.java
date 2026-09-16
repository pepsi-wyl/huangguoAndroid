package androidx.activity;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationChannelGroup;
import android.app.Person;
import android.app.job.JobWorkItem;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ShortcutInfo;
import android.content.pm.ShortcutManager;
import android.graphics.drawable.Icon;
import android.media.session.MediaSession;
import android.os.Bundle;
import android.telephony.SubscriptionManager;

/* compiled from: D8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class ComponentDialog$$ExternalSyntheticApiModelOutline0 {
    public static /* bridge */ /* synthetic */ Notification.MessagingStyle m(Object obj) {
        return (Notification.MessagingStyle) obj;
    }

    /* renamed from: m, reason: collision with other method in class */
    public static /* bridge */ /* synthetic */ NotificationChannel m7m(Object obj) {
        return (NotificationChannel) obj;
    }

    public static /* synthetic */ NotificationChannel m(String str, CharSequence charSequence, int i) {
        return new NotificationChannel(str, charSequence, i);
    }

    /* renamed from: m, reason: collision with other method in class */
    public static /* bridge */ /* synthetic */ NotificationChannelGroup m8m(Object obj) {
        return (NotificationChannelGroup) obj;
    }

    /* renamed from: m, reason: collision with other method in class */
    public static /* bridge */ /* synthetic */ Person m9m(Object obj) {
        return (Person) obj;
    }

    public static /* synthetic */ JobWorkItem m(Intent intent) {
        return new JobWorkItem(intent);
    }

    /* renamed from: m, reason: collision with other method in class */
    public static /* synthetic */ ShortcutInfo.Builder m12m(Context context, String str) {
        return new ShortcutInfo.Builder(context, str);
    }

    /* renamed from: m, reason: collision with other method in class */
    public static /* bridge */ /* synthetic */ ShortcutInfo m13m(Object obj) {
        return (ShortcutInfo) obj;
    }

    /* renamed from: m, reason: collision with other method in class */
    public static /* bridge */ /* synthetic */ ShortcutManager m14m(Object obj) {
        return (ShortcutManager) obj;
    }

    /* renamed from: m, reason: collision with other method in class */
    public static /* bridge */ /* synthetic */ Icon m15m(Object obj) {
        return (Icon) obj;
    }

    public static /* synthetic */ MediaSession m(Context context, String str, Bundle bundle) {
        return new MediaSession(context, str, bundle);
    }

    /* renamed from: m, reason: collision with other method in class */
    public static /* bridge */ /* synthetic */ Class m19m() {
        return Notification.MessagingStyle.class;
    }

    /* renamed from: m, reason: collision with other method in class */
    public static /* synthetic */ void m22m() {
    }

    /* renamed from: m, reason: collision with other method in class */
    public static /* bridge */ /* synthetic */ boolean m26m(Object obj) {
        return obj instanceof Icon;
    }

    public static /* bridge */ /* synthetic */ Class m$1() {
        return Notification.DecoratedCustomViewStyle.class;
    }

    public static /* bridge */ /* synthetic */ Class m$2() {
        return SubscriptionManager.class;
    }

    public static /* bridge */ /* synthetic */ Class m$3() {
        return ShortcutManager.class;
    }
}
