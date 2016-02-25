
package handler.board;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import dao.board.BoardDao;
import dto.board.BoardDataBean;
import handler.Commandhandler;

/*
@Controller
public class ModifyViewHandler implements Commandhandler {  */

	//* CreateBean의 dao 를 불러오기 위한 Resource 작업  (AutoWired 로 사용해도 된다)  *//
/*   
	@Resource(name="dao")  // logon 패키지의  CreateBean 자바파일에 있는 객체 dao 
	private BoardDao dao; 
	
	@RequestMapping("/modifyView")    
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		String pageNum = request.getParameter( "pageNum" );
		int num = Integer.parseInt( request.getParameter( "board_num" ) );
	//	String passwd = request.getParameter( "passwd" );
	
		int result = dao.checkArticle( board_num);
		
		request.setAttribute( "pageNum", pageNum );
		request.setAttribute( "board_num", board_num );
		request.setAttribute( "result", result );
		
		if( result != 0 ) {
			BoardDataBean dto = dao.getArticle( board_num );
			request.setAttribute( "dto", dto );
		}
		
		return new ModelAndView("modifyView");
	} 
}
*/




    