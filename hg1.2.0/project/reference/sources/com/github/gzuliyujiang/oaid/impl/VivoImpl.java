package com.github.gzuliyujiang.oaid.impl;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import androidx.media3.exoplayer.rtsp.SessionDescription;
import androidx.media3.extractor.metadata.icy.IcyHeaders;
import com.github.gzuliyujiang.oaid.IGetter;
import com.github.gzuliyujiang.oaid.IOAID;
import com.github.gzuliyujiang.oaid.OAIDException;
import com.github.gzuliyujiang.oaid.OAIDLog;
import com.github.gzuliyujiang.oaid.OAIDRom;
import java.util.Objects;

/* loaded from: classes.dex */
class VivoImpl implements IOAID {
    private final Context context;

    public VivoImpl(Context context) {
        this.context = context;
    }

    @Override // com.github.gzuliyujiang.oaid.IOAID
    public boolean supported() {
        if (Build.VERSION.SDK_INT < 28) {
            return false;
        }
        return OAIDRom.sysProperty("persist.sys.identifierid.supported", SessionDescription.SUPPORTED_SDP_VERSION).equals(IcyHeaders.REQUEST_HEADER_ENABLE_METADATA_VALUE) || OAIDRom.sysProperty("persist.sys.identifierid", SessionDescription.SUPPORTED_SDP_VERSION).equals(IcyHeaders.REQUEST_HEADER_ENABLE_METADATA_VALUE);
    }

    @Override // com.github.gzuliyujiang.oaid.IOAID
    public void doGet(IGetter iGetter) {
        if (this.context == null || iGetter == null) {
            return;
        }
        try {
            Cursor cursorQuery = this.context.getContentResolver().query(Uri.parse("content://com.vivo.vms.IdProvider/IdentifierId/OAID"), null, null, null, null);
            try {
                ((Cursor) Objects.requireNonNull(cursorQuery)).moveToFirst();
                String string = cursorQuery.getString(cursorQuery.getColumnIndex("value"));
                if (string == null || string.length() == 0) {
                    throw new OAIDException("OAID query failed");
                }
                OAIDLog.print("OAID query success: " + string);
                iGetter.onOAIDGetComplete(string);
                if (cursorQuery != null) {
                    cursorQuery.close();
                }
            } finally {
            }
        } catch (Exception e) {
            OAIDLog.print(e);
            iGetter.onOAIDGetError(e);
        }
    }
}
