package androidx.browser.trusted;

import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import android.support.customtabs.trusted.ITrustedWebActivityCallback;

/* loaded from: classes.dex */
public class TrustedWebActivityCallbackRemote {
    private final ITrustedWebActivityCallback mCallbackBinder;

    private TrustedWebActivityCallbackRemote(ITrustedWebActivityCallback iTrustedWebActivityCallback) {
        this.mCallbackBinder = iTrustedWebActivityCallback;
    }

    static TrustedWebActivityCallbackRemote fromBinder(IBinder iBinder) {
        ITrustedWebActivityCallback iTrustedWebActivityCallbackAsInterface = iBinder == null ? null : ITrustedWebActivityCallback.Stub.asInterface(iBinder);
        if (iTrustedWebActivityCallbackAsInterface == null) {
            return null;
        }
        return new TrustedWebActivityCallbackRemote(iTrustedWebActivityCallbackAsInterface);
    }

    public void runExtraCallback(String str, Bundle bundle) throws RemoteException {
        this.mCallbackBinder.onExtraCallback(str, bundle);
    }
}
