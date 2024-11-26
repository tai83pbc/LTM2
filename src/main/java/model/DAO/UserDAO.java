package model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.Out;

import model.bean.User;
import model.bean.Video;

public class UserDAO {
	private Connection conn;
	private static UserDAO instance;
	private UserDAO() {
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

    // Thêm người dùng mới
    public void addUser(User user) throws Exception {
        String sql = "INSERT INTO Users (userName, email, password) VALUES (?, ?, ?)";
        try ( PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.executeUpdate();
        }
    }

    // Lấy thông tin người dùng
    public User getUser(int userId) throws Exception {
        String sql = "SELECT * FROM Users WHERE userId = ?";
        try ( PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt(1));
                user.setUsername(rs.getString(2));
                user.setEmail(rs.getString(3));
                user.setPassword(rs.getString(4));
                return user;
            }
            return null;
        }
    }

    // Cập nhật thông tin người dùng
    public void updateUser(User user) throws Exception {
        String sql = "UPDATE Users SET userName = ?, email = ?, password = ? WHERE userId = ?";
        try ( PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.setInt(4, user.getUserId());
            stmt.executeUpdate();
        }
    }

    // Xóa người dùng
    public void deleteUser(int userId) throws Exception {
        String sql = "DELETE FROM Users WHERE userId = ?";
        try ( PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.executeUpdate();
        }
    }
	public User getUserByNameAndPassword(String username, String password) throws Exception {
		String sql = "SELECT * FROM `users` WHERE username = ? AND password = ?;";
		 try ( PreparedStatement stmt = conn.prepareStatement(sql)) {
			 stmt.setString(1, username);
			 stmt.setString(2, password);
	            ResultSet rs = stmt.executeQuery();
	            if (rs.next()) {
	                User user = new User();
	                user.setUserId(rs.getInt(1));
	                user.setUsername(rs.getString(2));
	                user.setEmail(rs.getString(3));
	                user.setPassword(rs.getString(4));
	                System.out.println("OK");
	                return user;
	            }
	            return null;
		 }
	}
	public static UserDAO getInstance() {
        if (instance == null) {
            instance = new UserDAO();
        }
        return instance;
    }

}
