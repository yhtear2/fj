package handler.join;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.Commandhandler;
import dao.join.JoinDao;

@Controller
public class JoinConfirmIdHandler implements Commandhandler {
	@Resource( name="joinDao" )
	private JoinDao dao;
	
	@RequestMapping("/joinConfirmId")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 변수 선언
	 	String email = request.getParameter("email");
	 	System.out.println(email);
	 	
	 	// 데이터 처리
	 	int result = dao.checkMember( email );
	 	System.out.println(result);
	 	
	 	request.setAttribute("check", result);
	 	request.getSession().setAttribute("check", result);
	 	// 출력
	 	//
	 	Map<String, Object> map = new HashMap<String, Object>();
	 	//map.put("check", result);
	 	//map.put("email", email);
	 	
	 	System.out.println( request.getAttribute("check") );
	 	map.put("test", "test11111");
//	 	map.put("menu", "member");
//	 	map.put("page", "/FJ_JOIN/confirmId");
		return new ModelAndView("/FJ_JOIN/confirmId", map);
//	 	return new ModelAndView("/FJ_JOIN/inputForm", map);joinConfirmId
	 	
	}

}
