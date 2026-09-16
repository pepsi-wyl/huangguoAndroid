package androidx.viewpager.widget;

import android.R;
import android.content.Context;
import android.database.DataSetObserver;
import android.graphics.drawable.Drawable;
import android.text.method.SingleLineTransformationMethod;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.TextView;
import androidx.core.view.ViewCompat;
import androidx.viewpager.widget.ViewPager;
import java.lang.ref.WeakReference;
import java.util.Locale;

@ViewPager.DecorView
/* loaded from: classes.dex */
public class PagerTitleStrip extends ViewGroup {
    private static final float SIDE_ALPHA = 0.6f;
    private static final int TEXT_SPACING = 16;
    TextView mCurrText;
    private int mGravity;
    private int mLastKnownCurrentPage;
    float mLastKnownPositionOffset;
    TextView mNextText;
    private int mNonPrimaryAlpha;
    private final PageListener mPageListener;
    ViewPager mPager;
    TextView mPrevText;
    private int mScaledTextSpacing;
    int mTextColor;
    private boolean mUpdatingPositions;
    private boolean mUpdatingText;
    private WeakReference<PagerAdapter> mWatchingAdapter;
    private static final int[] ATTRS = {R.attr.textAppearance, R.attr.textSize, R.attr.textColor, R.attr.gravity};
    private static final int[] TEXT_ATTRS = {R.attr.textAllCaps};

    private static class SingleLineAllCapsTransform extends SingleLineTransformationMethod {
        private Locale mLocale;

        SingleLineAllCapsTransform(Context context) {
            this.mLocale = context.getResources().getConfiguration().locale;
        }

        @Override // android.text.method.ReplacementTransformationMethod, android.text.method.TransformationMethod
        public CharSequence getTransformation(CharSequence charSequence, View view) {
            CharSequence transformation = super.getTransformation(charSequence, view);
            if (transformation != null) {
                return transformation.toString().toUpperCase(this.mLocale);
            }
            return null;
        }
    }

    private static void setSingleLineAllCaps(TextView textView) {
        textView.setTransformationMethod(new SingleLineAllCapsTransform(textView.getContext()));
    }

    public PagerTitleStrip(Context context) {
        this(context, null);
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x00c4  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public PagerTitleStrip(android.content.Context r5, android.util.AttributeSet r6) throws android.content.res.Resources.NotFoundException {
        /*
            r4 = this;
            r4.<init>(r5, r6)
            r0 = -1
            r4.mLastKnownCurrentPage = r0
            r0 = -1082130432(0xffffffffbf800000, float:-1.0)
            r4.mLastKnownPositionOffset = r0
            androidx.viewpager.widget.PagerTitleStrip$PageListener r0 = new androidx.viewpager.widget.PagerTitleStrip$PageListener
            r0.<init>()
            r4.mPageListener = r0
            android.widget.TextView r0 = new android.widget.TextView
            r0.<init>(r5)
            r4.mPrevText = r0
            r4.addView(r0)
            android.widget.TextView r0 = new android.widget.TextView
            r0.<init>(r5)
            r4.mCurrText = r0
            r4.addView(r0)
            android.widget.TextView r0 = new android.widget.TextView
            r0.<init>(r5)
            r4.mNextText = r0
            r4.addView(r0)
            int[] r0 = androidx.viewpager.widget.PagerTitleStrip.ATTRS
            android.content.res.TypedArray r6 = r5.obtainStyledAttributes(r6, r0)
            r0 = 0
            int r1 = r6.getResourceId(r0, r0)
            if (r1 == 0) goto L4b
            android.widget.TextView r2 = r4.mPrevText
            androidx.core.widget.TextViewCompat.setTextAppearance(r2, r1)
            android.widget.TextView r2 = r4.mCurrText
            androidx.core.widget.TextViewCompat.setTextAppearance(r2, r1)
            android.widget.TextView r2 = r4.mNextText
            androidx.core.widget.TextViewCompat.setTextAppearance(r2, r1)
        L4b:
            r2 = 1
            int r2 = r6.getDimensionPixelSize(r2, r0)
            if (r2 == 0) goto L56
            float r2 = (float) r2
            r4.setTextSize(r0, r2)
        L56:
            r2 = 2
            boolean r3 = r6.hasValue(r2)
            if (r3 == 0) goto L70
            int r2 = r6.getColor(r2, r0)
            android.widget.TextView r3 = r4.mPrevText
            r3.setTextColor(r2)
            android.widget.TextView r3 = r4.mCurrText
            r3.setTextColor(r2)
            android.widget.TextView r3 = r4.mNextText
            r3.setTextColor(r2)
        L70:
            r2 = 3
            r3 = 80
            int r2 = r6.getInteger(r2, r3)
            r4.mGravity = r2
            r6.recycle()
            android.widget.TextView r6 = r4.mCurrText
            android.content.res.ColorStateList r6 = r6.getTextColors()
            int r6 = r6.getDefaultColor()
            r4.mTextColor = r6
            r6 = 1058642330(0x3f19999a, float:0.6)
            r4.setNonPrimaryAlpha(r6)
            android.widget.TextView r6 = r4.mPrevText
            android.text.TextUtils$TruncateAt r2 = android.text.TextUtils.TruncateAt.END
            r6.setEllipsize(r2)
            android.widget.TextView r6 = r4.mCurrText
            android.text.TextUtils$TruncateAt r2 = android.text.TextUtils.TruncateAt.END
            r6.setEllipsize(r2)
            android.widget.TextView r6 = r4.mNextText
            android.text.TextUtils$TruncateAt r2 = android.text.TextUtils.TruncateAt.END
            r6.setEllipsize(r2)
            if (r1 == 0) goto Lc4
            int[] r6 = androidx.viewpager.widget.PagerTitleStrip.TEXT_ATTRS
            android.content.res.TypedArray r6 = r5.obtainStyledAttributes(r1, r6)
            boolean r0 = r6.getBoolean(r0, r0)
            r6.recycle()
            if (r0 == 0) goto Lc4
            android.widget.TextView r6 = r4.mPrevText
            setSingleLineAllCaps(r6)
            android.widget.TextView r6 = r4.mCurrText
            setSingleLineAllCaps(r6)
            android.widget.TextView r6 = r4.mNextText
            setSingleLineAllCaps(r6)
            goto Ld3
        Lc4:
            android.widget.TextView r6 = r4.mPrevText
            r6.setSingleLine()
            android.widget.TextView r6 = r4.mCurrText
            r6.setSingleLine()
            android.widget.TextView r6 = r4.mNextText
            r6.setSingleLine()
        Ld3:
            android.content.res.Resources r5 = r5.getResources()
            android.util.DisplayMetrics r5 = r5.getDisplayMetrics()
            float r5 = r5.density
            r6 = 1098907648(0x41800000, float:16.0)
            float r5 = r5 * r6
            int r5 = (int) r5
            r4.mScaledTextSpacing = r5
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.viewpager.widget.PagerTitleStrip.<init>(android.content.Context, android.util.AttributeSet):void");
    }

    public void setTextSpacing(int i) {
        this.mScaledTextSpacing = i;
        requestLayout();
    }

    public int getTextSpacing() {
        return this.mScaledTextSpacing;
    }

    public void setNonPrimaryAlpha(float f) {
        int i = ((int) (f * 255.0f)) & 255;
        this.mNonPrimaryAlpha = i;
        int i2 = (i << 24) | (this.mTextColor & ViewCompat.MEASURED_SIZE_MASK);
        this.mPrevText.setTextColor(i2);
        this.mNextText.setTextColor(i2);
    }

    public void setTextColor(int i) {
        this.mTextColor = i;
        this.mCurrText.setTextColor(i);
        int i2 = (this.mNonPrimaryAlpha << 24) | (this.mTextColor & ViewCompat.MEASURED_SIZE_MASK);
        this.mPrevText.setTextColor(i2);
        this.mNextText.setTextColor(i2);
    }

    public void setTextSize(int i, float f) {
        this.mPrevText.setTextSize(i, f);
        this.mCurrText.setTextSize(i, f);
        this.mNextText.setTextSize(i, f);
    }

    public void setGravity(int i) {
        this.mGravity = i;
        requestLayout();
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        ViewParent parent = getParent();
        if (!(parent instanceof ViewPager)) {
            throw new IllegalStateException("PagerTitleStrip must be a direct child of a ViewPager.");
        }
        ViewPager viewPager = (ViewPager) parent;
        PagerAdapter adapter = viewPager.getAdapter();
        viewPager.setInternalPageChangeListener(this.mPageListener);
        viewPager.addOnAdapterChangeListener(this.mPageListener);
        this.mPager = viewPager;
        WeakReference<PagerAdapter> weakReference = this.mWatchingAdapter;
        updateAdapter(weakReference != null ? weakReference.get() : null, adapter);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        ViewPager viewPager = this.mPager;
        if (viewPager != null) {
            updateAdapter(viewPager.getAdapter(), null);
            this.mPager.setInternalPageChangeListener(null);
            this.mPager.removeOnAdapterChangeListener(this.mPageListener);
            this.mPager = null;
        }
    }

    void updateText(int i, PagerAdapter pagerAdapter) {
        int count = pagerAdapter != null ? pagerAdapter.getCount() : 0;
        this.mUpdatingText = true;
        CharSequence pageTitle = null;
        this.mPrevText.setText((i < 1 || pagerAdapter == null) ? null : pagerAdapter.getPageTitle(i - 1));
        this.mCurrText.setText((pagerAdapter == null || i >= count) ? null : pagerAdapter.getPageTitle(i));
        int i2 = i + 1;
        if (i2 < count && pagerAdapter != null) {
            pageTitle = pagerAdapter.getPageTitle(i2);
        }
        this.mNextText.setText(pageTitle);
        int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(Math.max(0, (int) (((getWidth() - getPaddingLeft()) - getPaddingRight()) * 0.8f)), Integer.MIN_VALUE);
        int iMakeMeasureSpec2 = View.MeasureSpec.makeMeasureSpec(Math.max(0, (getHeight() - getPaddingTop()) - getPaddingBottom()), Integer.MIN_VALUE);
        this.mPrevText.measure(iMakeMeasureSpec, iMakeMeasureSpec2);
        this.mCurrText.measure(iMakeMeasureSpec, iMakeMeasureSpec2);
        this.mNextText.measure(iMakeMeasureSpec, iMakeMeasureSpec2);
        this.mLastKnownCurrentPage = i;
        if (!this.mUpdatingPositions) {
            updateTextPositions(i, this.mLastKnownPositionOffset, false);
        }
        this.mUpdatingText = false;
    }

    @Override // android.view.View, android.view.ViewParent
    public void requestLayout() {
        if (this.mUpdatingText) {
            return;
        }
        super.requestLayout();
    }

    void updateAdapter(PagerAdapter pagerAdapter, PagerAdapter pagerAdapter2) {
        if (pagerAdapter != null) {
            pagerAdapter.unregisterDataSetObserver(this.mPageListener);
            this.mWatchingAdapter = null;
        }
        if (pagerAdapter2 != null) {
            pagerAdapter2.registerDataSetObserver(this.mPageListener);
            this.mWatchingAdapter = new WeakReference<>(pagerAdapter2);
        }
        ViewPager viewPager = this.mPager;
        if (viewPager != null) {
            this.mLastKnownCurrentPage = -1;
            this.mLastKnownPositionOffset = -1.0f;
            updateText(viewPager.getCurrentItem(), pagerAdapter2);
            requestLayout();
        }
    }

    void updateTextPositions(int i, float f, boolean z) {
        int i2;
        int i3;
        int i4;
        int i5;
        if (i != this.mLastKnownCurrentPage) {
            updateText(i, this.mPager.getAdapter());
        } else if (!z && f == this.mLastKnownPositionOffset) {
            return;
        }
        this.mUpdatingPositions = true;
        int measuredWidth = this.mPrevText.getMeasuredWidth();
        int measuredWidth2 = this.mCurrText.getMeasuredWidth();
        int measuredWidth3 = this.mNextText.getMeasuredWidth();
        int i6 = measuredWidth2 / 2;
        int width = getWidth();
        int height = getHeight();
        int paddingLeft = getPaddingLeft();
        int paddingRight = getPaddingRight();
        int paddingTop = getPaddingTop();
        int paddingBottom = getPaddingBottom();
        int i7 = paddingRight + i6;
        int i8 = (width - (paddingLeft + i6)) - i7;
        float f2 = 0.5f + f;
        if (f2 > 1.0f) {
            f2 -= 1.0f;
        }
        int i9 = ((width - i7) - ((int) (i8 * f2))) - i6;
        int i10 = measuredWidth2 + i9;
        int baseline = this.mPrevText.getBaseline();
        int baseline2 = this.mCurrText.getBaseline();
        int baseline3 = this.mNextText.getBaseline();
        int iMax = Math.max(Math.max(baseline, baseline2), baseline3);
        int i11 = iMax - baseline;
        int i12 = iMax - baseline2;
        int i13 = iMax - baseline3;
        int iMax2 = Math.max(Math.max(this.mPrevText.getMeasuredHeight() + i11, this.mCurrText.getMeasuredHeight() + i12), this.mNextText.getMeasuredHeight() + i13);
        int i14 = this.mGravity & 112;
        if (i14 == 16) {
            i2 = (((height - paddingTop) - paddingBottom) - iMax2) / 2;
        } else {
            if (i14 != 80) {
                i3 = i11 + paddingTop;
                i4 = i12 + paddingTop;
                i5 = paddingTop + i13;
                TextView textView = this.mCurrText;
                textView.layout(i9, i4, i10, textView.getMeasuredHeight() + i4);
                int iMin = Math.min(paddingLeft, (i9 - this.mScaledTextSpacing) - measuredWidth);
                TextView textView2 = this.mPrevText;
                textView2.layout(iMin, i3, measuredWidth + iMin, textView2.getMeasuredHeight() + i3);
                int iMax3 = Math.max((width - paddingRight) - measuredWidth3, i10 + this.mScaledTextSpacing);
                TextView textView3 = this.mNextText;
                textView3.layout(iMax3, i5, iMax3 + measuredWidth3, textView3.getMeasuredHeight() + i5);
                this.mLastKnownPositionOffset = f;
                this.mUpdatingPositions = false;
            }
            i2 = (height - paddingBottom) - iMax2;
        }
        i3 = i11 + i2;
        i4 = i12 + i2;
        i5 = i2 + i13;
        TextView textView4 = this.mCurrText;
        textView4.layout(i9, i4, i10, textView4.getMeasuredHeight() + i4);
        int iMin2 = Math.min(paddingLeft, (i9 - this.mScaledTextSpacing) - measuredWidth);
        TextView textView22 = this.mPrevText;
        textView22.layout(iMin2, i3, measuredWidth + iMin2, textView22.getMeasuredHeight() + i3);
        int iMax32 = Math.max((width - paddingRight) - measuredWidth3, i10 + this.mScaledTextSpacing);
        TextView textView32 = this.mNextText;
        textView32.layout(iMax32, i5, iMax32 + measuredWidth3, textView32.getMeasuredHeight() + i5);
        this.mLastKnownPositionOffset = f;
        this.mUpdatingPositions = false;
    }

    @Override // android.view.View
    protected void onMeasure(int i, int i2) {
        int iMax;
        if (View.MeasureSpec.getMode(i) != 1073741824) {
            throw new IllegalStateException("Must measure with an exact width");
        }
        int paddingTop = getPaddingTop() + getPaddingBottom();
        int childMeasureSpec = getChildMeasureSpec(i2, paddingTop, -2);
        int size = View.MeasureSpec.getSize(i);
        int childMeasureSpec2 = getChildMeasureSpec(i, (int) (size * 0.2f), -2);
        this.mPrevText.measure(childMeasureSpec2, childMeasureSpec);
        this.mCurrText.measure(childMeasureSpec2, childMeasureSpec);
        this.mNextText.measure(childMeasureSpec2, childMeasureSpec);
        if (View.MeasureSpec.getMode(i2) == 1073741824) {
            iMax = View.MeasureSpec.getSize(i2);
        } else {
            iMax = Math.max(getMinHeight(), this.mCurrText.getMeasuredHeight() + paddingTop);
        }
        setMeasuredDimension(size, View.resolveSizeAndState(iMax, i2, this.mCurrText.getMeasuredState() << 16));
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
        if (this.mPager != null) {
            float f = this.mLastKnownPositionOffset;
            if (f < 0.0f) {
                f = 0.0f;
            }
            updateTextPositions(this.mLastKnownCurrentPage, f, true);
        }
    }

    int getMinHeight() {
        Drawable background = getBackground();
        if (background != null) {
            return background.getIntrinsicHeight();
        }
        return 0;
    }

    private class PageListener extends DataSetObserver implements ViewPager.OnPageChangeListener, ViewPager.OnAdapterChangeListener {
        private int mScrollState;

        PageListener() {
        }

        @Override // androidx.viewpager.widget.ViewPager.OnPageChangeListener
        public void onPageScrolled(int i, float f, int i2) {
            if (f > 0.5f) {
                i++;
            }
            PagerTitleStrip.this.updateTextPositions(i, f, false);
        }

        @Override // androidx.viewpager.widget.ViewPager.OnPageChangeListener
        public void onPageSelected(int i) {
            if (this.mScrollState == 0) {
                PagerTitleStrip pagerTitleStrip = PagerTitleStrip.this;
                pagerTitleStrip.updateText(pagerTitleStrip.mPager.getCurrentItem(), PagerTitleStrip.this.mPager.getAdapter());
                float f = PagerTitleStrip.this.mLastKnownPositionOffset >= 0.0f ? PagerTitleStrip.this.mLastKnownPositionOffset : 0.0f;
                PagerTitleStrip pagerTitleStrip2 = PagerTitleStrip.this;
                pagerTitleStrip2.updateTextPositions(pagerTitleStrip2.mPager.getCurrentItem(), f, true);
            }
        }

        @Override // androidx.viewpager.widget.ViewPager.OnPageChangeListener
        public void onPageScrollStateChanged(int i) {
            this.mScrollState = i;
        }

        @Override // androidx.viewpager.widget.ViewPager.OnAdapterChangeListener
        public void onAdapterChanged(ViewPager viewPager, PagerAdapter pagerAdapter, PagerAdapter pagerAdapter2) {
            PagerTitleStrip.this.updateAdapter(pagerAdapter, pagerAdapter2);
        }

        @Override // android.database.DataSetObserver
        public void onChanged() {
            PagerTitleStrip pagerTitleStrip = PagerTitleStrip.this;
            pagerTitleStrip.updateText(pagerTitleStrip.mPager.getCurrentItem(), PagerTitleStrip.this.mPager.getAdapter());
            float f = PagerTitleStrip.this.mLastKnownPositionOffset >= 0.0f ? PagerTitleStrip.this.mLastKnownPositionOffset : 0.0f;
            PagerTitleStrip pagerTitleStrip2 = PagerTitleStrip.this;
            pagerTitleStrip2.updateTextPositions(pagerTitleStrip2.mPager.getCurrentItem(), f, true);
        }
    }
}
