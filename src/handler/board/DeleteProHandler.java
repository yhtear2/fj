
package handler.board;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.board.BoardDao;
import handler.Commandhandler;



@Controller
public class DeleteProHandler implements Commandhandler {

	//* CreateBean의 dao 를 불러오기 위한 Resource 작업  (AutoWired 로 사용해도 된다)  *//

	@Resource(name="boardDao")  // logon 패키지의  CreateBean 자바파일에 있는 객체 dao 
	private BoardDao dao;  
	
	@RequestMapping("/boarddeletePro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	
		String pageNum = request.getParameter( "pageNum" );
		int board_num = Integer.parseInt( request.getParameter( "board_num" ) );
	//	String passwd = request.getParameter( "passwd" ); 
	
		int resultCheck = dao.deleteArticle( board_num);	

		request.setAttribute( "resultCheck", resultCheck );
		request.setAttribute( "pageNum", pageNum ); 
		    
	
		if( resultCheck != 0 ) {
			int result = dao.deleteArticle( board_num ); 
			request.setAttribute( "result", result );
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pageNum", pageNum);
		map.put("board_num", board_num); 
		
		map.put("page", "/FJ_BOARD/boarddelete");   
		return new ModelAndView("/FJ_MAIN/main", map); 
	}
}






