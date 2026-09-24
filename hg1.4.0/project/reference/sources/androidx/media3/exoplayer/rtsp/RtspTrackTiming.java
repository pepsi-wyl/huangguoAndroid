package androidx.media3.exoplayer.rtsp;

import android.net.Uri;
import androidx.media3.common.C;
import androidx.media3.common.ParserException;
import androidx.media3.common.util.Assertions;
import androidx.media3.common.util.UriUtil;
import androidx.media3.common.util.Util;
import com.google.common.collect.ImmutableList;
import tv.danmaku.ijk.media.player.IjkMediaPlayer;

/* loaded from: classes.dex */
final class RtspTrackTiming {
    public final long rtpTimestamp;
    public final int sequenceNumber;
    public final Uri uri;

    /* JADX WARN: Removed duplicated region for block: B:23:0x0067  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static ImmutableList<RtspTrackTiming> parseTrackTiming(String str, Uri uri) throws ParserException, NumberFormatException {
        char c;
        ImmutableList.Builder builder = new ImmutableList.Builder();
        String[] strArrSplit = Util.split(str, ",");
        int length = strArrSplit.length;
        char c2 = 0;
        int i = 0;
        while (i < length) {
            String str2 = strArrSplit[i];
            String[] strArrSplit2 = Util.split(str2, ";");
            int length2 = strArrSplit2.length;
            int i2 = 0;
            Uri uriResolveUri = null;
            int i3 = -1;
            long j = C.TIME_UNSET;
            while (i2 < length2) {
                String str3 = strArrSplit2[i2];
                try {
                    String[] strArrSplitAtFirst = Util.splitAtFirst(str3, "=");
                    String str4 = strArrSplitAtFirst[c2];
                    String str5 = strArrSplitAtFirst[1];
                    int iHashCode = str4.hashCode();
                    String[] strArr = strArrSplit;
                    if (iHashCode != 113759) {
                        if (iHashCode != 116079) {
                            c = (iHashCode == 1524180539 && str4.equals("rtptime")) ? (char) 2 : (char) 65535;
                        } else if (str4.equals(IjkMediaPlayer.OnNativeInvokeListener.ARG_URL)) {
                            c = 0;
                        }
                    } else if (str4.equals("seq")) {
                        c = 1;
                    }
                    if (c == 0) {
                        uriResolveUri = resolveUri(str5, uri);
                    } else if (c == 1) {
                        i3 = Integer.parseInt(str5);
                    } else if (c == 2) {
                        j = Long.parseLong(str5);
                    } else {
                        throw ParserException.createForMalformedManifest(str4, null);
                    }
                    i2++;
                    strArrSplit = strArr;
                    c2 = 0;
                } catch (Exception e) {
                    throw ParserException.createForMalformedManifest(str3, e);
                }
            }
            String[] strArr2 = strArrSplit;
            if (uriResolveUri != null && uriResolveUri.getScheme() != null) {
                long j2 = j;
                if (i3 != -1 || j2 != C.TIME_UNSET) {
                    builder.add((ImmutableList.Builder) new RtspTrackTiming(j2, i3, uriResolveUri));
                    i++;
                    strArrSplit = strArr2;
                    c2 = 0;
                }
            }
            throw ParserException.createForMalformedManifest(str2, null);
        }
        return builder.build();
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
