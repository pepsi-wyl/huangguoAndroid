package androidx.media3.exoplayer.offline;

import android.app.Notification;
import android.app.PendingIntent;
import android.content.Context;
import androidx.core.app.NotificationCompat;
import androidx.media3.common.util.Util;
import androidx.media3.exoplayer.R;

/* loaded from: classes.dex */
public final class DownloadNotificationHelper {
    private static final int NULL_STRING_ID = 0;
    private final NotificationCompat.Builder notificationBuilder;

    public DownloadNotificationHelper(Context context, String str) {
        this.notificationBuilder = new NotificationCompat.Builder(context.getApplicationContext(), str);
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0028  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0071  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x008b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public android.app.Notification buildProgressNotification(android.content.Context r22, int r23, android.app.PendingIntent r24, java.lang.String r25, java.util.List<androidx.media3.exoplayer.offline.Download> r26, int r27) {
        /*
            r21 = this;
            r0 = 0
            r1 = 0
            r2 = 1
            r3 = 0
            r4 = 0
            r5 = 0
            r6 = 0
            r7 = 0
            r8 = 0
            r9 = 1
        La:
            int r10 = r26.size()
            if (r3 >= r10) goto L4a
            r10 = r26
            java.lang.Object r11 = r10.get(r3)
            androidx.media3.exoplayer.offline.Download r11 = (androidx.media3.exoplayer.offline.Download) r11
            int r12 = r11.state
            if (r12 == 0) goto L46
            r13 = 2
            if (r12 == r13) goto L28
            r13 = 5
            if (r12 == r13) goto L26
            r13 = 7
            if (r12 == r13) goto L28
            goto L47
        L26:
            r7 = 1
            goto L47
        L28:
            float r4 = r11.getPercentDownloaded()
            r12 = -1082130432(0xffffffffbf800000, float:-1.0)
            int r12 = (r4 > r12 ? 1 : (r4 == r12 ? 0 : -1))
            if (r12 == 0) goto L34
            float r0 = r0 + r4
            r9 = 0
        L34:
            long r11 = r11.getBytesDownloaded()
            r13 = 0
            int r4 = (r11 > r13 ? 1 : (r11 == r13 ? 0 : -1))
            if (r4 <= 0) goto L40
            r4 = 1
            goto L41
        L40:
            r4 = 0
        L41:
            r6 = r6 | r4
            int r8 = r8 + 1
            r4 = 1
            goto L47
        L46:
            r5 = 1
        L47:
            int r3 = r3 + 1
            goto La
        L4a:
            if (r4 == 0) goto L51
            int r3 = androidx.media3.exoplayer.R.string.exo_download_downloading
        L4e:
            r15 = r3
            r3 = 1
            goto L6f
        L51:
            if (r5 == 0) goto L68
            if (r27 == 0) goto L68
            r3 = r27 & 2
            if (r3 == 0) goto L5e
            int r3 = androidx.media3.exoplayer.R.string.exo_download_paused_for_wifi
        L5b:
            r15 = r3
            r3 = 0
            goto L6f
        L5e:
            r3 = r27 & 1
            if (r3 == 0) goto L65
            int r3 = androidx.media3.exoplayer.R.string.exo_download_paused_for_network
            goto L5b
        L65:
            int r3 = androidx.media3.exoplayer.R.string.exo_download_paused
            goto L5b
        L68:
            if (r7 == 0) goto L6d
            int r3 = androidx.media3.exoplayer.R.string.exo_download_removing
            goto L4e
        L6d:
            r3 = 1
            r15 = 0
        L6f:
            if (r3 == 0) goto L8b
            r3 = 100
            if (r4 == 0) goto L84
            float r4 = (float) r8
            float r0 = r0 / r4
            int r0 = (int) r0
            if (r9 == 0) goto L7d
            if (r6 == 0) goto L7d
            r1 = 1
        L7d:
            r17 = r0
            r18 = r1
            r16 = 100
            goto L91
        L84:
            r16 = 100
            r17 = 0
            r18 = 1
            goto L91
        L8b:
            r16 = 0
            r17 = 0
            r18 = 0
        L91:
            r19 = 1
            r20 = 0
            r10 = r21
            r11 = r22
            r12 = r23
            r13 = r24
            r14 = r25
            android.app.Notification r0 = r10.buildNotification(r11, r12, r13, r14, r15, r16, r17, r18, r19, r20)
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.media3.exoplayer.offline.DownloadNotificationHelper.buildProgressNotification(android.content.Context, int, android.app.PendingIntent, java.lang.String, java.util.List, int):android.app.Notification");
    }

    public Notification buildDownloadCompletedNotification(Context context, int i, PendingIntent pendingIntent, String str) {
        return buildEndStateNotification(context, i, pendingIntent, str, R.string.exo_download_completed);
    }

    public Notification buildDownloadFailedNotification(Context context, int i, PendingIntent pendingIntent, String str) {
        return buildEndStateNotification(context, i, pendingIntent, str, R.string.exo_download_failed);
    }

    private Notification buildEndStateNotification(Context context, int i, PendingIntent pendingIntent, String str, int i2) {
        return buildNotification(context, i, pendingIntent, str, i2, 0, 0, false, false, true);
    }

    private Notification buildNotification(Context context, int i, PendingIntent pendingIntent, String str, int i2, int i3, int i4, boolean z, boolean z2, boolean z3) {
        this.notificationBuilder.setSmallIcon(i);
        this.notificationBuilder.setContentTitle(i2 == 0 ? null : context.getResources().getString(i2));
        this.notificationBuilder.setContentIntent(pendingIntent);
        this.notificationBuilder.setStyle(str != null ? new NotificationCompat.BigTextStyle().bigText(str) : null);
        this.notificationBuilder.setProgress(i3, i4, z);
        this.notificationBuilder.setOngoing(z2);
        this.notificationBuilder.setShowWhen(z3);
        if (Util.SDK_INT >= 31) {
            Api31.setForegroundServiceBehavior(this.notificationBuilder);
        }
        return this.notificationBuilder.build();
    }

    private static final class Api31 {
        private Api31() {
        }

        public static void setForegroundServiceBehavior(NotificationCompat.Builder builder) {
            builder.setForegroundServiceBehavior(1);
        }
    }
}
