/*
package handler.board;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import board.BoardDBBean;
import board.BoardDataBean;
import board.Dao;
import handler.CommandHandler;

@Controller
public class ContentHandler implements CommandHandler {
*/
	//* CreateBean의 dao 를 불러오기 위한 Resource 작업  (AutoWired 로 사용해도 된다)  *//
/*
	@Resource(name="dao")  // logon 패키지의  CreateBean 자바파일에 있는 객체 dao 
	private Dao dao; 
	
	@RequestMapping("/content")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		String pageNum = request.getParameter( "pageNum" );
		int num = Integer.parseInt( request.getParameter( "num" ) );
		int number = Integer.parseInt( request.getParameter( "number" ) );

		BoardDataBean dto = dao.getArticle( num ); */
		/*
		if( ! request.getRemoteAddr().equals( dto.getIp() ) )	 {
			dao.addCount( num );		
		}
	*/
/*
		request.setAttribute( "number", number );
		request.setAttribute( "pageNum", pageNum );
		request.setAttribute( "dto", dto );
				
		return new ModelAndView("content"); 
	}
}
*/













