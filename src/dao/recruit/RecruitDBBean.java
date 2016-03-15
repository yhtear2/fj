package dao.recruit;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dao.SqlMapClient;
import dto.recruit.RecruitDataBean;
import dto.recruit.Recruit_LogDataBean;
import dto.user.CareerDataBean;
import dto.user.UserDataBean;

public class RecruitDBBean implements RecruitDao {
	
	private SqlSession sqlSession = SqlMapClient.getSqlSession();

	@Override
	public int getRecruitCount() {
		return sqlSession.selectOne("Recruit.getRecruitCount");
	}
	
	@Override
	public List<RecruitDataBean> getRecruitList(Map<String, Integer> map) {
		return sqlSession.selectList("Recruit.getRecruitList", map);
	}

	
	@Override
	public int insertRecruit(RecruitDataBean dto) {
		return sqlSession.insert("Recruit.insertRecruit", dto);
	}
	@Override
	public int insertRecruit_re(Recruit_LogDataBean dto) {
		return sqlSession.insert("Recruit.insertRecruit_re", dto);
	}
	
	@Override 
	public int deleteArticle( int user_history_id ) {		
		return  sqlSession.delete("Recruit.deleteArticle", user_history_id);
	}
	
	@Override
	public RecruitDataBean getContent(int recruit_id) {
		return sqlSession.selectOne("Recruit.getContent", recruit_id);
	}


	@Override
	public List<Recruit_LogDataBean> get_history_id(Map<String, Integer> map) {
		return sqlSession.selectList("Recruit.get_history_id", map);
	}
	
	@Override
	public List<Recruit_LogDataBean> recruit_situation(Map<String, Integer> map) {
		return sqlSession.selectList("Recruit.recruit_situation", map);
	}
	
	@Override	
	public int getContent_re() {
		return sqlSession.selectOne("Recruit.getContent_re");
	}
	
	
	@Override
	public void addReadContent(int recruit_id) {
		sqlSession.update("Recruit.addReadContent", recruit_id);
		
	}
	@Override
	public List<UserDataBean> getRecruitEmail(Map<String, Object> map) {
		return sqlSession.selectList("Recruit.getRecruitEmail", map);
		
	}
	
	@Override
	public int modifyRecruit(RecruitDataBean dto) {
		return sqlSession.update("Recruit.modifyRecruit", dto);
		
	}

	@Override
	public int getRecruitId() {
		return sqlSession.selectOne("Recruit.getRecruitId");
	}



}
