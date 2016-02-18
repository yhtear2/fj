package dao.message;

import java.util.ArrayList;

import dto.message.MessageDataBean;

public interface MessageDao {
	public int sendMessage(MessageDataBean dto);
	public int getCount(String email);
	public ArrayList<MessageDataBean> getList( int start, int end, String email );
	public MessageDataBean getContent(int message_num);
	public int addReadContent(int message_num);
	public int deleteMessage(int message_num);
	public int getSendCount(String sender); 
	public ArrayList<MessageDataBean> getSendList( int start, int end, String sender );
}
