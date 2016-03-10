 
package handler.board;

import java.util.HashMap;
import java.util.List;
//import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.board.BoardDao;
import dao.join.JoinDao;
import dto.board.BoardCommentDataBean;
//import dto.board.BoardCommentDataBean;
import dto.board.BoardDataBean;
import dto.join.JoinDataBean;
import handler.Commandhandler;



@Controller
public class ContentHandler implements Commandhandler {

	@Resource(name="boardDao")   
	private BoardDao dao;
	
	@Resource( name="joinDao" )
	private JoinDao joindao;
	
	@RequestMapping("/boardcontent")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Map<String, Object> map = new HashMap<String, Object>(); 
		
		// 데이터 넘겨 받기
		String pageNum = request.getParameter( "pageNum" );
		int board_num = Integer.parseInt( request.getParameter( "board_num" ) );
		int number = Integer.parseInt( request.getParameter( "number" ) );
		
		// 글 정보 받아오기
		BoardDataBean dto = dao.getArticle( board_num );
		// 작성자 데이터 받아오기
		JoinDataBean joindto = joindao.getMember( dto.getEmail() );
		
		// 글 읽은 수 확인
		String email = (String)request.getSession().getAttribute("memId");
		if( email != null ){
			if( email.equals(joindto.getEmail())){
				dao.addCount(board_num);
				dto.setRead_count(dto.getRead_count() +1);
			}
		}
		
		
		// 댓글 가져오기
		List<BoardCommentDataBean> result = dao.getCommentList(board_num);
		
		// 태그 처리
		String[] tags = null;
		if( dto.getHstag() != null ){
			tags = dto.getHstag().split(",");
			map.put("tags", tags);
		} 
		  
		map.put( "count", result.size());
		map.put( "number", number);
		map.put( "pageNum", pageNum);
		map.put( "board_num", board_num); 
		map.put( "dto", dto );   					// 글의 정보
		map.put("result", result);					// 댓글의 정보
		map.put("joindto", joindto);				// 작성자 정보

		map.put("menu", "board");
		map.put("page", "/FJ_BOARD/boardcontent");  
		return new ModelAndView("/FJ_MAIN/main", map);
		 
	}
	
}
   













