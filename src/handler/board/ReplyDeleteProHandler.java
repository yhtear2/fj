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
public class ReplyDeleteProHandler implements Commandhandler{
	
	@Resource(name="boardDao")  
	private BoardDao dao;

	@RequestMapping("/replyDeletePro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int board_num = Integer.parseInt( request.getParameter( "board_num" ) );	// 읽은 글의 넘버
		int comment_board_num = Integer.parseInt(request.getParameter("comment_board_num") );
		int number = Integer.parseInt( request.getParameter( "number" ) );			// 넘버
		String pageNum = request.getParameter("pageNum");							// 페이지 넘버   
		
		System.out.println("comment_board_num : " + comment_board_num);
		int result = dao.deleteReply( comment_board_num );
		
		if (result == 1){
			dao.reCountMinus(board_num);
		}
		
		map.put("pageNum", pageNum);
		map.put("number", number);
		map.put("board_num", board_num);
		map.put("result", result); 
		
	 	map.put("menu", "board");
		map.put("page", "/FJ_BOARD/boardreplyPro");   
		return new ModelAndView("/FJ_MAIN/main", map); 
	}

}
