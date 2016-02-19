package dao.board;

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
		
		int category = dto.getCategory();
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
				
			}
		}
		*/ 
		String sql = null;
		
		 
		
		// set 으로 우선 호출한다   
		dto.setCategory(category);
		dto.setSubject(subject);
		dto.setContent(content);
	 
		return sqlSession.insert("FJ_BOARD.insertArticle", dto);  
			
	}
	
	public int updateArticle( BoardDataBean dto)
	{
		return sqlSession.update("FJ_BOARD.updateArticle", dto); 
	}
	
	
} // class

