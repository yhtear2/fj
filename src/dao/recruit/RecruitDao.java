package dao.recruit;

import java.util.List;
import java.util.Map;

import dto.recruit.RecruitDataBean;

public interface RecruitDao {
	public int getRecruitCount();
	public List<RecruitDataBean> getRecruitList(Map<String, Integer> map);
}
