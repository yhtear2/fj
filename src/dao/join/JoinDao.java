package dao.join;

import java.util.ArrayList;

import dto.join.JoinDataBean;

public interface JoinDao {
	public int checkMember( String email, String passwd );
	public int checkMember( String email );
	public int checkName( String name );
	public int insertMember( JoinDataBean dto );
	public int deleteMember( String email );
	public JoinDataBean getMember( String email );
	public int updateMember( JoinDataBean dto );
	public String emailconfirm( String email );
	
	// 관리자용 겟하는거
	public int getMemberCount(int member_flag);
	public ArrayList<JoinDataBean> getMemberList(int start, int end, int member_flag);
}
