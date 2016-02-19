package dao.join;

import org.apache.ibatis.session.SqlSession;

import dao.SqlMapClient;
import dto.join.JoinDataBean;

public class JoinDBBean implements JoinDao {
private SqlSession sqlSession = SqlMapClient.getSqlSession();
	
	public int insertMember( JoinDataBean dto ) {			
		return sqlSession.insert( "Join.insertMember", dto ); 	
	}
	
		
	public int checkMember( String email ) {
		int result = 0;
		int count = sqlSession.selectOne( "Join.checkEmail", email );
		if( count == 0 ) {
			// 아이디가 없다.
			result = 0;
		} else {
			// 아이디가 있다.
			result = 1;
		}	
		return result;
	}
		
	public int checkMember( String email, String passwd ) {
		int result = 0;
		int count = checkMember( email );
		if( count == 0 ) {
			// 아이디가 없다
			result = -1;
		} else {
			// 아이디가 있다
			JoinDataBean dto = getMember( email );		
			if( passwd.equals( dto.getPasswd() ) ) {
				// 비밀번호가 같다
				result = 1;				
			} else {
				// 비밀번호가 다르다
				result = 0;
			}						
		}			
		return result;
	}
	
	
	
	public int deleteMember( String email ) {
		return sqlSession.delete( "Join.deleteMember", email );
	}
	

	public JoinDataBean getMember( String email ) {
		return sqlSession.selectOne( "Join.getMember", email );
	}

	
	
	public int updateMember( JoinDataBean dto ) {
		return sqlSession.update( "Join.updateMember", dto);
	}
}
