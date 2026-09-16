package androidx.media3.exoplayer.dash.manifest;

import androidx.media3.common.util.Util;

/* loaded from: classes.dex */
public final class ProgramInformation {
    public final String copyright;
    public final String lang;
    public final String moreInformationURL;
    public final String source;
    public final String title;

    public ProgramInformation(String str, String str2, String str3, String str4, String str5) {
        this.title = str;
        this.source = str2;
        this.copyright = str3;
        this.moreInformationURL = str4;
        this.lang = str5;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ProgramInformation)) {
            return false;
        }
        ProgramInformation programInformation = (ProgramInformation) obj;
        return Util.areEqual(this.title, programInformation.title) && Util.areEqual(this.source, programInformation.source) && Util.areEqual(this.copyright, programInformation.copyright) && Util.areEqual(this.moreInformationURL, programInformation.moreInformationURL) && Util.areEqual(this.lang, programInformation.lang);
    }

    public int hashCode() {
        String str = this.title;
        int iHashCode = (527 + (str != null ? str.hashCode() : 0)) * 31;
        String str2 = this.source;
        int iHashCode2 = (iHashCode + (str2 != null ? str2.hashCode() : 0)) * 31;
        String str3 = this.copyright;
        int iHashCode3 = (iHashCode2 + (str3 != null ? str3.hashCode() : 0)) * 31;
        String str4 = this.moreInformationURL;
        int iHashCode4 = (iHashCode3 + (str4 != null ? str4.hashCode() : 0)) * 31;
        String str5 = this.lang;
        return iHashCode4 + (str5 != null ? str5.hashCode() : 0);
    }
}
