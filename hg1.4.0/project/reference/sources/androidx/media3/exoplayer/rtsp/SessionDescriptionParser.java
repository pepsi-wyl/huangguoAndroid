package androidx.media3.exoplayer.rtsp;

import android.net.Uri;
import androidx.media3.common.ParserException;
import androidx.media3.common.util.Assertions;
import androidx.media3.common.util.Log;
import androidx.media3.common.util.Util;
import androidx.media3.exoplayer.rtsp.MediaDescription;
import androidx.media3.exoplayer.rtsp.SessionDescription;
import com.google.common.base.Strings;
import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: classes.dex */
final class SessionDescriptionParser {
    private static final String ATTRIBUTE_TYPE = "a";
    private static final String BANDWIDTH_TYPE = "b";
    private static final String CONNECTION_TYPE = "c";
    private static final String EMAIL_TYPE = "e";
    private static final String INFORMATION_TYPE = "i";
    private static final String KEY_TYPE = "k";
    private static final String MEDIA_TYPE = "m";
    private static final String ORIGIN_TYPE = "o";
    private static final String PHONE_NUMBER_TYPE = "p";
    private static final String REPEAT_TYPE = "r";
    private static final String SESSION_TYPE = "s";
    private static final String TAG = "SDPParser";
    private static final String TIMING_TYPE = "t";
    private static final String URI_TYPE = "u";
    private static final String VERSION_TYPE = "v";
    private static final String ZONE_TYPE = "z";
    private static final Pattern SDP_LINE_PATTERN = Pattern.compile("([a-z])=\\s?(.+)");
    private static final Pattern SDP_LINE_WITH_EMPTY_VALUE_PATTERN = Pattern.compile("^([a-z])=$");
    private static final Pattern ATTRIBUTE_PATTERN = Pattern.compile("([\\x21\\x23-\\x27\\x2a\\x2b\\x2d\\x2e\\x30-\\x39\\x41-\\x5a\\x5e-\\x7e]+)(?::(.*))?");
    private static final Pattern MEDIA_DESCRIPTION_PATTERN = Pattern.compile("(\\S+)\\s(\\S+)\\s(\\S+)\\s(\\S+)");

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code restructure failed: missing block: B:156:0x01f3, code lost:
    
        continue;
     */
    /* JADX WARN: Removed duplicated region for block: B:64:0x0115  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static SessionDescription parse(String str) throws ParserException, NumberFormatException {
        String str2;
        SessionDescription.Builder builder = new SessionDescription.Builder();
        MediaDescription.Builder mediaDescriptionLine = null;
        boolean z = false;
        for (String str3 : RtspMessageUtil.splitRtspMessageBody(str)) {
            if (!"".equals(str3)) {
                Matcher matcher = SDP_LINE_PATTERN.matcher(str3);
                if (!matcher.matches()) {
                    Matcher matcher2 = SDP_LINE_WITH_EMPTY_VALUE_PATTERN.matcher(str3);
                    if (!matcher2.matches() || !Objects.equals(matcher2.group(1), "i")) {
                        throw ParserException.createForMalformedManifest("Malformed SDP line: " + str3, null);
                    }
                } else {
                    String str4 = (String) Assertions.checkNotNull(matcher.group(1));
                    str2 = (String) Assertions.checkNotNull(matcher.group(2));
                    switch (str4) {
                        case "v":
                            if (!SessionDescription.SUPPORTED_SDP_VERSION.equals(str2)) {
                                throw ParserException.createForMalformedManifest(String.format("SDP version %s is not supported.", str2), null);
                            }
                            break;
                        case "o":
                            builder.setOrigin(str2);
                            break;
                        case "s":
                            builder.setSessionName(str2);
                            break;
                        case "i":
                            if (z) {
                                break;
                            } else if (mediaDescriptionLine == null) {
                                builder.setSessionInfo(str2);
                                break;
                            } else {
                                mediaDescriptionLine.setMediaTitle(str2);
                                break;
                            }
                        case "u":
                            builder.setUri(Uri.parse(str2));
                            break;
                        case "e":
                            builder.setEmailAddress(str2);
                            break;
                        case "p":
                            builder.setPhoneNumber(str2);
                            break;
                        case "c":
                            if (z) {
                                break;
                            } else if (mediaDescriptionLine == null) {
                                builder.setConnection(str2);
                                break;
                            } else {
                                mediaDescriptionLine.setConnection(str2);
                                break;
                            }
                        case "b":
                            if (z) {
                                break;
                            } else {
                                String[] strArrSplit = Util.split(str2, ":\\s?");
                                Assertions.checkArgument(strArrSplit.length == 2);
                                int i = Integer.parseInt(strArrSplit[1]);
                                if (mediaDescriptionLine == null) {
                                    builder.setBitrate(i * 1000);
                                    break;
                                } else {
                                    mediaDescriptionLine.setBitrate(i * 1000);
                                    break;
                                }
                            }
                        case "t":
                            builder.setTiming(str2);
                            break;
                        case "k":
                            if (z) {
                                break;
                            } else if (mediaDescriptionLine == null) {
                                builder.setKey(str2);
                                break;
                            } else {
                                mediaDescriptionLine.setKey(str2);
                                break;
                            }
                        case "a":
                            if (!z) {
                                Matcher matcher3 = ATTRIBUTE_PATTERN.matcher(str2);
                                if (!matcher3.matches()) {
                                    throw ParserException.createForMalformedManifest("Malformed Attribute line: " + str3, null);
                                }
                                String str5 = (String) Assertions.checkNotNull(matcher3.group(1));
                                String strNullToEmpty = Strings.nullToEmpty(matcher3.group(2));
                                if (mediaDescriptionLine == null) {
                                    builder.addAttribute(str5, strNullToEmpty);
                                    break;
                                } else {
                                    mediaDescriptionLine.addAttribute(str5, strNullToEmpty);
                                    break;
                                }
                            } else {
                                continue;
                            }
                        case "m":
                            if (mediaDescriptionLine != null) {
                                addMediaDescriptionToSession(builder, mediaDescriptionLine);
                            }
                            mediaDescriptionLine = parseMediaDescriptionLine(str2);
                            if (mediaDescriptionLine == null) {
                                z = true;
                                break;
                            } else {
                                z = false;
                                break;
                            }
                    }
                }
            }
        }
        if (mediaDescriptionLine != null) {
            addMediaDescriptionToSession(builder, mediaDescriptionLine);
        }
        try {
            return builder.build();
        } catch (IllegalArgumentException | IllegalStateException e) {
            throw ParserException.createForMalformedManifest(null, e);
        }
    }

    private static void addMediaDescriptionToSession(SessionDescription.Builder builder, MediaDescription.Builder builder2) throws ParserException {
        try {
            builder.addMediaDescription(builder2.build());
        } catch (IllegalArgumentException | IllegalStateException e) {
            throw ParserException.createForMalformedManifest(null, e);
        }
    }

    private static MediaDescription.Builder parseMediaDescriptionLine(String str) throws ParserException {
        Matcher matcher = MEDIA_DESCRIPTION_PATTERN.matcher(str);
        if (!matcher.matches()) {
            throw ParserException.createForMalformedManifest("Malformed SDP media description line: " + str, null);
        }
        try {
            return new MediaDescription.Builder((String) Assertions.checkNotNull(matcher.group(1)), Integer.parseInt((String) Assertions.checkNotNull(matcher.group(2))), (String) Assertions.checkNotNull(matcher.group(3)), Integer.parseInt((String) Assertions.checkNotNull(matcher.group(4))));
        } catch (NumberFormatException e) {
            Log.w(TAG, "Malformed SDP media description line: " + str, e);
            return null;
        }
    }

    private SessionDescriptionParser() {
    }
}
