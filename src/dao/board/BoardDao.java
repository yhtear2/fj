package dao.board;
 

import java.util.List;
import java.util.Map;

import dto.board.BoardCommentDataBean;
import dto.board.BoardDataBean;

public interface BoardDao {  
		public int getCount();  
		public List<BoardDataBean> getArticles( Map<String, Integer> map );
		public int insertArticle( BoardDataBean dto ); 
		public BoardDataBean getArticle( int board_num );
		
		public int addCount(int board_num);
		public int updateArticle(BoardDataBean dto);   
//		public int checkArticle(int board_num); 
		public int deleteArticle(int board_num);
		public int reCount(int board_num);     
		public List<BoardCommentDataBean> getCommentList(int board_num);  // select 부분 
		public int commentList(BoardCommentDataBean cdto);      // insert 부분 
//		public BoardCommentDataBean getComment(int board_num);
		
	
		
		
		
		 
	
}
  