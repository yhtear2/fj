package dao.recruit;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dao.SqlMapClient;
import dto.recruit.RecruitDataBean;

public class RecruitDBBean implements RecruitDao {
	private SqlSession sqlSession = SqlMapClient.getSqlSession();

	@Override
	public int getRecruitCount() {
		return sqlSession.selectOne("Recruit.getRecruitCount");
	}
	
	@Override
	public List<RecruitDataBean> getRecruitList() {
		return sqlSession.selectList("Recruit.getRecruitList");
	}


}
