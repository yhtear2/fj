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
		
		int board_num = Integer.parseInt( request.getParameter( "board_num" ) );
		
		BoardDataBean dto = dao.getArticle( board_num ); 
		
		System.out.println(" 댓글 :" + dto.getContent());
	
		   
		Map<String, Object>map = new HashMap<String, Object>();
		
		map.put("board_num", board_num);
		System.out.println(" 댓글 :" + dto.getContent());
		
		map.put("page", "/FJ_BOARD/boardreplyPro");
		return new ModelAndView("/FJ_MAIN/main", map); 
		
		
	}

}
