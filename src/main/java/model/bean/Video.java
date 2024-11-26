package model.bean;
public class Video {
    private int videoId;        // ID của video
    private int channelId;      // ID kênh đăng video
    private String title;       // Tiêu đề video
    private String description; // Mô tả video
    private int size;           // Kích thước video (tính bằng KB, MB, hoặc byte)
    private String format;      // Định dạng video (VD: MP4, AVI)
    private String videoUrl;    // Đường dẫn đến video
    private String createdAt;   // Thời gian tạo video (chuỗi thời gian)

    // Constructor không tham số
    public Video() {
    }

    // Constructor đầy đủ tham số
    public Video(int videoId, int channelId, String title, String description, int size, String format, String videoUrl, String createdAt) {
        this.videoId = videoId;
        this.channelId = channelId;
        this.title = title;
        this.description = description;
        this.size = size;
        this.format = format;
        this.videoUrl = videoUrl;
        this.createdAt = createdAt;
    }

    // Getter và Setter
    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public int getChannelId() {
        return channelId;
    }

    public void setChannelId(int channelId) {
        this.channelId = channelId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    // ToString để kiểm tra thông tin
    @Override
    public String toString() {
        return "Video{" +
                "videoId=" + videoId +
                ", channelId=" + channelId +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", size=" + size +
                ", format='" + format + '\'' +
                ", videoUrl='" + videoUrl + '\'' +
                ", createdAt='" + createdAt + '\'' +
                '}';
    }
}

