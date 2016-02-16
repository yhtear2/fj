package dao.board;

import org.apache.ibatis.session.SqlSession;

import dao.SqlMapClient;
import dto.board.BoardDataBean; 


public class BoardDBBean implements BoardDao {
private SqlSession sqlSession = SqlMapClient.getSqlSession();
	
	

	
	public int insertArticle( BoardDataBean dto ) {
	//	int num = dto.getNum(); 
		String subject = dto.getSubject(); 
		String sql = null;
		
			
		
		// set 으로 우선 호출한다 
		dto.setSubject(subject); 
	//	dto.setNum(num);
		return sqlSession.insert("Board.insertArticle", dto);
			
	}
	
	/*   필요 없다 
	RowMapper <BoardDataBean> mapper = new RowMapper<BoardDataBean>() {
		@Override
		public BoardDataBean mapRow(ResultSet rs, int rows ) throws SQLException {
			BoardDataBean dto = new BoardDataBean();
			dto.setNum( rs.getInt( "num" ) );
			dto.setWriter( rs.getString( "writer" ) );
			dto.setEmail( rs.getString( "email" ) );
			dto.setSubject( rs.getString( "subject" ) );
			dto.setPasswd( rs.getString( "passwd" ) );
			dto.setReg_date( rs.getTimestamp( "reg_date" ) );
			dto.setReadcount( rs.getInt( "readcount" ) );
			dto.setRef( rs.getInt( "ref" ) );
			dto.setRe_step( rs.getInt( "re_step" ) );
			dto.setRe_level( rs.getInt( "re_level" ) );
			dto.setContent( rs.getString( "content" ) );
			dto.setIp( rs.getString( "ip" ) );			
			return dto;
		}
	};	
	*/
	
	
	//  기존 start 하고 end가 int 값이므로, map으로 String 값을 받기 위해 ListHandler 와 DAO로 가서 수정할 것 
	/*
	public List<BoardDataBean> getArticles( int start, int end ) {
		List <BoardDataBean> list = getJdbcTemplate().query(
			sql,
			new Object[] {start, end},
			mapper
		); 	
		return list;
	}
	*/ 
	/*
	public List<BoardDataBean> getArticles( Map<String, Integer> map ) {
		return sqlSession.selectList( "Board.getArticles", map ); 
	} 
	
	
	
	public BoardDataBean getArticle( int num ) {
		return sqlSession.selectOne("Board.getArticle", num);
	}
*/
	
} // class

