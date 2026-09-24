package com.github.gzuliyujiang.oaid;

/* loaded from: classes.dex */
public interface IRegisterCallback {
    @Deprecated
    void onComplete();

    void onComplete(String str, Exception exc);

    /* renamed from: com.github.gzuliyujiang.oaid.IRegisterCallback$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
        public static void $default$onComplete(IRegisterCallback _this, String str, Exception exc) {
        }
    }
}
