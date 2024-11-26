package model.bean;

public class Channel {
    private int channelId;    // ID của kênh
    private int userId;       // ID người dùng (chủ kênh)
    private String name;      // Tên kênh
    private String description; // Mô tả kênh
    private String createdAt; // Ngày tạo kênh (chuỗi thời gian)

    // Constructor không tham số
    public Channel() {
    }

    // Constructor đầy đủ tham số
    public Channel(int channelId, int userId, String name, String description, String createdAt) {
        this.channelId = channelId;
        this.userId = userId;
        this.name = name;
        this.description = description;
        this.createdAt = createdAt;
    }

    // Getter và Setter
    public int getChannelId() {
        return channelId;
    }

    public void setChannelId(int channelId) {
        this.channelId = channelId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
        return "Channel{" +
                "channelId=" + channelId +
                ", userId=" + userId +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", createdAt='" + createdAt + '\'' +
                '}';
    }
}
