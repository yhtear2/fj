 
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

	@Resource(name="boardDao")   
	private BoardDao dao;   
	
	@RequestMapping("/boardmodifyPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding( "utf-8" );

	
		String notice = request.getParameter("notice");
		
		request.setCharacterEncoding( "utf-8" );	
	
		String tags[] = request.getParameterValues("tags");   
		String hstag = "";
		
		if( tags != null ) {
			for (int i=0; i<tags.length; i++){
				hstag += tags[i];
				if(i < tags.length -1){
					hstag += ",";
				}
			}
		} 
		
		BoardDataBean dto = new BoardDataBean();
		dto.setBoard_num( Integer.parseInt( request.getParameter( "board_num" ) ) );
		dto.setCategory(request.getParameter("category"));   
		dto.setSubject( request.getParameter( "subject" ) );
		dto.setHstag(hstag); 
		dto.setContent( request.getParameter( "content" ) );
	
		String pageNum = request.getParameter( "pageNum" );
		
		// 1: 공지사항		2: 일반글		3: 댓글
		// 여기선 일반글 이므로 2 삽입		
		if (notice.equals("bf")) {
			dto.setRe_step(2);
		} if(notice.equals("fb")) {
			dto.setRe_step(1);															// 게시글의 구분
		}
		
		int result = dao.updateArticle( dto );	
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pageNum", pageNum);
		map.put("result", result); 
		
		map.put("menu", "board");
		map.put("page", "/FJ_BOARD/boardmodifyPro");   
		return new ModelAndView("/FJ_MAIN/main", map);
	}
}









 