package handler.board;

import java.sql.Timestamp;
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
	    
	@RequestMapping("/boardwritePro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Map<String, Object> map = new HashMap<String, Object>();
		request.setCharacterEncoding( "utf-8" );
		
		System.out.println( request.getParameter("category"));  
		System.out.println( (String)request.getParameter( "subject" ) );
		System.out.println( (String)request.getParameter("content"));
		//BoardDataBean dto = new BoardDataBean();
		//dto.setSubject( (String) request.getParameter( "subject" ) );
		//int result = dao.insertArticle( dto ); 
		
		BoardDataBean dto = new BoardDataBean();
		dto.setBoard_num(Integer.parseInt(request.getParameter("board_num")));
		dto.setScrap_count(Integer.parseInt(request.getParameter("scrap_count")));
		dto.setRe_count(Integer.parseInt(request.getParameter("re_count")));
		dto.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		dto.setRead_count(Integer.parseInt(request.getParameter("read_count"))); 
		dto.setRecom_count(Integer.parseInt(request.getParameter("recom_count")));
		dto.setBad_count(Integer.parseInt(request.getParameter("bad_count")));
		dto.setCategory(Integer.parseInt(request.getParameter("category")));
		dto.setSubject((String)request.getParameter("subject"));
		dto.setContent((String)request.getParameter("content"));  
		dto.setHstag((String)request.getParameter("hstag"));
		dto.setEmail((String)request.getParameter("email"));
		dto.setReg_date(new Timestamp(System.currentTimeMillis()));
		
		int result = dao.insertArticle(dto); 
		request.setAttribute("result", result);
		
		map.put("page", "/FJ_BOARD/boardwritePro");
		return new ModelAndView("/FJ_MAIN/main", map);
	}
}






