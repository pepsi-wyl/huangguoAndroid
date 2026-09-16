package androidx.media3.datasource.cache;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.util.SparseArray;
import android.util.SparseBooleanArray;
import androidx.media3.common.util.Assertions;
import androidx.media3.common.util.AtomicFile;
import androidx.media3.common.util.Util;
import androidx.media3.database.DatabaseIOException;
import androidx.media3.database.DatabaseProvider;
import androidx.media3.database.VersionTable;
import androidx.media3.datasource.cache.ContentMetadata;
import com.google.common.collect.ImmutableSet;
import com.google.common.collect.UnmodifiableIterator;
import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.CipherOutputStream;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/* loaded from: classes.dex */
class CachedContentIndex {
    static final String FILE_NAME_ATOMIC = "cached_content_index.exi";
    private static final int INCREMENTAL_METADATA_READ_LENGTH = 10485760;
    private final SparseArray<String> idToKey;
    private final HashMap<String, CachedContent> keyToContent;
    private final SparseBooleanArray newIds;
    private Storage previousStorage;
    private final SparseBooleanArray removedIds;
    private Storage storage;

    private interface Storage {
        void delete() throws IOException;

        boolean exists() throws IOException;

        void initialize(long j);

        void load(HashMap<String, CachedContent> map, SparseArray<String> sparseArray) throws IOException;

        void onRemove(CachedContent cachedContent, boolean z);

        void onUpdate(CachedContent cachedContent);

        void storeFully(HashMap<String, CachedContent> map) throws IOException;

        void storeIncremental(HashMap<String, CachedContent> map) throws IOException;
    }

    public static boolean isIndexFile(String str) {
        return str.startsWith(FILE_NAME_ATOMIC);
    }

    public static void delete(DatabaseProvider databaseProvider, long j) throws DatabaseIOException {
        DatabaseStorage.delete(databaseProvider, j);
    }

    public CachedContentIndex(DatabaseProvider databaseProvider) {
        this(databaseProvider, null, null, false, false);
    }

    public CachedContentIndex(DatabaseProvider databaseProvider, File file, byte[] bArr, boolean z, boolean z2) {
        Assertions.checkState((databaseProvider == null && file == null) ? false : true);
        this.keyToContent = new HashMap<>();
        this.idToKey = new SparseArray<>();
        this.removedIds = new SparseBooleanArray();
        this.newIds = new SparseBooleanArray();
        DatabaseStorage databaseStorage = databaseProvider != null ? new DatabaseStorage(databaseProvider) : null;
        LegacyStorage legacyStorage = file != null ? new LegacyStorage(new File(file, FILE_NAME_ATOMIC), bArr, z) : null;
        if (databaseStorage == null || (legacyStorage != null && z2)) {
            this.storage = (Storage) Util.castNonNull(legacyStorage);
            this.previousStorage = databaseStorage;
        } else {
            this.storage = databaseStorage;
            this.previousStorage = legacyStorage;
        }
    }

    public void initialize(long j) throws IOException {
        Storage storage;
        this.storage.initialize(j);
        Storage storage2 = this.previousStorage;
        if (storage2 != null) {
            storage2.initialize(j);
        }
        if (!this.storage.exists() && (storage = this.previousStorage) != null && storage.exists()) {
            this.previousStorage.load(this.keyToContent, this.idToKey);
            this.storage.storeFully(this.keyToContent);
        } else {
            this.storage.load(this.keyToContent, this.idToKey);
        }
        Storage storage3 = this.previousStorage;
        if (storage3 != null) {
            storage3.delete();
            this.previousStorage = null;
        }
    }

    public void store() throws IOException {
        this.storage.storeIncremental(this.keyToContent);
        int size = this.removedIds.size();
        for (int i = 0; i < size; i++) {
            this.idToKey.remove(this.removedIds.keyAt(i));
        }
        this.removedIds.clear();
        this.newIds.clear();
    }

    public CachedContent getOrAdd(String str) {
        CachedContent cachedContent = this.keyToContent.get(str);
        return cachedContent == null ? addNew(str) : cachedContent;
    }

    public CachedContent get(String str) {
        return this.keyToContent.get(str);
    }

    public Collection<CachedContent> getAll() {
        return Collections.unmodifiableCollection(this.keyToContent.values());
    }

    public int assignIdForKey(String str) {
        return getOrAdd(str).id;
    }

    public String getKeyForId(int i) {
        return this.idToKey.get(i);
    }

    public void maybeRemove(String str) {
        CachedContent cachedContent = this.keyToContent.get(str);
        if (cachedContent != null && cachedContent.isEmpty() && cachedContent.isFullyUnlocked()) {
            this.keyToContent.remove(str);
            int i = cachedContent.id;
            boolean z = this.newIds.get(i);
            this.storage.onRemove(cachedContent, z);
            if (z) {
                this.idToKey.remove(i);
                this.newIds.delete(i);
            } else {
                this.idToKey.put(i, null);
                this.removedIds.put(i, true);
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void removeEmpty() {
        UnmodifiableIterator it = ImmutableSet.copyOf((Collection) this.keyToContent.keySet()).iterator();
        while (it.hasNext()) {
            maybeRemove((String) it.next());
        }
    }

    public Set<String> getKeys() {
        return this.keyToContent.keySet();
    }

    public void applyContentMetadataMutations(String str, ContentMetadataMutations contentMetadataMutations) {
        CachedContent orAdd = getOrAdd(str);
        if (orAdd.applyMetadataMutations(contentMetadataMutations)) {
            this.storage.onUpdate(orAdd);
        }
    }

    public ContentMetadata getContentMetadata(String str) {
        CachedContent cachedContent = get(str);
        return cachedContent != null ? cachedContent.getMetadata() : DefaultContentMetadata.EMPTY;
    }

    private CachedContent addNew(String str) {
        int newId = getNewId(this.idToKey);
        CachedContent cachedContent = new CachedContent(newId, str);
        this.keyToContent.put(str, cachedContent);
        this.idToKey.put(newId, str);
        this.newIds.put(newId, true);
        this.storage.onUpdate(cachedContent);
        return cachedContent;
    }

    static int getNewId(SparseArray<String> sparseArray) {
        int size = sparseArray.size();
        int i = 0;
        int iKeyAt = size == 0 ? 0 : sparseArray.keyAt(size - 1) + 1;
        if (iKeyAt >= 0) {
            return iKeyAt;
        }
        while (i < size && i == sparseArray.keyAt(i)) {
            i++;
        }
        return i;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static DefaultContentMetadata readContentMetadata(DataInputStream dataInputStream) throws IOException {
        int i = dataInputStream.readInt();
        HashMap map = new HashMap();
        for (int i2 = 0; i2 < i; i2++) {
            String utf = dataInputStream.readUTF();
            int i3 = dataInputStream.readInt();
            if (i3 < 0) {
                throw new IOException("Invalid value size: " + i3);
            }
            int iMin = Math.min(i3, INCREMENTAL_METADATA_READ_LENGTH);
            byte[] bArrCopyOf = Util.EMPTY_BYTE_ARRAY;
            int i4 = 0;
            while (i4 != i3) {
                int i5 = i4 + iMin;
                bArrCopyOf = Arrays.copyOf(bArrCopyOf, i5);
                dataInputStream.readFully(bArrCopyOf, i4, iMin);
                iMin = Math.min(i3 - i5, INCREMENTAL_METADATA_READ_LENGTH);
                i4 = i5;
            }
            map.put(utf, bArrCopyOf);
        }
        return new DefaultContentMetadata(map);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void writeContentMetadata(DefaultContentMetadata defaultContentMetadata, DataOutputStream dataOutputStream) throws IOException {
        Set<Map.Entry<String, byte[]>> setEntrySet = defaultContentMetadata.entrySet();
        dataOutputStream.writeInt(setEntrySet.size());
        for (Map.Entry<String, byte[]> entry : setEntrySet) {
            dataOutputStream.writeUTF(entry.getKey());
            byte[] value = entry.getValue();
            dataOutputStream.writeInt(value.length);
            dataOutputStream.write(value);
        }
    }

    private static class LegacyStorage implements Storage {
        private static final int FLAG_ENCRYPTED_INDEX = 1;
        private static final int VERSION = 2;
        private static final int VERSION_METADATA_INTRODUCED = 2;
        private final AtomicFile atomicFile;
        private ReusableBufferedOutputStream bufferedOutputStream;
        private boolean changed;
        private final Cipher cipher;
        private final boolean encrypt;
        private final SecureRandom random;
        private final SecretKeySpec secretKeySpec;

        @Override // androidx.media3.datasource.cache.CachedContentIndex.Storage
        public void initialize(long j) {
        }

        public LegacyStorage(File file, byte[] bArr, boolean z) throws NoSuchPaddingException, NoSuchAlgorithmException {
            Cipher cipher;
            SecretKeySpec secretKeySpec;
            Assertions.checkState((bArr == null && z) ? false : true);
            if (bArr != null) {
                Assertions.checkArgument(bArr.length == 16);
                try {
                    cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
                    secretKeySpec = new SecretKeySpec(bArr, "AES");
                } catch (NoSuchAlgorithmException | NoSuchPaddingException e) {
                    throw new IllegalStateException(e);
                }
            } else {
                Assertions.checkArgument(!z);
                cipher = null;
                secretKeySpec = null;
            }
            this.encrypt = z;
            this.cipher = cipher;
            this.secretKeySpec = secretKeySpec;
            this.random = z ? new SecureRandom() : null;
            this.atomicFile = new AtomicFile(file);
        }

        @Override // androidx.media3.datasource.cache.CachedContentIndex.Storage
        public boolean exists() {
            return this.atomicFile.exists();
        }

        @Override // androidx.media3.datasource.cache.CachedContentIndex.Storage
        public void delete() {
            this.atomicFile.delete();
        }

        @Override // androidx.media3.datasource.cache.CachedContentIndex.Storage
        public void load(HashMap<String, CachedContent> map, SparseArray<String> sparseArray) {
            Assertions.checkState(!this.changed);
            if (readFile(map, sparseArray)) {
                return;
            }
            map.clear();
            sparseArray.clear();
            this.atomicFile.delete();
        }

        @Override // androidx.media3.datasource.cache.CachedContentIndex.Storage
        public void storeFully(HashMap<String, CachedContent> map) throws Throwable {
            writeFile(map);
            this.changed = false;
        }

        @Override // androidx.media3.datasource.cache.CachedContentIndex.Storage
        public void storeIncremental(HashMap<String, CachedContent> map) throws Throwable {
            if (this.changed) {
                storeFully(map);
            }
        }

        @Override // androidx.media3.datasource.cache.CachedContentIndex.Storage
        public void onUpdate(CachedContent cachedContent) {
            this.changed = true;
        }

        @Override // androidx.media3.datasource.cache.CachedContentIndex.Storage
        public void onRemove(CachedContent cachedContent, boolean z) {
            this.changed = true;
        }

        private boolean readFile(HashMap<String, CachedContent> map, SparseArray<String> sparseArray) throws Throwable {
            BufferedInputStream bufferedInputStream;
            DataInputStream dataInputStream;
            if (!this.atomicFile.exists()) {
                return true;
            }
            DataInputStream dataInputStream2 = null;
            try {
                bufferedInputStream = new BufferedInputStream(this.atomicFile.openRead());
                dataInputStream = new DataInputStream(bufferedInputStream);
            } catch (IOException unused) {
            } catch (Throwable th) {
                th = th;
            }
            try {
                int i = dataInputStream.readInt();
                if (i >= 0 && i <= 2) {
                    if ((dataInputStream.readInt() & 1) != 0) {
                        if (this.cipher != null) {
                            byte[] bArr = new byte[16];
                            dataInputStream.readFully(bArr);
                            try {
                                this.cipher.init(2, (Key) Util.castNonNull(this.secretKeySpec), new IvParameterSpec(bArr));
                                dataInputStream = new DataInputStream(new CipherInputStream(bufferedInputStream, this.cipher));
                            } catch (InvalidAlgorithmParameterException e) {
                                e = e;
                                throw new IllegalStateException(e);
                            } catch (InvalidKeyException e2) {
                                e = e2;
                                throw new IllegalStateException(e);
                            }
                        } else {
                            Util.closeQuietly(dataInputStream);
                            return false;
                        }
                    } else if (this.encrypt) {
                        this.changed = true;
                    }
                    int i2 = dataInputStream.readInt();
                    int iHashCachedContent = 0;
                    for (int i3 = 0; i3 < i2; i3++) {
                        CachedContent cachedContent = readCachedContent(i, dataInputStream);
                        map.put(cachedContent.key, cachedContent);
                        sparseArray.put(cachedContent.id, cachedContent.key);
                        iHashCachedContent += hashCachedContent(cachedContent, i);
                    }
                    int i4 = dataInputStream.readInt();
                    boolean z = dataInputStream.read() == -1;
                    if (i4 == iHashCachedContent && z) {
                        Util.closeQuietly(dataInputStream);
                        return true;
                    }
                    Util.closeQuietly(dataInputStream);
                    return false;
                }
                Util.closeQuietly(dataInputStream);
                return false;
            } catch (IOException unused2) {
                dataInputStream2 = dataInputStream;
                if (dataInputStream2 != null) {
                    Util.closeQuietly(dataInputStream2);
                }
                return false;
            } catch (Throwable th2) {
                th = th2;
                dataInputStream2 = dataInputStream;
                if (dataInputStream2 != null) {
                    Util.closeQuietly(dataInputStream2);
                }
                throw th;
            }
        }

        private void writeFile(HashMap<String, CachedContent> map) throws Throwable {
            Closeable closeable = null;
            try {
                OutputStream outputStreamStartWrite = this.atomicFile.startWrite();
                ReusableBufferedOutputStream reusableBufferedOutputStream = this.bufferedOutputStream;
                if (reusableBufferedOutputStream == null) {
                    this.bufferedOutputStream = new ReusableBufferedOutputStream(outputStreamStartWrite);
                } else {
                    reusableBufferedOutputStream.reset(outputStreamStartWrite);
                }
                ReusableBufferedOutputStream reusableBufferedOutputStream2 = this.bufferedOutputStream;
                DataOutputStream dataOutputStream = new DataOutputStream(reusableBufferedOutputStream2);
                try {
                    dataOutputStream.writeInt(2);
                    int iHashCachedContent = 0;
                    dataOutputStream.writeInt(this.encrypt ? 1 : 0);
                    if (this.encrypt) {
                        byte[] bArr = new byte[16];
                        ((SecureRandom) Util.castNonNull(this.random)).nextBytes(bArr);
                        dataOutputStream.write(bArr);
                        try {
                            ((Cipher) Util.castNonNull(this.cipher)).init(1, (Key) Util.castNonNull(this.secretKeySpec), new IvParameterSpec(bArr));
                            dataOutputStream.flush();
                            dataOutputStream = new DataOutputStream(new CipherOutputStream(reusableBufferedOutputStream2, this.cipher));
                        } catch (InvalidAlgorithmParameterException e) {
                            e = e;
                            throw new IllegalStateException(e);
                        } catch (InvalidKeyException e2) {
                            e = e2;
                            throw new IllegalStateException(e);
                        }
                    }
                    dataOutputStream.writeInt(map.size());
                    for (CachedContent cachedContent : map.values()) {
                        writeCachedContent(cachedContent, dataOutputStream);
                        iHashCachedContent += hashCachedContent(cachedContent, 2);
                    }
                    dataOutputStream.writeInt(iHashCachedContent);
                    this.atomicFile.endWrite(dataOutputStream);
                    Util.closeQuietly(null);
                } catch (Throwable th) {
                    th = th;
                    closeable = dataOutputStream;
                    Util.closeQuietly(closeable);
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
            }
        }

        private int hashCachedContent(CachedContent cachedContent, int i) {
            int iHashCode = (cachedContent.id * 31) + cachedContent.key.hashCode();
            if (i < 2) {
                long contentLength = ContentMetadata.CC.getContentLength(cachedContent.getMetadata());
                return (iHashCode * 31) + ((int) (contentLength ^ (contentLength >>> 32)));
            }
            return (iHashCode * 31) + cachedContent.getMetadata().hashCode();
        }

        private CachedContent readCachedContent(int i, DataInputStream dataInputStream) throws IOException {
            DefaultContentMetadata contentMetadata;
            int i2 = dataInputStream.readInt();
            String utf = dataInputStream.readUTF();
            if (i >= 2) {
                contentMetadata = CachedContentIndex.readContentMetadata(dataInputStream);
            } else {
                long j = dataInputStream.readLong();
                ContentMetadataMutations contentMetadataMutations = new ContentMetadataMutations();
                ContentMetadataMutations.setContentLength(contentMetadataMutations, j);
                contentMetadata = DefaultContentMetadata.EMPTY.copyWithMutationsApplied(contentMetadataMutations);
            }
            return new CachedContent(i2, utf, contentMetadata);
        }

        private void writeCachedContent(CachedContent cachedContent, DataOutputStream dataOutputStream) throws IOException {
            dataOutputStream.writeInt(cachedContent.id);
            dataOutputStream.writeUTF(cachedContent.key);
            CachedContentIndex.writeContentMetadata(cachedContent.getMetadata(), dataOutputStream);
        }
    }

    private static final class DatabaseStorage implements Storage {
        private static final String COLUMN_ID = "id";
        private static final int COLUMN_INDEX_ID = 0;
        private static final int COLUMN_INDEX_KEY = 1;
        private static final int COLUMN_INDEX_METADATA = 2;
        private static final String COLUMN_METADATA = "metadata";
        private static final String TABLE_PREFIX = "ExoPlayerCacheIndex";
        private static final String TABLE_SCHEMA = "(id INTEGER PRIMARY KEY NOT NULL,key TEXT NOT NULL,metadata BLOB NOT NULL)";
        private static final int TABLE_VERSION = 1;
        private static final String WHERE_ID_EQUALS = "id = ?";
        private final DatabaseProvider databaseProvider;
        private String hexUid;
        private final SparseArray<CachedContent> pendingUpdates = new SparseArray<>();
        private String tableName;
        private static final String COLUMN_KEY = "key";
        private static final String[] COLUMNS = {"id", COLUMN_KEY, "metadata"};

        public static void delete(DatabaseProvider databaseProvider, long j) throws DatabaseIOException {
            delete(databaseProvider, Long.toHexString(j));
        }

        public DatabaseStorage(DatabaseProvider databaseProvider) {
            this.databaseProvider = databaseProvider;
        }

        @Override // androidx.media3.datasource.cache.CachedContentIndex.Storage
        public void initialize(long j) {
            String hexString = Long.toHexString(j);
            this.hexUid = hexString;
            this.tableName = getTableName(hexString);
        }

        @Override // androidx.media3.datasource.cache.CachedContentIndex.Storage
        public boolean exists() throws DatabaseIOException {
            try {
                return VersionTable.getVersion(this.databaseProvider.getReadableDatabase(), 1, (String) Assertions.checkNotNull(this.hexUid)) != -1;
            } catch (SQLException e) {
                throw new DatabaseIOException(e);
            }
        }

        @Override // androidx.media3.datasource.cache.CachedContentIndex.Storage
        public void delete() throws DatabaseIOException {
            delete(this.databaseProvider, (String) Assertions.checkNotNull(this.hexUid));
        }

        @Override // androidx.media3.datasource.cache.CachedContentIndex.Storage
        public void load(HashMap<String, CachedContent> map, SparseArray<String> sparseArray) throws IOException {
            Assertions.checkState(this.pendingUpdates.size() == 0);
            try {
                if (VersionTable.getVersion(this.databaseProvider.getReadableDatabase(), 1, (String) Assertions.checkNotNull(this.hexUid)) != 1) {
                    SQLiteDatabase writableDatabase = this.databaseProvider.getWritableDatabase();
                    writableDatabase.beginTransactionNonExclusive();
                    try {
                        initializeTable(writableDatabase);
                        writableDatabase.setTransactionSuccessful();
                        writableDatabase.endTransaction();
                    } catch (Throwable th) {
                        writableDatabase.endTransaction();
                        throw th;
                    }
                }
                Cursor cursor = getCursor();
                while (cursor.moveToNext()) {
                    try {
                        CachedContent cachedContent = new CachedContent(cursor.getInt(0), (String) Assertions.checkNotNull(cursor.getString(1)), CachedContentIndex.readContentMetadata(new DataInputStream(new ByteArrayInputStream(cursor.getBlob(2)))));
                        map.put(cachedContent.key, cachedContent);
                        sparseArray.put(cachedContent.id, cachedContent.key);
                    } finally {
                    }
                }
                if (cursor != null) {
                    cursor.close();
                }
            } catch (SQLiteException e) {
                map.clear();
                sparseArray.clear();
                throw new DatabaseIOException(e);
            }
        }

        @Override // androidx.media3.datasource.cache.CachedContentIndex.Storage
        public void storeFully(HashMap<String, CachedContent> map) throws IOException {
            try {
                SQLiteDatabase writableDatabase = this.databaseProvider.getWritableDatabase();
                writableDatabase.beginTransactionNonExclusive();
                try {
                    initializeTable(writableDatabase);
                    Iterator<CachedContent> it = map.values().iterator();
                    while (it.hasNext()) {
                        addOrUpdateRow(writableDatabase, it.next());
                    }
                    writableDatabase.setTransactionSuccessful();
                    this.pendingUpdates.clear();
                } finally {
                    writableDatabase.endTransaction();
                }
            } catch (SQLException e) {
                throw new DatabaseIOException(e);
            }
        }

        @Override // androidx.media3.datasource.cache.CachedContentIndex.Storage
        public void storeIncremental(HashMap<String, CachedContent> map) throws IOException {
            if (this.pendingUpdates.size() == 0) {
                return;
            }
            try {
                SQLiteDatabase writableDatabase = this.databaseProvider.getWritableDatabase();
                writableDatabase.beginTransactionNonExclusive();
                for (int i = 0; i < this.pendingUpdates.size(); i++) {
                    try {
                        CachedContent cachedContentValueAt = this.pendingUpdates.valueAt(i);
                        if (cachedContentValueAt == null) {
                            deleteRow(writableDatabase, this.pendingUpdates.keyAt(i));
                        } else {
                            addOrUpdateRow(writableDatabase, cachedContentValueAt);
                        }
                    } finally {
                        writableDatabase.endTransaction();
                    }
                }
                writableDatabase.setTransactionSuccessful();
                this.pendingUpdates.clear();
            } catch (SQLException e) {
                throw new DatabaseIOException(e);
            }
        }

        @Override // androidx.media3.datasource.cache.CachedContentIndex.Storage
        public void onUpdate(CachedContent cachedContent) {
            this.pendingUpdates.put(cachedContent.id, cachedContent);
        }

        @Override // androidx.media3.datasource.cache.CachedContentIndex.Storage
        public void onRemove(CachedContent cachedContent, boolean z) {
            if (z) {
                this.pendingUpdates.delete(cachedContent.id);
            } else {
                this.pendingUpdates.put(cachedContent.id, null);
            }
        }

        private Cursor getCursor() {
            return this.databaseProvider.getReadableDatabase().query((String) Assertions.checkNotNull(this.tableName), COLUMNS, null, null, null, null, null);
        }

        private void initializeTable(SQLiteDatabase sQLiteDatabase) throws DatabaseIOException, SQLException {
            VersionTable.setVersion(sQLiteDatabase, 1, (String) Assertions.checkNotNull(this.hexUid), 1);
            dropTable(sQLiteDatabase, (String) Assertions.checkNotNull(this.tableName));
            sQLiteDatabase.execSQL("CREATE TABLE " + this.tableName + " (id INTEGER PRIMARY KEY NOT NULL,key TEXT NOT NULL,metadata BLOB NOT NULL)");
        }

        private void deleteRow(SQLiteDatabase sQLiteDatabase, int i) {
            sQLiteDatabase.delete((String) Assertions.checkNotNull(this.tableName), WHERE_ID_EQUALS, new String[]{Integer.toString(i)});
        }

        private void addOrUpdateRow(SQLiteDatabase sQLiteDatabase, CachedContent cachedContent) throws IOException, SQLException {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            CachedContentIndex.writeContentMetadata(cachedContent.getMetadata(), new DataOutputStream(byteArrayOutputStream));
            byte[] byteArray = byteArrayOutputStream.toByteArray();
            ContentValues contentValues = new ContentValues();
            contentValues.put("id", Integer.valueOf(cachedContent.id));
            contentValues.put(COLUMN_KEY, cachedContent.key);
            contentValues.put("metadata", byteArray);
            sQLiteDatabase.replaceOrThrow((String) Assertions.checkNotNull(this.tableName), null, contentValues);
        }

        private static void delete(DatabaseProvider databaseProvider, String str) throws DatabaseIOException {
            try {
                String tableName = getTableName(str);
                SQLiteDatabase writableDatabase = databaseProvider.getWritableDatabase();
                writableDatabase.beginTransactionNonExclusive();
                try {
                    VersionTable.removeVersion(writableDatabase, 1, str);
                    dropTable(writableDatabase, tableName);
                    writableDatabase.setTransactionSuccessful();
                } finally {
                    writableDatabase.endTransaction();
                }
            } catch (SQLException e) {
                throw new DatabaseIOException(e);
            }
        }

        private static void dropTable(SQLiteDatabase sQLiteDatabase, String str) throws SQLException {
            sQLiteDatabase.execSQL("DROP TABLE IF EXISTS " + str);
        }

        private static String getTableName(String str) {
            return TABLE_PREFIX + str;
        }
    }
}
