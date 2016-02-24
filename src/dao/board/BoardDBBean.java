package dao.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dao.SqlMapClient;
import dto.board.BoardDataBean;



public class BoardDBBean implements BoardDao {
private SqlSession sqlSession = SqlMapClient.getSqlSession();
	

	public int getCount()
	{
		return sqlSession.selectOne("FJ_BOARD.getCount"); 
	} 
	 
	 
	public int insertArticle( BoardDataBean dto ) {
		
		int board_num = dto.getBoard_num();
		int category = dto.getCategory();
		String hstag = dto.getHstag(); 
		String subject = dto.getSubject();
		String content = dto.getContent();
	
		
		/*
		if(board_num == 0)
		{
			int count = getCount();
			if(count > 0)
			{  
				int maxNum = sqlSession.selectOne("FJ_BOARD.getMaxNum");
				
			}
			else
			{
				sqlSession.update("FJ_BOARD.updateRe_com", dto);
			}
		}
		*/
		
		String sql = null;
		
		 
		
		// set 으로 우선 호출한다   
		dto.setCategory(category);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setHstag(hstag);
		
		return sqlSession.insert("FJ_BOARD.insertArticle", dto);  
			
	}
	
	public int updateArticle( BoardDataBean dto)
	{
		return sqlSession.update("FJ_BOARD.updateArticle", dto); 
	}

	
	@Override 
	
	public List<BoardDataBean> getArticles( Map<String, Integer> map ) {
		return sqlSession.selectList( "FJ_BOARD.getArticles", map ); 
	} 
	  
	public BoardDataBean getArticle(int board_num) 
	{ 
		return sqlSession.selectOne("FJ_BOARD.getArticle", board_num);
	}

	
	public void addCount(int board_num)
	{
		sqlSession.update("FJ_BOARD.addCount", board_num);
	}

	

	
	
} // class

