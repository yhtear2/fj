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
public class ReplyProHandler implements Commandhandler {

	@Resource(name="boardDao")
	private BoardDao dao;
	
	@RequestMapping("/boardreplyPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		  
		request.setCharacterEncoding("utf-8");
		
		BoardDataBean dto = new BoardDataBean();
		
		dto.setScrap_count(Integer.parseInt(request.getParameter("scrap_count")));
		dto.setRe_count(Integer.parseInt(request.getParameter("re_count")));
		dto.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		dto.setRead_count(Integer.parseInt(request.getParameter("read_count")));
		dto.setRecom_count(Integer.parseInt(request.getParameter("recom_count")));
		dto.setBad_count(Integer.parseInt(request.getParameter("bad_count")));
		dto.setCategory((String)request.getParameter("category"));
		dto.setSubject((String)request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		 
		System.out.println(" 댓글 :" + dto.getContent());
		
		dto.setEmail((String)request.getParameter("email"));
		dto.setReg_date(new Timestamp(System.currentTimeMillis()));
		   
		Map<String, Object>map = new HashMap<String, Object>();
		int result = dao.insertArticle(dto); 
		map.put("result", result);
		System.out.println(" 댓글 :" + dto.getContent());
		
		map.put("page", "/FJ_BOARD/boardreplyPro");
		return new ModelAndView("/FJ_MAIN/main", map); 
		
		
	}

}
