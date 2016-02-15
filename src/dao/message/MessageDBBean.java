package dao.message;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dao.SqlMapClient;
import dto.message.MessageDataBean;


public class MessageDBBean implements MessageDao {
	private SqlSession sqlSession = SqlMapClient.getSqlSession();
	private Map<String, Object> map = null;
	
	@Override
	public int sendMessage(MessageDataBean dto) {
		System.out.println("dao까지는 넘어오는거지???");
		return sqlSession.update("Message.sendMessage", dto);
		
	}

}
