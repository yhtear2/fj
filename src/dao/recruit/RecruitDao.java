package dao.recruit;

import java.util.List;
import java.util.Map;

import dto.recruit.RecruitDataBean;
import dto.recruit.Recruit_LogDataBean;
import dto.user.UserDataBean;

public interface RecruitDao {
	public int getRecruitCount();
	public List<RecruitDataBean> getRecruitList(Map<String, Integer> map);
	public List<Recruit_LogDataBean> get_history_id(Map<String, Integer> map);

	public int insertRecruit(RecruitDataBean dto);
	public int insertRecruit_re(Recruit_LogDataBean dto);
	public RecruitDataBean getContent( int recruit_id );

	public void addReadContent( int recruit_id );
	public List<UserDataBean> getRecruitEmail(Map<String, Object> maps);
	public int modifyRecruit(RecruitDataBean dto);
	public int getContent_re();

	
}

