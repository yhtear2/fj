package dao.recruit;

import java.util.List;
import java.util.Map;

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

	@Override
	public List<RecruitDataBean> getRecruitList(Map<String, Integer> map) {
		return sqlSession.selectList("Recruit.getRecruitList", map);
	}

	@Override
	public int insertRecruit(RecruitDataBean dto) {
		return sqlSession.insert("Recruit.insertRecruit", dto);
	}


}
