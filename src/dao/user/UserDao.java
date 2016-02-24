package dao.user;

import dto.user.SchoolDataBean;
import dto.user.UserDataBean;

public interface UserDao {
	public int insertArticle( UserDataBean dto );
	public int insertArticle_sc( SchoolDataBean dto);
	
}
