package dao.board;
 
import dto.board.BoardDataBean;

public interface BoardDao { 
	//public int getCount(); 
		//public List<BoardDataBean> getArticles( Map <String, Integer> map );
		public int insertArticle( BoardDataBean dto );
		//public BoardDataBean getArticle( int num );
		
		//public void addCount(int num);
		public int updateArticle(BoardDataBean dto);
	//	public int checkArticle(int num, String passwd);
	//	public int deleteArticle(int num);     
		
	
}
