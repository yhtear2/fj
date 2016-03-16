package dao.comp;

import java.util.List;
import java.util.Map;

import dto.comp.CompDataBean;
import dto.recruit.Recruit_LogDataBean;

public interface CompDao {
	public CompDataBean getComp(String email);
	public int countComp(String email);
	public int insertComp(CompDataBean dto);
	public int updateComp(CompDataBean dto);
	public int deleteCdomp(String email);
	public List<CompDataBean> getComp_Resome(Map<String, Integer> map);

}
