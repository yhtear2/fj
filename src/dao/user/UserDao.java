package dao.user;

import java.util.List;
import java.util.Map;

import dto.user.CareerDataBean;
import dto.user.IntroduceDataBean;
import dto.user.SchoolDataBean;
import dto.user.UserDataBean;

public interface UserDao {
	public int getUserCount();
	
	public int insertArticle( UserDataBean dto );
	public int insertArticle_sc( SchoolDataBean dto);
	public int insertArticle_career( CareerDataBean dto);
	public int insertArticle_introduce( IntroduceDataBean dto);
	public List<UserDataBean> getUserList(Map<String, Integer> map);
	public UserDataBean getContent( int user_history_id );
	List<SchoolDataBean> getContent_school(int user_history_id);
	List<CareerDataBean> getContent_career(int user_history_id);
	List<IntroduceDataBean> getContent_introduce(int user_history_id);

	public UserDataBean getUser_history_id(int user_history_id);

	
}
