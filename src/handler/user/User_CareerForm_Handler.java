/*	package handler.user;

	import java.util.HashMap;
	import java.util.Map;

	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;

	import org.springframework.stereotype.Controller;
	import org.springframework.web.bind.annotation.RequestMapping;
	import org.springframework.web.servlet.ModelAndView;

	import handler.Commandhandler;

	@Controller
	public class User_CareerForm_Handler implements Commandhandler{
		
		@RequestMapping("/career")
		@Override
		public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
			Map<String, Object> map = new HashMap<String, Object>();
			
			String pageNum = request.getParameter("pageNum");
			String sender = request.getParameter("sender");
			
			map.put("sender", sender);
			map.put("pageNum", pageNum);
			map.put("page", "/FJ_User/career");
			return new ModelAndView("/FJ_User/career", map);
		}

	}

*/





package handler.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



import handler.Commandhandler;

@Controller
public class User_CareerForm_Handler implements Commandhandler{

	@RequestMapping( "/career" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		return new ModelAndView( "/FJ_USER/career" );
	}
}
