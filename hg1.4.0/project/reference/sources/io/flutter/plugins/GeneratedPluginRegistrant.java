package io.flutter.plugins;

import com.aaassseee.screen_brightness_android.ScreenBrightnessAndroidPlugin;
import com.baseflow.permissionhandler.PermissionHandlerPlugin;
import com.example.analytics_sdk.AnalyticsSdkPlugin;
import com.example.image_gallery_saver_plus.ImageGallerySaverPlusPlugin;
import com.jsyyds.log_report.LogReportPlugin;
import com.kurenai7968.volume_controller.VolumeControllerPlugin;
import com.rocksti.get_thumbnail_video.VideoThumbnailPlugin;
import com.ryanheise.audio_session.AudioSessionPlugin;
import com.ryanheise.just_audio.JustAudioPlugin;
import com.yosemiteyss.flutter_volume_controller.FlutterVolumeControllerPlugin;
import com.zero.app_installer.AppInstallerPlugin;
import dev.fluttercommunity.android_id.AndroidIdPlugin;
import dev.fluttercommunity.plus.battery.BatteryPlusPlugin;
import dev.fluttercommunity.plus.connectivity.ConnectivityPlugin;
import dev.fluttercommunity.plus.device_info.DeviceInfoPlusPlugin;
import dev.fluttercommunity.plus.packageinfo.PackageInfoPlugin;
import dev.fluttercommunity.plus.sensors.SensorsPlugin;
import dev.fluttercommunity.plus.wakelock.WakelockPlusPlugin;
import dk.cachet.screen_state.ScreenStatePlugin;
import io.flutter.Log;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.flutter_plugin_android_lifecycle.FlutterAndroidLifecyclePlugin;
import io.flutter.plugins.imagepicker.ImagePickerPlugin;
import io.flutter.plugins.pathprovider.PathProviderPlugin;
import io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin;
import io.flutter.plugins.urllauncher.UrlLauncherPlugin;
import io.flutter.plugins.videoplayer.VideoPlayerPlugin;
import io.flutter.plugins.webviewflutter.WebViewFlutterPlugin;

/* loaded from: classes2.dex */
public final class GeneratedPluginRegistrant {
    private static final String TAG = "GeneratedPluginRegistrant";

    public static void registerWith(FlutterEngine flutterEngine) {
        try {
            flutterEngine.getPlugins().add(new AnalyticsSdkPlugin());
        } catch (Exception e) {
            Log.e(TAG, "Error registering plugin analytics_sdk, com.example.analytics_sdk.AnalyticsSdkPlugin", e);
        }
        try {
            flutterEngine.getPlugins().add(new AndroidIdPlugin());
        } catch (Exception e2) {
            Log.e(TAG, "Error registering plugin android_id, dev.fluttercommunity.android_id.AndroidIdPlugin", e2);
        }
        try {
            flutterEngine.getPlugins().add(new AppInstallerPlugin());
        } catch (Exception e3) {
            Log.e(TAG, "Error registering plugin app_installer, com.zero.app_installer.AppInstallerPlugin", e3);
        }
        try {
            flutterEngine.getPlugins().add(new AudioSessionPlugin());
        } catch (Exception e4) {
            Log.e(TAG, "Error registering plugin audio_session, com.ryanheise.audio_session.AudioSessionPlugin", e4);
        }
        try {
            flutterEngine.getPlugins().add(new BatteryPlusPlugin());
        } catch (Exception e5) {
            Log.e(TAG, "Error registering plugin battery_plus, dev.fluttercommunity.plus.battery.BatteryPlusPlugin", e5);
        }
        try {
            flutterEngine.getPlugins().add(new ConnectivityPlugin());
        } catch (Exception e6) {
            Log.e(TAG, "Error registering plugin connectivity_plus, dev.fluttercommunity.plus.connectivity.ConnectivityPlugin", e6);
        }
        try {
            flutterEngine.getPlugins().add(new DeviceInfoPlusPlugin());
        } catch (Exception e7) {
            Log.e(TAG, "Error registering plugin device_info_plus, dev.fluttercommunity.plus.device_info.DeviceInfoPlusPlugin", e7);
        }
        try {
            flutterEngine.getPlugins().add(new FlutterAndroidLifecyclePlugin());
        } catch (Exception e8) {
            Log.e(TAG, "Error registering plugin flutter_plugin_android_lifecycle, io.flutter.plugins.flutter_plugin_android_lifecycle.FlutterAndroidLifecyclePlugin", e8);
        }
        try {
            flutterEngine.getPlugins().add(new FlutterVolumeControllerPlugin());
        } catch (Exception e9) {
            Log.e(TAG, "Error registering plugin flutter_volume_controller, com.yosemiteyss.flutter_volume_controller.FlutterVolumeControllerPlugin", e9);
        }
        try {
            flutterEngine.getPlugins().add(new VideoThumbnailPlugin());
        } catch (Exception e10) {
            Log.e(TAG, "Error registering plugin get_thumbnail_video, com.rocksti.get_thumbnail_video.VideoThumbnailPlugin", e10);
        }
        try {
            flutterEngine.getPlugins().add(new ImageGallerySaverPlusPlugin());
        } catch (Exception e11) {
            Log.e(TAG, "Error registering plugin image_gallery_saver_plus, com.example.image_gallery_saver_plus.ImageGallerySaverPlusPlugin", e11);
        }
        try {
            flutterEngine.getPlugins().add(new ImagePickerPlugin());
        } catch (Exception e12) {
            Log.e(TAG, "Error registering plugin image_picker_android, io.flutter.plugins.imagepicker.ImagePickerPlugin", e12);
        }
        try {
            flutterEngine.getPlugins().add(new JustAudioPlugin());
        } catch (Exception e13) {
            Log.e(TAG, "Error registering plugin just_audio, com.ryanheise.just_audio.JustAudioPlugin", e13);
        }
        try {
            flutterEngine.getPlugins().add(new LogReportPlugin());
        } catch (Exception e14) {
            Log.e(TAG, "Error registering plugin log_report, com.jsyyds.log_report.LogReportPlugin", e14);
        }
        try {
            flutterEngine.getPlugins().add(new PackageInfoPlugin());
        } catch (Exception e15) {
            Log.e(TAG, "Error registering plugin package_info_plus, dev.fluttercommunity.plus.packageinfo.PackageInfoPlugin", e15);
        }
        try {
            flutterEngine.getPlugins().add(new PathProviderPlugin());
        } catch (Exception e16) {
            Log.e(TAG, "Error registering plugin path_provider_android, io.flutter.plugins.pathprovider.PathProviderPlugin", e16);
        }
        try {
            flutterEngine.getPlugins().add(new PermissionHandlerPlugin());
        } catch (Exception e17) {
            Log.e(TAG, "Error registering plugin permission_handler_android, com.baseflow.permissionhandler.PermissionHandlerPlugin", e17);
        }
        try {
            flutterEngine.getPlugins().add(new ScreenBrightnessAndroidPlugin());
        } catch (Exception e18) {
            Log.e(TAG, "Error registering plugin screen_brightness_android, com.aaassseee.screen_brightness_android.ScreenBrightnessAndroidPlugin", e18);
        }
        try {
            flutterEngine.getPlugins().add(new ScreenStatePlugin());
        } catch (Exception e19) {
            Log.e(TAG, "Error registering plugin screen_state, dk.cachet.screen_state.ScreenStatePlugin", e19);
        }
        try {
            flutterEngine.getPlugins().add(new SensorsPlugin());
        } catch (Exception e20) {
            Log.e(TAG, "Error registering plugin sensors_plus, dev.fluttercommunity.plus.sensors.SensorsPlugin", e20);
        }
        try {
            flutterEngine.getPlugins().add(new SharedPreferencesPlugin());
        } catch (Exception e21) {
            Log.e(TAG, "Error registering plugin shared_preferences_android, io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin", e21);
        }
        try {
            flutterEngine.getPlugins().add(new UrlLauncherPlugin());
        } catch (Exception e22) {
            Log.e(TAG, "Error registering plugin url_launcher_android, io.flutter.plugins.urllauncher.UrlLauncherPlugin", e22);
        }
        try {
            flutterEngine.getPlugins().add(new VideoPlayerPlugin());
        } catch (Exception e23) {
            Log.e(TAG, "Error registering plugin video_player_android, io.flutter.plugins.videoplayer.VideoPlayerPlugin", e23);
        }
        try {
            flutterEngine.getPlugins().add(new VolumeControllerPlugin());
        } catch (Exception e24) {
            Log.e(TAG, "Error registering plugin volume_controller, com.kurenai7968.volume_controller.VolumeControllerPlugin", e24);
        }
        try {
            flutterEngine.getPlugins().add(new WakelockPlusPlugin());
        } catch (Exception e25) {
            Log.e(TAG, "Error registering plugin wakelock_plus, dev.fluttercommunity.plus.wakelock.WakelockPlusPlugin", e25);
        }
        try {
            flutterEngine.getPlugins().add(new WebViewFlutterPlugin());
        } catch (Exception e26) {
            Log.e(TAG, "Error registering plugin webview_flutter_android, io.flutter.plugins.webviewflutter.WebViewFlutterPlugin", e26);
        }
    }
}
