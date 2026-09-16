package androidx.media3.exoplayer.rtsp;

import androidx.media3.exoplayer.rtsp.RtpPacketReorderingQueue;
import java.util.Comparator;
import java.util.TreeSet;

/* loaded from: classes.dex */
final class RtpPacketReorderingQueue {
    static final int MAX_SEQUENCE_LEAP_ALLOWED = 1000;
    private static final int QUEUE_SIZE_THRESHOLD_FOR_RESET = 5000;
    private int lastDequeuedSequenceNumber;
    private int lastReceivedSequenceNumber;
    private final TreeSet<RtpPacketContainer> packetQueue = new TreeSet<>(new Comparator() { // from class: androidx.media3.exoplayer.rtsp.RtpPacketReorderingQueue$$ExternalSyntheticLambda0
        @Override // java.util.Comparator
        public final int compare(Object obj, Object obj2) {
            return RtpPacketReorderingQueue.calculateSequenceNumberShift(((RtpPacketReorderingQueue.RtpPacketContainer) obj).packet.sequenceNumber, ((RtpPacketReorderingQueue.RtpPacketContainer) obj2).packet.sequenceNumber);
        }
    });
    private boolean started;

    public RtpPacketReorderingQueue() {
        reset();
    }

    public synchronized void reset() {
        this.packetQueue.clear();
        this.started = false;
        this.lastDequeuedSequenceNumber = -1;
        this.lastReceivedSequenceNumber = -1;
    }

    public synchronized boolean offer(RtpPacket rtpPacket, long j) {
        if (this.packetQueue.size() >= 5000) {
            throw new IllegalStateException("Queue size limit of 5000 reached.");
        }
        int i = rtpPacket.sequenceNumber;
        if (!this.started) {
            reset();
            this.lastDequeuedSequenceNumber = RtpPacket.getPreviousSequenceNumber(i);
            this.started = true;
            addToQueue(new RtpPacketContainer(rtpPacket, j));
            return true;
        }
        if (Math.abs(calculateSequenceNumberShift(i, RtpPacket.getNextSequenceNumber(this.lastReceivedSequenceNumber))) < 1000) {
            if (calculateSequenceNumberShift(i, this.lastDequeuedSequenceNumber) <= 0) {
                return false;
            }
            addToQueue(new RtpPacketContainer(rtpPacket, j));
            return true;
        }
        this.lastDequeuedSequenceNumber = RtpPacket.getPreviousSequenceNumber(i);
        this.packetQueue.clear();
        addToQueue(new RtpPacketContainer(rtpPacket, j));
        return true;
    }

    public synchronized RtpPacket poll(long j) {
        if (this.packetQueue.isEmpty()) {
            return null;
        }
        RtpPacketContainer rtpPacketContainerFirst = this.packetQueue.first();
        int i = rtpPacketContainerFirst.packet.sequenceNumber;
        if (i != RtpPacket.getNextSequenceNumber(this.lastDequeuedSequenceNumber) && j < rtpPacketContainerFirst.receivedTimestampMs) {
            return null;
        }
        this.packetQueue.pollFirst();
        this.lastDequeuedSequenceNumber = i;
        return rtpPacketContainerFirst.packet;
    }

    private synchronized void addToQueue(RtpPacketContainer rtpPacketContainer) {
        this.lastReceivedSequenceNumber = rtpPacketContainer.packet.sequenceNumber;
        this.packetQueue.add(rtpPacketContainer);
    }

    /* JADX INFO: Access modifiers changed from: private */
    static final class RtpPacketContainer {
        public final RtpPacket packet;
        public final long receivedTimestampMs;

        public RtpPacketContainer(RtpPacket rtpPacket, long j) {
            this.packet = rtpPacket;
            this.receivedTimestampMs = j;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static int calculateSequenceNumberShift(int i, int i2) {
        int iMin;
        int i3 = i - i2;
        return (Math.abs(i3) <= 1000 || (iMin = (Math.min(i, i2) - Math.max(i, i2)) + 65535) >= 1000) ? i3 : i < i2 ? iMin : -iMin;
    }
}
