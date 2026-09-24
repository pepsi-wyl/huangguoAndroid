package com.baseflow.permissionhandler;

import android.app.Activity;
import android.content.Context;
import com.baseflow.permissionhandler.AppSettingsManager;
import com.baseflow.permissionhandler.PermissionManager;
import com.baseflow.permissionhandler.ServiceManager;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/* loaded from: classes.dex */
final class MethodCallHandlerImpl implements MethodChannel.MethodCallHandler {
    private Activity activity;
    private final AppSettingsManager appSettingsManager;
    private final Context applicationContext;
    private final PermissionManager permissionManager;
    private final ServiceManager serviceManager;

    MethodCallHandlerImpl(Context context, AppSettingsManager appSettingsManager, PermissionManager permissionManager, ServiceManager serviceManager) {
        this.applicationContext = context;
        this.appSettingsManager = appSettingsManager;
        this.permissionManager = permissionManager;
        this.serviceManager = serviceManager;
    }

    public void setActivity(Activity activity) {
        this.activity = activity;
    }

    @Override // io.flutter.plugin.common.MethodChannel.MethodCallHandler
    public void onMethodCall(MethodCall methodCall, final MethodChannel.Result result) throws NumberFormatException {
        String str = methodCall.method;
        str.hashCode();
        switch (str) {
            case "checkServiceStatus":
                int i = Integer.parseInt(methodCall.arguments.toString());
                ServiceManager serviceManager = this.serviceManager;
                Context context = this.applicationContext;
                Objects.requireNonNull(result);
                serviceManager.checkServiceStatus(i, context, new ServiceManager.SuccessCallback() { // from class: com.baseflow.permissionhandler.MethodCallHandlerImpl$$ExternalSyntheticLambda0
                    @Override // com.baseflow.permissionhandler.ServiceManager.SuccessCallback
                    public final void onSuccess(int i2) {
                        result.success(Integer.valueOf(i2));
                    }
                }, new ErrorCallback() { // from class: com.baseflow.permissionhandler.MethodCallHandlerImpl$$ExternalSyntheticLambda1
                    @Override // com.baseflow.permissionhandler.ErrorCallback
                    public final void onError(String str2, String str3) {
                        result.error(str2, str3, null);
                    }
                });
                break;
            case "shouldShowRequestPermissionRationale":
                int i2 = Integer.parseInt(methodCall.arguments.toString());
                PermissionManager permissionManager = this.permissionManager;
                Activity activity = this.activity;
                Objects.requireNonNull(result);
                permissionManager.shouldShowRequestPermissionRationale(i2, activity, new PermissionManager.ShouldShowRequestPermissionRationaleSuccessCallback() { // from class: com.baseflow.permissionhandler.MethodCallHandlerImpl$$ExternalSyntheticLambda5
                    @Override // com.baseflow.permissionhandler.PermissionManager.ShouldShowRequestPermissionRationaleSuccessCallback
                    public final void onSuccess(boolean z) {
                        result.success(Boolean.valueOf(z));
                    }
                }, new ErrorCallback() { // from class: com.baseflow.permissionhandler.MethodCallHandlerImpl$$ExternalSyntheticLambda6
                    @Override // com.baseflow.permissionhandler.ErrorCallback
                    public final void onError(String str2, String str3) {
                        result.error(str2, str3, null);
                    }
                });
                break;
            case "checkPermissionStatus":
                int i3 = Integer.parseInt(methodCall.arguments.toString());
                PermissionManager permissionManager2 = this.permissionManager;
                Context context2 = this.applicationContext;
                Objects.requireNonNull(result);
                permissionManager2.checkPermissionStatus(i3, context2, new PermissionManager.CheckPermissionsSuccessCallback() { // from class: com.baseflow.permissionhandler.MethodCallHandlerImpl$$ExternalSyntheticLambda2
                    @Override // com.baseflow.permissionhandler.PermissionManager.CheckPermissionsSuccessCallback
                    public final void onSuccess(int i4) {
                        result.success(Integer.valueOf(i4));
                    }
                });
                break;
            case "openAppSettings":
                AppSettingsManager appSettingsManager = this.appSettingsManager;
                Context context3 = this.applicationContext;
                Objects.requireNonNull(result);
                appSettingsManager.openAppSettings(context3, new AppSettingsManager.OpenAppSettingsSuccessCallback() { // from class: com.baseflow.permissionhandler.MethodCallHandlerImpl$$ExternalSyntheticLambda7
                    @Override // com.baseflow.permissionhandler.AppSettingsManager.OpenAppSettingsSuccessCallback
                    public final void onSuccess(boolean z) {
                        result.success(Boolean.valueOf(z));
                    }
                }, new ErrorCallback() { // from class: com.baseflow.permissionhandler.MethodCallHandlerImpl$$ExternalSyntheticLambda8
                    @Override // com.baseflow.permissionhandler.ErrorCallback
                    public final void onError(String str2, String str3) {
                        result.error(str2, str3, null);
                    }
                });
                break;
            case "requestPermissions":
                List<Integer> list = (List) methodCall.arguments();
                PermissionManager permissionManager3 = this.permissionManager;
                Activity activity2 = this.activity;
                Objects.requireNonNull(result);
                permissionManager3.requestPermissions(list, activity2, new PermissionManager.RequestPermissionsSuccessCallback() { // from class: com.baseflow.permissionhandler.MethodCallHandlerImpl$$ExternalSyntheticLambda3
                    @Override // com.baseflow.permissionhandler.PermissionManager.RequestPermissionsSuccessCallback
                    public final void onSuccess(Map map) {
                        result.success(map);
                    }
                }, new ErrorCallback() { // from class: com.baseflow.permissionhandler.MethodCallHandlerImpl$$ExternalSyntheticLambda4
                    @Override // com.baseflow.permissionhandler.ErrorCallback
                    public final void onError(String str2, String str3) {
                        result.error(str2, str3, null);
                    }
                });
                break;
            default:
                result.notImplemented();
                break;
        }
    }
}
