package io.flutter.embedding.engine.systemchannels;

import io.flutter.FlutterInjector;
import io.flutter.Log;
import io.flutter.embedding.engine.dart.DartExecutor;
import io.flutter.embedding.engine.deferredcomponents.DeferredComponentManager;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.StandardMethodCodec;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: classes2.dex */
public class DeferredComponentChannel {
    private static final String TAG = "DeferredComponentChannel";
    private final MethodChannel channel;
    private Map<String, List<MethodChannel.Result>> componentNameToResults;
    private DeferredComponentManager deferredComponentManager;
    final MethodChannel.MethodCallHandler parsingMethodHandler;

    public DeferredComponentChannel(DartExecutor dartExecutor) {
        MethodChannel.MethodCallHandler methodCallHandler = new MethodChannel.MethodCallHandler() { // from class: io.flutter.embedding.engine.systemchannels.DeferredComponentChannel.1
            @Override // io.flutter.plugin.common.MethodChannel.MethodCallHandler
            public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                int iIntValue;
                String str;
                if (DeferredComponentChannel.this.deferredComponentManager == null) {
                }
                String str2 = methodCall.method;
                Map map = (Map) methodCall.arguments();
                Log.v(DeferredComponentChannel.TAG, "Received '" + str2 + "' message.");
                iIntValue = ((Integer) map.get("loadingUnitId")).intValue();
                str = (String) map.get("componentName");
                str2.hashCode();
                switch (str2) {
                    case "uninstallDeferredComponent":
                        DeferredComponentChannel.this.deferredComponentManager.uninstallDeferredComponent(iIntValue, str);
                        result.success(null);
                        break;
                    case "getDeferredComponentInstallState":
                        result.success(DeferredComponentChannel.this.deferredComponentManager.getDeferredComponentInstallState(iIntValue, str));
                        break;
                    case "installDeferredComponent":
                        DeferredComponentChannel.this.deferredComponentManager.installDeferredComponent(iIntValue, str);
                        if (!DeferredComponentChannel.this.componentNameToResults.containsKey(str)) {
                            DeferredComponentChannel.this.componentNameToResults.put(str, new ArrayList());
                        }
                        ((List) DeferredComponentChannel.this.componentNameToResults.get(str)).add(result);
                        break;
                    default:
                        result.notImplemented();
                        break;
                }
            }
        };
        this.parsingMethodHandler = methodCallHandler;
        MethodChannel methodChannel = new MethodChannel(dartExecutor, "flutter/deferredcomponent", StandardMethodCodec.INSTANCE);
        this.channel = methodChannel;
        methodChannel.setMethodCallHandler(methodCallHandler);
        this.deferredComponentManager = FlutterInjector.instance().deferredComponentManager();
        this.componentNameToResults = new HashMap();
    }

    public void setDeferredComponentManager(DeferredComponentManager deferredComponentManager) {
        this.deferredComponentManager = deferredComponentManager;
    }

    public void completeInstallSuccess(String str) {
        if (this.componentNameToResults.containsKey(str)) {
            Iterator<MethodChannel.Result> it = this.componentNameToResults.get(str).iterator();
            while (it.hasNext()) {
                it.next().success(null);
            }
            this.componentNameToResults.get(str).clear();
        }
    }

    public void completeInstallError(String str, String str2) {
        if (this.componentNameToResults.containsKey(str)) {
            Iterator<MethodChannel.Result> it = this.componentNameToResults.get(str).iterator();
            while (it.hasNext()) {
                it.next().error("DeferredComponent Install failure", str2, null);
            }
            this.componentNameToResults.get(str).clear();
        }
    }
}
