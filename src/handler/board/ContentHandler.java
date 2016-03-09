 
package handler.board;

import java.util.HashMap;
import java.util.List;
//import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.board.BoardDao;
import dto.board.BoardCommentDataBean;
//import dto.board.BoardCommentDataBean;
import dto.board.BoardDataBean;
import handler.Commandhandler;



@Controller
public class ContentHandler implements Commandhandler {

	//* CreateBean의 dao 를 불러오기 위한 Resource 작업  (AutoWired 로 사용해도 된다)  *//

	@Resource(name="boardDao")   
	private BoardDao dao; 
	
	@RequestMapping("/boardcontent")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		
		String pageNum = request.getParameter( "pageNum" );
		int board_num = Integer.parseInt( request.getParameter( "board_num" ) );
		int number = Integer.parseInt( request.getParameter( "number" ) );
		int count = 0;
		int currentPage = 0;
		int pageSize = 10;
		
		currentPage = Integer.parseInt( pageNum );
		count = dao.getCount();
		number = count - ( currentPage - 1 ) * pageSize;
		
		BoardDataBean dto = dao.getArticle( board_num );  
	//	BoardCommentDataBean cdto = dao.getCommentList(board_num);
		int addresult = dao.addCount(board_num); 
		int reresult = dao.reCount(board_num);
		/*
		if( ! request.getRemoteAddr().equals( dto.getIp() ) )	 {
			dao.addCount( board_num );		
		} */   
	
	//	System.out.println(dto.getHstag()); 
	//	BoardCommentDataBean cdto = dao.getCommentList(map); 
		
		
		
		
		   
		System.out.println(board_num);   
		/*
		if( request.getParameter("board_num") != null)
		{
			board_num = Integer.parseInt(request.getParameter("board_num"));
			number = Integer.parseInt(request.getParameter("number")); 
			pageNum = request.getParameter("pageNum"); 
		
		 
		
		}  */  
		  
		// 바구니에 담자~
		// 그룹화 아이디 에다가 읽은 글 넘버 넣고
		
		
		  
		
	//	System.out.println( cdto==null ? "안들어가는cdto":"들어가는cdto");
		
		
		
				
		
		
		String[] tags = null;
	//	String recontents = null;
	//	String recontent = null;
		
		/*
		if( cdto != null)
		{
			map.put("cdto", cdto);
			for(int i=0 ; i<cdto.size() ; i++) {
				System.out.println(cdto.get(i).getRecontent().toString());
			}
		}  */ 
		
		
		request.setAttribute( "count", count );
		request.setAttribute( "number", number );
		request.setAttribute( "pageNum", pageNum );
		request.setAttribute( "currentPage", currentPage );
		
		
		Map<String, Object> map = new HashMap<String, Object>(); 
		
		List<BoardCommentDataBean> result = dao.getCommentList(board_num);
		
		if( dto.getHstag() != null ){
			tags = dto.getHstag().split(",");
			map.put("tags", tags);
		} 
		  
		map.put("count", count);
		map.put("number", number);
		map.put("pageNum", pageNum);
		map.put("board_num", board_num); 
		map.put( "dto", dto );
		
	//	System.out.println(map.get("tags"));
		
		/*for( int i=0; i<tags.length; i++){
			map.put("tag"+i, tags[i]);
		}*/
		   
		map.put("result", result);
		map.put("page", "/FJ_BOARD/boardcontent");  
		map.put("addresult", addresult);
		map.put("reresult", reresult);  
		return new ModelAndView("/FJ_MAIN/main", map);
		 
	}
	
}
   













