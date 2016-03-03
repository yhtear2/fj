package dao.user;

import dto.user.CareerDataBean;
import dto.user.IntroduceDataBean;
import dto.user.SchoolDataBean;
import dto.user.UserDataBean;

public interface UserDao {
	public int insertArticle( UserDataBean dto );
	public int insertArticle_sc( SchoolDataBean dto);
	public int insertArticle_career( CareerDataBean dto);
	public int insertArticle_introduce( IntroduceDataBean dto);


	public UserDataBean getUser_history_id(int user_history_id);

	
}
