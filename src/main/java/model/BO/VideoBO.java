package model.BO;

import java.sql.*;
import java.util.List;

import model.DAO.VideoDAO;
import model.bean.Video;

public class VideoBO {

    private VideoDAO videoDAO;

    // Constructor
    public VideoBO() {
        videoDAO = videoDAO.getInstance();
    }

    // Thêm video
    public void addVideo(Video video) {
        try {
        	videoDAO.addVideo(video);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Lấy video theo ID
    public Video getVideoById(int videoId) {
        try {
            return videoDAO.getVideoById(videoId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Lấy tất cả video theo kênh
    public List<Video> getVideosByChannel(int channelId) {
        try {
            return videoDAO.getVideosByChannel(channelId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Cập nhật video
    public void updateVideo(Video video) {
        try {
            videoDAO.updateVideo(video);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Xóa video
    public void deleteVideo(int videoId) {
        try {
            videoDAO.deleteVideo(videoId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
