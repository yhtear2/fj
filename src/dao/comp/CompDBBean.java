package dao.comp;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dao.SqlMapClient;
import dto.comp.CompDataBean;
import dto.recruit.Recruit_LogDataBean;

public class CompDBBean implements CompDao{
	private SqlSession sqlSession = SqlMapClient.getSqlSession();

	@Override
	public CompDataBean getComp(String email) {
		return sqlSession.selectOne("Comp.selectComp", email);
	}

	@Override
	public int insertComp(CompDataBean dto) {
		return sqlSession.insert("Comp.insertComp", dto);
	}


	@Override
	public int updateComp(CompDataBean dto) {
		return sqlSession.update("Comp.updateComp", dto);
	}

	@Override
	public int deleteCdomp(String email) {
		return sqlSession.delete("Comp.deleteComp", email);
	}

	@Override
	public int countComp(String email) {
		return sqlSession.selectOne("Comp.countComp", email);
	}
}
