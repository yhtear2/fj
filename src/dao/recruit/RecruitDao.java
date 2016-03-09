package dao.recruit;

import java.util.List;
import java.util.Map;

import dto.recruit.RecruitDataBean;
import dto.user.UserDataBean;

public interface RecruitDao {
	public int getRecruitCount();
	public List<RecruitDataBean> getRecruitList(Map<String, Integer> map);
	public int insertRecruit(RecruitDataBean dto);
	public RecruitDataBean getContent( int recruit_id );
	public void addReadContent( int recruit_id );
	public List<UserDataBean> getRecruitEmail(Map<String, Object> maps);
}

