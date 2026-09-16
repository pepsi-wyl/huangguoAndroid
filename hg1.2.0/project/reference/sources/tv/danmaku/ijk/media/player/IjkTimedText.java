package tv.danmaku.ijk.media.player;

import android.graphics.Rect;

/* loaded from: classes2.dex */
public final class IjkTimedText {
    private Rect mTextBounds;
    private String mTextChars;

    public IjkTimedText(Rect rect, String str) {
        this.mTextBounds = rect;
        this.mTextChars = str;
    }

    public Rect getBounds() {
        return this.mTextBounds;
    }

    public String getText() {
        return this.mTextChars;
    }
}
