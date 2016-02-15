package dao.recruit;

import java.util.List;

import dto.recruit.RecruitDataBean;

public interface RecruitDao {
	public int getRecruitCount();
	public List<RecruitDataBean> getRecruitList();
}
