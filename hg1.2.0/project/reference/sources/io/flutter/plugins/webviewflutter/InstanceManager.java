package io.flutter.plugins.webviewflutter;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.WeakHashMap;

/* loaded from: classes2.dex */
public class InstanceManager {
    private static final long CLEAR_FINALIZED_WEAK_REFERENCES_INTERVAL = 3000;
    private static final long MIN_HOST_CREATED_IDENTIFIER = 65536;
    private static final String TAG = "InstanceManager";
    private final FinalizationListener finalizationListener;
    private final Handler handler;
    private boolean hasFinalizationListenerStopped;
    private long nextIdentifier;
    private final WeakHashMap<Object, Long> identifiers = new WeakHashMap<>();
    private final HashMap<Long, WeakReference<Object>> weakInstances = new HashMap<>();
    private final HashMap<Long, Object> strongInstances = new HashMap<>();
    private final ReferenceQueue<Object> referenceQueue = new ReferenceQueue<>();
    private final HashMap<WeakReference<Object>, Long> weakReferencesToIdentifiers = new HashMap<>();

    public interface FinalizationListener {
        void onFinalize(long j);
    }

    public static InstanceManager create(FinalizationListener finalizationListener) {
        return new InstanceManager(finalizationListener);
    }

    private InstanceManager(FinalizationListener finalizationListener) {
        Handler handler = new Handler(Looper.getMainLooper());
        this.handler = handler;
        this.nextIdentifier = 65536L;
        this.hasFinalizationListenerStopped = false;
        this.finalizationListener = finalizationListener;
        handler.postDelayed(new InstanceManager$$ExternalSyntheticLambda0(this), 3000L);
    }

    public <T> T remove(long j) {
        logWarningIfFinalizationListenerHasStopped();
        return (T) this.strongInstances.remove(Long.valueOf(j));
    }

    public Long getIdentifierForStrongReference(Object obj) {
        logWarningIfFinalizationListenerHasStopped();
        Long l = this.identifiers.get(obj);
        if (l != null) {
            this.strongInstances.put(l, obj);
        }
        return l;
    }

    public void addDartCreatedInstance(Object obj, long j) {
        logWarningIfFinalizationListenerHasStopped();
        addInstance(obj, j);
    }

    public long addHostCreatedInstance(Object obj) {
        logWarningIfFinalizationListenerHasStopped();
        if (containsInstance(obj)) {
            throw new IllegalArgumentException("Instance of " + obj.getClass() + " has already been added.");
        }
        long j = this.nextIdentifier;
        this.nextIdentifier = 1 + j;
        addInstance(obj, j);
        return j;
    }

    public <T> T getInstance(long j) {
        logWarningIfFinalizationListenerHasStopped();
        WeakReference<Object> weakReference = this.weakInstances.get(Long.valueOf(j));
        if (weakReference != null) {
            return (T) weakReference.get();
        }
        return null;
    }

    public boolean containsInstance(Object obj) {
        logWarningIfFinalizationListenerHasStopped();
        return this.identifiers.containsKey(obj);
    }

    public void stopFinalizationListener() {
        this.handler.removeCallbacks(new InstanceManager$$ExternalSyntheticLambda0(this));
        this.hasFinalizationListenerStopped = true;
    }

    public void clear() {
        this.identifiers.clear();
        this.weakInstances.clear();
        this.strongInstances.clear();
        this.weakReferencesToIdentifiers.clear();
    }

    public boolean hasFinalizationListenerStopped() {
        return this.hasFinalizationListenerStopped;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void releaseAllFinalizedInstances() {
        if (hasFinalizationListenerStopped()) {
            return;
        }
        while (true) {
            WeakReference weakReference = (WeakReference) this.referenceQueue.poll();
            if (weakReference != null) {
                Long lRemove = this.weakReferencesToIdentifiers.remove(weakReference);
                if (lRemove != null) {
                    this.weakInstances.remove(lRemove);
                    this.strongInstances.remove(lRemove);
                    this.finalizationListener.onFinalize(lRemove.longValue());
                }
            } else {
                this.handler.postDelayed(new InstanceManager$$ExternalSyntheticLambda0(this), 3000L);
                return;
            }
        }
    }

    private void addInstance(Object obj, long j) {
        if (j < 0) {
            throw new IllegalArgumentException(String.format("Identifier must be >= 0: %d", Long.valueOf(j)));
        }
        if (this.weakInstances.containsKey(Long.valueOf(j))) {
            throw new IllegalArgumentException(String.format("Identifier has already been added: %d", Long.valueOf(j)));
        }
        WeakReference<Object> weakReference = new WeakReference<>(obj, this.referenceQueue);
        this.identifiers.put(obj, Long.valueOf(j));
        this.weakInstances.put(Long.valueOf(j), weakReference);
        this.weakReferencesToIdentifiers.put(weakReference, Long.valueOf(j));
        this.strongInstances.put(Long.valueOf(j), obj);
    }

    private void logWarningIfFinalizationListenerHasStopped() {
        if (hasFinalizationListenerStopped()) {
            Log.w(TAG, "The manager was used after calls to the FinalizationListener have been stopped.");
        }
    }
}
