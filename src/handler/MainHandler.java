package handler;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainHandler implements Commandhandler {

	@RequestMapping("/main")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Map<String, Object> map = new HashMap<String, Object>();
		
		/*
		Cookie [] cookie = request.getCookies();
		
		if(cookie != null){
			for(int i=0 ; i<cookie.length ; i ++) {
				map.put(cookie[i].getName(), cookie[i].getValue());
			}
			request.getSession().setAttribute("memId", map.get("memId"));
			request.getSession().setAttribute("name", map.get("name"));
			request.getSession().setAttribute("member_flag", map.get("member_flag"));
		}
		*/
		
		map.put("menu", "main");
		map.put("page", "/FJ_MAIN/main_page");
		
		return new ModelAndView("/FJ_MAIN/main", map);
		
	}

}
