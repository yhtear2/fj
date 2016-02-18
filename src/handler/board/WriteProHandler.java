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
public class WriteProHandler implements Commandhandler {

	@Resource(name="boardDao")
	private BoardDao dao;   
	
	@RequestMapping("/writePro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Map<String, Object> map = new HashMap<String, Object>();
		request.setCharacterEncoding( "utf-8" );
		
		System.out.println( (String)request.getParameter( "subject" ) );
		//BoardDataBean dto = new BoardDataBean();
		//dto.setSubject( (String) request.getParameter( "subject" ) );
		//int result = dao.insertArticle( dto ); 
		
		
		map.put("page", "/FJ_BOARD/writePro");
		return new ModelAndView("/FJ_MAIN/main", map);
	}
}






