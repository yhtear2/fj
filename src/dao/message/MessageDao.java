package dao.message;

import java.util.ArrayList;

import dto.message.MessageDataBean;

public interface MessageDao {
	public int sendMessage(MessageDataBean dto);
	public int getCount();
	public ArrayList<MessageDataBean> getList(String email);
}
