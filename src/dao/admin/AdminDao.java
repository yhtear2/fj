package dao.admin;

import dto.join.JoinDataBean;

public interface AdminDao {
	public JoinDataBean managementGetMember(String email);
	public int managementUpdateMember(JoinDataBean dto);
	public int managementDeleteMember(String email);
}
