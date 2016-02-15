package dao.recruit;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dao.SqlMapClient;
import dto.recruit.RecruitDataBean;

public class RecruitDBBean implements RecruitDao {
	private SqlSession sqlSession = SqlMapClient.getSqlSession();
	
	public int getRecruitCount(){
		return sqlSession.selectOne("Recruit.getRecruitCount");
	}
	
	
	public List<RecruitDataBean> getRecruitList(Map<String, Integer> map){
		return sqlSession.selectList("Recruit.getRecruitList", map);
	}
}
