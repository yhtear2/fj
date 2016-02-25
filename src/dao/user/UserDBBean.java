package dao.user;

import org.apache.ibatis.session.SqlSession;

import dto.user.SchoolDataBean;
import dto.user.UserDataBean;
import dao.SqlMapClient;

public class UserDBBean implements UserDao {
	
	private SqlSession sqlSession = SqlMapClient.getSqlSession();
	
	public int insertArticle( UserDataBean dto ) {
				
		return sqlSession.insert( "User.insertArticle", dto );
		
	}
	
	public int insertArticle_sc( SchoolDataBean dto ) {
		
		return sqlSession.insert( "User.insertArticle_sc", dto );
		
	}	
	
	public UserDataBean getUser_history_id(int user_history_id) {
		return sqlSession.selectOne("User.getUser_history_id", user_history_id);
	}
}
