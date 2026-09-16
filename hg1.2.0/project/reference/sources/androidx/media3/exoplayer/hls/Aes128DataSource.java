package androidx.media3.exoplayer.hls;

import android.net.Uri;
import androidx.media3.common.util.Assertions;
import androidx.media3.datasource.DataSource;
import androidx.media3.datasource.DataSourceInputStream;
import androidx.media3.datasource.DataSpec;
import androidx.media3.datasource.TransferListener;
import java.io.IOException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;
import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/* loaded from: classes.dex */
class Aes128DataSource implements DataSource {
    private CipherInputStream cipherInputStream;
    private final byte[] encryptionIv;
    private final byte[] encryptionKey;
    private final DataSource upstream;

    public Aes128DataSource(DataSource dataSource, byte[] bArr, byte[] bArr2) {
        this.upstream = dataSource;
        this.encryptionKey = bArr;
        this.encryptionIv = bArr2;
    }

    @Override // androidx.media3.datasource.DataSource
    public final void addTransferListener(TransferListener transferListener) {
        Assertions.checkNotNull(transferListener);
        this.upstream.addTransferListener(transferListener);
    }

    @Override // androidx.media3.datasource.DataSource
    public final long open(DataSpec dataSpec) throws InvalidKeyException, IOException, InvalidAlgorithmParameterException {
        try {
            Cipher cipherInstance = getCipherInstance();
            try {
                cipherInstance.init(2, new SecretKeySpec(this.encryptionKey, "AES"), new IvParameterSpec(this.encryptionIv));
                DataSourceInputStream dataSourceInputStream = new DataSourceInputStream(this.upstream, dataSpec);
                this.cipherInputStream = new CipherInputStream(dataSourceInputStream, cipherInstance);
                dataSourceInputStream.open();
                return -1L;
            } catch (InvalidAlgorithmParameterException | InvalidKeyException e) {
                throw new RuntimeException(e);
            }
        } catch (NoSuchAlgorithmException | NoSuchPaddingException e2) {
            throw new RuntimeException(e2);
        }
    }

    @Override // androidx.media3.common.DataReader
    public final int read(byte[] bArr, int i, int i2) throws IOException {
        Assertions.checkNotNull(this.cipherInputStream);
        int i3 = this.cipherInputStream.read(bArr, i, i2);
        if (i3 < 0) {
            return -1;
        }
        return i3;
    }

    @Override // androidx.media3.datasource.DataSource
    public final Uri getUri() {
        return this.upstream.getUri();
    }

    @Override // androidx.media3.datasource.DataSource
    public final Map<String, List<String>> getResponseHeaders() {
        return this.upstream.getResponseHeaders();
    }

    @Override // androidx.media3.datasource.DataSource
    public void close() throws IOException {
        if (this.cipherInputStream != null) {
            this.cipherInputStream = null;
            this.upstream.close();
        }
    }

    protected Cipher getCipherInstance() throws NoSuchPaddingException, NoSuchAlgorithmException {
        return Cipher.getInstance("AES/CBC/PKCS7Padding");
    }
}
