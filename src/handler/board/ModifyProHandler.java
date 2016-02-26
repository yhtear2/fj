
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
import dto.board.BoardDataBean;
import handler.Commandhandler;



@Controller
public class ModifyProHandler implements Commandhandler {

	//* CreateBean의 dao 를 불러오기 위한 Resource 작업  (AutoWired 로 사용해도 된다)  *//

	@Resource(name="boardDao")  // logon 패키지의  CreateBean 자바파일에 있는 객체 dao 
	private BoardDao dao;   
	
	@RequestMapping("/boardmodifyPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	Map<String, Object> map = new HashMap<String, Object>();
		request.setCharacterEncoding( "utf-8" );	
	
		BoardDataBean dto = new BoardDataBean();
		dto.setBoard_num( Integer.parseInt( request.getParameter( "board_num" ) ) );
		dto.setCategory(request.getParameter("category"));   
		dto.setSubject( request.getParameter( "subject" ) );
		dto.setHstag(request.getParameter("hstag"));
		dto.setContent( request.getParameter( "content" ) );
	
		String pageNum = request.getParameter( "pageNum" );
		
		int result = dao.updateArticle( dto );	
		
		/* 
		request.setAttribute( "pageNum", pageNum );
		request.setAttribute( "result", result );	*/
		
		map.put("pageNum", pageNum);
		map.put("result", result); 
		
		map.put("page", "/FJ_BOARD/boardmodifyPro");   
		return new ModelAndView("/FJ_MAIN/main", map);
	}
}









