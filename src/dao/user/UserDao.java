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
	public List<UserDataBean> getUserList(Map<String, Object> map);
	public int deleteArticle_user( int user_history_id );
	public int deleteArticle_school( int user_history_id );
	public int deleteArticle_career( int user_history_id );
	public int deleteArticle_introduce( int user_history_id );

	public UserDataBean getContent( int user_history_id );
	List<SchoolDataBean> getContent_school(int user_history_id);
	List<CareerDataBean> getContent_career(int user_history_id);
	List<IntroduceDataBean> getContent_introduce(int user_history_id);
	public UserDataBean getUser_history_id(int user_history_id);
	//홍석 추가
	public int getUserhistoryid();
	public int updateTotalCareer( Map<String, Object> map);
	public int updateUserData( UserDataBean dto );
	public int updateSchoolData( SchoolDataBean dto);
	public int updateCareerData( CareerDataBean dto);
	public int updateIntroduceData( IntroduceDataBean dto);
	


}
