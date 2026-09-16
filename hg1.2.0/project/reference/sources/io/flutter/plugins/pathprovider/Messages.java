package io.flutter.plugins.pathprovider;

import android.util.Log;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugins.pathprovider.Messages;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public class Messages {

    public static class FlutterError extends RuntimeException {
        public final String code;
        public final Object details;

        public FlutterError(String str, String str2, Object obj) {
            super(str2);
            this.code = str;
            this.details = obj;
        }
    }

    protected static ArrayList<Object> wrapError(Throwable th) {
        ArrayList<Object> arrayList = new ArrayList<>(3);
        if (th instanceof FlutterError) {
            FlutterError flutterError = (FlutterError) th;
            arrayList.add(flutterError.code);
            arrayList.add(flutterError.getMessage());
            arrayList.add(flutterError.details);
        } else {
            arrayList.add(th.toString());
            arrayList.add(th.getClass().getSimpleName());
            arrayList.add("Cause: " + th.getCause() + ", Stacktrace: " + Log.getStackTraceString(th));
        }
        return arrayList;
    }

    public enum StorageDirectory {
        ROOT(0),
        MUSIC(1),
        PODCASTS(2),
        RINGTONES(3),
        ALARMS(4),
        NOTIFICATIONS(5),
        PICTURES(6),
        MOVIES(7),
        DOWNLOADS(8),
        DCIM(9),
        DOCUMENTS(10);

        final int index;

        StorageDirectory(int i) {
            this.index = i;
        }
    }

    public interface PathProviderApi {
        String getApplicationCachePath();

        String getApplicationDocumentsPath();

        String getApplicationSupportPath();

        List<String> getExternalCachePaths();

        String getExternalStoragePath();

        List<String> getExternalStoragePaths(StorageDirectory storageDirectory);

        String getTemporaryPath();

        /* renamed from: io.flutter.plugins.pathprovider.Messages$PathProviderApi$-CC, reason: invalid class name */
        public final /* synthetic */ class CC {
            public static MessageCodec<Object> getCodec() {
                return new StandardMessageCodec();
            }

            public static void setup(BinaryMessenger binaryMessenger, final PathProviderApi pathProviderApi) {
                BasicMessageChannel basicMessageChannel = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.PathProviderApi.getTemporaryPath", getCodec(), binaryMessenger.makeBackgroundTaskQueue());
                if (pathProviderApi != null) {
                    basicMessageChannel.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.pathprovider.Messages$PathProviderApi$$ExternalSyntheticLambda0
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            Messages.PathProviderApi.CC.lambda$setup$0(pathProviderApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel2 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.PathProviderApi.getApplicationSupportPath", getCodec(), binaryMessenger.makeBackgroundTaskQueue());
                if (pathProviderApi != null) {
                    basicMessageChannel2.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.pathprovider.Messages$PathProviderApi$$ExternalSyntheticLambda1
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            Messages.PathProviderApi.CC.lambda$setup$1(pathProviderApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel2.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel3 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.PathProviderApi.getApplicationDocumentsPath", getCodec(), binaryMessenger.makeBackgroundTaskQueue());
                if (pathProviderApi != null) {
                    basicMessageChannel3.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.pathprovider.Messages$PathProviderApi$$ExternalSyntheticLambda2
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            Messages.PathProviderApi.CC.lambda$setup$2(pathProviderApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel3.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel4 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.PathProviderApi.getApplicationCachePath", getCodec(), binaryMessenger.makeBackgroundTaskQueue());
                if (pathProviderApi != null) {
                    basicMessageChannel4.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.pathprovider.Messages$PathProviderApi$$ExternalSyntheticLambda3
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            Messages.PathProviderApi.CC.lambda$setup$3(pathProviderApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel4.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel5 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.PathProviderApi.getExternalStoragePath", getCodec(), binaryMessenger.makeBackgroundTaskQueue());
                if (pathProviderApi != null) {
                    basicMessageChannel5.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.pathprovider.Messages$PathProviderApi$$ExternalSyntheticLambda4
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            Messages.PathProviderApi.CC.lambda$setup$4(pathProviderApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel5.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel6 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.PathProviderApi.getExternalCachePaths", getCodec(), binaryMessenger.makeBackgroundTaskQueue());
                if (pathProviderApi != null) {
                    basicMessageChannel6.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.pathprovider.Messages$PathProviderApi$$ExternalSyntheticLambda5
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            Messages.PathProviderApi.CC.lambda$setup$5(pathProviderApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel6.setMessageHandler(null);
                }
                BasicMessageChannel basicMessageChannel7 = new BasicMessageChannel(binaryMessenger, "dev.flutter.pigeon.PathProviderApi.getExternalStoragePaths", getCodec(), binaryMessenger.makeBackgroundTaskQueue());
                if (pathProviderApi != null) {
                    basicMessageChannel7.setMessageHandler(new BasicMessageChannel.MessageHandler() { // from class: io.flutter.plugins.pathprovider.Messages$PathProviderApi$$ExternalSyntheticLambda6
                        @Override // io.flutter.plugin.common.BasicMessageChannel.MessageHandler
                        public final void onMessage(Object obj, BasicMessageChannel.Reply reply) {
                            Messages.PathProviderApi.CC.lambda$setup$6(pathProviderApi, obj, reply);
                        }
                    });
                } else {
                    basicMessageChannel7.setMessageHandler(null);
                }
            }

            public static /* synthetic */ void lambda$setup$0(PathProviderApi pathProviderApi, Object obj, BasicMessageChannel.Reply reply) {
                ArrayList<Object> arrayList = new ArrayList<>();
                try {
                    arrayList.add(0, pathProviderApi.getTemporaryPath());
                } catch (Throwable th) {
                    arrayList = Messages.wrapError(th);
                }
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$1(PathProviderApi pathProviderApi, Object obj, BasicMessageChannel.Reply reply) {
                ArrayList<Object> arrayList = new ArrayList<>();
                try {
                    arrayList.add(0, pathProviderApi.getApplicationSupportPath());
                } catch (Throwable th) {
                    arrayList = Messages.wrapError(th);
                }
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$2(PathProviderApi pathProviderApi, Object obj, BasicMessageChannel.Reply reply) {
                ArrayList<Object> arrayList = new ArrayList<>();
                try {
                    arrayList.add(0, pathProviderApi.getApplicationDocumentsPath());
                } catch (Throwable th) {
                    arrayList = Messages.wrapError(th);
                }
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$3(PathProviderApi pathProviderApi, Object obj, BasicMessageChannel.Reply reply) {
                ArrayList<Object> arrayList = new ArrayList<>();
                try {
                    arrayList.add(0, pathProviderApi.getApplicationCachePath());
                } catch (Throwable th) {
                    arrayList = Messages.wrapError(th);
                }
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$4(PathProviderApi pathProviderApi, Object obj, BasicMessageChannel.Reply reply) {
                ArrayList<Object> arrayList = new ArrayList<>();
                try {
                    arrayList.add(0, pathProviderApi.getExternalStoragePath());
                } catch (Throwable th) {
                    arrayList = Messages.wrapError(th);
                }
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$5(PathProviderApi pathProviderApi, Object obj, BasicMessageChannel.Reply reply) {
                ArrayList<Object> arrayList = new ArrayList<>();
                try {
                    arrayList.add(0, pathProviderApi.getExternalCachePaths());
                } catch (Throwable th) {
                    arrayList = Messages.wrapError(th);
                }
                reply.reply(arrayList);
            }

            public static /* synthetic */ void lambda$setup$6(PathProviderApi pathProviderApi, Object obj, BasicMessageChannel.Reply reply) {
                ArrayList<Object> arrayList = new ArrayList<>();
                ArrayList arrayList2 = (ArrayList) obj;
                try {
                    arrayList.add(0, pathProviderApi.getExternalStoragePaths(arrayList2.get(0) == null ? null : StorageDirectory.values()[((Integer) arrayList2.get(0)).intValue()]));
                } catch (Throwable th) {
                    arrayList = Messages.wrapError(th);
                }
                reply.reply(arrayList);
            }
        }
    }
}
