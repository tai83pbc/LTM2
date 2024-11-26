package model.BO;

import model.DAO.ChannelDAO;
import model.bean.Channel;

public class ChannelBO {
    private ChannelDAO channelDAO;

    public ChannelBO() {
        channelDAO = ChannelDAO.getInstance();
    }

    // Thêm kênh
    public void addChannel(Channel channel) throws Exception {
        channelDAO.addChannel(channel);
    }

    // Lấy thông tin kênh
    public Channel getChannel(int channelId) throws Exception {
        return channelDAO.getChannel(channelId);
    }

    // Cập nhật kênh
    public void updateChannel(Channel channel) throws Exception {
        channelDAO.updateChannel(channel);
    }

    // Xóa kênh
    public void deleteChannel(int channelId) throws Exception {
        channelDAO.deleteChannel(channelId);
    }
}
