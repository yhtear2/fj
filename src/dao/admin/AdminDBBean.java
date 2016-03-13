package dao.admin;

import org.apache.ibatis.session.SqlSession;

import dao.SqlMapClient;
import dto.join.JoinDataBean;

public class AdminDBBean implements AdminDao {
	private SqlSession sqlSession = SqlMapClient.getSqlSession();

	@Override
	public JoinDataBean managementGetMember(String email) {
		return sqlSession.selectOne( "Join.getMember", email );
	}

	@Override
	public int managementUpdateMember(JoinDataBean dto) {
		return sqlSession.update("Join.updateMember", dto);
	}

	@Override
	public int managementDeleteMember(String email) {
		return sqlSession.delete("Join.deleteMember", email);
	}
	

}
