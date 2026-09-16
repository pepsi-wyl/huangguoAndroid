package com.huawei.hms.ads.identifier;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
import android.text.TextUtils;
import android.util.Log;
import com.huawei.ads.R;
import java.io.UnsupportedEncodingException;
import java.lang.ref.SoftReference;
import java.security.GeneralSecurityException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.AlgorithmParameterSpec;
import java.security.spec.InvalidKeySpecException;
import java.util.Locale;
import javax.crypto.Cipher;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;

/* loaded from: classes2.dex */
public abstract class d {
    private static final byte[] a = new byte[0];
    private static final byte[] b = new byte[0];
    private static SoftReference<byte[]> c;

    public static class a {
        private static final Long a = 120000L;
        private static final byte[] h = new byte[0];
        private static volatile a i;
        private SharedPreferences b;
        private SharedPreferences c;
        private SharedPreferences d;
        private final byte[] e = new byte[0];
        private final byte[] f = new byte[0];
        private final byte[] g = new byte[0];
        private Context j;

        private a(Context context) {
            this.b = null;
            this.c = null;
            this.d = null;
            try {
                this.j = context.getApplicationContext();
                Context contextA = e.a(context);
                this.b = contextA.getSharedPreferences("identifier_sp_story_book_file", 4);
                this.c = contextA.getSharedPreferences("identifier_hiad_sp_bed_rock_file", 4);
                this.d = contextA.getSharedPreferences("identifier_hiad_sp_red_stone_file", 4);
            } catch (Throwable th) {
                Log.w("Aes128", "get SharedPreference error: " + th.getClass().getSimpleName());
            }
        }

        public static a a(Context context) {
            a aVar;
            if (i != null) {
                return i;
            }
            synchronized (h) {
                if (i == null) {
                    i = new a(context);
                }
                aVar = i;
            }
            return aVar;
        }

        public String a() {
            synchronized (this.f) {
                SharedPreferences sharedPreferences = this.d;
                if (sharedPreferences == null) {
                    return "";
                }
                String string = sharedPreferences.getString("read_first_chapter", "");
                if (TextUtils.isEmpty(string)) {
                    return string;
                }
                return d.a(string, d.a(this.j));
            }
        }

        public void a(String str) {
            synchronized (this.f) {
                if (this.d == null) {
                    return;
                }
                this.d.edit().putString("read_first_chapter", d.b(str, d.a(this.j))).apply();
            }
        }

        public void b() {
            synchronized (this.g) {
                SharedPreferences sharedPreferences = this.b;
                if (sharedPreferences == null) {
                    return;
                }
                sharedPreferences.edit().putLong("read_first_chapter_time", System.currentTimeMillis()).apply();
            }
        }

        void b(String str) {
            synchronized (this.e) {
                SharedPreferences sharedPreferences = this.c;
                if (sharedPreferences == null) {
                    return;
                }
                sharedPreferences.edit().putString("get_a_book", str).commit();
            }
        }

        void c(String str) {
            synchronized (this.g) {
                SharedPreferences sharedPreferences = this.b;
                if (sharedPreferences == null) {
                    return;
                }
                sharedPreferences.edit().putString("catch_a_cat", str).commit();
            }
        }

        public boolean c() {
            synchronized (this.g) {
                SharedPreferences sharedPreferences = this.b;
                if (sharedPreferences == null) {
                    return false;
                }
                long j = sharedPreferences.getLong("read_first_chapter_time", -1L);
                if (j < 0) {
                    return false;
                }
                return j + a.longValue() > System.currentTimeMillis();
            }
        }

        public void d() {
            synchronized (this.g) {
                SharedPreferences sharedPreferences = this.b;
                if (sharedPreferences == null) {
                    return;
                }
                sharedPreferences.edit().putBoolean("has_read_first_chapter", true).apply();
            }
        }

        public void d(String str) {
            synchronized (this.g) {
                this.b.edit().putString("read_second_chapter", str).apply();
            }
        }

        public boolean e() {
            synchronized (this.g) {
                SharedPreferences sharedPreferences = this.b;
                if (sharedPreferences == null) {
                    return false;
                }
                return sharedPreferences.getBoolean("has_read_first_chapter", false);
            }
        }

        String f() {
            synchronized (this.e) {
                SharedPreferences sharedPreferences = this.c;
                if (sharedPreferences == null) {
                    return null;
                }
                return sharedPreferences.getString("get_a_book", null);
            }
        }

        String g() {
            synchronized (this.g) {
                SharedPreferences sharedPreferences = this.b;
                if (sharedPreferences == null) {
                    return null;
                }
                String string = sharedPreferences.getString("catch_a_cat", null);
                if (string == null) {
                    string = d.a(d.a());
                    c(string);
                }
                return string;
            }
        }

        public String h() {
            String string;
            synchronized (this.g) {
                string = this.b.getString("read_second_chapter", "");
            }
            return string;
        }
    }

    private static String a(Context context, a aVar) {
        String strA = a(b());
        aVar.b(b(strA, d(context)));
        return strA;
    }

    public static String a(String str, String str2) {
        String strA;
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
            return null;
        }
        synchronized (a) {
            try {
                strA = a(str, b(str2));
            } catch (Throwable th) {
                Log.w("Aes128", "decrypt oaid ex: " + th.getClass().getSimpleName());
                return null;
            }
        }
        return strA;
    }

    public static String a(String str, byte[] bArr) {
        if (!TextUtils.isEmpty(str) && str.length() >= 32 && bArr != null && bArr.length != 0) {
            try {
                if (d()) {
                    return d(str, bArr);
                }
            } catch (Throwable th) {
                Log.w("Aes128", "fail to decrypt: " + th.getClass().getSimpleName());
            }
        }
        return "";
    }

    public static String a(byte[] bArr) {
        if (bArr == null || bArr.length == 0) {
            return "";
        }
        StringBuilder sb = new StringBuilder();
        for (byte b2 : bArr) {
            String hexString = Integer.toHexString(b2 & 255);
            if (hexString.length() == 1) {
                sb.append('0');
            }
            sb.append(hexString);
        }
        return sb.toString();
    }

    public static byte[] a() {
        return a(16);
    }

    public static byte[] a(int i) {
        byte[] bArr = new byte[i];
        c().nextBytes(bArr);
        return bArr;
    }

    public static byte[] a(Context context) {
        byte[] bArr;
        byte[] bArrC;
        synchronized (b) {
            SoftReference<byte[]> softReference = c;
            bArr = softReference != null ? softReference.get() : null;
            if (bArr == null) {
                try {
                    bArrC = b(b(context));
                } catch (UnsupportedEncodingException unused) {
                    Log.w("Aes128", "getWorkKeyBytes UnsupportedEncodingException");
                    bArrC = c(context);
                    bArr = bArrC;
                    c = new SoftReference<>(bArr);
                    return bArr;
                } catch (Throwable th) {
                    Log.w("Aes128", "getWorkKeyBytes " + th.getClass().getSimpleName());
                    bArrC = c(context);
                    bArr = bArrC;
                    c = new SoftReference<>(bArr);
                    return bArr;
                }
                bArr = bArrC;
                c = new SoftReference<>(bArr);
            }
        }
        return bArr;
    }

    private static byte[] a(Context context, String str) {
        return a(str, context.getString(R.string.identifier_hiad_str_2), context.getString(R.string.identifier_hiad_str_3));
    }

    public static byte[] a(String str) {
        byte[] bArr = new byte[0];
        try {
            return b(str);
        } catch (Throwable th) {
            Log.e("Aes128", "hex string 2 byte: " + th.getClass().getSimpleName());
            return bArr;
        }
    }

    private static byte[] a(String str, String str2, String str3) {
        byte[] bArrA = a(str);
        byte[] bArrA2 = a(str2);
        return a(a(bArrA, bArrA2), a(str3));
    }

    private static byte[] a(String str, byte[] bArr, byte[] bArr2) {
        if (!TextUtils.isEmpty(str) && c(bArr) && b(bArr2) && d()) {
            try {
                return a(str.getBytes("UTF-8"), bArr, bArr2);
            } catch (UnsupportedEncodingException e) {
                Log.e("Aes128", "GCM encrypt data error" + e.getMessage());
            }
        } else {
            Log.i("Aes128", "gcm encrypt param is not right");
        }
        return new byte[0];
    }

    private static byte[] a(byte[] bArr, byte[] bArr2) {
        if (bArr.length <= bArr2.length) {
            bArr2 = bArr;
            bArr = bArr2;
        }
        int length = bArr.length;
        int length2 = bArr2.length;
        byte[] bArr3 = new byte[length];
        int i = 0;
        while (i < length2) {
            bArr3[i] = (byte) (bArr2[i] ^ bArr[i]);
            i++;
        }
        while (i < bArr.length) {
            bArr3[i] = bArr[i];
            i++;
        }
        return bArr3;
    }

    public static byte[] a(byte[] bArr, byte[] bArr2, byte[] bArr3) throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException, InvalidAlgorithmParameterException {
        String str;
        if (bArr == null || bArr.length == 0) {
            str = "encrypt, contentBytes invalid.";
        } else if (bArr2 == null || bArr2.length < 16) {
            str = "encrypt, keyBytes invalid.";
        } else if (!d()) {
            str = "encrypt, osVersion too low.";
        } else if (bArr3 == null || bArr3.length < 12) {
            str = "encrypt, random invalid.";
        } else {
            try {
                SecretKeySpec secretKeySpec = new SecretKeySpec(bArr2, "AES");
                Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
                cipher.init(1, secretKeySpec, d(bArr3));
                return cipher.doFinal(bArr);
            } catch (GeneralSecurityException e) {
                Log.e("Aes128", "GCM encrypt data error" + e.getMessage());
            }
        }
        Log.i("Aes128", str);
        return new byte[0];
    }

    public static byte[] a(char[] cArr, byte[] bArr) throws InvalidKeySpecException, NoSuchAlgorithmException {
        return SecretKeyFactory.getInstance(Build.VERSION.SDK_INT > 26 ? "PBKDF2WithHmacSHA256" : "PBKDF2WithHmacSHA1").generateSecret(new PBEKeySpec(cArr, bArr, 10000, 256)).getEncoded();
    }

    private static String b(int i) {
        try {
            SecureRandom secureRandomC = c();
            StringBuilder sb = new StringBuilder();
            for (int i2 = 0; i2 < i; i2++) {
                sb.append(Integer.toHexString(secureRandomC.nextInt(16)));
            }
            return sb.toString();
        } catch (Throwable th) {
            Log.w("Aes128", "generate aes key1 err:" + th.getClass().getSimpleName());
            return "";
        }
    }

    private static String b(Context context) {
        String strA;
        if (context == null) {
            return "";
        }
        synchronized (b) {
            a aVarA = a.a(context);
            String strF = aVarA.f();
            if (strF != null) {
                String strA2 = a(strF, d(context));
                strA = TextUtils.isEmpty(strA2) ? a(context, aVarA) : strA2;
            }
        }
        return strA;
    }

    public static String b(String str, byte[] bArr) {
        StringBuilder sb;
        if (!TextUtils.isEmpty(str) && bArr != null && bArr.length != 0) {
            try {
                if (d()) {
                    return c(str, bArr);
                }
            } catch (Exception e) {
                e = e;
                sb = new StringBuilder("fail to cipher: ");
                sb.append(e.getClass().getSimpleName());
                Log.w("Aes128", sb.toString());
                return "";
            } catch (Throwable th) {
                e = th;
                sb = new StringBuilder("fail to cipher: ");
                sb.append(e.getClass().getSimpleName());
                Log.w("Aes128", sb.toString());
                return "";
            }
        }
        return "";
    }

    private static boolean b(byte[] bArr) {
        return bArr != null && bArr.length >= 12;
    }

    public static byte[] b() {
        return a(16);
    }

    public static byte[] b(String str) throws NumberFormatException, UnsupportedEncodingException {
        if (TextUtils.isEmpty(str)) {
            return new byte[0];
        }
        String upperCase = str.toUpperCase(Locale.ENGLISH);
        int length = upperCase.length() / 2;
        byte[] bArr = new byte[length];
        byte[] bytes = upperCase.getBytes("UTF-8");
        for (int i = 0; i < length; i++) {
            int i2 = i * 2;
            bArr[i] = (byte) (((byte) (Byte.decode("0x".concat(new String(new byte[]{bytes[i2]}, "UTF-8"))).byteValue() << 4)) ^ Byte.decode("0x".concat(new String(new byte[]{bytes[i2 + 1]}, "UTF-8"))).byteValue());
        }
        return bArr;
    }

    private static String c(String str) {
        if (!TextUtils.isEmpty(str) && str.length() >= 24) {
            return str.substring(0, 24);
        }
        Log.i("Aes128", "IV is invalid.");
        return "";
    }

    private static String c(String str, byte[] bArr) {
        byte[] bArrA;
        byte[] bArrA2;
        if (TextUtils.isEmpty(str) || bArr == null || bArr.length < 16 || !d() || (bArrA2 = a(str, bArr, (bArrA = a(12)))) == null || bArrA2.length == 0) {
            return "";
        }
        return a(bArrA) + a(bArrA2);
    }

    private static SecureRandom c() {
        SecureRandom instanceStrong;
        try {
            instanceStrong = Build.VERSION.SDK_INT >= 26 ? SecureRandom.getInstanceStrong() : SecureRandom.getInstance("SHA1PRNG");
        } catch (Exception e) {
            Log.w("Aes128", "getInstanceStrong, exception: " + e.getClass().getSimpleName());
            instanceStrong = null;
        }
        return instanceStrong == null ? new SecureRandom() : instanceStrong;
    }

    private static boolean c(byte[] bArr) {
        return bArr != null && bArr.length >= 16;
    }

    private static byte[] c(Context context) {
        Log.i("Aes128", "regenerateWorkKey");
        a.a(context).b("");
        return a(b(context));
    }

    private static String d(String str) {
        return (TextUtils.isEmpty(str) || str.length() < 24) ? "" : str.substring(24);
    }

    private static String d(String str, byte[] bArr) throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException, InvalidAlgorithmParameterException {
        if (!TextUtils.isEmpty(str) && bArr != null && bArr.length >= 16 && d()) {
            try {
                SecretKeySpec secretKeySpec = new SecretKeySpec(bArr, "AES");
                Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
                String strC = c(str);
                String strD = d(str);
                if (TextUtils.isEmpty(strC) || TextUtils.isEmpty(strD)) {
                    Log.i("Aes128", "ivParameter or encrypedWord is null");
                    return "";
                }
                cipher.init(2, secretKeySpec, d(a(strC)));
                return new String(cipher.doFinal(a(strD)), "UTF-8");
            } catch (UnsupportedEncodingException | GeneralSecurityException e) {
                Log.e("Aes128", "GCM decrypt data exception: " + e.getMessage());
            }
        }
        return "";
    }

    private static AlgorithmParameterSpec d(byte[] bArr) {
        return new GCMParameterSpec(128, bArr);
    }

    private static boolean d() {
        return true;
    }

    private static byte[] d(Context context) {
        String str;
        if (context == null) {
            return new byte[0];
        }
        a aVarA = a.a(context);
        try {
            return a(a(e(context)).toCharArray(), a(aVarA.g()));
        } catch (NoSuchAlgorithmException unused) {
            str = "get userRootKey NoSuchAlgorithmException";
            Log.w("Aes128", str);
            return null;
        } catch (InvalidKeySpecException unused2) {
            str = "get userRootKey InvalidKeySpecException";
            Log.w("Aes128", str);
            return null;
        }
    }

    private static byte[] e(Context context) {
        return a(context, f(context));
    }

    private static String f(Context context) {
        final a aVarA = a.a(context);
        String strH = aVarA.h();
        if (!TextUtils.isEmpty(strH)) {
            return strH;
        }
        final String strB = b(64);
        e.a.execute(new Runnable() { // from class: com.huawei.hms.ads.identifier.d.1
            @Override // java.lang.Runnable
            public void run() {
                aVarA.d(strB);
            }
        });
        return strB;
    }
}
