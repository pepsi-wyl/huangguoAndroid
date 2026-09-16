package androidx.media3.exoplayer.hls.playlist;

import androidx.media3.exoplayer.upstream.ParsingLoadable;

/* loaded from: classes.dex */
public final class DefaultHlsPlaylistParserFactory implements HlsPlaylistParserFactory {
    @Override // androidx.media3.exoplayer.hls.playlist.HlsPlaylistParserFactory
    public ParsingLoadable.Parser<HlsPlaylist> createPlaylistParser() {
        return new HlsPlaylistParser();
    }

    @Override // androidx.media3.exoplayer.hls.playlist.HlsPlaylistParserFactory
    public ParsingLoadable.Parser<HlsPlaylist> createPlaylistParser(HlsMultivariantPlaylist hlsMultivariantPlaylist, HlsMediaPlaylist hlsMediaPlaylist) {
        return new HlsPlaylistParser(hlsMultivariantPlaylist, hlsMediaPlaylist);
    }
}
