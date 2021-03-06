package handler.join;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.join.JoinDao;
import handler.Commandhandler;

@Controller
public class JoinSendEmailHandler implements Commandhandler{
	
	@Resource( name="joinDao" )
	private JoinDao dao;
	
	@RequestMapping("/joinEmailConfirm")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	 	String email = request.getParameter("email");
	 	System.out.println("이메일 값 받았고");
	 	String code = dao.emailconfirm( email );
	 	System.out.println("code를 가져왔고");
	 	System.out.println("code는" + code );
	 	// 출력
	 	Map<String, Object> map = new HashMap<String, Object>();
	 	
	 	map.put("code", code);
	 	
	 	return new ModelAndView("/FJ_JOIN/emailConfirm", map );
	 	
	}

}
