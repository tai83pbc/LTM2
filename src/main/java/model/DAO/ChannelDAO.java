package model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.bean.Channel;
import model.bean.User;

public class ChannelDAO {
	private Connection conn;
	private static ChannelDAO instance;
	private ChannelDAO() {
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

	// Thêm kênh mới
    public void addChannel(Channel channel) throws Exception {
        String sql = "INSERT INTO Channels (channelName, userId, channelDescription) VALUES (?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, channel.getName());
            stmt.setInt(2, channel.getUserId());
            stmt.setString(3, channel.getDescription());
            stmt.executeUpdate();
        }
    }

    // Lấy thông tin kênh
    public Channel getChannel(int channelId) throws Exception {
        String sql = "SELECT * FROM Channels WHERE channelId = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, channelId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Channel channel = new Channel();
                channel.setChannelId(rs.getInt("channelId"));
                channel.setName(rs.getString("channelName"));
                channel.setUserId(rs.getInt("userId"));
                channel.setDescription(rs.getString("channelDescription"));
                return channel;
            }
            return null;
        }
    }

    // Cập nhật thông tin kênh
    public void updateChannel(Channel channel) throws Exception {
        String sql = "UPDATE Channels SET channelName = ?, channelDescription = ? WHERE channelId = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, channel.getName());
            stmt.setString(2, channel.getDescription());
            stmt.setInt(3, channel.getChannelId());
            stmt.executeUpdate();
        }
    }

    // Xóa kênh
    public void deleteChannel(int channelId) throws Exception {
        String sql = "DELETE FROM Channels WHERE channelId = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, channelId);
            stmt.executeUpdate();
        }
    }
	public static ChannelDAO getInstance() {
        if (instance == null) {
            instance = new ChannelDAO();
        }
        return instance;
    }
}
