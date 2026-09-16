package androidx.media3.extractor.text.dvb;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.util.SparseArray;
import androidx.core.view.ViewCompat;
import androidx.media3.common.C;
import androidx.media3.common.text.Cue;
import androidx.media3.common.util.Consumer;
import androidx.media3.common.util.Log;
import androidx.media3.common.util.ParsableBitArray;
import androidx.media3.common.util.ParsableByteArray;
import androidx.media3.common.util.Util;
import androidx.media3.exoplayer.trackselection.AdaptiveTrackSelection;
import androidx.media3.extractor.text.CuesWithTiming;
import androidx.media3.extractor.text.Subtitle;
import androidx.media3.extractor.text.SubtitleParser;
import androidx.media3.extractor.ts.TsExtractor;
import com.google.common.base.Ascii;
import com.google.common.collect.ImmutableList;
import java.util.ArrayList;
import java.util.List;
import kotlinx.coroutines.scheduling.WorkQueueKt;

/* loaded from: classes.dex */
public final class DvbParser implements SubtitleParser {
    public static final int CUE_REPLACEMENT_BEHAVIOR = 2;
    private static final int DATA_TYPE_24_TABLE_DATA = 32;
    private static final int DATA_TYPE_28_TABLE_DATA = 33;
    private static final int DATA_TYPE_2BP_CODE_STRING = 16;
    private static final int DATA_TYPE_48_TABLE_DATA = 34;
    private static final int DATA_TYPE_4BP_CODE_STRING = 17;
    private static final int DATA_TYPE_8BP_CODE_STRING = 18;
    private static final int DATA_TYPE_END_LINE = 240;
    private static final int OBJECT_CODING_PIXELS = 0;
    private static final int OBJECT_CODING_STRING = 1;
    private static final int PAGE_STATE_NORMAL = 0;
    private static final int REGION_DEPTH_4_BIT = 2;
    private static final int REGION_DEPTH_8_BIT = 3;
    private static final int SEGMENT_TYPE_CLUT_DEFINITION = 18;
    private static final int SEGMENT_TYPE_DISPLAY_DEFINITION = 20;
    private static final int SEGMENT_TYPE_OBJECT_DATA = 19;
    private static final int SEGMENT_TYPE_PAGE_COMPOSITION = 16;
    private static final int SEGMENT_TYPE_REGION_COMPOSITION = 17;
    private static final String TAG = "DvbParser";
    private static final byte[] defaultMap2To4 = {0, 7, 8, Ascii.SI};
    private static final byte[] defaultMap2To8 = {0, 119, -120, -1};
    private static final byte[] defaultMap4To8 = {0, 17, 34, 51, 68, 85, 102, 119, -120, -103, -86, -69, -52, -35, -18, -1};
    private Bitmap bitmap;
    private final Canvas canvas;
    private final ClutDefinition defaultClutDefinition;
    private final DisplayDefinition defaultDisplayDefinition;
    private final Paint defaultPaint;
    private final Paint fillRegionPaint;
    private final SubtitleService subtitleService;

    private static int getColor(int i, int i2, int i3, int i4) {
        return (i << 24) | (i2 << 16) | (i3 << 8) | i4;
    }

    @Override // androidx.media3.extractor.text.SubtitleParser
    public int getCueReplacementBehavior() {
        return 2;
    }

    @Override // androidx.media3.extractor.text.SubtitleParser
    public /* synthetic */ void parse(byte[] bArr, SubtitleParser.OutputOptions outputOptions, Consumer consumer) {
        parse(bArr, 0, bArr.length, outputOptions, consumer);
    }

    @Override // androidx.media3.extractor.text.SubtitleParser
    public /* synthetic */ Subtitle parseToLegacySubtitle(byte[] bArr, int i, int i2) {
        return SubtitleParser.CC.$default$parseToLegacySubtitle(this, bArr, i, i2);
    }

    public DvbParser(List<byte[]> list) {
        ParsableByteArray parsableByteArray = new ParsableByteArray(list.get(0));
        int unsignedShort = parsableByteArray.readUnsignedShort();
        int unsignedShort2 = parsableByteArray.readUnsignedShort();
        Paint paint = new Paint();
        this.defaultPaint = paint;
        paint.setStyle(Paint.Style.FILL_AND_STROKE);
        paint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.SRC));
        paint.setPathEffect(null);
        Paint paint2 = new Paint();
        this.fillRegionPaint = paint2;
        paint2.setStyle(Paint.Style.FILL);
        paint2.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.DST_OVER));
        paint2.setPathEffect(null);
        this.canvas = new Canvas();
        this.defaultDisplayDefinition = new DisplayDefinition(AdaptiveTrackSelection.DEFAULT_MAX_HEIGHT_TO_DISCARD, 575, 0, AdaptiveTrackSelection.DEFAULT_MAX_HEIGHT_TO_DISCARD, 0, 575);
        this.defaultClutDefinition = new ClutDefinition(0, generateDefault2BitClutEntries(), generateDefault4BitClutEntries(), generateDefault8BitClutEntries());
        this.subtitleService = new SubtitleService(unsignedShort, unsignedShort2);
    }

    @Override // androidx.media3.extractor.text.SubtitleParser
    public void reset() {
        this.subtitleService.reset();
    }

    @Override // androidx.media3.extractor.text.SubtitleParser
    public void parse(byte[] bArr, int i, int i2, SubtitleParser.OutputOptions outputOptions, Consumer<CuesWithTiming> consumer) {
        ParsableBitArray parsableBitArray = new ParsableBitArray(bArr, i2 + i);
        parsableBitArray.setPosition(i);
        consumer.accept(parse(parsableBitArray));
    }

    private CuesWithTiming parse(ParsableBitArray parsableBitArray) {
        DisplayDefinition displayDefinition;
        int i;
        int i2;
        SparseArray<RegionObject> sparseArray;
        while (parsableBitArray.bitsLeft() >= 48 && parsableBitArray.readBits(8) == 15) {
            parseSubtitlingSegment(parsableBitArray, this.subtitleService);
        }
        PageComposition pageComposition = this.subtitleService.pageComposition;
        if (pageComposition == null) {
            return new CuesWithTiming(ImmutableList.of(), C.TIME_UNSET, C.TIME_UNSET);
        }
        if (this.subtitleService.displayDefinition != null) {
            displayDefinition = this.subtitleService.displayDefinition;
        } else {
            displayDefinition = this.defaultDisplayDefinition;
        }
        if (this.bitmap == null || displayDefinition.width + 1 != this.bitmap.getWidth() || displayDefinition.height + 1 != this.bitmap.getHeight()) {
            Bitmap bitmapCreateBitmap = Bitmap.createBitmap(displayDefinition.width + 1, displayDefinition.height + 1, Bitmap.Config.ARGB_8888);
            this.bitmap = bitmapCreateBitmap;
            this.canvas.setBitmap(bitmapCreateBitmap);
        }
        ArrayList arrayList = new ArrayList();
        SparseArray<PageRegion> sparseArray2 = pageComposition.regions;
        for (int i3 = 0; i3 < sparseArray2.size(); i3++) {
            this.canvas.save();
            PageRegion pageRegionValueAt = sparseArray2.valueAt(i3);
            RegionComposition regionComposition = this.subtitleService.regions.get(sparseArray2.keyAt(i3));
            int i4 = pageRegionValueAt.horizontalAddress + displayDefinition.horizontalPositionMinimum;
            int i5 = pageRegionValueAt.verticalAddress + displayDefinition.verticalPositionMinimum;
            this.canvas.clipRect(i4, i5, Math.min(regionComposition.width + i4, displayDefinition.horizontalPositionMaximum), Math.min(regionComposition.height + i5, displayDefinition.verticalPositionMaximum));
            ClutDefinition clutDefinition = this.subtitleService.cluts.get(regionComposition.clutId);
            if (clutDefinition == null && (clutDefinition = this.subtitleService.ancillaryCluts.get(regionComposition.clutId)) == null) {
                clutDefinition = this.defaultClutDefinition;
            }
            SparseArray<RegionObject> sparseArray3 = regionComposition.regionObjects;
            int i6 = 0;
            while (i6 < sparseArray3.size()) {
                int iKeyAt = sparseArray3.keyAt(i6);
                RegionObject regionObjectValueAt = sparseArray3.valueAt(i6);
                ObjectData objectData = this.subtitleService.objects.get(iKeyAt);
                ObjectData objectData2 = objectData == null ? this.subtitleService.ancillaryObjects.get(iKeyAt) : objectData;
                if (objectData2 != null) {
                    i2 = i6;
                    sparseArray = sparseArray3;
                    paintPixelDataSubBlocks(objectData2, clutDefinition, regionComposition.depth, regionObjectValueAt.horizontalPosition + i4, i5 + regionObjectValueAt.verticalPosition, objectData2.nonModifyingColorFlag ? null : this.defaultPaint, this.canvas);
                } else {
                    i2 = i6;
                    sparseArray = sparseArray3;
                }
                i6 = i2 + 1;
                sparseArray3 = sparseArray;
            }
            if (regionComposition.fillFlag) {
                if (regionComposition.depth == 3) {
                    i = clutDefinition.clutEntries8Bit[regionComposition.pixelCode8Bit];
                } else if (regionComposition.depth == 2) {
                    i = clutDefinition.clutEntries4Bit[regionComposition.pixelCode4Bit];
                } else {
                    i = clutDefinition.clutEntries2Bit[regionComposition.pixelCode2Bit];
                }
                this.fillRegionPaint.setColor(i);
                this.canvas.drawRect(i4, i5, regionComposition.width + i4, regionComposition.height + i5, this.fillRegionPaint);
            }
            arrayList.add(new Cue.Builder().setBitmap(Bitmap.createBitmap(this.bitmap, i4, i5, regionComposition.width, regionComposition.height)).setPosition(i4 / displayDefinition.width).setPositionAnchor(0).setLine(i5 / displayDefinition.height, 0).setLineAnchor(0).setSize(regionComposition.width / displayDefinition.width).setBitmapHeight(regionComposition.height / displayDefinition.height).build());
            this.canvas.drawColor(0, PorterDuff.Mode.CLEAR);
            this.canvas.restore();
        }
        return new CuesWithTiming(arrayList, C.TIME_UNSET, C.TIME_UNSET);
    }

    private static void parseSubtitlingSegment(ParsableBitArray parsableBitArray, SubtitleService subtitleService) {
        RegionComposition regionComposition;
        int bits = parsableBitArray.readBits(8);
        int bits2 = parsableBitArray.readBits(16);
        int bits3 = parsableBitArray.readBits(16);
        int bytePosition = parsableBitArray.getBytePosition() + bits3;
        if (bits3 * 8 > parsableBitArray.bitsLeft()) {
            Log.w(TAG, "Data field length exceeds limit");
            parsableBitArray.skipBits(parsableBitArray.bitsLeft());
            return;
        }
        switch (bits) {
            case 16:
                if (bits2 == subtitleService.subtitlePageId) {
                    PageComposition pageComposition = subtitleService.pageComposition;
                    PageComposition pageComposition2 = parsePageComposition(parsableBitArray, bits3);
                    if (pageComposition2.state != 0) {
                        subtitleService.pageComposition = pageComposition2;
                        subtitleService.regions.clear();
                        subtitleService.cluts.clear();
                        subtitleService.objects.clear();
                        break;
                    } else if (pageComposition != null && pageComposition.version != pageComposition2.version) {
                        subtitleService.pageComposition = pageComposition2;
                        break;
                    }
                }
                break;
            case 17:
                PageComposition pageComposition3 = subtitleService.pageComposition;
                if (bits2 == subtitleService.subtitlePageId && pageComposition3 != null) {
                    RegionComposition regionComposition2 = parseRegionComposition(parsableBitArray, bits3);
                    if (pageComposition3.state == 0 && (regionComposition = subtitleService.regions.get(regionComposition2.id)) != null) {
                        regionComposition2.mergeFrom(regionComposition);
                    }
                    subtitleService.regions.put(regionComposition2.id, regionComposition2);
                    break;
                }
                break;
            case 18:
                if (bits2 == subtitleService.subtitlePageId) {
                    ClutDefinition clutDefinition = parseClutDefinition(parsableBitArray, bits3);
                    subtitleService.cluts.put(clutDefinition.id, clutDefinition);
                    break;
                } else if (bits2 == subtitleService.ancillaryPageId) {
                    ClutDefinition clutDefinition2 = parseClutDefinition(parsableBitArray, bits3);
                    subtitleService.ancillaryCluts.put(clutDefinition2.id, clutDefinition2);
                    break;
                }
                break;
            case 19:
                if (bits2 == subtitleService.subtitlePageId) {
                    ObjectData objectData = parseObjectData(parsableBitArray);
                    subtitleService.objects.put(objectData.id, objectData);
                    break;
                } else if (bits2 == subtitleService.ancillaryPageId) {
                    ObjectData objectData2 = parseObjectData(parsableBitArray);
                    subtitleService.ancillaryObjects.put(objectData2.id, objectData2);
                    break;
                }
                break;
            case 20:
                if (bits2 == subtitleService.subtitlePageId) {
                    subtitleService.displayDefinition = parseDisplayDefinition(parsableBitArray);
                    break;
                }
                break;
        }
        parsableBitArray.skipBytes(bytePosition - parsableBitArray.getBytePosition());
    }

    private static DisplayDefinition parseDisplayDefinition(ParsableBitArray parsableBitArray) {
        int i;
        int bits;
        int i2;
        int i3;
        parsableBitArray.skipBits(4);
        boolean bit = parsableBitArray.readBit();
        parsableBitArray.skipBits(3);
        int bits2 = parsableBitArray.readBits(16);
        int bits3 = parsableBitArray.readBits(16);
        if (bit) {
            int bits4 = parsableBitArray.readBits(16);
            int bits5 = parsableBitArray.readBits(16);
            int bits6 = parsableBitArray.readBits(16);
            bits = parsableBitArray.readBits(16);
            i = bits5;
            i3 = bits6;
            i2 = bits4;
        } else {
            i = bits2;
            bits = bits3;
            i2 = 0;
            i3 = 0;
        }
        return new DisplayDefinition(bits2, bits3, i2, i, i3, bits);
    }

    private static PageComposition parsePageComposition(ParsableBitArray parsableBitArray, int i) {
        int bits = parsableBitArray.readBits(8);
        int bits2 = parsableBitArray.readBits(4);
        int bits3 = parsableBitArray.readBits(2);
        parsableBitArray.skipBits(2);
        int i2 = i - 2;
        SparseArray sparseArray = new SparseArray();
        while (i2 > 0) {
            int bits4 = parsableBitArray.readBits(8);
            parsableBitArray.skipBits(8);
            i2 -= 6;
            sparseArray.put(bits4, new PageRegion(parsableBitArray.readBits(16), parsableBitArray.readBits(16)));
        }
        return new PageComposition(bits, bits2, bits3, sparseArray);
    }

    private static RegionComposition parseRegionComposition(ParsableBitArray parsableBitArray, int i) {
        int bits;
        int bits2;
        int bits3 = parsableBitArray.readBits(8);
        parsableBitArray.skipBits(4);
        boolean bit = parsableBitArray.readBit();
        parsableBitArray.skipBits(3);
        int i2 = 16;
        int bits4 = parsableBitArray.readBits(16);
        int bits5 = parsableBitArray.readBits(16);
        int bits6 = parsableBitArray.readBits(3);
        int bits7 = parsableBitArray.readBits(3);
        int i3 = 2;
        parsableBitArray.skipBits(2);
        int bits8 = parsableBitArray.readBits(8);
        int bits9 = parsableBitArray.readBits(8);
        int bits10 = parsableBitArray.readBits(4);
        int bits11 = parsableBitArray.readBits(2);
        parsableBitArray.skipBits(2);
        int i4 = i - 10;
        SparseArray sparseArray = new SparseArray();
        while (i4 > 0) {
            int bits12 = parsableBitArray.readBits(i2);
            int bits13 = parsableBitArray.readBits(i3);
            int bits14 = parsableBitArray.readBits(i3);
            int bits15 = parsableBitArray.readBits(12);
            int i5 = bits11;
            parsableBitArray.skipBits(4);
            int bits16 = parsableBitArray.readBits(12);
            int i6 = i4 - 6;
            if (bits13 == 1 || bits13 == 2) {
                i4 -= 8;
                bits = parsableBitArray.readBits(8);
                bits2 = parsableBitArray.readBits(8);
            } else {
                i4 = i6;
                bits = 0;
                bits2 = 0;
            }
            sparseArray.put(bits12, new RegionObject(bits13, bits14, bits15, bits16, bits, bits2));
            bits11 = i5;
            i3 = 2;
            i2 = 16;
        }
        return new RegionComposition(bits3, bit, bits4, bits5, bits6, bits7, bits8, bits9, bits10, bits11, sparseArray);
    }

    private static ClutDefinition parseClutDefinition(ParsableBitArray parsableBitArray, int i) {
        int bits;
        int i2;
        int bits2;
        int bits3;
        int bits4;
        int i3 = 8;
        int bits5 = parsableBitArray.readBits(8);
        parsableBitArray.skipBits(8);
        int i4 = 2;
        int i5 = i - 2;
        int[] iArrGenerateDefault2BitClutEntries = generateDefault2BitClutEntries();
        int[] iArrGenerateDefault4BitClutEntries = generateDefault4BitClutEntries();
        int[] iArrGenerateDefault8BitClutEntries = generateDefault8BitClutEntries();
        while (i5 > 0) {
            int bits6 = parsableBitArray.readBits(i3);
            int bits7 = parsableBitArray.readBits(i3);
            int[] iArr = (bits7 & 128) != 0 ? iArrGenerateDefault2BitClutEntries : (bits7 & 64) != 0 ? iArrGenerateDefault4BitClutEntries : iArrGenerateDefault8BitClutEntries;
            if ((bits7 & 1) != 0) {
                bits3 = parsableBitArray.readBits(i3);
                bits4 = parsableBitArray.readBits(i3);
                bits = parsableBitArray.readBits(i3);
                bits2 = parsableBitArray.readBits(i3);
                i2 = i5 - 6;
            } else {
                int bits8 = parsableBitArray.readBits(6) << i4;
                int bits9 = parsableBitArray.readBits(4) << 4;
                bits = parsableBitArray.readBits(4) << 4;
                i2 = i5 - 4;
                bits2 = parsableBitArray.readBits(i4) << 6;
                bits3 = bits8;
                bits4 = bits9;
            }
            if (bits3 == 0) {
                bits4 = 0;
                bits = 0;
                bits2 = 255;
            }
            double d = bits3;
            double d2 = bits4 - 128;
            double d3 = bits - 128;
            iArr[bits6] = getColor((byte) (255 - (bits2 & 255)), Util.constrainValue((int) (d + (1.402d * d2)), 0, 255), Util.constrainValue((int) ((d - (0.34414d * d3)) - (d2 * 0.71414d)), 0, 255), Util.constrainValue((int) (d + (d3 * 1.772d)), 0, 255));
            i5 = i2;
            bits5 = bits5;
            i3 = 8;
            i4 = 2;
        }
        return new ClutDefinition(bits5, iArrGenerateDefault2BitClutEntries, iArrGenerateDefault4BitClutEntries, iArrGenerateDefault8BitClutEntries);
    }

    private static ObjectData parseObjectData(ParsableBitArray parsableBitArray) {
        int bits = parsableBitArray.readBits(16);
        parsableBitArray.skipBits(4);
        int bits2 = parsableBitArray.readBits(2);
        boolean bit = parsableBitArray.readBit();
        parsableBitArray.skipBits(1);
        byte[] bArr = Util.EMPTY_BYTE_ARRAY;
        byte[] bArr2 = Util.EMPTY_BYTE_ARRAY;
        if (bits2 == 1) {
            parsableBitArray.skipBits(parsableBitArray.readBits(8) * 16);
        } else if (bits2 == 0) {
            int bits3 = parsableBitArray.readBits(16);
            int bits4 = parsableBitArray.readBits(16);
            if (bits3 > 0) {
                bArr = new byte[bits3];
                parsableBitArray.readBytes(bArr, 0, bits3);
            }
            if (bits4 > 0) {
                bArr2 = new byte[bits4];
                parsableBitArray.readBytes(bArr2, 0, bits4);
            } else {
                bArr2 = bArr;
            }
        }
        return new ObjectData(bits, bit, bArr, bArr2);
    }

    private static int[] generateDefault2BitClutEntries() {
        return new int[]{0, -1, ViewCompat.MEASURED_STATE_MASK, -8421505};
    }

    private static int[] generateDefault4BitClutEntries() {
        int[] iArr = new int[16];
        iArr[0] = 0;
        for (int i = 1; i < 16; i++) {
            if (i < 8) {
                iArr[i] = getColor(255, (i & 1) != 0 ? 255 : 0, (i & 2) != 0 ? 255 : 0, (i & 4) != 0 ? 255 : 0);
            } else {
                int i2 = i & 1;
                int i3 = WorkQueueKt.MASK;
                int i4 = i2 != 0 ? WorkQueueKt.MASK : 0;
                int i5 = (i & 2) != 0 ? WorkQueueKt.MASK : 0;
                if ((i & 4) == 0) {
                    i3 = 0;
                }
                iArr[i] = getColor(255, i4, i5, i3);
            }
        }
        return iArr;
    }

    private static int[] generateDefault8BitClutEntries() {
        int[] iArr = new int[256];
        iArr[0] = 0;
        for (int i = 0; i < 256; i++) {
            if (i < 8) {
                iArr[i] = getColor(63, (i & 1) != 0 ? 255 : 0, (i & 2) != 0 ? 255 : 0, (i & 4) == 0 ? 0 : 255);
            } else {
                int i2 = i & TsExtractor.TS_STREAM_TYPE_DTS_HD;
                if (i2 == 0) {
                    iArr[i] = getColor(255, ((i & 1) != 0 ? 85 : 0) + ((i & 16) != 0 ? 170 : 0), ((i & 2) != 0 ? 85 : 0) + ((i & 32) != 0 ? 170 : 0), ((i & 4) == 0 ? 0 : 85) + ((i & 64) == 0 ? 0 : 170));
                } else if (i2 == 8) {
                    iArr[i] = getColor(WorkQueueKt.MASK, ((i & 1) != 0 ? 85 : 0) + ((i & 16) != 0 ? 170 : 0), ((i & 2) != 0 ? 85 : 0) + ((i & 32) != 0 ? 170 : 0), ((i & 4) == 0 ? 0 : 85) + ((i & 64) == 0 ? 0 : 170));
                } else if (i2 == 128) {
                    iArr[i] = getColor(255, ((i & 1) != 0 ? 43 : 0) + WorkQueueKt.MASK + ((i & 16) != 0 ? 85 : 0), ((i & 2) != 0 ? 43 : 0) + WorkQueueKt.MASK + ((i & 32) != 0 ? 85 : 0), ((i & 4) == 0 ? 0 : 43) + WorkQueueKt.MASK + ((i & 64) == 0 ? 0 : 85));
                } else if (i2 == 136) {
                    iArr[i] = getColor(255, ((i & 1) != 0 ? 43 : 0) + ((i & 16) != 0 ? 85 : 0), ((i & 2) != 0 ? 43 : 0) + ((i & 32) != 0 ? 85 : 0), ((i & 4) == 0 ? 0 : 43) + ((i & 64) == 0 ? 0 : 85));
                }
            }
        }
        return iArr;
    }

    private static void paintPixelDataSubBlocks(ObjectData objectData, ClutDefinition clutDefinition, int i, int i2, int i3, Paint paint, Canvas canvas) {
        int[] iArr;
        if (i == 3) {
            iArr = clutDefinition.clutEntries8Bit;
        } else if (i == 2) {
            iArr = clutDefinition.clutEntries4Bit;
        } else {
            iArr = clutDefinition.clutEntries2Bit;
        }
        int[] iArr2 = iArr;
        paintPixelDataSubBlock(objectData.topFieldData, iArr2, i, i2, i3, paint, canvas);
        paintPixelDataSubBlock(objectData.bottomFieldData, iArr2, i, i2, i3 + 1, paint, canvas);
    }

    private static void paintPixelDataSubBlock(byte[] bArr, int[] iArr, int i, int i2, int i3, Paint paint, Canvas canvas) {
        byte[] bArr2;
        byte[] bArr3;
        byte[] bArr4;
        ParsableBitArray parsableBitArray = new ParsableBitArray(bArr);
        int iPaint2BitPixelCodeString = i2;
        int i4 = i3;
        byte[] bArrBuildClutMapTable = null;
        byte[] bArrBuildClutMapTable2 = null;
        byte[] bArrBuildClutMapTable3 = null;
        while (parsableBitArray.bitsLeft() != 0) {
            int bits = parsableBitArray.readBits(8);
            if (bits != 240) {
                switch (bits) {
                    case 16:
                        if (i != 3) {
                            if (i == 2) {
                                bArr3 = bArrBuildClutMapTable3 == null ? defaultMap2To4 : bArrBuildClutMapTable3;
                            } else {
                                bArr2 = null;
                                iPaint2BitPixelCodeString = paint2BitPixelCodeString(parsableBitArray, iArr, bArr2, iPaint2BitPixelCodeString, i4, paint, canvas);
                                parsableBitArray.byteAlign();
                                break;
                            }
                        } else {
                            bArr3 = bArrBuildClutMapTable == null ? defaultMap2To8 : bArrBuildClutMapTable;
                        }
                        bArr2 = bArr3;
                        iPaint2BitPixelCodeString = paint2BitPixelCodeString(parsableBitArray, iArr, bArr2, iPaint2BitPixelCodeString, i4, paint, canvas);
                        parsableBitArray.byteAlign();
                    case 17:
                        if (i == 3) {
                            bArr4 = bArrBuildClutMapTable2 == null ? defaultMap4To8 : bArrBuildClutMapTable2;
                        } else {
                            bArr4 = null;
                        }
                        iPaint2BitPixelCodeString = paint4BitPixelCodeString(parsableBitArray, iArr, bArr4, iPaint2BitPixelCodeString, i4, paint, canvas);
                        parsableBitArray.byteAlign();
                        break;
                    case 18:
                        iPaint2BitPixelCodeString = paint8BitPixelCodeString(parsableBitArray, iArr, null, iPaint2BitPixelCodeString, i4, paint, canvas);
                        break;
                    default:
                        switch (bits) {
                            case 32:
                                bArrBuildClutMapTable3 = buildClutMapTable(4, 4, parsableBitArray);
                                break;
                            case 33:
                                bArrBuildClutMapTable = buildClutMapTable(4, 8, parsableBitArray);
                                break;
                            case 34:
                                bArrBuildClutMapTable2 = buildClutMapTable(16, 8, parsableBitArray);
                                break;
                        }
                }
            } else {
                i4 += 2;
                iPaint2BitPixelCodeString = i2;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0063 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0067  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0083 A[LOOP:0: B:3:0x0009->B:33:0x0083, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0082 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static int paint2BitPixelCodeString(androidx.media3.common.util.ParsableBitArray r13, int[] r14, byte[] r15, int r16, int r17, android.graphics.Paint r18, android.graphics.Canvas r19) {
        /*
            r0 = r13
            r1 = r17
            r8 = r18
            r9 = 0
            r10 = r16
            r2 = 0
        L9:
            r3 = 2
            int r4 = r13.readBits(r3)
            r5 = 1
            if (r4 == 0) goto L14
            r11 = r2
        L12:
            r12 = 1
            goto L61
        L14:
            boolean r4 = r13.readBit()
            r6 = 3
            if (r4 == 0) goto L28
            int r4 = r13.readBits(r6)
            int r4 = r4 + r6
            int r3 = r13.readBits(r3)
        L24:
            r11 = r2
            r12 = r4
            r4 = r3
            goto L61
        L28:
            boolean r4 = r13.readBit()
            if (r4 == 0) goto L31
            r11 = r2
            r4 = 0
            goto L12
        L31:
            int r4 = r13.readBits(r3)
            if (r4 == 0) goto L5e
            if (r4 == r5) goto L5a
            if (r4 == r3) goto L4e
            if (r4 == r6) goto L41
            r11 = r2
            r4 = 0
        L3f:
            r12 = 0
            goto L61
        L41:
            r4 = 8
            int r4 = r13.readBits(r4)
            int r4 = r4 + 29
            int r3 = r13.readBits(r3)
            goto L24
        L4e:
            r4 = 4
            int r4 = r13.readBits(r4)
            int r4 = r4 + 12
            int r3 = r13.readBits(r3)
            goto L24
        L5a:
            r11 = r2
            r4 = 0
            r12 = 2
            goto L61
        L5e:
            r4 = 0
            r11 = 1
            goto L3f
        L61:
            if (r12 == 0) goto L7f
            if (r8 == 0) goto L7f
            if (r15 == 0) goto L69
            r4 = r15[r4]
        L69:
            r2 = r14[r4]
            r8.setColor(r2)
            float r3 = (float) r10
            float r4 = (float) r1
            int r2 = r10 + r12
            float r6 = (float) r2
            int r2 = r1 + 1
            float r7 = (float) r2
            r2 = r19
            r5 = r6
            r6 = r7
            r7 = r18
            r2.drawRect(r3, r4, r5, r6, r7)
        L7f:
            int r10 = r10 + r12
            if (r11 == 0) goto L83
            return r10
        L83:
            r2 = r11
            goto L9
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.media3.extractor.text.dvb.DvbParser.paint2BitPixelCodeString(androidx.media3.common.util.ParsableBitArray, int[], byte[], int, int, android.graphics.Paint, android.graphics.Canvas):int");
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x0074  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0090 A[LOOP:0: B:3:0x0009->B:36:0x0090, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:37:0x008f A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static int paint4BitPixelCodeString(androidx.media3.common.util.ParsableBitArray r13, int[] r14, byte[] r15, int r16, int r17, android.graphics.Paint r18, android.graphics.Canvas r19) {
        /*
            r0 = r13
            r1 = r17
            r8 = r18
            r9 = 0
            r10 = r16
            r2 = 0
        L9:
            r3 = 4
            int r4 = r13.readBits(r3)
            r5 = 1
            if (r4 == 0) goto L15
            r11 = r2
        L12:
            r12 = 1
            goto L6e
        L15:
            boolean r4 = r13.readBit()
            r6 = 3
            if (r4 != 0) goto L2b
            int r3 = r13.readBits(r6)
            if (r3 == 0) goto L28
            int r3 = r3 + 2
            r11 = r2
            r12 = r3
            r4 = 0
            goto L6e
        L28:
            r4 = 0
            r11 = 1
            goto L4d
        L2b:
            boolean r4 = r13.readBit()
            r7 = 2
            if (r4 != 0) goto L3f
            int r4 = r13.readBits(r7)
            int r4 = r4 + r3
            int r3 = r13.readBits(r3)
        L3b:
            r11 = r2
            r12 = r4
            r4 = r3
            goto L6e
        L3f:
            int r4 = r13.readBits(r7)
            if (r4 == 0) goto L6b
            if (r4 == r5) goto L67
            if (r4 == r7) goto L5c
            if (r4 == r6) goto L4f
            r11 = r2
            r4 = 0
        L4d:
            r12 = 0
            goto L6e
        L4f:
            r4 = 8
            int r4 = r13.readBits(r4)
            int r4 = r4 + 25
            int r3 = r13.readBits(r3)
            goto L3b
        L5c:
            int r4 = r13.readBits(r3)
            int r4 = r4 + 9
            int r3 = r13.readBits(r3)
            goto L3b
        L67:
            r11 = r2
            r4 = 0
            r12 = 2
            goto L6e
        L6b:
            r11 = r2
            r4 = 0
            goto L12
        L6e:
            if (r12 == 0) goto L8c
            if (r8 == 0) goto L8c
            if (r15 == 0) goto L76
            r4 = r15[r4]
        L76:
            r2 = r14[r4]
            r8.setColor(r2)
            float r3 = (float) r10
            float r4 = (float) r1
            int r2 = r10 + r12
            float r6 = (float) r2
            int r2 = r1 + 1
            float r7 = (float) r2
            r2 = r19
            r5 = r6
            r6 = r7
            r7 = r18
            r2.drawRect(r3, r4, r5, r6, r7)
        L8c:
            int r10 = r10 + r12
            if (r11 == 0) goto L90
            return r10
        L90:
            r2 = r11
            goto L9
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.media3.extractor.text.dvb.DvbParser.paint4BitPixelCodeString(androidx.media3.common.util.ParsableBitArray, int[], byte[], int, int, android.graphics.Paint, android.graphics.Canvas):int");
    }

    private static int paint8BitPixelCodeString(ParsableBitArray parsableBitArray, int[] iArr, byte[] bArr, int i, int i2, Paint paint, Canvas canvas) {
        boolean z;
        int bits;
        int i3 = i;
        boolean z2 = false;
        while (true) {
            int bits2 = parsableBitArray.readBits(8);
            if (bits2 != 0) {
                z = z2;
                bits = 1;
            } else if (!parsableBitArray.readBit()) {
                int bits3 = parsableBitArray.readBits(7);
                if (bits3 != 0) {
                    z = z2;
                    bits = bits3;
                    bits2 = 0;
                } else {
                    bits2 = 0;
                    z = true;
                    bits = 0;
                }
            } else {
                z = z2;
                bits = parsableBitArray.readBits(7);
                bits2 = parsableBitArray.readBits(8);
            }
            if (bits != 0 && paint != null) {
                if (bArr != null) {
                    bits2 = bArr[bits2];
                }
                paint.setColor(iArr[bits2]);
                canvas.drawRect(i3, i2, i3 + bits, i2 + 1, paint);
            }
            i3 += bits;
            if (z) {
                return i3;
            }
            z2 = z;
        }
    }

    private static byte[] buildClutMapTable(int i, int i2, ParsableBitArray parsableBitArray) {
        byte[] bArr = new byte[i];
        for (int i3 = 0; i3 < i; i3++) {
            bArr[i3] = (byte) parsableBitArray.readBits(i2);
        }
        return bArr;
    }

    private static final class SubtitleService {
        public final int ancillaryPageId;
        public DisplayDefinition displayDefinition;
        public PageComposition pageComposition;
        public final int subtitlePageId;
        public final SparseArray<RegionComposition> regions = new SparseArray<>();
        public final SparseArray<ClutDefinition> cluts = new SparseArray<>();
        public final SparseArray<ObjectData> objects = new SparseArray<>();
        public final SparseArray<ClutDefinition> ancillaryCluts = new SparseArray<>();
        public final SparseArray<ObjectData> ancillaryObjects = new SparseArray<>();

        public SubtitleService(int i, int i2) {
            this.subtitlePageId = i;
            this.ancillaryPageId = i2;
        }

        public void reset() {
            this.regions.clear();
            this.cluts.clear();
            this.objects.clear();
            this.ancillaryCluts.clear();
            this.ancillaryObjects.clear();
            this.displayDefinition = null;
            this.pageComposition = null;
        }
    }

    private static final class DisplayDefinition {
        public final int height;
        public final int horizontalPositionMaximum;
        public final int horizontalPositionMinimum;
        public final int verticalPositionMaximum;
        public final int verticalPositionMinimum;
        public final int width;

        public DisplayDefinition(int i, int i2, int i3, int i4, int i5, int i6) {
            this.width = i;
            this.height = i2;
            this.horizontalPositionMinimum = i3;
            this.horizontalPositionMaximum = i4;
            this.verticalPositionMinimum = i5;
            this.verticalPositionMaximum = i6;
        }
    }

    private static final class PageComposition {
        public final SparseArray<PageRegion> regions;
        public final int state;
        public final int timeOutSecs;
        public final int version;

        public PageComposition(int i, int i2, int i3, SparseArray<PageRegion> sparseArray) {
            this.timeOutSecs = i;
            this.version = i2;
            this.state = i3;
            this.regions = sparseArray;
        }
    }

    private static final class PageRegion {
        public final int horizontalAddress;
        public final int verticalAddress;

        public PageRegion(int i, int i2) {
            this.horizontalAddress = i;
            this.verticalAddress = i2;
        }
    }

    private static final class RegionComposition {
        public final int clutId;
        public final int depth;
        public final boolean fillFlag;
        public final int height;
        public final int id;
        public final int levelOfCompatibility;
        public final int pixelCode2Bit;
        public final int pixelCode4Bit;
        public final int pixelCode8Bit;
        public final SparseArray<RegionObject> regionObjects;
        public final int width;

        public RegionComposition(int i, boolean z, int i2, int i3, int i4, int i5, int i6, int i7, int i8, int i9, SparseArray<RegionObject> sparseArray) {
            this.id = i;
            this.fillFlag = z;
            this.width = i2;
            this.height = i3;
            this.levelOfCompatibility = i4;
            this.depth = i5;
            this.clutId = i6;
            this.pixelCode8Bit = i7;
            this.pixelCode4Bit = i8;
            this.pixelCode2Bit = i9;
            this.regionObjects = sparseArray;
        }

        public void mergeFrom(RegionComposition regionComposition) {
            SparseArray<RegionObject> sparseArray = regionComposition.regionObjects;
            for (int i = 0; i < sparseArray.size(); i++) {
                this.regionObjects.put(sparseArray.keyAt(i), sparseArray.valueAt(i));
            }
        }
    }

    private static final class RegionObject {
        public final int backgroundPixelCode;
        public final int foregroundPixelCode;
        public final int horizontalPosition;
        public final int provider;
        public final int type;
        public final int verticalPosition;

        public RegionObject(int i, int i2, int i3, int i4, int i5, int i6) {
            this.type = i;
            this.provider = i2;
            this.horizontalPosition = i3;
            this.verticalPosition = i4;
            this.foregroundPixelCode = i5;
            this.backgroundPixelCode = i6;
        }
    }

    private static final class ClutDefinition {
        public final int[] clutEntries2Bit;
        public final int[] clutEntries4Bit;
        public final int[] clutEntries8Bit;
        public final int id;

        public ClutDefinition(int i, int[] iArr, int[] iArr2, int[] iArr3) {
            this.id = i;
            this.clutEntries2Bit = iArr;
            this.clutEntries4Bit = iArr2;
            this.clutEntries8Bit = iArr3;
        }
    }

    private static final class ObjectData {
        public final byte[] bottomFieldData;
        public final int id;
        public final boolean nonModifyingColorFlag;
        public final byte[] topFieldData;

        public ObjectData(int i, boolean z, byte[] bArr, byte[] bArr2) {
            this.id = i;
            this.nonModifyingColorFlag = z;
            this.topFieldData = bArr;
            this.bottomFieldData = bArr2;
        }
    }
}
