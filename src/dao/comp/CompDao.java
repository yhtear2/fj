package dao.comp;

import dto.comp.CompDataBean;

public interface CompDao {
	public CompDataBean getComp(String email);
	public int insertComp(CompDataBean dto);
	public int updateComp(CompDataBean dto);
	public int deleteCdomp(String email);
}
