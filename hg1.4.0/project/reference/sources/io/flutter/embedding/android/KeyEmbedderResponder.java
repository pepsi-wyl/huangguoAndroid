package io.flutter.embedding.android;

import android.view.KeyEvent;
import io.flutter.Log;
import io.flutter.embedding.android.KeyData;
import io.flutter.embedding.android.KeyboardManager;
import io.flutter.embedding.android.KeyboardMap;
import io.flutter.plugin.common.BinaryMessenger;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/* loaded from: classes2.dex */
public class KeyEmbedderResponder implements KeyboardManager.Responder {
    private static final String TAG = "KeyEmbedderResponder";
    private final BinaryMessenger messenger;
    private final HashMap<Long, Long> pressingRecords = new HashMap<>();
    private final HashMap<Long, KeyboardMap.TogglingGoal> togglingGoals = new HashMap<>();
    private final KeyboardManager.CharacterCombiner characterCombiner = new KeyboardManager.CharacterCombiner();

    private static long keyOfPlane(long j, long j2) {
        return (j & KeyboardMap.kValueMask) | j2;
    }

    private static KeyData.Type getEventType(KeyEvent keyEvent) {
        boolean z = keyEvent.getRepeatCount() > 0;
        int action = keyEvent.getAction();
        if (action == 0) {
            return z ? KeyData.Type.kRepeat : KeyData.Type.kDown;
        }
        if (action == 1) {
            return KeyData.Type.kUp;
        }
        throw new AssertionError("Unexpected event type");
    }

    public KeyEmbedderResponder(BinaryMessenger binaryMessenger) {
        this.messenger = binaryMessenger;
        for (KeyboardMap.TogglingGoal togglingGoal : KeyboardMap.getTogglingGoals()) {
            this.togglingGoals.put(Long.valueOf(togglingGoal.logicalKey), togglingGoal);
        }
    }

    private Long getPhysicalKey(KeyEvent keyEvent) {
        long scanCode = keyEvent.getScanCode();
        if (scanCode == 0) {
            return Long.valueOf(keyOfPlane(keyEvent.getKeyCode(), KeyboardMap.kAndroidPlane));
        }
        Long l = KeyboardMap.scanCodeToPhysical.get(Long.valueOf(scanCode));
        return l != null ? l : Long.valueOf(keyOfPlane(keyEvent.getScanCode(), KeyboardMap.kAndroidPlane));
    }

    private Long getLogicalKey(KeyEvent keyEvent) {
        Long l = KeyboardMap.keyCodeToLogical.get(Long.valueOf(keyEvent.getKeyCode()));
        return l != null ? l : Long.valueOf(keyOfPlane(keyEvent.getKeyCode(), KeyboardMap.kAndroidPlane));
    }

    void updatePressingState(Long l, Long l2) {
        if (l2 != null) {
            if (this.pressingRecords.put(l, l2) != null) {
                throw new AssertionError("The key was not empty");
            }
        } else if (this.pressingRecords.remove(l) == null) {
            throw new AssertionError("The key was empty");
        }
    }

    void synchronizePressingKey(KeyboardMap.PressingGoal pressingGoal, boolean z, long j, final long j2, final KeyEvent keyEvent, ArrayList<Runnable> arrayList) {
        boolean[] zArr = new boolean[pressingGoal.keys.length];
        Boolean[] boolArr = new Boolean[pressingGoal.keys.length];
        boolean z2 = false;
        int i = 0;
        while (true) {
            boolean z3 = true;
            if (i >= pressingGoal.keys.length) {
                break;
            }
            final KeyboardMap.KeyPair keyPair = pressingGoal.keys[i];
            zArr[i] = this.pressingRecords.containsKey(Long.valueOf(keyPair.physicalKey));
            if (keyPair.logicalKey == j) {
                int i2 = AnonymousClass1.$SwitchMap$io$flutter$embedding$android$KeyData$Type[getEventType(keyEvent).ordinal()];
                if (i2 == 1) {
                    boolArr[i] = false;
                    if (!z) {
                        arrayList.add(new Runnable() { // from class: io.flutter.embedding.android.KeyEmbedderResponder$$ExternalSyntheticLambda1
                            @Override // java.lang.Runnable
                            public final void run() {
                                this.f$0.m455x63b96e0c(keyPair, j2, keyEvent);
                            }
                        });
                    }
                } else if (i2 == 2) {
                    boolArr[i] = Boolean.valueOf(zArr[i]);
                } else if (i2 == 3) {
                    if (!z) {
                        arrayList.add(new Runnable() { // from class: io.flutter.embedding.android.KeyEmbedderResponder$$ExternalSyntheticLambda2
                            @Override // java.lang.Runnable
                            public final void run() {
                                this.f$0.m456xa7448bcd(keyPair, keyEvent);
                            }
                        });
                    }
                    boolArr[i] = Boolean.valueOf(zArr[i]);
                }
                z2 = true;
            } else {
                if (!z2 && !zArr[i]) {
                    z3 = false;
                }
                z2 = z3;
            }
            i++;
        }
        if (z) {
            for (int i3 = 0; i3 < pressingGoal.keys.length; i3++) {
                if (boolArr[i3] == null) {
                    if (z2) {
                        boolArr[i3] = Boolean.valueOf(zArr[i3]);
                    } else {
                        boolArr[i3] = true;
                        z2 = true;
                    }
                }
            }
            if (!z2) {
                boolArr[0] = true;
            }
        } else {
            for (int i4 = 0; i4 < pressingGoal.keys.length; i4++) {
                if (boolArr[i4] == null) {
                    boolArr[i4] = false;
                }
            }
        }
        for (int i5 = 0; i5 < pressingGoal.keys.length; i5++) {
            if (zArr[i5] != boolArr[i5].booleanValue()) {
                KeyboardMap.KeyPair keyPair2 = pressingGoal.keys[i5];
                synthesizeEvent(boolArr[i5].booleanValue(), Long.valueOf(keyPair2.logicalKey), Long.valueOf(keyPair2.physicalKey), keyEvent.getEventTime());
            }
        }
    }

    /* renamed from: io.flutter.embedding.android.KeyEmbedderResponder$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$io$flutter$embedding$android$KeyData$Type;

        static {
            int[] iArr = new int[KeyData.Type.values().length];
            $SwitchMap$io$flutter$embedding$android$KeyData$Type = iArr;
            try {
                iArr[KeyData.Type.kDown.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$io$flutter$embedding$android$KeyData$Type[KeyData.Type.kUp.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$io$flutter$embedding$android$KeyData$Type[KeyData.Type.kRepeat.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
        }
    }

    /* renamed from: lambda$synchronizePressingKey$0$io-flutter-embedding-android-KeyEmbedderResponder, reason: not valid java name */
    /* synthetic */ void m455x63b96e0c(KeyboardMap.KeyPair keyPair, long j, KeyEvent keyEvent) {
        synthesizeEvent(false, Long.valueOf(keyPair.logicalKey), Long.valueOf(j), keyEvent.getEventTime());
    }

    /* renamed from: lambda$synchronizePressingKey$1$io-flutter-embedding-android-KeyEmbedderResponder, reason: not valid java name */
    /* synthetic */ void m456xa7448bcd(KeyboardMap.KeyPair keyPair, KeyEvent keyEvent) {
        synthesizeEvent(false, Long.valueOf(keyPair.logicalKey), Long.valueOf(keyPair.physicalKey), keyEvent.getEventTime());
    }

    void synchronizeTogglingKey(KeyboardMap.TogglingGoal togglingGoal, boolean z, long j, KeyEvent keyEvent) {
        if (togglingGoal.logicalKey == j || togglingGoal.enabled == z) {
            return;
        }
        boolean zContainsKey = this.pressingRecords.containsKey(Long.valueOf(togglingGoal.physicalKey));
        boolean z2 = !zContainsKey;
        if (z2) {
            togglingGoal.enabled = !togglingGoal.enabled;
        }
        synthesizeEvent(z2, Long.valueOf(togglingGoal.logicalKey), Long.valueOf(togglingGoal.physicalKey), keyEvent.getEventTime());
        if (!z2) {
            togglingGoal.enabled = !togglingGoal.enabled;
        }
        synthesizeEvent(zContainsKey, Long.valueOf(togglingGoal.logicalKey), Long.valueOf(togglingGoal.physicalKey), keyEvent.getEventTime());
    }

    /* JADX WARN: Removed duplicated region for block: B:46:0x00d2  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00f8  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x011a  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x0149 A[LOOP:2: B:68:0x0143->B:70:0x0149, LOOP_END] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private boolean handleEventImpl(KeyEvent keyEvent, KeyboardManager.Responder.OnKeyEventHandledCallback onKeyEventHandledCallback) {
        boolean z;
        KeyData.Type type;
        int source;
        Iterator<Runnable> it;
        KeyboardMap.TogglingGoal togglingGoal;
        if (keyEvent.getScanCode() == 0 && keyEvent.getKeyCode() == 0) {
            return false;
        }
        Long physicalKey = getPhysicalKey(keyEvent);
        Long logicalKey = getLogicalKey(keyEvent);
        ArrayList<Runnable> arrayList = new ArrayList<>();
        for (KeyboardMap.PressingGoal pressingGoal : KeyboardMap.pressingGoals) {
            synchronizePressingKey(pressingGoal, (keyEvent.getMetaState() & pressingGoal.mask) != 0, logicalKey.longValue(), physicalKey.longValue(), keyEvent, arrayList);
        }
        for (KeyboardMap.TogglingGoal togglingGoal2 : this.togglingGoals.values()) {
            synchronizeTogglingKey(togglingGoal2, (keyEvent.getMetaState() & togglingGoal2.mask) != 0, logicalKey.longValue(), keyEvent);
        }
        int action = keyEvent.getAction();
        if (action == 0) {
            z = true;
        } else {
            if (action != 1) {
                return false;
            }
            z = false;
        }
        Long l = this.pressingRecords.get(physicalKey);
        if (z) {
            if (l == null) {
                type = KeyData.Type.kDown;
            } else if (keyEvent.getRepeatCount() > 0) {
                type = KeyData.Type.kRepeat;
            } else {
                synthesizeEvent(false, l, physicalKey, keyEvent.getEventTime());
                type = KeyData.Type.kDown;
            }
            char cCharValue = this.characterCombiner.applyCombiningCharacterToBaseCharacter(keyEvent.getUnicodeChar()).charValue();
            String str = cCharValue != 0 ? "" + cCharValue : null;
            if (type != KeyData.Type.kRepeat) {
                updatePressingState(physicalKey, z ? logicalKey : null);
            }
            if (type == KeyData.Type.kDown && (togglingGoal = this.togglingGoals.get(logicalKey)) != null) {
                togglingGoal.enabled = !togglingGoal.enabled;
            }
            KeyData keyData = new KeyData();
            source = keyEvent.getSource();
            if (source != 513) {
                keyData.deviceType = KeyData.DeviceType.kDirectionalPad;
            } else if (source == 1025) {
                keyData.deviceType = KeyData.DeviceType.kGamepad;
            } else if (source == 16777232) {
                keyData.deviceType = KeyData.DeviceType.kJoystick;
            } else if (source != 33554433) {
                keyData.deviceType = KeyData.DeviceType.kKeyboard;
            } else {
                keyData.deviceType = KeyData.DeviceType.kHdmi;
            }
            keyData.timestamp = keyEvent.getEventTime();
            keyData.type = type;
            keyData.logicalKey = logicalKey.longValue();
            keyData.physicalKey = physicalKey.longValue();
            keyData.character = str;
            keyData.synthesized = false;
            keyData.deviceType = KeyData.DeviceType.kKeyboard;
            sendKeyEvent(keyData, onKeyEventHandledCallback);
            it = arrayList.iterator();
            while (it.hasNext()) {
                it.next().run();
            }
            return true;
        }
        if (l == null) {
            return false;
        }
        type = KeyData.Type.kUp;
        if (type != KeyData.Type.kRepeat) {
        }
        if (type == KeyData.Type.kDown) {
            togglingGoal.enabled = !togglingGoal.enabled;
        }
        KeyData keyData2 = new KeyData();
        source = keyEvent.getSource();
        if (source != 513) {
        }
        keyData2.timestamp = keyEvent.getEventTime();
        keyData2.type = type;
        keyData2.logicalKey = logicalKey.longValue();
        keyData2.physicalKey = physicalKey.longValue();
        keyData2.character = str;
        keyData2.synthesized = false;
        keyData2.deviceType = KeyData.DeviceType.kKeyboard;
        sendKeyEvent(keyData2, onKeyEventHandledCallback);
        it = arrayList.iterator();
        while (it.hasNext()) {
        }
        return true;
    }

    private void synthesizeEvent(boolean z, Long l, Long l2, long j) {
        KeyData keyData = new KeyData();
        keyData.timestamp = j;
        keyData.type = z ? KeyData.Type.kDown : KeyData.Type.kUp;
        keyData.logicalKey = l.longValue();
        keyData.physicalKey = l2.longValue();
        keyData.character = null;
        keyData.synthesized = true;
        keyData.deviceType = KeyData.DeviceType.kKeyboard;
        if (l2.longValue() != 0 && l.longValue() != 0) {
            if (!z) {
                l = null;
            }
            updatePressingState(l2, l);
        }
        sendKeyEvent(keyData, null);
    }

    private void sendKeyEvent(KeyData keyData, final KeyboardManager.Responder.OnKeyEventHandledCallback onKeyEventHandledCallback) {
        this.messenger.send(KeyData.CHANNEL, keyData.toBytes(), onKeyEventHandledCallback == null ? null : new BinaryMessenger.BinaryReply() { // from class: io.flutter.embedding.android.KeyEmbedderResponder$$ExternalSyntheticLambda0
            @Override // io.flutter.plugin.common.BinaryMessenger.BinaryReply
            public final void reply(ByteBuffer byteBuffer) {
                KeyEmbedderResponder.lambda$sendKeyEvent$2(onKeyEventHandledCallback, byteBuffer);
            }
        });
    }

    static /* synthetic */ void lambda$sendKeyEvent$2(KeyboardManager.Responder.OnKeyEventHandledCallback onKeyEventHandledCallback, ByteBuffer byteBuffer) {
        Boolean boolValueOf = false;
        if (byteBuffer != null) {
            byteBuffer.rewind();
            if (byteBuffer.capacity() != 0) {
                boolValueOf = Boolean.valueOf(byteBuffer.get() != 0);
            }
        } else {
            Log.w(TAG, "A null reply was received when sending a key event to the framework.");
        }
        onKeyEventHandledCallback.onKeyEventHandled(boolValueOf.booleanValue());
    }

    @Override // io.flutter.embedding.android.KeyboardManager.Responder
    public void handleEvent(KeyEvent keyEvent, KeyboardManager.Responder.OnKeyEventHandledCallback onKeyEventHandledCallback) {
        if (handleEventImpl(keyEvent, onKeyEventHandledCallback)) {
            return;
        }
        synthesizeEvent(true, 0L, 0L, 0L);
        onKeyEventHandledCallback.onKeyEventHandled(true);
    }

    public Map<Long, Long> getPressedState() {
        return Collections.unmodifiableMap(this.pressingRecords);
    }
}
