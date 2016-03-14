package dao.user;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.board.BoardCommentDataBean;
import dto.recruit.RecruitDataBean;
import dto.user.CareerDataBean;
import dto.user.IntroduceDataBean;
import dto.user.SchoolDataBean;
import dto.user.UserDataBean;
import dao.SqlMapClient;

public class UserDBBean implements UserDao {
	
	
	private SqlSession sqlSession = SqlMapClient.getSqlSession();
	
	public int getUserCount() {
		return sqlSession.selectOne("User.getUserCount");
	}
	
	@Override
	public UserDataBean getContent(int user_history_id) {
		return sqlSession.selectOne("User.getContent", user_history_id);
	}	

	
	public  List<SchoolDataBean> getContent_school(int user_history_id) 
	{
		return sqlSession.selectList("User.getContent_school", user_history_id);   
	} 

	public  List<IntroduceDataBean> getContent_introduce(int user_history_id) 
	{
		return sqlSession.selectList("User.getContent_introduce", user_history_id);   
	}
	
	public  List<CareerDataBean> getContent_career(int user_history_id) 
	{
		return sqlSession.selectList("User.getContent_career", user_history_id);   
	}
	
	
	@Override
	public List<UserDataBean> getUserList(Map<String, Object> map) {
		return sqlSession.selectList("User.getUserList", map);
	}
	
	public int insertArticle( UserDataBean dto ) {
				
		return sqlSession.insert( "User.insertArticle", dto );
		
	}
	
	public int insertArticle_sc( SchoolDataBean dto ) {
		
		return sqlSession.insert( "User.insertArticle_sc", dto );
		
	}
	
	public int insertArticle_career( CareerDataBean dto ) {
		
		return sqlSession.insert( "User.insertArticle_career", dto );
		
	}	
	
	public int insertArticle_introduce( IntroduceDataBean dto ) {
		
		return sqlSession.insert( "User.insertArticle_introduce", dto );
		
	}		
	
	public UserDataBean getUser_history_id(int user_history_id) {
		return sqlSession.selectOne("User.getUser_history_id", user_history_id);
	}

	@Override
	public int updateTotalCareer(Map<String, Object> map) {
		return sqlSession.update("User.updateTotalCareer", map);
	}

	@Override
	public int getUserhistoryid() {
		return sqlSession.selectOne("User.getUserhistoryid");
	}

	@Override
	public int updateUserData(UserDataBean dto) {
		return sqlSession.update("User.updateUserData", dto);
	}

	@Override
	public int updateSchoolData(SchoolDataBean dto) {
		return sqlSession.update("User.updateSchoolData", dto);
	}

	@Override
	public int updateCareerData(CareerDataBean dto) {
		return sqlSession.update("User.updateCareerData", dto);
	}

	@Override
	public int updateIntroduceData(IntroduceDataBean dto) {
		return sqlSession.update("User.updateIntroduceData", dto);
	}

}
