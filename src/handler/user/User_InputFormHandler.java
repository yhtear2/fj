package handler.user;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.user.UserDao;
import handler.Commandhandler;

@Controller
public class User_InputFormHandler implements Commandhandler{
	
	@Resource(name="userDao")
	private UserDao dao;

	@RequestMapping( "/resome" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
/*		Map<String, Object> map = new HashMap<String, Object>();

		int user_history_id = Integer.parseInt(request.getParameter("user_history_id"));
		

		UserDataBean dto = dao.getUser_history_id(user_history_id);
		
		
		request.setAttribute("user_history_id", user_history_id);

		System.out.println(user_history_id);
		map.put("dto", dto);*/

		return new ModelAndView( "/FJ_USER/resome" );
	}
}
