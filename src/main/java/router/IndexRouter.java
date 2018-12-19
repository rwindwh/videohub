package router;

import database.OrmTemplate;
import domain.Video;
import mvc.Router;
import mvc.View;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class IndexRouter implements Registrable {
    @Override
    public void registerRouter() {
        Router.get("/index.html", model -> {
            List<Video> videoList = OrmTemplate.queryList("select * from videohub_resource", Video.class);
            // Use our sublime java 8 stream APIs to group result set by identifying their category :)
            Map<String, List<Video>> res = videoList.stream().collect(Collectors.groupingBy(Video::getCategory));
            res.forEach((category, list) -> {

            });
            model.set("videos", res);
            return View.create("index.html", model);
        });
    }
}
