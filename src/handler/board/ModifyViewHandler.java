
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
public class ModifyViewHandler implements Commandhandler {  

  
	@Resource(name="boardDao") 
	private BoardDao dao; 
	
	@RequestMapping("/boardmodifyView")    
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	
		String pageNum = request.getParameter( "pageNum" );
		int board_num = Integer.parseInt( request.getParameter( "board_num" ) );

	
	//	int result = dao.checkArticle( board_num);
		
		
		/*
		request.setAttribute( "pageNum", pageNum );
		request.setAttribute( "board_num", board_num );  */
	//	request.setAttribute( "result", result );
		/*
		if( result != 0 ) {
			BoardDataBean dto = dao.getArticle( board_num );
			request.setAttribute( "dto", dto );
		}
		*/
		 
		BoardDataBean dto = dao.getArticle(board_num);
	//	request.setAttribute("dto", dto);
		
		Map<String, Object> map = new HashMap<String, Object>();	
		
		map.put("pageNum", pageNum);
		map.put("board_num", board_num);
		map.put("dto", dto);
		
		
		map.put("page", "/FJ_BOARD/boardmodifyView");     
		return new ModelAndView("/FJ_MAIN/main", map);
	} 
}





    