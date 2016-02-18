package dao.message;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dao.SqlMapClient;
import dto.message.MessageDataBean;


public class MessageDBBean implements MessageDao {
	private SqlSession sqlSession = SqlMapClient.getSqlSession();
	private Map<String, Object> map = null;
	
	// 메세지 보내는 DB 연결
	@Override
	public int sendMessage(MessageDataBean dto) {
		return sqlSession.update("Message.sendMessage", dto);
	}

	// 카운터 받아오는 DB 연결
	@Override
	public int getCount() {
		return sqlSession.selectOne("Message.getCount");
	}

	// 리스트 받아오는 DB연결
	@Override
	public ArrayList<MessageDataBean> getList(String email) {
		List<MessageDataBean> list = null;
		list = sqlSession.selectList("Message.getList", email);
		return (ArrayList<MessageDataBean>) list;
	}

}
