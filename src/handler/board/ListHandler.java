
package handler.board;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.board.BoardDao;
import dto.board.BoardDataBean;
import handler.Commandhandler;


@Controller
public class ListHandler implements Commandhandler {
	
   
	//* CreateBean의 BoardDao 를 불러오기 위한 Resource 작업   *//


	@Resource(name="boardDao")  // dao. 패키지의  CreateBean 자바파일에 있는 객체 dao 
	private BoardDao boardDao; 
	
	@RequestMapping("/boardlist") 
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int pageSize = 10;     // 페이지 레코드 수 
		int pageBlock = 3;     // 페이지 번호 수 
	
		int count = 0;
		String pageNum = null;
		int currentPage = 0;
		int start = 0;
		int end = 0;
		int number = 0;
		int tag = 0; 
		
		int pageCount = 0;
		int startPage = 0;
		int endPage = 0;
	 
		count = boardDao.getCount(); 
		
		pageNum = request.getParameter( "pageNum" );
		if( pageNum == null ) 
		{
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt( pageNum );
		pageCount = count / pageSize + ( count%pageSize > 0 ? 1 : 0 );
		if( currentPage > pageCount ) 
		{
			currentPage = pageCount;
			pageNum = String.valueOf( pageCount );
		}
		
		start = ( currentPage - 1 ) * pageSize + 1;
		end = start + pageSize - 1;
		  
		number = count - ( currentPage - 1 ) * pageSize;
			
		startPage = ( currentPage / pageBlock ) * pageBlock + 1;
					//  ( 19 / 10 ) * 10 + 1		11
					
		if( currentPage % pageBlock == 0 ) startPage -= pageBlock;				
		endPage = startPage + pageBlock - 1;
					// 	11 + 10 - 1					20
					      
		if( endPage > pageCount ) endPage = pageCount;			
	
		request.setAttribute( "pageBlock", pageBlock );
		request.setAttribute( "count", count );
		request.setAttribute( "number", number );
		request.setAttribute( "pageNum", pageNum );
		request.setAttribute( "currentPage", currentPage );
		request.setAttribute( "startPage", startPage );
		request.setAttribute( "endPage", endPage );
		request.setAttribute( "pageCount", pageCount );
		request.setAttribute("tag", tag);
		 
		
		if( count != 0 ) {  
			// BoardDBBean 의 getArticles 부분에서 int 값이 두개이상이므로 매핑을 건다 
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put( "start", start );  
			map.put( "end", end );   
			map.put("count", count);
			map.put("tag", tag); 
			
			List<BoardDataBean> list =  boardDao.getArticles(map );
			request.setAttribute( "list", list );	   		
		}		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", "/FJ_BOARD/boardlist");  
		
		return new ModelAndView("/FJ_MAIN/main", map); 
	}	
}
 

 











