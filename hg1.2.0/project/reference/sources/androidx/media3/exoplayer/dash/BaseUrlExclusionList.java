package androidx.media3.exoplayer.dash;

import android.os.SystemClock;
import android.util.Pair;
import androidx.media3.common.util.Util;
import androidx.media3.exoplayer.dash.manifest.BaseUrl;
import com.google.common.collect.Iterables;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;

/* loaded from: classes.dex */
public final class BaseUrlExclusionList {
    private final Map<Integer, Long> excludedPriorities;
    private final Map<String, Long> excludedServiceLocations;
    private final Random random;
    private final Map<List<Pair<String, Integer>>, BaseUrl> selectionsTaken;

    public BaseUrlExclusionList() {
        this(new Random());
    }

    BaseUrlExclusionList(Random random) {
        this.selectionsTaken = new HashMap();
        this.random = random;
        this.excludedServiceLocations = new HashMap();
        this.excludedPriorities = new HashMap();
    }

    public void exclude(BaseUrl baseUrl, long j) {
        long jElapsedRealtime = SystemClock.elapsedRealtime() + j;
        addExclusion(baseUrl.serviceLocation, jElapsedRealtime, this.excludedServiceLocations);
        if (baseUrl.priority != Integer.MIN_VALUE) {
            addExclusion(Integer.valueOf(baseUrl.priority), jElapsedRealtime, this.excludedPriorities);
        }
    }

    public BaseUrl selectBaseUrl(List<BaseUrl> list) {
        List<BaseUrl> listApplyExclusions = applyExclusions(list);
        if (listApplyExclusions.size() < 2) {
            return (BaseUrl) Iterables.getFirst(listApplyExclusions, null);
        }
        Collections.sort(listApplyExclusions, new Comparator() { // from class: androidx.media3.exoplayer.dash.BaseUrlExclusionList$$ExternalSyntheticLambda0
            @Override // java.util.Comparator
            public final int compare(Object obj, Object obj2) {
                return BaseUrlExclusionList.compareBaseUrl((BaseUrl) obj, (BaseUrl) obj2);
            }
        });
        ArrayList arrayList = new ArrayList();
        int i = listApplyExclusions.get(0).priority;
        int i2 = 0;
        while (true) {
            if (i2 >= listApplyExclusions.size()) {
                break;
            }
            BaseUrl baseUrl = listApplyExclusions.get(i2);
            if (i != baseUrl.priority) {
                if (arrayList.size() == 1) {
                    return listApplyExclusions.get(0);
                }
            } else {
                arrayList.add(new Pair(baseUrl.serviceLocation, Integer.valueOf(baseUrl.weight)));
                i2++;
            }
        }
        BaseUrl baseUrl2 = this.selectionsTaken.get(arrayList);
        if (baseUrl2 != null) {
            return baseUrl2;
        }
        BaseUrl baseUrlSelectWeighted = selectWeighted(listApplyExclusions.subList(0, arrayList.size()));
        this.selectionsTaken.put(arrayList, baseUrlSelectWeighted);
        return baseUrlSelectWeighted;
    }

    public int getPriorityCountAfterExclusion(List<BaseUrl> list) {
        HashSet hashSet = new HashSet();
        List<BaseUrl> listApplyExclusions = applyExclusions(list);
        for (int i = 0; i < listApplyExclusions.size(); i++) {
            hashSet.add(Integer.valueOf(listApplyExclusions.get(i).priority));
        }
        return hashSet.size();
    }

    public static int getPriorityCount(List<BaseUrl> list) {
        HashSet hashSet = new HashSet();
        for (int i = 0; i < list.size(); i++) {
            hashSet.add(Integer.valueOf(list.get(i).priority));
        }
        return hashSet.size();
    }

    public void reset() {
        this.excludedServiceLocations.clear();
        this.excludedPriorities.clear();
        this.selectionsTaken.clear();
    }

    private List<BaseUrl> applyExclusions(List<BaseUrl> list) {
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        removeExpiredExclusions(jElapsedRealtime, this.excludedServiceLocations);
        removeExpiredExclusions(jElapsedRealtime, this.excludedPriorities);
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < list.size(); i++) {
            BaseUrl baseUrl = list.get(i);
            if (!this.excludedServiceLocations.containsKey(baseUrl.serviceLocation) && !this.excludedPriorities.containsKey(Integer.valueOf(baseUrl.priority))) {
                arrayList.add(baseUrl);
            }
        }
        return arrayList;
    }

    private BaseUrl selectWeighted(List<BaseUrl> list) {
        int i = 0;
        for (int i2 = 0; i2 < list.size(); i2++) {
            i += list.get(i2).weight;
        }
        int iNextInt = this.random.nextInt(i);
        int i3 = 0;
        for (int i4 = 0; i4 < list.size(); i4++) {
            BaseUrl baseUrl = list.get(i4);
            i3 += baseUrl.weight;
            if (iNextInt < i3) {
                return baseUrl;
            }
        }
        return (BaseUrl) Iterables.getLast(list);
    }

    private static <T> void addExclusion(T t, long j, Map<T, Long> map) {
        if (map.containsKey(t)) {
            j = Math.max(j, ((Long) Util.castNonNull(map.get(t))).longValue());
        }
        map.put(t, Long.valueOf(j));
    }

    private static <T> void removeExpiredExclusions(long j, Map<T, Long> map) {
        ArrayList arrayList = new ArrayList();
        for (Map.Entry<T, Long> entry : map.entrySet()) {
            if (entry.getValue().longValue() <= j) {
                arrayList.add(entry.getKey());
            }
        }
        for (int i = 0; i < arrayList.size(); i++) {
            map.remove(arrayList.get(i));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static int compareBaseUrl(BaseUrl baseUrl, BaseUrl baseUrl2) {
        int iCompare = Integer.compare(baseUrl.priority, baseUrl2.priority);
        return iCompare != 0 ? iCompare : baseUrl.serviceLocation.compareTo(baseUrl2.serviceLocation);
    }
}
