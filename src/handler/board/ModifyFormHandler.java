package handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.Commandhandler;


@Controller
public class ModifyFormHandler implements Commandhandler {

	@RequestMapping("/modifyForm") 
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	
		String pageNum = request.getParameter( "pageNum" );
		int num = Integer.parseInt( request.getParameter( "num" ) );
	
		request.setAttribute( "pageNum", pageNum );
		request.setAttribute( "num", num );
				
		return new ModelAndView("modifyForm");
	}
}






