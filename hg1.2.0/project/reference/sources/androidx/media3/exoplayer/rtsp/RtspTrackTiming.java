package androidx.media3.exoplayer.rtsp;

import android.net.Uri;
import androidx.media3.common.util.Assertions;
import androidx.media3.common.util.UriUtil;

/* loaded from: classes.dex */
final class RtspTrackTiming {
    public final long rtpTimestamp;
    public final int sequenceNumber;
    public final Uri uri;

    /* JADX WARN: Removed duplicated region for block: B:23:0x0067  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static com.google.common.collect.ImmutableList<androidx.media3.exoplayer.rtsp.RtspTrackTiming> parseTrackTiming(java.lang.String r18, android.net.Uri r19) throws androidx.media3.common.ParserException, java.lang.NumberFormatException {
        /*
            com.google.common.collect.ImmutableList$Builder r0 = new com.google.common.collect.ImmutableList$Builder
            r0.<init>()
            java.lang.String r1 = ","
            r2 = r18
            java.lang.String[] r1 = androidx.media3.common.util.Util.split(r2, r1)
            int r2 = r1.length
            r3 = 0
            r4 = 0
        L10:
            if (r4 >= r2) goto Lc1
            r5 = r1[r4]
            java.lang.String r6 = ";"
            java.lang.String[] r6 = androidx.media3.common.util.Util.split(r5, r6)
            int r7 = r6.length
            r12 = 0
            r13 = 0
            r14 = -1
            r15 = -9223372036854775807(0x8000000000000001, double:-4.9E-324)
        L23:
            if (r12 >= r7) goto L93
            r8 = r6[r12]
            java.lang.String r9 = "="
            java.lang.String[] r9 = androidx.media3.common.util.Util.splitAtFirst(r8, r9)     // Catch: java.lang.Exception -> L8d
            r11 = r9[r3]     // Catch: java.lang.Exception -> L8d
            r3 = 1
            r9 = r9[r3]     // Catch: java.lang.Exception -> L8d
            int r10 = r11.hashCode()     // Catch: java.lang.Exception -> L8d
            r3 = 113759(0x1bc5f, float:1.5941E-40)
            r17 = r1
            r1 = 2
            if (r10 == r3) goto L5d
            r3 = 116079(0x1c56f, float:1.62661E-40)
            if (r10 == r3) goto L53
            r3 = 1524180539(0x5ad9263b, float:3.05610524E16)
            if (r10 == r3) goto L49
            goto L67
        L49:
            java.lang.String r3 = "rtptime"
            boolean r3 = r11.equals(r3)     // Catch: java.lang.Exception -> L8d
            if (r3 == 0) goto L67
            r3 = 2
            goto L68
        L53:
            java.lang.String r3 = "url"
            boolean r3 = r11.equals(r3)     // Catch: java.lang.Exception -> L8d
            if (r3 == 0) goto L67
            r3 = 0
            goto L68
        L5d:
            java.lang.String r3 = "seq"
            boolean r3 = r11.equals(r3)     // Catch: java.lang.Exception -> L8d
            if (r3 == 0) goto L67
            r3 = 1
            goto L68
        L67:
            r3 = -1
        L68:
            if (r3 == 0) goto L81
            r10 = 1
            if (r3 == r10) goto L7a
            if (r3 != r1) goto L74
            long r15 = java.lang.Long.parseLong(r9)     // Catch: java.lang.Exception -> L8d
            goto L7e
        L74:
            r0 = 0
            androidx.media3.common.ParserException r0 = androidx.media3.common.ParserException.createForMalformedManifest(r11, r0)     // Catch: java.lang.Exception -> L8d
            throw r0     // Catch: java.lang.Exception -> L8d
        L7a:
            int r14 = java.lang.Integer.parseInt(r9)     // Catch: java.lang.Exception -> L8d
        L7e:
            r1 = r19
            goto L87
        L81:
            r1 = r19
            android.net.Uri r13 = resolveUri(r9, r1)     // Catch: java.lang.Exception -> L8d
        L87:
            int r12 = r12 + 1
            r1 = r17
            r3 = 0
            goto L23
        L8d:
            r0 = move-exception
            androidx.media3.common.ParserException r0 = androidx.media3.common.ParserException.createForMalformedManifest(r8, r0)
            throw r0
        L93:
            r17 = r1
            r1 = r19
            if (r13 == 0) goto Lbb
            java.lang.String r3 = r13.getScheme()
            if (r3 == 0) goto Lbb
            r3 = -1
            r8 = r15
            if (r14 != r3) goto Lac
            r6 = -9223372036854775807(0x8000000000000001, double:-4.9E-324)
            int r3 = (r8 > r6 ? 1 : (r8 == r6 ? 0 : -1))
            if (r3 == 0) goto Lbb
        Lac:
            androidx.media3.exoplayer.rtsp.RtspTrackTiming r3 = new androidx.media3.exoplayer.rtsp.RtspTrackTiming
            r3.<init>(r8, r14, r13)
            r0.add(r3)
            int r4 = r4 + 1
            r1 = r17
            r3 = 0
            goto L10
        Lbb:
            r0 = 0
            androidx.media3.common.ParserException r0 = androidx.media3.common.ParserException.createForMalformedManifest(r5, r0)
            throw r0
        Lc1:
            com.google.common.collect.ImmutableList r0 = r0.build()
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.media3.exoplayer.rtsp.RtspTrackTiming.parseTrackTiming(java.lang.String, android.net.Uri):com.google.common.collect.ImmutableList");
    }

    static Uri resolveUri(String str, Uri uri) {
        Assertions.checkArgument(((String) Assertions.checkNotNull(uri.getScheme())).equals("rtsp"));
        Uri uri2 = Uri.parse(str);
        if (uri2.isAbsolute()) {
            return uri2;
        }
        Uri uri3 = Uri.parse("rtsp://" + str);
        String string = uri.toString();
        if (((String) Assertions.checkNotNull(uri3.getHost())).equals(uri.getHost())) {
            return uri3;
        }
        if (string.endsWith("/")) {
            return UriUtil.resolveToUri(string, str);
        }
        return UriUtil.resolveToUri(string + "/", str);
    }

    private RtspTrackTiming(long j, int i, Uri uri) {
        this.rtpTimestamp = j;
        this.sequenceNumber = i;
        this.uri = uri;
    }
}
