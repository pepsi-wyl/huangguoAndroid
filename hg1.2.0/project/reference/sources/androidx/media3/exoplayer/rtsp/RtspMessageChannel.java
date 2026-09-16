package androidx.media3.exoplayer.rtsp;

import android.os.Handler;
import android.os.HandlerThread;
import androidx.media3.common.ParserException;
import androidx.media3.common.util.Assertions;
import androidx.media3.exoplayer.upstream.Loader;
import com.google.common.base.Charsets;
import com.google.common.collect.ImmutableList;
import com.google.common.primitives.Ints;
import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/* loaded from: classes.dex */
final class RtspMessageChannel implements Closeable {
    public static final Charset CHARSET = Charsets.UTF_8;
    public static final int DEFAULT_RTSP_PORT = 554;
    private static final String TAG = "RtspMessageChannel";
    private volatile boolean closed;
    private final MessageListener messageListener;
    private Sender sender;
    private Socket socket;
    private final Loader receiverLoader = new Loader("ExoPlayer:RtspMessageChannel:ReceiverLoader");
    private final Map<Integer, InterleavedBinaryDataListener> interleavedBinaryDataListeners = Collections.synchronizedMap(new HashMap());

    public interface InterleavedBinaryDataListener {
        void onInterleavedBinaryDataReceived(byte[] bArr);
    }

    public interface MessageListener {

        /* renamed from: androidx.media3.exoplayer.rtsp.RtspMessageChannel$MessageListener$-CC, reason: invalid class name */
        public final /* synthetic */ class CC {
            public static void $default$onReceivingFailed(MessageListener _this, Exception exc) {
            }

            public static void $default$onSendingFailed(MessageListener _this, List list, Exception exc) {
            }
        }

        void onReceivingFailed(Exception exc);

        void onRtspMessageReceived(List<String> list);

        void onSendingFailed(List<String> list, Exception exc);
    }

    public RtspMessageChannel(MessageListener messageListener) {
        this.messageListener = messageListener;
    }

    public void open(Socket socket) throws IOException {
        this.socket = socket;
        this.sender = new Sender(socket.getOutputStream());
        this.receiverLoader.startLoading(new Receiver(socket.getInputStream()), new LoaderCallbackImpl(), 0);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (this.closed) {
            return;
        }
        try {
            Sender sender = this.sender;
            if (sender != null) {
                sender.close();
            }
            this.receiverLoader.release();
            Socket socket = this.socket;
            if (socket != null) {
                socket.close();
            }
        } finally {
            this.closed = true;
        }
    }

    public void send(List<String> list) {
        Assertions.checkStateNotNull(this.sender);
        this.sender.send(list);
    }

    public void registerInterleavedBinaryDataListener(int i, InterleavedBinaryDataListener interleavedBinaryDataListener) {
        this.interleavedBinaryDataListeners.put(Integer.valueOf(i), interleavedBinaryDataListener);
    }

    /* JADX INFO: Access modifiers changed from: private */
    final class Sender implements Closeable {
        private final OutputStream outputStream;
        private final HandlerThread senderThread;
        private final Handler senderThreadHandler;

        public Sender(OutputStream outputStream) {
            this.outputStream = outputStream;
            HandlerThread handlerThread = new HandlerThread("ExoPlayer:RtspMessageChannel:Sender");
            this.senderThread = handlerThread;
            handlerThread.start();
            this.senderThreadHandler = new Handler(handlerThread.getLooper());
        }

        public void send(final List<String> list) {
            final byte[] bArrConvertMessageToByteArray = RtspMessageUtil.convertMessageToByteArray(list);
            this.senderThreadHandler.post(new Runnable() { // from class: androidx.media3.exoplayer.rtsp.RtspMessageChannel$Sender$$ExternalSyntheticLambda1
                @Override // java.lang.Runnable
                public final void run() throws IOException {
                    this.f$0.m270x8c7d4ead(bArrConvertMessageToByteArray, list);
                }
            });
        }

        /* renamed from: lambda$send$0$androidx-media3-exoplayer-rtsp-RtspMessageChannel$Sender, reason: not valid java name */
        /* synthetic */ void m270x8c7d4ead(byte[] bArr, List list) throws IOException {
            try {
                this.outputStream.write(bArr);
            } catch (Exception e) {
                if (RtspMessageChannel.this.closed) {
                    return;
                }
                RtspMessageChannel.this.messageListener.onSendingFailed(list, e);
            }
        }

        @Override // java.io.Closeable, java.lang.AutoCloseable
        public void close() {
            Handler handler = this.senderThreadHandler;
            final HandlerThread handlerThread = this.senderThread;
            Objects.requireNonNull(handlerThread);
            handler.post(new Runnable() { // from class: androidx.media3.exoplayer.rtsp.RtspMessageChannel$Sender$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    handlerThread.quit();
                }
            });
            try {
                this.senderThread.join();
            } catch (InterruptedException unused) {
                this.senderThread.interrupt();
            }
        }
    }

    private final class Receiver implements Loader.Loadable {
        private static final byte INTERLEAVED_MESSAGE_MARKER = 36;
        private final DataInputStream dataInputStream;
        private volatile boolean loadCanceled;
        private final MessageParser messageParser = new MessageParser();

        public Receiver(InputStream inputStream) {
            this.dataInputStream = new DataInputStream(inputStream);
        }

        @Override // androidx.media3.exoplayer.upstream.Loader.Loadable
        public void cancelLoad() {
            this.loadCanceled = true;
        }

        @Override // androidx.media3.exoplayer.upstream.Loader.Loadable
        public void load() throws IOException {
            while (!this.loadCanceled) {
                byte b = this.dataInputStream.readByte();
                if (b == 36) {
                    handleInterleavedBinaryData();
                } else {
                    handleRtspMessage(b);
                }
            }
        }

        private void handleRtspMessage(byte b) throws IOException {
            if (RtspMessageChannel.this.closed) {
                return;
            }
            RtspMessageChannel.this.messageListener.onRtspMessageReceived(this.messageParser.parseNext(b, this.dataInputStream));
        }

        private void handleInterleavedBinaryData() throws IOException {
            int unsignedByte = this.dataInputStream.readUnsignedByte();
            int unsignedShort = this.dataInputStream.readUnsignedShort();
            byte[] bArr = new byte[unsignedShort];
            this.dataInputStream.readFully(bArr, 0, unsignedShort);
            InterleavedBinaryDataListener interleavedBinaryDataListener = (InterleavedBinaryDataListener) RtspMessageChannel.this.interleavedBinaryDataListeners.get(Integer.valueOf(unsignedByte));
            if (interleavedBinaryDataListener == null || RtspMessageChannel.this.closed) {
                return;
            }
            interleavedBinaryDataListener.onInterleavedBinaryDataReceived(bArr);
        }
    }

    private final class LoaderCallbackImpl implements Loader.Callback<Receiver> {
        @Override // androidx.media3.exoplayer.upstream.Loader.Callback
        public void onLoadCanceled(Receiver receiver, long j, long j2, boolean z) {
        }

        @Override // androidx.media3.exoplayer.upstream.Loader.Callback
        public void onLoadCompleted(Receiver receiver, long j, long j2) {
        }

        private LoaderCallbackImpl() {
        }

        @Override // androidx.media3.exoplayer.upstream.Loader.Callback
        public Loader.LoadErrorAction onLoadError(Receiver receiver, long j, long j2, IOException iOException, int i) {
            if (!RtspMessageChannel.this.closed) {
                RtspMessageChannel.this.messageListener.onReceivingFailed(iOException);
            }
            return Loader.DONT_RETRY;
        }
    }

    private static final class MessageParser {
        private static final int STATE_READING_BODY = 3;
        private static final int STATE_READING_FIRST_LINE = 1;
        private static final int STATE_READING_HEADER = 2;
        private long messageBodyLength;
        private final List<String> messageLines = new ArrayList();
        private int state = 1;

        public ImmutableList<String> parseNext(byte b, DataInputStream dataInputStream) throws IOException {
            ImmutableList<String> immutableListAddMessageLine = addMessageLine(parseNextLine(b, dataInputStream));
            while (immutableListAddMessageLine == null) {
                if (this.state == 3) {
                    long j = this.messageBodyLength;
                    if (j > 0) {
                        int iCheckedCast = Ints.checkedCast(j);
                        Assertions.checkState(iCheckedCast != -1);
                        byte[] bArr = new byte[iCheckedCast];
                        dataInputStream.readFully(bArr, 0, iCheckedCast);
                        immutableListAddMessageLine = addMessageBody(bArr);
                    } else {
                        throw new IllegalStateException("Expects a greater than zero Content-Length.");
                    }
                } else {
                    immutableListAddMessageLine = addMessageLine(parseNextLine(dataInputStream.readByte(), dataInputStream));
                }
            }
            return immutableListAddMessageLine;
        }

        private static byte[] parseNextLine(byte b, DataInputStream dataInputStream) throws IOException {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            byte[] bArr = {b, dataInputStream.readByte()};
            byteArrayOutputStream.write(bArr);
            while (true) {
                if (bArr[0] != 13 || bArr[1] != 10) {
                    bArr[0] = bArr[1];
                    byte b2 = dataInputStream.readByte();
                    bArr[1] = b2;
                    byteArrayOutputStream.write(b2);
                } else {
                    return byteArrayOutputStream.toByteArray();
                }
            }
        }

        private ImmutableList<String> addMessageLine(byte[] bArr) throws ParserException {
            Assertions.checkArgument(bArr.length >= 2 && bArr[bArr.length - 2] == 13 && bArr[bArr.length - 1] == 10);
            String str = new String(bArr, 0, bArr.length - 2, RtspMessageChannel.CHARSET);
            this.messageLines.add(str);
            int i = this.state;
            if (i == 1) {
                if (!RtspMessageUtil.isRtspStartLine(str)) {
                    return null;
                }
                this.state = 2;
                return null;
            }
            if (i == 2) {
                long contentLengthHeader = RtspMessageUtil.parseContentLengthHeader(str);
                if (contentLengthHeader != -1) {
                    this.messageBodyLength = contentLengthHeader;
                }
                if (!str.isEmpty()) {
                    return null;
                }
                if (this.messageBodyLength > 0) {
                    this.state = 3;
                    return null;
                }
                ImmutableList<String> immutableListCopyOf = ImmutableList.copyOf((Collection) this.messageLines);
                reset();
                return immutableListCopyOf;
            }
            throw new IllegalStateException();
        }

        private ImmutableList<String> addMessageBody(byte[] bArr) {
            String str;
            Assertions.checkState(this.state == 3);
            if (bArr.length > 0 && bArr[bArr.length - 1] == 10) {
                if (bArr.length > 1 && bArr[bArr.length - 2] == 13) {
                    str = new String(bArr, 0, bArr.length - 2, RtspMessageChannel.CHARSET);
                } else {
                    str = new String(bArr, 0, bArr.length - 1, RtspMessageChannel.CHARSET);
                }
                this.messageLines.add(str);
                ImmutableList<String> immutableListCopyOf = ImmutableList.copyOf((Collection) this.messageLines);
                reset();
                return immutableListCopyOf;
            }
            throw new IllegalArgumentException("Message body is empty or does not end with a LF.");
        }

        private void reset() {
            this.messageLines.clear();
            this.state = 1;
            this.messageBodyLength = 0L;
        }
    }
}
