package com.ryanheise.audio_session;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.media.AudioDeviceCallback;
import android.media.AudioDeviceInfo;
import android.media.AudioManager;
import android.media.MicrophoneInfo;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.Pair;
import android.view.KeyEvent;
import androidx.core.content.ContextCompat;
import androidx.core.view.MotionEventCompat;
import androidx.media.AudioAttributesCompat;
import androidx.media.AudioFocusRequestCompat;
import androidx.media.AudioManagerCompat;
import androidx.media3.extractor.text.ttml.TtmlNode;
import com.example.analytics_sdk.AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.text.Typography;

/* loaded from: classes2.dex */
public class AndroidAudioManager implements MethodChannel.MethodCallHandler {
    private static Singleton singleton;
    MethodChannel channel;
    BinaryMessenger messenger;

    public AndroidAudioManager(Context context, BinaryMessenger binaryMessenger) {
        if (singleton == null) {
            singleton = new Singleton(context);
        }
        this.messenger = binaryMessenger;
        this.channel = new MethodChannel(binaryMessenger, "com.ryanheise.android_audio_manager");
        singleton.add(this);
        this.channel.setMethodCallHandler(this);
    }

    /* JADX WARN: Removed duplicated region for block: B:134:0x0205  */
    @Override // io.flutter.plugin.common.MethodChannel.MethodCallHandler
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        char c;
        try {
            List<?> list = (List) methodCall.arguments;
            String str = methodCall.method;
            switch (str.hashCode()) {
                case -1758921066:
                    if (!str.equals("getCommunicationDevice")) {
                        c = 65535;
                        break;
                    } else {
                        c = 17;
                        break;
                    }
                case -1698305881:
                    if (str.equals("getDevices")) {
                        c = '(';
                        break;
                    }
                    break;
                case -1679670739:
                    if (str.equals("isMicrophoneMute")) {
                        c = 29;
                        break;
                    }
                    break;
                case -1582239800:
                    if (str.equals("getStreamMaxVolume")) {
                        c = '\b';
                        break;
                    }
                    break;
                case -1562927400:
                    if (str.equals("isSpeakerphoneOn")) {
                        c = 20;
                        break;
                    }
                    break;
                case -1524320654:
                    if (str.equals("isHapticPlaybackSupported")) {
                        c = '*';
                        break;
                    }
                    break;
                case -1504647535:
                    if (str.equals("requestAudioFocus")) {
                        c = 0;
                        break;
                    }
                    break;
                case -1413157019:
                    if (str.equals("setMicrophoneMute")) {
                        c = 28;
                        break;
                    }
                    break;
                case -1296413680:
                    if (str.equals("setSpeakerphoneOn")) {
                        c = 19;
                        break;
                    }
                    break;
                case -1285190630:
                    if (str.equals("isBluetoothScoOn")) {
                        c = 27;
                        break;
                    }
                    break;
                case -1197068311:
                    if (str.equals("adjustStreamVolume")) {
                        c = 4;
                        break;
                    }
                    break;
                case -1091382445:
                    if (str.equals("getMicrophones")) {
                        c = ')';
                        break;
                    }
                    break;
                case -1079290158:
                    if (str.equals("setAllowedCapturePolicy")) {
                        c = 21;
                        break;
                    }
                    break;
                case -1018676910:
                    if (str.equals("setBluetoothScoOn")) {
                        c = 26;
                        break;
                    }
                    break;
                case -809761226:
                    if (str.equals("getStreamMinVolume")) {
                        c = '\t';
                        break;
                    }
                    break;
                case -763512583:
                    if (str.equals("loadSoundEffects")) {
                        c = '%';
                        break;
                    }
                    break;
                case -694417919:
                    if (str.equals("isMusicActive")) {
                        c = ' ';
                        break;
                    }
                    break;
                case -580980717:
                    if (str.equals("startBluetoothSco")) {
                        c = 24;
                        break;
                    }
                    break;
                case -445792758:
                    if (str.equals("setCommunicationDevice")) {
                        c = 16;
                        break;
                    }
                    break;
                case -380792370:
                    if (str.equals("getStreamVolumeDb")) {
                        c = 11;
                        break;
                    }
                    break;
                case -75324903:
                    if (str.equals("getMode")) {
                        c = 31;
                        break;
                    }
                    break;
                case 152385829:
                    if (str.equals("dispatchMediaKeyEvent")) {
                        c = 2;
                        break;
                    }
                    break;
                case 160987616:
                    if (str.equals("getParameters")) {
                        c = '#';
                        break;
                    }
                    break;
                case 186762163:
                    if (str.equals("stopBluetoothSco")) {
                        c = 25;
                        break;
                    }
                    break;
                case 276698416:
                    if (str.equals("getStreamVolume")) {
                        c = '\n';
                        break;
                    }
                    break;
                case 469094495:
                    if (str.equals("isBluetoothScoAvailableOffCall")) {
                        c = 23;
                        break;
                    }
                    break;
                case 623794710:
                    if (str.equals("getRingerMode")) {
                        c = 7;
                        break;
                    }
                    break;
                case 935118828:
                    if (str.equals("setParameters")) {
                        c = Typography.quote;
                        break;
                    }
                    break;
                case 954131337:
                    if (str.equals("adjustVolume")) {
                        c = 5;
                        break;
                    }
                    break;
                case 976310915:
                    if (str.equals("isStreamMute")) {
                        c = 14;
                        break;
                    }
                    break;
                case 1084758859:
                    if (str.equals("getProperty")) {
                        c = '\'';
                        break;
                    }
                    break;
                case 1163405254:
                    if (str.equals("getAllowedCapturePolicy")) {
                        c = 22;
                        break;
                    }
                    break;
                case 1187450940:
                    if (str.equals("setStreamVolume")) {
                        c = '\r';
                        break;
                    }
                    break;
                case 1241312831:
                    if (str.equals("clearCommunicationDevice")) {
                        c = 18;
                        break;
                    }
                    break;
                case 1258134830:
                    if (str.equals("adjustSuggestedStreamVolume")) {
                        c = 6;
                        break;
                    }
                    break;
                case 1357290231:
                    if (str.equals("abandonAudioFocus")) {
                        c = 1;
                        break;
                    }
                    break;
                case 1378317714:
                    if (str.equals("unloadSoundEffects")) {
                        c = Typography.amp;
                        break;
                    }
                    break;
                case 1397925922:
                    if (str.equals("setRingerMode")) {
                        c = '\f';
                        break;
                    }
                    break;
                case 1504508844:
                    if (str.equals("playSoundEffect")) {
                        c = Typography.dollar;
                        break;
                    }
                    break;
                case 1570996442:
                    if (str.equals("getAvailableCommunicationDevices")) {
                        c = 15;
                        break;
                    }
                    break;
                case 1984784677:
                    if (str.equals("setMode")) {
                        c = 30;
                        break;
                    }
                    break;
                case 1986792688:
                    if (str.equals("isVolumeFixed")) {
                        c = 3;
                        break;
                    }
                    break;
                case 2093966320:
                    if (str.equals("generateAudioSessionId")) {
                        c = '!';
                        break;
                    }
                    break;
                default:
                    c = 65535;
                    break;
            }
            switch (c) {
                case 0:
                    result.success(Boolean.valueOf(singleton.requestAudioFocus(list)));
                    break;
                case 1:
                    result.success(Boolean.valueOf(singleton.abandonAudioFocus()));
                    break;
                case 2:
                    result.success(singleton.dispatchMediaKeyEvent((Map) list.get(0)));
                    break;
                case 3:
                    result.success(singleton.isVolumeFixed());
                    break;
                case 4:
                    result.success(singleton.adjustStreamVolume(((Integer) list.get(0)).intValue(), ((Integer) list.get(1)).intValue(), ((Integer) list.get(2)).intValue()));
                    break;
                case 5:
                    result.success(singleton.adjustVolume(((Integer) list.get(0)).intValue(), ((Integer) list.get(1)).intValue()));
                    break;
                case 6:
                    result.success(singleton.adjustSuggestedStreamVolume(((Integer) list.get(0)).intValue(), ((Integer) list.get(1)).intValue(), ((Integer) list.get(2)).intValue()));
                    break;
                case 7:
                    result.success(singleton.getRingerMode());
                    break;
                case '\b':
                    result.success(singleton.getStreamMaxVolume(((Integer) list.get(0)).intValue()));
                    break;
                case '\t':
                    result.success(singleton.getStreamMinVolume(((Integer) list.get(0)).intValue()));
                    break;
                case '\n':
                    result.success(singleton.getStreamVolume(((Integer) list.get(0)).intValue()));
                    break;
                case 11:
                    result.success(singleton.getStreamVolumeDb(((Integer) list.get(0)).intValue(), ((Integer) list.get(1)).intValue(), ((Integer) list.get(2)).intValue()));
                    break;
                case '\f':
                    result.success(singleton.setRingerMode(((Integer) list.get(0)).intValue()));
                    break;
                case '\r':
                    result.success(singleton.setStreamVolume(((Integer) list.get(0)).intValue(), ((Integer) list.get(1)).intValue(), ((Integer) list.get(2)).intValue()));
                    break;
                case 14:
                    result.success(singleton.isStreamMute(((Integer) list.get(0)).intValue()));
                    break;
                case 15:
                    result.success(singleton.getAvailableCommunicationDevices());
                    break;
                case 16:
                    result.success(Boolean.valueOf(singleton.setCommunicationDevice((Integer) list.get(0))));
                    break;
                case 17:
                    result.success(singleton.getCommunicationDevice());
                    break;
                case 18:
                    result.success(singleton.clearCommunicationDevice());
                    break;
                case 19:
                    result.success(singleton.setSpeakerphoneOn(((Boolean) list.get(0)).booleanValue()));
                    break;
                case 20:
                    result.success(singleton.isSpeakerphoneOn());
                    break;
                case 21:
                    result.success(singleton.setAllowedCapturePolicy(((Integer) list.get(0)).intValue()));
                    break;
                case 22:
                    result.success(singleton.getAllowedCapturePolicy());
                    break;
                case 23:
                    result.success(singleton.isBluetoothScoAvailableOffCall());
                    break;
                case 24:
                    result.success(singleton.startBluetoothSco());
                    break;
                case 25:
                    result.success(singleton.stopBluetoothSco());
                    break;
                case 26:
                    result.success(singleton.setBluetoothScoOn(((Boolean) list.get(0)).booleanValue()));
                    break;
                case 27:
                    result.success(singleton.isBluetoothScoOn());
                    break;
                case 28:
                    result.success(singleton.setMicrophoneMute(((Boolean) list.get(0)).booleanValue()));
                    break;
                case 29:
                    result.success(singleton.isMicrophoneMute());
                    break;
                case 30:
                    result.success(singleton.setMode(((Integer) list.get(0)).intValue()));
                    break;
                case 31:
                    result.success(singleton.getMode());
                    break;
                case ' ':
                    result.success(singleton.isMusicActive());
                    break;
                case '!':
                    result.success(singleton.generateAudioSessionId());
                    break;
                case '\"':
                    result.success(singleton.setParameters((String) list.get(0)));
                    break;
                case '#':
                    result.success(singleton.getParameters((String) list.get(0)));
                    break;
                case '$':
                    result.success(singleton.playSoundEffect(((Integer) list.get(0)).intValue(), (Double) list.get(1)));
                    break;
                case MotionEventCompat.AXIS_GENERIC_6 /* 37 */:
                    result.success(singleton.loadSoundEffects());
                    break;
                case '&':
                    result.success(singleton.unloadSoundEffects());
                    break;
                case MotionEventCompat.AXIS_GENERIC_8 /* 39 */:
                    result.success(singleton.getProperty((String) list.get(0)));
                    break;
                case MotionEventCompat.AXIS_GENERIC_9 /* 40 */:
                    result.success(singleton.getDevices(((Integer) list.get(0)).intValue()));
                    break;
                case MotionEventCompat.AXIS_GENERIC_10 /* 41 */:
                    result.success(singleton.getMicrophones());
                    break;
                case '*':
                    result.success(singleton.isHapticPlaybackSupported());
                    break;
                default:
                    result.notImplemented();
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.error("Error: " + e, null, null);
        }
    }

    public void dispose() {
        this.channel.setMethodCallHandler(null);
        singleton.remove(this);
        if (singleton.isEmpty()) {
            singleton.dispose();
            singleton = null;
        }
        this.channel = null;
        this.messenger = null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    static class Singleton {
        private Context applicationContext;
        private Object audioDeviceCallback;
        private AudioFocusRequestCompat audioFocusRequest;
        private AudioManager audioManager;
        private BroadcastReceiver noisyReceiver;
        private BroadcastReceiver scoReceiver;
        private final Handler handler = new Handler(Looper.getMainLooper());
        private List<AndroidAudioManager> instances = new ArrayList();
        private List<AudioDeviceInfo> devices = new ArrayList();

        public Singleton(Context context) {
            this.applicationContext = context;
            this.audioManager = (AudioManager) context.getSystemService("audio");
            if (Build.VERSION.SDK_INT >= 23) {
                initAudioDeviceCallback();
            }
        }

        private void initAudioDeviceCallback() {
            AudioDeviceCallback audioDeviceCallback = new AudioDeviceCallback() { // from class: com.ryanheise.audio_session.AndroidAudioManager.Singleton.1
                @Override // android.media.AudioDeviceCallback
                public void onAudioDevicesAdded(AudioDeviceInfo[] audioDeviceInfoArr) {
                    Singleton.this.invokeMethod("onAudioDevicesAdded", AndroidAudioManager.encodeAudioDevices(audioDeviceInfoArr));
                }

                @Override // android.media.AudioDeviceCallback
                public void onAudioDevicesRemoved(AudioDeviceInfo[] audioDeviceInfoArr) {
                    Singleton.this.invokeMethod("onAudioDevicesRemoved", AndroidAudioManager.encodeAudioDevices(audioDeviceInfoArr));
                }
            };
            this.audioDeviceCallback = audioDeviceCallback;
            this.audioManager.registerAudioDeviceCallback(AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0.m((Object) audioDeviceCallback), this.handler);
        }

        public void add(AndroidAudioManager androidAudioManager) {
            this.instances.add(androidAudioManager);
        }

        public void remove(AndroidAudioManager androidAudioManager) {
            this.instances.remove(androidAudioManager);
        }

        public boolean isEmpty() {
            return this.instances.size() == 0;
        }

        public boolean requestAudioFocus(List<?> list) {
            if (this.audioFocusRequest != null) {
                return true;
            }
            Map map = (Map) list.get(0);
            AudioFocusRequestCompat.Builder builder = new AudioFocusRequestCompat.Builder(((Integer) map.get("gainType")).intValue());
            builder.setOnAudioFocusChangeListener(new AudioManager.OnAudioFocusChangeListener() { // from class: com.ryanheise.audio_session.AndroidAudioManager$Singleton$$ExternalSyntheticLambda32
                @Override // android.media.AudioManager.OnAudioFocusChangeListener
                public final void onAudioFocusChange(int i) {
                    this.f$0.m451xe843b57a(i);
                }
            });
            if (map.get("audioAttributes") != null) {
                builder.setAudioAttributes(decodeAudioAttributes((Map) map.get("audioAttributes")));
            }
            if (map.get("willPauseWhenDucked") != null) {
                builder.setWillPauseWhenDucked(((Boolean) map.get("willPauseWhenDucked")).booleanValue());
            }
            AudioFocusRequestCompat audioFocusRequestCompatBuild = builder.build();
            this.audioFocusRequest = audioFocusRequestCompatBuild;
            boolean z = AudioManagerCompat.requestAudioFocus(this.audioManager, audioFocusRequestCompatBuild) == 1;
            if (z) {
                registerNoisyReceiver();
                registerScoReceiver();
            }
            return z;
        }

        /* renamed from: lambda$requestAudioFocus$0$com-ryanheise-audio_session-AndroidAudioManager$Singleton, reason: not valid java name */
        /* synthetic */ void m451xe843b57a(int i) {
            if (i == -1) {
                abandonAudioFocus();
            }
            invokeMethod("onAudioFocusChanged", Integer.valueOf(i));
        }

        public boolean abandonAudioFocus() {
            if (this.applicationContext == null) {
                return false;
            }
            unregisterNoisyReceiver();
            unregisterScoReceiver();
            AudioFocusRequestCompat audioFocusRequestCompat = this.audioFocusRequest;
            if (audioFocusRequestCompat == null) {
                return true;
            }
            int iAbandonAudioFocusRequest = AudioManagerCompat.abandonAudioFocusRequest(this.audioManager, audioFocusRequestCompat);
            this.audioFocusRequest = null;
            return iAbandonAudioFocusRequest == 1;
        }

        public Object dispatchMediaKeyEvent(Map<?, ?> map) {
            this.audioManager.dispatchMediaKeyEvent(new KeyEvent(AndroidAudioManager.getLong(map.get("downTime")).longValue(), AndroidAudioManager.getLong(map.get("eventTime")).longValue(), ((Integer) map.get("action")).intValue(), ((Integer) map.get("keyCode")).intValue(), ((Integer) map.get("repeatCount")).intValue(), ((Integer) map.get("metaState")).intValue(), ((Integer) map.get("deviceId")).intValue(), ((Integer) map.get("scanCode")).intValue(), ((Integer) map.get("flags")).intValue(), ((Integer) map.get("source")).intValue()));
            return null;
        }

        public Object isVolumeFixed() {
            AndroidAudioManager.requireApi(21);
            return Boolean.valueOf(this.audioManager.isVolumeFixed());
        }

        public Object adjustStreamVolume(int i, int i2, int i3) {
            this.audioManager.adjustStreamVolume(i, i2, i3);
            return null;
        }

        public Object adjustVolume(int i, int i2) {
            this.audioManager.adjustVolume(i, i2);
            return null;
        }

        public Object adjustSuggestedStreamVolume(int i, int i2, int i3) {
            this.audioManager.adjustSuggestedStreamVolume(i, i2, i3);
            return null;
        }

        public Object getRingerMode() {
            return Integer.valueOf(this.audioManager.getRingerMode());
        }

        public Object getStreamMaxVolume(int i) {
            return Integer.valueOf(this.audioManager.getStreamMaxVolume(i));
        }

        public Object getStreamMinVolume(int i) {
            AndroidAudioManager.requireApi(28);
            return Integer.valueOf(this.audioManager.getStreamMinVolume(i));
        }

        public Object getStreamVolume(int i) {
            return Integer.valueOf(this.audioManager.getStreamVolume(i));
        }

        public Object getStreamVolumeDb(int i, int i2, int i3) {
            AndroidAudioManager.requireApi(28);
            return Float.valueOf(this.audioManager.getStreamVolumeDb(i, i2, i3));
        }

        public Object setRingerMode(int i) {
            this.audioManager.setRingerMode(i);
            return null;
        }

        public Object setStreamVolume(int i, int i2, int i3) {
            this.audioManager.setStreamVolume(i, i2, i3);
            return null;
        }

        public Object isStreamMute(int i) {
            AndroidAudioManager.requireApi(23);
            return Boolean.valueOf(this.audioManager.isStreamMute(i));
        }

        public List<Map<String, Object>> getAvailableCommunicationDevices() {
            AndroidAudioManager.requireApi(31);
            this.devices = this.audioManager.getAvailableCommunicationDevices();
            ArrayList arrayList = new ArrayList();
            Iterator<AudioDeviceInfo> it = this.devices.iterator();
            while (it.hasNext()) {
                arrayList.add(AndroidAudioManager.encodeAudioDevice(AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0.m374m((Object) it.next())));
            }
            return arrayList;
        }

        public boolean setCommunicationDevice(Integer num) {
            AndroidAudioManager.requireApi(31);
            Iterator<AudioDeviceInfo> it = this.devices.iterator();
            while (it.hasNext()) {
                AudioDeviceInfo audioDeviceInfoM374m = AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0.m374m((Object) it.next());
                if (audioDeviceInfoM374m.getId() == num.intValue()) {
                    return this.audioManager.setCommunicationDevice(audioDeviceInfoM374m);
                }
            }
            return false;
        }

        public Map<String, Object> getCommunicationDevice() {
            AndroidAudioManager.requireApi(31);
            return AndroidAudioManager.encodeAudioDevice(this.audioManager.getCommunicationDevice());
        }

        public Object clearCommunicationDevice() {
            AndroidAudioManager.requireApi(31);
            this.audioManager.clearCommunicationDevice();
            return null;
        }

        public Object setSpeakerphoneOn(boolean z) {
            this.audioManager.setSpeakerphoneOn(z);
            return null;
        }

        public Object isSpeakerphoneOn() {
            return Boolean.valueOf(this.audioManager.isSpeakerphoneOn());
        }

        public Object setAllowedCapturePolicy(int i) {
            AndroidAudioManager.requireApi(29);
            this.audioManager.setAllowedCapturePolicy(i);
            return null;
        }

        public Object getAllowedCapturePolicy() {
            AndroidAudioManager.requireApi(29);
            return Integer.valueOf(this.audioManager.getAllowedCapturePolicy());
        }

        public Object isBluetoothScoAvailableOffCall() {
            return Boolean.valueOf(this.audioManager.isBluetoothScoAvailableOffCall());
        }

        public Object startBluetoothSco() {
            this.audioManager.startBluetoothSco();
            return null;
        }

        public Object stopBluetoothSco() {
            this.audioManager.stopBluetoothSco();
            return null;
        }

        public Object setBluetoothScoOn(boolean z) {
            this.audioManager.setBluetoothScoOn(z);
            return null;
        }

        public Object isBluetoothScoOn() {
            return Boolean.valueOf(this.audioManager.isBluetoothScoOn());
        }

        public Object setMicrophoneMute(boolean z) {
            this.audioManager.setMicrophoneMute(z);
            return null;
        }

        public Object isMicrophoneMute() {
            return Boolean.valueOf(this.audioManager.isMicrophoneMute());
        }

        public Object setMode(int i) {
            this.audioManager.setMode(i);
            return null;
        }

        public Object getMode() {
            return Integer.valueOf(this.audioManager.getMode());
        }

        public Object isMusicActive() {
            return Boolean.valueOf(this.audioManager.isMusicActive());
        }

        public Object generateAudioSessionId() {
            AndroidAudioManager.requireApi(21);
            return Integer.valueOf(this.audioManager.generateAudioSessionId());
        }

        public Object setParameters(String str) {
            this.audioManager.setParameters(str);
            return null;
        }

        public Object getParameters(String str) {
            return this.audioManager.getParameters(str);
        }

        public Object playSoundEffect(int i, Double d) {
            if (d != null) {
                this.audioManager.playSoundEffect(i, (float) d.doubleValue());
                return null;
            }
            this.audioManager.playSoundEffect(i);
            return null;
        }

        public Object loadSoundEffects() {
            this.audioManager.loadSoundEffects();
            return null;
        }

        public Object unloadSoundEffects() {
            this.audioManager.unloadSoundEffects();
            return null;
        }

        public Object getProperty(String str) {
            return this.audioManager.getProperty(str);
        }

        public Object getDevices(int i) {
            AndroidAudioManager.requireApi(23);
            ArrayList arrayList = new ArrayList();
            for (AudioDeviceInfo audioDeviceInfo : this.audioManager.getDevices(i)) {
                arrayList.add(AndroidAudioManager.mapOf(TtmlNode.ATTR_ID, Integer.valueOf(audioDeviceInfo.getId()), "productName", audioDeviceInfo.getProductName(), "address", Build.VERSION.SDK_INT >= 28 ? audioDeviceInfo.getAddress() : null, "isSource", Boolean.valueOf(audioDeviceInfo.isSource()), "isSink", Boolean.valueOf(audioDeviceInfo.isSink()), "sampleRates", AndroidAudioManager.intArrayToList(audioDeviceInfo.getSampleRates()), "channelMasks", AndroidAudioManager.intArrayToList(audioDeviceInfo.getChannelMasks()), "channelIndexMasks", AndroidAudioManager.intArrayToList(audioDeviceInfo.getChannelIndexMasks()), "channelCounts", AndroidAudioManager.intArrayToList(audioDeviceInfo.getChannelCounts()), "encodings", AndroidAudioManager.intArrayToList(audioDeviceInfo.getEncodings()), "type", Integer.valueOf(audioDeviceInfo.getType())));
            }
            return arrayList;
        }

        public Object getMicrophones() throws IOException {
            AndroidAudioManager.requireApi(28);
            ArrayList arrayList = new ArrayList();
            Iterator it = this.audioManager.getMicrophones().iterator();
            while (it.hasNext()) {
                MicrophoneInfo microphoneInfoM376m = AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0.m376m(it.next());
                ArrayList arrayList2 = new ArrayList();
                for (Pair pair : microphoneInfoM376m.getFrequencyResponse()) {
                    arrayList2.add(new ArrayList(Arrays.asList(Double.valueOf(((Float) pair.first).floatValue()), Double.valueOf(((Float) pair.second).floatValue()))));
                }
                ArrayList arrayList3 = new ArrayList();
                for (Pair pair2 : microphoneInfoM376m.getChannelMapping()) {
                    arrayList3.add(new ArrayList(Arrays.asList((Integer) pair2.first, (Integer) pair2.second)));
                }
                arrayList.add(AndroidAudioManager.mapOf("description", microphoneInfoM376m.getDescription(), TtmlNode.ATTR_ID, Integer.valueOf(microphoneInfoM376m.getId()), "type", Integer.valueOf(microphoneInfoM376m.getType()), "address", microphoneInfoM376m.getAddress(), "location", Integer.valueOf(microphoneInfoM376m.getLocation()), "group", Integer.valueOf(microphoneInfoM376m.getGroup()), "indexInTheGroup", Integer.valueOf(microphoneInfoM376m.getIndexInTheGroup()), "position", AndroidAudioManager.coordinate3fToList(microphoneInfoM376m.getPosition()), "orientation", AndroidAudioManager.coordinate3fToList(microphoneInfoM376m.getOrientation()), "frequencyResponse", arrayList2, "channelMapping", arrayList3, "sensitivity", Float.valueOf(microphoneInfoM376m.getSensitivity()), "maxSpl", Float.valueOf(microphoneInfoM376m.getMaxSpl()), "minSpl", Float.valueOf(microphoneInfoM376m.getMinSpl()), "directionality", Integer.valueOf(microphoneInfoM376m.getDirectionality())));
            }
            return arrayList;
        }

        public Object isHapticPlaybackSupported() {
            AndroidAudioManager.requireApi(29);
            return Boolean.valueOf(AudioManager.isHapticPlaybackSupported());
        }

        private void registerNoisyReceiver() {
            if (this.noisyReceiver != null) {
                return;
            }
            BroadcastReceiver broadcastReceiver = new BroadcastReceiver() { // from class: com.ryanheise.audio_session.AndroidAudioManager.Singleton.2
                @Override // android.content.BroadcastReceiver
                public void onReceive(Context context, Intent intent) {
                    if ("android.media.AUDIO_BECOMING_NOISY".equals(intent.getAction())) {
                        Singleton.this.invokeMethod("onBecomingNoisy", new Object[0]);
                    }
                }
            };
            this.noisyReceiver = broadcastReceiver;
            ContextCompat.registerReceiver(this.applicationContext, broadcastReceiver, new IntentFilter("android.media.AUDIO_BECOMING_NOISY"), 2);
        }

        private void unregisterNoisyReceiver() {
            Context context;
            BroadcastReceiver broadcastReceiver = this.noisyReceiver;
            if (broadcastReceiver == null || (context = this.applicationContext) == null) {
                return;
            }
            context.unregisterReceiver(broadcastReceiver);
            this.noisyReceiver = null;
        }

        private void registerScoReceiver() {
            if (this.scoReceiver != null) {
                return;
            }
            BroadcastReceiver broadcastReceiver = new BroadcastReceiver() { // from class: com.ryanheise.audio_session.AndroidAudioManager.Singleton.3
                @Override // android.content.BroadcastReceiver
                public void onReceive(Context context, Intent intent) {
                    Singleton.this.invokeMethod("onScoAudioStateUpdated", Integer.valueOf(intent.getIntExtra("android.media.extra.SCO_AUDIO_STATE", -1)), Integer.valueOf(intent.getIntExtra("android.media.extra.SCO_AUDIO_PREVIOUS_STATE", -1)));
                }
            };
            this.scoReceiver = broadcastReceiver;
            ContextCompat.registerReceiver(this.applicationContext, broadcastReceiver, new IntentFilter("android.media.ACTION_SCO_AUDIO_STATE_UPDATED"), 2);
        }

        private void unregisterScoReceiver() {
            Context context;
            BroadcastReceiver broadcastReceiver = this.scoReceiver;
            if (broadcastReceiver == null || (context = this.applicationContext) == null) {
                return;
            }
            context.unregisterReceiver(broadcastReceiver);
            this.scoReceiver = null;
        }

        private AudioAttributesCompat decodeAudioAttributes(Map<?, ?> map) {
            AudioAttributesCompat.Builder builder = new AudioAttributesCompat.Builder();
            if (map.get("contentType") != null) {
                builder.setContentType(((Integer) map.get("contentType")).intValue());
            }
            if (map.get("flags") != null) {
                builder.setFlags(((Integer) map.get("flags")).intValue());
            }
            if (map.get("usage") != null) {
                builder.setUsage(((Integer) map.get("usage")).intValue());
            }
            return builder.build();
        }

        public void invokeMethod(String str, Object... objArr) {
            for (AndroidAudioManager androidAudioManager : this.instances) {
                androidAudioManager.channel.invokeMethod(str, new ArrayList(Arrays.asList(objArr)));
            }
        }

        public void dispose() {
            abandonAudioFocus();
            if (Build.VERSION.SDK_INT >= 23) {
                disposeAudioDeviceCallback();
            }
            this.applicationContext = null;
            this.audioManager = null;
        }

        private void disposeAudioDeviceCallback() {
            this.audioManager.unregisterAudioDeviceCallback(AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0.m(this.audioDeviceCallback));
        }
    }

    static void requireApi(int i) {
        if (Build.VERSION.SDK_INT >= i) {
            return;
        }
        throw new RuntimeException("Requires API level " + i);
    }

    static Map<String, Object> mapOf(Object... objArr) {
        HashMap map = new HashMap();
        for (int i = 0; i < objArr.length; i += 2) {
            map.put((String) objArr[i], objArr[i + 1]);
        }
        return map;
    }

    static ArrayList<Integer> intArrayToList(int[] iArr) {
        ArrayList<Integer> arrayList = new ArrayList<>();
        for (int i : iArr) {
            arrayList.add(Integer.valueOf(i));
        }
        return arrayList;
    }

    static ArrayList<Double> doubleArrayToList(double[] dArr) {
        ArrayList<Double> arrayList = new ArrayList<>();
        for (double d : dArr) {
            arrayList.add(Double.valueOf(d));
        }
        return arrayList;
    }

    static ArrayList<Double> coordinate3fToList(MicrophoneInfo.Coordinate3F coordinate3F) {
        ArrayList<Double> arrayList = new ArrayList<>();
        arrayList.add(Double.valueOf(coordinate3F.x));
        arrayList.add(Double.valueOf(coordinate3F.y));
        arrayList.add(Double.valueOf(coordinate3F.z));
        return arrayList;
    }

    static Long getLong(Object obj) {
        return (obj == null || (obj instanceof Long)) ? (Long) obj : Long.valueOf(((Integer) obj).intValue());
    }

    public static List<?> encodeAudioDevices(AudioDeviceInfo[] audioDeviceInfoArr) {
        ArrayList arrayList = new ArrayList();
        for (AudioDeviceInfo audioDeviceInfo : audioDeviceInfoArr) {
            arrayList.add(encodeAudioDevice(audioDeviceInfo));
        }
        return arrayList;
    }

    public static Map<String, Object> encodeAudioDevice(AudioDeviceInfo audioDeviceInfo) {
        return mapOf(TtmlNode.ATTR_ID, Integer.valueOf(audioDeviceInfo.getId()), "productName", audioDeviceInfo.getProductName(), "address", Build.VERSION.SDK_INT >= 28 ? audioDeviceInfo.getAddress() : null, "isSource", Boolean.valueOf(audioDeviceInfo.isSource()), "isSink", Boolean.valueOf(audioDeviceInfo.isSink()), "sampleRates", audioDeviceInfo.getSampleRates(), "channelMasks", audioDeviceInfo.getChannelMasks(), "channelIndexMasks", audioDeviceInfo.getChannelIndexMasks(), "channelCounts", audioDeviceInfo.getChannelCounts(), "encodings", audioDeviceInfo.getEncodings(), "type", Integer.valueOf(audioDeviceInfo.getType()));
    }
}
