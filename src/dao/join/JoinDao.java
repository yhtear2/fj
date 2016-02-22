package dao.join;

import dto.join.JoinDataBean;

public interface JoinDao {
	public int checkMember( String email, String passwd );
	public int checkMember( String email );
	public int checkName( String name );
	public int insertMember( JoinDataBean dto );
	public int deleteMember( String email );
	public JoinDataBean getMember( String email );
	public int updateMember( JoinDataBean dto );	
}
