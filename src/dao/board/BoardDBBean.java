package dao.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dao.SqlMapClient;
import dto.board.BoardCommentDataBean;
import dto.board.BoardDataBean;
   
      
 
public class BoardDBBean implements BoardDao {
private SqlSession sqlSession = SqlMapClient.getSqlSession();
	
	@Override 
	public int getCount()
	{
		return sqlSession.selectOne("FJ_BOARD.getCount"); 
	} 
	 
	@Override 
	public int insertArticle( BoardDataBean dto ) {
		
		int board_num = dto.getBoard_num();
		int re_step = dto.getRe_step();
		int re_count = dto.getRe_count();
	//	String category = dto.getCategory();
	//	String hstag = dto.getHstag(); 
	//	String subject = dto.getSubject();
	//	String content = dto.getContent();
		
	
		
		
		if(board_num == 0)
		{
			int count = getCount();
			if(count > 0)
			{  
				System.out.println("board_num :" + dto.getBoard_num()); 
				int maxNum = sqlSession.selectOne("FJ_BOARD.getMaxNum");
				board_num = maxNum + 1;
				
			}
			else 
			{
				sqlSession.update("FJ_BOARD.updateReply", dto);
				re_step ++;
				re_count ++;
			}
		}
	
		// set 으로 우선 호출한다   
		dto.setBoard_num(board_num);
		dto.setRe_step(re_step);
		dto.setRe_count(re_count); 
	//	dto.setCategory(category);
	//	dto.setSubject(subject);
	//	dto.setContent(content);
	//	dto.setHstag(hstag);   
		System.out.println("hstag : " + dto.getHstag());
		System.out.println("content : " + dto.getContent());
		return sqlSession.insert("FJ_BOARD.insertArticle", dto);  
		 	
	}
	
	@Override 
	public int updateArticle( BoardDataBean dto)
	{
		return sqlSession.update("FJ_BOARD.updateArticle", dto); 
	}

	
	@Override 
	public List<BoardDataBean> getArticles( Map<String, Integer> map ) {
		return sqlSession.selectList( "FJ_BOARD.getArticles", map ); 
	} 
	  
	@Override 
	public BoardDataBean getArticle(int board_num) 
	{ 
		return sqlSession.selectOne("FJ_BOARD.getArticle", board_num);
	}

	@Override 
	public int addCount(int board_num)
	{
		return sqlSession.update("FJ_BOARD.addCount", board_num);
	}
	
	@Override 
	public int reCount(int board_num)
	{
		return sqlSession.update("FJ_BOARD.reCount", board_num); 
	}
	 
	@Override 
	public int deleteArticle( int board_num ) {		
		return  sqlSession.delete("FJ_BOARD.deleteArticle", board_num);
	}

	@Override 
	public int commentList( BoardCommentDataBean cdto) 
	{
		return sqlSession.insert("FJ_BOARD.commentList", cdto);
	}
	  
	@Override  
	public  List<BoardCommentDataBean> getCommentList(int board_num) 
	{
		return sqlSession.selectOne("FJ_BOARD.getCommentList", board_num);   
	}




/*
	public int checkArticle(int board_num)
	{
	
		BoardDataBean dto = getArticle(board_num); 
		int result = 0;  
		if(
		{
			result = 1;
		}else
		{
			result = 0;
		}
		return result;
	}
*/

	
	
} // class  */

 