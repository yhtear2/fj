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
	public int commentList( BoardCommentDataBean cdto) {
		return sqlSession.insert("FJ_BOARD.commentList", cdto);
	}
	  
	@Override  
	public  List<BoardCommentDataBean> getCommentList(int board_num) {
		return sqlSession.selectList("FJ_BOARD.getCommentList", board_num);   
	}

	@Override
	public int deleteReply(int comment_board_num) {
		return sqlSession.delete("FJ_BOARD.deleteReply", comment_board_num);
		
	}

	@Override
	public void reCountMinus(int board_num) {
		sqlSession.update("FJ_BOARD.reCountMinus", board_num);
		
	} 


	
	
} // class  */

 