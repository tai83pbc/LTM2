package model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.bean.Video;

public class VideoDAO {
	private Connection conn;
	private static VideoDAO instance;
	private VideoDAO() {
		connectDB();
    }
	private void connectDB() 
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			conn =  DriverManager.getConnection("jdbc:mysql://localhost:3306/LTM","root","");
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	
	// Thêm một video mới
    public void addVideo(Video video) throws Exception {
        String query = "INSERT INTO Videos (channelId, title, description, size, format, videoUrl, createdAt) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, video.getChannelId());
            stmt.setString(2, video.getTitle());
            stmt.setString(3, video.getDescription());
            stmt.setInt(4, video.getSize());
            stmt.setString(5, video.getFormat());
            stmt.setString(6, video.getVideoUrl());
            stmt.setString(7, video.getCreatedAt());
            stmt.executeUpdate();
        }
    }

    // Lấy video theo ID
    public Video getVideoById(int videoId) throws Exception {
        String query = "SELECT * FROM Videos WHERE videoId = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, videoId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Video(
                    rs.getInt("videoId"),
                    rs.getInt("channelId"),
                    rs.getString("title"),
                    rs.getString("description"),
                    rs.getInt("size"),
                    rs.getString("format"),
                    rs.getString("videoUrl"),
                    rs.getString("createdAt")
                );
            }
        }
        return null;
    }

    // Lấy tất cả video theo kênh
    public List<Video> getVideosByChannel(int channelId) throws Exception {
        List<Video> videos = new ArrayList<>();
        String query = "SELECT * FROM Videos WHERE channelId = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, channelId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Video video = new Video(
                    rs.getInt("videoId"),
                    rs.getInt("channelId"),
                    rs.getString("title"),
                    rs.getString("description"),
                    rs.getInt("size"),
                    rs.getString("format"),
                    rs.getString("videoUrl"),
                    rs.getString("createdAt")
                );
                videos.add(video);
            }
        }
        return videos;
    }

    // Cập nhật video
    public void updateVideo(Video video) throws Exception {
        String query = "UPDATE Videos SET title = ?, description = ?, size = ?, format = ?, videoUrl = ?, createdAt = ? WHERE videoId = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, video.getTitle());
            stmt.setString(2, video.getDescription());
            stmt.setInt(3, video.getSize());
            stmt.setString(4, video.getFormat());
            stmt.setString(5, video.getVideoUrl());
            stmt.setString(6, video.getCreatedAt());
            stmt.setInt(7, video.getVideoId());
            stmt.executeUpdate();
        }
    }

    // Xóa video
    public void deleteVideo(int videoId) throws Exception {
        String query = "DELETE FROM Videos WHERE videoId = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, videoId);
            stmt.executeUpdate();
        }
    }
	public static VideoDAO getInstance() {
        if (instance == null) {
            instance = new VideoDAO();
        }
        return instance;
    }
}
