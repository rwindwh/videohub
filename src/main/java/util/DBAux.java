package util;

import database.OrmTemplate;
import domain.Video;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class DBAux {
    public static Map<String, List<Video>> getCategoriedMap() {
        List<Video> videoList = OrmTemplate.queryList("select * from videohub_resource", Video.class);
        // Use our sublime java 8 stream APIs to group result set by identifying their category :)
        Map<String, List<Video>> res = videoList.stream().collect(Collectors.groupingBy(Video::getCategory));
        return res;
    }
}
