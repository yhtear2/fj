package dao.user;

import dto.user.SchoolDataBean;
import dto.user.UserDataBean;

public interface UserDao {
	public int insertArticle( UserDataBean dto );
	public int insertArticle_sc( SchoolDataBean dto);
	public UserDataBean getUser_history_id(int user_history_id);

	
}
