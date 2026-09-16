package com.google.common.reflect;

import com.google.common.base.CharMatcher;
import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import com.google.common.base.Splitter;
import com.google.common.base.StandardSystemProperty;
import com.google.common.collect.FluentIterable;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableSet;
import com.google.common.collect.Maps;
import com.google.common.collect.UnmodifiableIterator;
import com.google.common.io.ByteSource;
import com.google.common.io.CharSource;
import com.google.common.io.Resources;
import com.google.common.reflect.ClassPath;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLClassLoader;
import java.nio.charset.Charset;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Set;
import java.util.jar.Attributes;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;
import java.util.jar.Manifest;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public final class ClassPath {
    private static final String CLASS_FILE_NAME_EXTENSION = ".class";
    private final ImmutableSet<ResourceInfo> resources;
    private static final Logger logger = Logger.getLogger(ClassPath.class.getName());
    private static final Splitter CLASS_PATH_ATTRIBUTE_SEPARATOR = Splitter.on(" ").omitEmptyStrings();

    private ClassPath(ImmutableSet<ResourceInfo> resources) {
        this.resources = resources;
    }

    public static ClassPath from(ClassLoader classloader) throws IOException {
        ImmutableSet<LocationInfo> immutableSetLocationsFrom = locationsFrom(classloader);
        HashSet hashSet = new HashSet();
        UnmodifiableIterator<LocationInfo> it = immutableSetLocationsFrom.iterator();
        while (it.hasNext()) {
            hashSet.add(it.next().file());
        }
        ImmutableSet.Builder builder = ImmutableSet.builder();
        UnmodifiableIterator<LocationInfo> it2 = immutableSetLocationsFrom.iterator();
        while (it2.hasNext()) {
            builder.addAll((Iterable) it2.next().scanResources(hashSet));
        }
        return new ClassPath(builder.build());
    }

    public ImmutableSet<ResourceInfo> getResources() {
        return this.resources;
    }

    public ImmutableSet<ClassInfo> getAllClasses() {
        return FluentIterable.from(this.resources).filter(ClassInfo.class).toSet();
    }

    public ImmutableSet<ClassInfo> getTopLevelClasses() {
        return FluentIterable.from(this.resources).filter(ClassInfo.class).filter(new Predicate() { // from class: com.google.common.reflect.ClassPath$$ExternalSyntheticLambda0
            @Override // com.google.common.base.Predicate
            public final boolean apply(Object obj) {
                return ((ClassPath.ClassInfo) obj).isTopLevel();
            }
        }).toSet();
    }

    public ImmutableSet<ClassInfo> getTopLevelClasses(String packageName) {
        Preconditions.checkNotNull(packageName);
        ImmutableSet.Builder builder = ImmutableSet.builder();
        UnmodifiableIterator<ClassInfo> it = getTopLevelClasses().iterator();
        while (it.hasNext()) {
            ClassInfo next = it.next();
            if (next.getPackageName().equals(packageName)) {
                builder.add((ImmutableSet.Builder) next);
            }
        }
        return builder.build();
    }

    public ImmutableSet<ClassInfo> getTopLevelClassesRecursive(String packageName) {
        Preconditions.checkNotNull(packageName);
        String str = packageName + '.';
        ImmutableSet.Builder builder = ImmutableSet.builder();
        UnmodifiableIterator<ClassInfo> it = getTopLevelClasses().iterator();
        while (it.hasNext()) {
            ClassInfo next = it.next();
            if (next.getName().startsWith(str)) {
                builder.add((ImmutableSet.Builder) next);
            }
        }
        return builder.build();
    }

    public static class ResourceInfo {
        private final File file;
        final ClassLoader loader;
        private final String resourceName;

        static ResourceInfo of(File file, String resourceName, ClassLoader loader) {
            if (resourceName.endsWith(ClassPath.CLASS_FILE_NAME_EXTENSION)) {
                return new ClassInfo(file, resourceName, loader);
            }
            return new ResourceInfo(file, resourceName, loader);
        }

        ResourceInfo(File file, String resourceName, ClassLoader loader) {
            this.file = (File) Preconditions.checkNotNull(file);
            this.resourceName = (String) Preconditions.checkNotNull(resourceName);
            this.loader = (ClassLoader) Preconditions.checkNotNull(loader);
        }

        public final URL url() {
            URL resource = this.loader.getResource(this.resourceName);
            if (resource != null) {
                return resource;
            }
            throw new NoSuchElementException(this.resourceName);
        }

        public final ByteSource asByteSource() {
            return Resources.asByteSource(url());
        }

        public final CharSource asCharSource(Charset charset) {
            return Resources.asCharSource(url(), charset);
        }

        public final String getResourceName() {
            return this.resourceName;
        }

        final File getFile() {
            return this.file;
        }

        public int hashCode() {
            return this.resourceName.hashCode();
        }

        public boolean equals(@CheckForNull Object obj) {
            if (!(obj instanceof ResourceInfo)) {
                return false;
            }
            ResourceInfo resourceInfo = (ResourceInfo) obj;
            return this.resourceName.equals(resourceInfo.resourceName) && this.loader == resourceInfo.loader;
        }

        public String toString() {
            return this.resourceName;
        }
    }

    public static final class ClassInfo extends ResourceInfo {
        private final String className;

        ClassInfo(File file, String resourceName, ClassLoader loader) {
            super(file, resourceName, loader);
            this.className = ClassPath.getClassName(resourceName);
        }

        public String getPackageName() {
            return Reflection.getPackageName(this.className);
        }

        public String getSimpleName() {
            int iLastIndexOf = this.className.lastIndexOf(36);
            if (iLastIndexOf != -1) {
                return CharMatcher.inRange('0', '9').trimLeadingFrom(this.className.substring(iLastIndexOf + 1));
            }
            String packageName = getPackageName();
            if (packageName.isEmpty()) {
                return this.className;
            }
            return this.className.substring(packageName.length() + 1);
        }

        public String getName() {
            return this.className;
        }

        public boolean isTopLevel() {
            return this.className.indexOf(36) == -1;
        }

        public Class<?> load() {
            try {
                return this.loader.loadClass(this.className);
            } catch (ClassNotFoundException e) {
                throw new IllegalStateException(e);
            }
        }

        @Override // com.google.common.reflect.ClassPath.ResourceInfo
        public String toString() {
            return this.className;
        }
    }

    static ImmutableSet<LocationInfo> locationsFrom(ClassLoader classloader) {
        ImmutableSet.Builder builder = ImmutableSet.builder();
        UnmodifiableIterator<Map.Entry<File, ClassLoader>> it = getClassPathEntries(classloader).entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry<File, ClassLoader> next = it.next();
            builder.add((ImmutableSet.Builder) new LocationInfo(next.getKey(), next.getValue()));
        }
        return builder.build();
    }

    static final class LocationInfo {
        private final ClassLoader classloader;
        final File home;

        LocationInfo(File home, ClassLoader classloader) {
            this.home = (File) Preconditions.checkNotNull(home);
            this.classloader = (ClassLoader) Preconditions.checkNotNull(classloader);
        }

        public final File file() {
            return this.home;
        }

        public ImmutableSet<ResourceInfo> scanResources() throws IOException {
            return scanResources(new HashSet());
        }

        public ImmutableSet<ResourceInfo> scanResources(Set<File> scannedFiles) throws IOException {
            ImmutableSet.Builder<ResourceInfo> builder = ImmutableSet.builder();
            scannedFiles.add(this.home);
            scan(this.home, scannedFiles, builder);
            return builder.build();
        }

        private void scan(File file, Set<File> scannedUris, ImmutableSet.Builder<ResourceInfo> builder) throws IOException {
            try {
                if (file.exists()) {
                    if (file.isDirectory()) {
                        scanDirectory(file, builder);
                    } else {
                        scanJar(file, scannedUris, builder);
                    }
                }
            } catch (SecurityException e) {
                ClassPath.logger.warning("Cannot access " + file + ": " + e);
            }
        }

        private void scanJar(File file, Set<File> scannedUris, ImmutableSet.Builder<ResourceInfo> builder) throws IOException {
            try {
                JarFile jarFile = new JarFile(file);
                try {
                    UnmodifiableIterator<File> it = ClassPath.getClassPathFromManifest(file, jarFile.getManifest()).iterator();
                    while (it.hasNext()) {
                        File next = it.next();
                        if (scannedUris.add(next.getCanonicalFile())) {
                            scan(next, scannedUris, builder);
                        }
                    }
                    scanJarFile(jarFile, builder);
                } finally {
                    try {
                        jarFile.close();
                    } catch (IOException unused) {
                    }
                }
            } catch (IOException unused2) {
            }
        }

        private void scanJarFile(JarFile file, ImmutableSet.Builder<ResourceInfo> builder) {
            Enumeration<JarEntry> enumerationEntries = file.entries();
            while (enumerationEntries.hasMoreElements()) {
                JarEntry jarEntryNextElement = enumerationEntries.nextElement();
                if (!jarEntryNextElement.isDirectory() && !jarEntryNextElement.getName().equals("META-INF/MANIFEST.MF")) {
                    builder.add((ImmutableSet.Builder<ResourceInfo>) ResourceInfo.of(new File(file.getName()), jarEntryNextElement.getName(), this.classloader));
                }
            }
        }

        private void scanDirectory(File directory, ImmutableSet.Builder<ResourceInfo> builder) throws IOException {
            HashSet hashSet = new HashSet();
            hashSet.add(directory.getCanonicalFile());
            scanDirectory(directory, "", hashSet, builder);
        }

        private void scanDirectory(File directory, String packagePrefix, Set<File> currentPath, ImmutableSet.Builder<ResourceInfo> builder) throws IOException {
            File[] fileArrListFiles = directory.listFiles();
            if (fileArrListFiles == null) {
                ClassPath.logger.warning("Cannot read directory " + directory);
                return;
            }
            for (File file : fileArrListFiles) {
                String name = file.getName();
                if (file.isDirectory()) {
                    File canonicalFile = file.getCanonicalFile();
                    if (currentPath.add(canonicalFile)) {
                        scanDirectory(canonicalFile, packagePrefix + name + "/", currentPath, builder);
                        currentPath.remove(canonicalFile);
                    }
                } else {
                    String str = packagePrefix + name;
                    if (!str.equals("META-INF/MANIFEST.MF")) {
                        builder.add((ImmutableSet.Builder<ResourceInfo>) ResourceInfo.of(file, str, this.classloader));
                    }
                }
            }
        }

        public boolean equals(@CheckForNull Object obj) {
            if (!(obj instanceof LocationInfo)) {
                return false;
            }
            LocationInfo locationInfo = (LocationInfo) obj;
            return this.home.equals(locationInfo.home) && this.classloader.equals(locationInfo.classloader);
        }

        public int hashCode() {
            return this.home.hashCode();
        }

        public String toString() {
            return this.home.toString();
        }
    }

    static ImmutableSet<File> getClassPathFromManifest(File jarFile, @CheckForNull Manifest manifest) {
        if (manifest == null) {
            return ImmutableSet.of();
        }
        ImmutableSet.Builder builder = ImmutableSet.builder();
        String value = manifest.getMainAttributes().getValue(Attributes.Name.CLASS_PATH.toString());
        if (value != null) {
            for (String str : CLASS_PATH_ATTRIBUTE_SEPARATOR.split(value)) {
                try {
                    URL classPathEntry = getClassPathEntry(jarFile, str);
                    if (classPathEntry.getProtocol().equals("file")) {
                        builder.add((ImmutableSet.Builder) toFile(classPathEntry));
                    }
                } catch (MalformedURLException unused) {
                    logger.warning("Invalid Class-Path entry: " + str);
                }
            }
        }
        return builder.build();
    }

    static ImmutableMap<File, ClassLoader> getClassPathEntries(ClassLoader classloader) {
        LinkedHashMap linkedHashMapNewLinkedHashMap = Maps.newLinkedHashMap();
        ClassLoader parent = classloader.getParent();
        if (parent != null) {
            linkedHashMapNewLinkedHashMap.putAll(getClassPathEntries(parent));
        }
        UnmodifiableIterator<URL> it = getClassLoaderUrls(classloader).iterator();
        while (it.hasNext()) {
            URL next = it.next();
            if (next.getProtocol().equals("file")) {
                File file = toFile(next);
                if (!linkedHashMapNewLinkedHashMap.containsKey(file)) {
                    linkedHashMapNewLinkedHashMap.put(file, classloader);
                }
            }
        }
        return ImmutableMap.copyOf((Map) linkedHashMapNewLinkedHashMap);
    }

    private static ImmutableList<URL> getClassLoaderUrls(ClassLoader classloader) {
        if (classloader instanceof URLClassLoader) {
            return ImmutableList.copyOf(((URLClassLoader) classloader).getURLs());
        }
        if (classloader.equals(ClassLoader.getSystemClassLoader())) {
            return parseJavaClassPath();
        }
        return ImmutableList.of();
    }

    static ImmutableList<URL> parseJavaClassPath() {
        ImmutableList.Builder builder = ImmutableList.builder();
        for (String str : Splitter.on(StandardSystemProperty.PATH_SEPARATOR.value()).split(StandardSystemProperty.JAVA_CLASS_PATH.value())) {
            try {
                try {
                    builder.add((ImmutableList.Builder) new File(str).toURI().toURL());
                } catch (SecurityException unused) {
                    builder.add((ImmutableList.Builder) new URL("file", (String) null, new File(str).getAbsolutePath()));
                }
            } catch (MalformedURLException e) {
                logger.log(Level.WARNING, "malformed classpath entry: " + str, (Throwable) e);
            }
        }
        return builder.build();
    }

    static URL getClassPathEntry(File jarFile, String path) throws MalformedURLException {
        return new URL(jarFile.toURI().toURL(), path);
    }

    static String getClassName(String filename) {
        return filename.substring(0, filename.length() - 6).replace('/', '.');
    }

    static File toFile(URL url) {
        Preconditions.checkArgument(url.getProtocol().equals("file"));
        try {
            return new File(url.toURI());
        } catch (URISyntaxException unused) {
            return new File(url.getPath());
        }
    }
}
