package handler.board;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.Commandhandler;



@Controller
public class WriteFormHandler implements Commandhandler{
	

	@RequestMapping("/boardwriteForm") 
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		/*
		// 제목글인 경우	<- list.jsp
		int num = 0;		// 제목글 / 답변글
		int ref = 1;		// 그룹화 아이디
		int re_step = 0;	// 글순서	
		int re_level = 0;	// 글레벨
		
		// 답글인 경우		<- content.jsp
		if( request.getParameter( "num" ) != null ) {
			num = Integer.parseInt( request.getParameter( "num" ) );
			ref = Integer.parseInt( request.getParameter( "ref" ) );
			re_step = Integer.parseInt( request.getParameter( "re_step" ) );
			re_level = Integer.parseInt( request.getParameter( "re_level" ) );		
		}	
		
		request.setAttribute( "num", num );
		request.setAttribute( "ref", ref );
		request.setAttribute( "re_step", re_step );
		request.setAttribute( "re_level", re_level );
		*/
		
		
		int board_num = 0;
		int re_step = 0;
		int recom_count = 0;
		int read_count = 0;
		int bad_count = 0;
		int re_count = 0;
		int scrap_count = 0;
		
		if( request.getParameter("board_num") != null)
		{
			board_num = Integer.parseInt(request.getParameter("board_num"));
			re_step = Integer.parseInt(request.getParameter("re_step"));
			recom_count = Integer.parseInt(request.getParameter("recom_count"));
			read_count = Integer.parseInt(request.getParameter("read_count"));
			bad_count = Integer.parseInt(request.getParameter("bad_count"));
			re_count = Integer.parseInt(request.getParameter("re_count"));
			scrap_count = Integer.parseInt(request.getParameter("scrap_count"));
		}
		
		request.setAttribute("board_num", board_num);
		request.setAttribute("re_step", re_step);
		request.setAttribute("recom_count", recom_count);
		request.setAttribute("read_count", read_count);
		request.setAttribute("bad_count", bad_count);
		request.setAttribute("re_count", re_count);
		request.setAttribute("scrap_count", scrap_count);
		
	 	
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		
		map.put("page", "/FJ_BOARD/boardwriteForm"); 
		return new ModelAndView("/FJ_MAIN/main", map);
		
	}
}








