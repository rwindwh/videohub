package domain;

public class Video {
    private long id;
    private String video_title;
    private String video_file_name;
    private long require_point;
    private String category;
    private String video_url;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getVideo_title() {
        return video_title;
    }

    public void setVideo_title(String video_title) {
        this.video_title = video_title;
    }

    public String getVideo_file_name() {
        return video_file_name;
    }

    public void setVideo_file_name(String video_file_name) {
        this.video_file_name = video_file_name;
    }

    public long getRequire_point() {
        return require_point;
    }

    public void setRequire_point(long require_point) {
        this.require_point = require_point;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getVideo_url() {
        return video_url;
    }

    public void setVideo_url(String video_url) {
        this.video_url = video_url;
    }
}
