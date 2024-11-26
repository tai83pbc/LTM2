package model.bean;

public class User {
    private int userId;       // ID của người dùng
    private String username;  // Tên đăng nhập
    private String email;     // Email người dùng
    private String password;  // Mật khẩu
    private String createdAt; // Ngày tạo tài khoản (định dạng chuỗi thời gian)

    // Constructor không tham số
    public User() {
    }

    // Constructor đầy đủ tham số
    public User(int userId, String username, String email, String password, String createdAt) {
        this.userId = userId;
        this.username = username;
        this.email = email;
        this.password = password;
        this.createdAt = createdAt;
    }

    // Getter và Setter
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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
        return "User{" +
                "userId=" + userId +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", createdAt='" + createdAt + '\'' +
                '}';
    }


}
