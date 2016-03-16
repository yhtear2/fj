package handler.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



import handler.Commandhandler;

@Controller
public class User_IntroduceFormHandler implements Commandhandler{

	@RequestMapping( "/introduceForm" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int User_history_id = Integer.parseInt(request.getParameter("User_history_id"));
		map.put("User_history_id", User_history_id);
		map.put("page", "/FJ_USER/introduceForm");
		
		map.put("menu", "resome");
		return new ModelAndView("/FJ_MAIN/main", map);
	}
}
