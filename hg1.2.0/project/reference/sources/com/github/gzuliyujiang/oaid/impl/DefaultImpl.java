package com.github.gzuliyujiang.oaid.impl;

import com.github.gzuliyujiang.oaid.IGetter;
import com.github.gzuliyujiang.oaid.IOAID;
import com.github.gzuliyujiang.oaid.OAIDException;

/* loaded from: classes.dex */
class DefaultImpl implements IOAID {
    @Override // com.github.gzuliyujiang.oaid.IOAID
    public boolean supported() {
        return false;
    }

    DefaultImpl() {
    }

    @Override // com.github.gzuliyujiang.oaid.IOAID
    public void doGet(IGetter iGetter) {
        if (iGetter == null) {
            return;
        }
        iGetter.onOAIDGetError(new OAIDException("Unsupported"));
    }
}
