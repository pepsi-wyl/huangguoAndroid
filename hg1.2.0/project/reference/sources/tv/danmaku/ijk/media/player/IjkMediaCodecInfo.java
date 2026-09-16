package tv.danmaku.ijk.media.player;

import android.media.MediaCodecInfo;
import android.text.TextUtils;
import android.util.Log;
import androidx.exifinterface.media.ExifInterface;
import androidx.media3.exoplayer.rtsp.SessionDescription;
import androidx.media3.extractor.metadata.icy.IcyHeaders;
import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;

/* loaded from: classes2.dex */
public class IjkMediaCodecInfo {
    public static final int RANK_ACCEPTABLE = 700;
    public static final int RANK_LAST_CHANCE = 600;
    public static final int RANK_MAX = 1000;
    public static final int RANK_NON_STANDARD = 100;
    public static final int RANK_NO_SENSE = 0;
    public static final int RANK_SECURE = 300;
    public static final int RANK_SOFTWARE = 200;
    public static final int RANK_TESTED = 800;
    private static final String TAG = "IjkMediaCodecInfo";
    private static Map<String, Integer> sKnownCodecList;
    public MediaCodecInfo mCodecInfo;
    public String mMimeType;
    public int mRank = 0;

    private static synchronized Map<String, Integer> getKnownCodecList() {
        Map<String, Integer> map = sKnownCodecList;
        if (map != null) {
            return map;
        }
        TreeMap treeMap = new TreeMap(String.CASE_INSENSITIVE_ORDER);
        sKnownCodecList = treeMap;
        treeMap.put("OMX.Nvidia.h264.decode", 800);
        sKnownCodecList.put("OMX.Nvidia.h264.decode.secure", Integer.valueOf(RANK_SECURE));
        sKnownCodecList.put("OMX.Intel.hw_vd.h264", Integer.valueOf(IMediaPlayer.MEDIA_INFO_NOT_SEEKABLE));
        sKnownCodecList.put("OMX.Intel.VideoDecoder.AVC", 800);
        sKnownCodecList.put("OMX.qcom.video.decoder.avc", 800);
        sKnownCodecList.put("OMX.ittiam.video.decoder.avc", 0);
        sKnownCodecList.put("OMX.SEC.avc.dec", 800);
        sKnownCodecList.put("OMX.SEC.AVC.Decoder", 799);
        sKnownCodecList.put("OMX.SEC.avcdec", 798);
        sKnownCodecList.put("OMX.SEC.avc.sw.dec", 200);
        sKnownCodecList.put("OMX.Exynos.avc.dec", 800);
        sKnownCodecList.put("OMX.Exynos.AVC.Decoder", 799);
        sKnownCodecList.put("OMX.k3.video.decoder.avc", 800);
        sKnownCodecList.put("OMX.IMG.MSVDX.Decoder.AVC", 800);
        sKnownCodecList.put("OMX.TI.DUCATI1.VIDEO.DECODER", 800);
        sKnownCodecList.put("OMX.rk.video_decoder.avc", 800);
        sKnownCodecList.put("OMX.amlogic.avc.decoder.awesome", 800);
        sKnownCodecList.put("OMX.MARVELL.VIDEO.HW.CODA7542DECODER", 800);
        sKnownCodecList.put("OMX.MARVELL.VIDEO.H264DECODER", 200);
        sKnownCodecList.remove("OMX.Action.Video.Decoder");
        sKnownCodecList.remove("OMX.allwinner.video.decoder.avc");
        sKnownCodecList.remove("OMX.BRCM.vc4.decoder.avc");
        sKnownCodecList.remove("OMX.brcm.video.h264.hw.decoder");
        sKnownCodecList.remove("OMX.brcm.video.h264.decoder");
        sKnownCodecList.remove("OMX.cosmo.video.decoder.avc");
        sKnownCodecList.remove("OMX.duos.h264.decoder");
        sKnownCodecList.remove("OMX.hantro.81x0.video.decoder");
        sKnownCodecList.remove("OMX.hantro.G1.video.decoder");
        sKnownCodecList.remove("OMX.hisi.video.decoder");
        sKnownCodecList.remove("OMX.LG.decoder.video.avc");
        sKnownCodecList.remove("OMX.MS.AVC.Decoder");
        sKnownCodecList.remove("OMX.RENESAS.VIDEO.DECODER.H264");
        sKnownCodecList.remove("OMX.RTK.video.decoder");
        sKnownCodecList.remove("OMX.sprd.h264.decoder");
        sKnownCodecList.remove("OMX.ST.VFM.H264Dec");
        sKnownCodecList.remove("OMX.vpu.video_decoder.avc");
        sKnownCodecList.remove("OMX.WMT.decoder.avc");
        sKnownCodecList.remove("OMX.bluestacks.hw.decoder");
        sKnownCodecList.put("OMX.google.h264.decoder", 200);
        sKnownCodecList.put("OMX.google.h264.lc.decoder", 200);
        sKnownCodecList.put("OMX.k3.ffmpeg.decoder", 200);
        sKnownCodecList.put("OMX.ffmpeg.video.decoder", 200);
        sKnownCodecList.put("OMX.sprd.soft.h264.decoder", 200);
        return sKnownCodecList;
    }

    public static IjkMediaCodecInfo setupCandidate(MediaCodecInfo mediaCodecInfo, String str) {
        int iIntValue;
        if (mediaCodecInfo == null) {
            return null;
        }
        String name = mediaCodecInfo.getName();
        if (TextUtils.isEmpty(name)) {
            return null;
        }
        String lowerCase = name.toLowerCase(Locale.US);
        if (!lowerCase.startsWith("omx.")) {
            iIntValue = 100;
        } else if (lowerCase.startsWith("omx.pv") || lowerCase.startsWith("omx.google.") || lowerCase.startsWith("omx.ffmpeg.") || lowerCase.startsWith("omx.k3.ffmpeg.") || lowerCase.startsWith("omx.avcodec.")) {
            iIntValue = 200;
        } else if (lowerCase.startsWith("omx.ittiam.")) {
            iIntValue = 0;
        } else if (lowerCase.startsWith("omx.mtk.")) {
            iIntValue = 800;
        } else {
            Integer num = getKnownCodecList().get(lowerCase);
            if (num != null) {
                iIntValue = num.intValue();
            } else {
                iIntValue = RANK_LAST_CHANCE;
                try {
                    if (mediaCodecInfo.getCapabilitiesForType(str) != null) {
                        iIntValue = 700;
                    }
                } catch (Throwable unused) {
                }
            }
        }
        IjkMediaCodecInfo ijkMediaCodecInfo = new IjkMediaCodecInfo();
        ijkMediaCodecInfo.mCodecInfo = mediaCodecInfo;
        ijkMediaCodecInfo.mRank = iIntValue;
        ijkMediaCodecInfo.mMimeType = str;
        return ijkMediaCodecInfo;
    }

    public void dumpProfileLevels(String str) {
        int iMax;
        int iMax2;
        try {
            MediaCodecInfo.CodecCapabilities capabilitiesForType = this.mCodecInfo.getCapabilitiesForType(str);
            if (capabilitiesForType == null || capabilitiesForType.profileLevels == null) {
                iMax = 0;
                iMax2 = 0;
            } else {
                iMax = 0;
                iMax2 = 0;
                for (MediaCodecInfo.CodecProfileLevel codecProfileLevel : capabilitiesForType.profileLevels) {
                    if (codecProfileLevel != null) {
                        iMax = Math.max(iMax, codecProfileLevel.profile);
                        iMax2 = Math.max(iMax2, codecProfileLevel.level);
                    }
                }
            }
            Log.i(TAG, String.format(Locale.US, "%s", getProfileLevelName(iMax, iMax2)));
        } catch (Throwable unused) {
            Log.i(TAG, "profile-level: exception");
        }
    }

    public static String getProfileLevelName(int i, int i2) {
        return String.format(Locale.US, " %s Profile Level %s (%d,%d)", getProfileName(i), getLevelName(i2), Integer.valueOf(i), Integer.valueOf(i2));
    }

    public static String getProfileName(int i) {
        if (i == 1) {
            return "Baseline";
        }
        if (i == 2) {
            return "Main";
        }
        if (i == 4) {
            return "Extends";
        }
        if (i == 8) {
            return "High";
        }
        if (i == 16) {
            return "High10";
        }
        if (i == 32) {
            return "High422";
        }
        if (i == 64) {
            return "High444";
        }
        return "Unknown";
    }

    public static String getLevelName(int i) {
        if (i == 1) {
            return IcyHeaders.REQUEST_HEADER_ENABLE_METADATA_VALUE;
        }
        if (i == 2) {
            return "1b";
        }
        switch (i) {
            case 4:
                return "11";
            case 8:
                return "12";
            case 16:
                return "13";
            case 32:
                return ExifInterface.GPS_MEASUREMENT_2D;
            case 64:
                return "21";
            case 128:
                return "22";
            case 256:
                return ExifInterface.GPS_MEASUREMENT_3D;
            case 512:
                return "31";
            case 1024:
                return "32";
            case 2048:
                return "4";
            case 4096:
                return "41";
            case 8192:
                return "42";
            case 16384:
                return "5";
            case 32768:
                return "51";
            case 65536:
                return "52";
            default:
                return SessionDescription.SUPPORTED_SDP_VERSION;
        }
    }
}
