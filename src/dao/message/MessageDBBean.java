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
		return sqlSession.update("Message.sendMessage", dto);
		
	}

	@Override
	public int getCount() {
		return sqlSession.selectOne("Message.getCount");
	}

}
