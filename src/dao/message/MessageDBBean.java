package dao.message;

import java.util.ArrayList;
import java.util.HashMap;
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

	// 받은쪽지 카운터 받아오는 DB 연결
	@Override
	public int getCount(String email) {
		return sqlSession.selectOne("Message.getCount", email);
	}

	// 받은쪽지 리스트 받아오는 DB연결
	@Override
	public ArrayList<MessageDataBean> getList( int start, int end, String email ) {
		map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("email", email);
		
		List<MessageDataBean> list = null;
		list = sqlSession.selectList("Message.getList", map);
		return (ArrayList<MessageDataBean>) list;
	}

	// 쪽지 내용 DB
	@Override
	public MessageDataBean getContent(int message_num) {
		return sqlSession.selectOne("Message.getContent", message_num);
	}

	// 쪽지 읽으면 읽었다고 표시
	@Override
	public int addReadContent(int message_num) {
		return sqlSession.update("Message.addReadContent", message_num);
	}

	// 쪽지 삭제
	@Override
	public int deleteMessage(int message_num) {
		return sqlSession.delete("Message.deleteMessage", message_num);
	}

	// 보낸 쪽지 카운트
	@Override
	public int getSendCount(String sender) {
		return sqlSession.selectOne("Message.getSendCount", sender);
	}

	// 보낸 쪽지 리스트
	@Override
	public ArrayList<MessageDataBean> getSendList(int start, int end, String sender) {
		map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("sender", sender);
		
		List<MessageDataBean> list = null;
		list = sqlSession.selectList("Message.getSendList", map);
		return (ArrayList<MessageDataBean>) list;
	}

}
