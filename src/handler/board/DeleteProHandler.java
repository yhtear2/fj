
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
public class DeleteProHandler implements Commandhandler {

	//* CreateBean의 dao 를 불러오기 위한 Resource 작업  (AutoWired 로 사용해도 된다)  *//

	@Resource(name="boardDao")  
	private BoardDao dao;
	 
	@RequestMapping("/boarddeletePro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	
		Map<String, Object> map = new HashMap<String, Object>();
		        
		String pageNum = request.getParameter( "pageNum" );
		int board_num = Integer.parseInt(request.getParameter("board_num").trim());
		
		BoardDataBean dto = dao.getArticle(board_num);	
       
	
		if( dto.getRe_step() != 3 ) {    //  re_step 3 을 댓글로 지정하였고, 댓글이 없을 경우를 if 문으로 돌려서 체크 
			int result = dao.deleteArticle( board_num ); 
			map.put( "result", result );
		}
		
		map.put("pageNum", pageNum);
	 	map.put("board_num", board_num); 
		 
		
		map.put("page", "/FJ_BOARD/boarddeletePro");   
		return new ModelAndView("/FJ_MAIN/main", map); 
	}
}
  





