package androidx.media3.extractor;

import android.net.Uri;
import androidx.media3.extractor.ExtractorsFactory;
import androidx.media3.extractor.text.SubtitleParser;
import java.util.List;
import java.util.Map;

/* loaded from: classes.dex */
public interface ExtractorsFactory {
    public static final ExtractorsFactory EMPTY = new ExtractorsFactory() { // from class: androidx.media3.extractor.ExtractorsFactory$$ExternalSyntheticLambda0
        @Override // androidx.media3.extractor.ExtractorsFactory
        public final Extractor[] createExtractors() {
            return ExtractorsFactory.CC.lambda$static$0();
        }

        @Override // androidx.media3.extractor.ExtractorsFactory
        public /* synthetic */ Extractor[] createExtractors(Uri uri, Map map) {
            return createExtractors();
        }

        @Override // androidx.media3.extractor.ExtractorsFactory
        public /* synthetic */ ExtractorsFactory experimentalSetTextTrackTranscodingEnabled(boolean z) {
            return ExtractorsFactory.CC.$default$experimentalSetTextTrackTranscodingEnabled(this, z);
        }

        @Override // androidx.media3.extractor.ExtractorsFactory
        public /* synthetic */ ExtractorsFactory setSubtitleParserFactory(SubtitleParser.Factory factory) {
            return ExtractorsFactory.CC.$default$setSubtitleParserFactory(this, factory);
        }
    };

    Extractor[] createExtractors();

    Extractor[] createExtractors(Uri uri, Map<String, List<String>> map);

    @Deprecated
    ExtractorsFactory experimentalSetTextTrackTranscodingEnabled(boolean z);

    ExtractorsFactory setSubtitleParserFactory(SubtitleParser.Factory factory);

    /* renamed from: androidx.media3.extractor.ExtractorsFactory$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
        @Deprecated
        public static ExtractorsFactory $default$experimentalSetTextTrackTranscodingEnabled(ExtractorsFactory _this, boolean z) {
            return _this;
        }

        public static ExtractorsFactory $default$setSubtitleParserFactory(ExtractorsFactory _this, SubtitleParser.Factory factory) {
            return _this;
        }

        static {
            ExtractorsFactory extractorsFactory = ExtractorsFactory.EMPTY;
        }

        public static /* synthetic */ Extractor[] lambda$static$0() {
            return new Extractor[0];
        }
    }
}
