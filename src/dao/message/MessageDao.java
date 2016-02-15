package dao.message;

import dto.message.MessageDataBean;

public interface MessageDao {
	public int sendMessage(MessageDataBean dto);
}
