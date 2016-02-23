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
public class JoinConfirmNameHandler implements Commandhandler {
	@Resource( name="joinDao" )
	private JoinDao dao;
	
	@RequestMapping("/joinConfirmName")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 변수 선언
	 	String name = request.getParameter("name");
	 	System.out.println(name);
	 	
	 	// 데이터 처리
	 	int result = dao.checkName( name );
	 	System.out.println(result);
	 	
	 	// 출력
	 	Map<String, Object> map = new HashMap<String, Object>();
	 	map.put("check", result);
	 	
	 	return new ModelAndView("/FJ_JOIN/confirmName", map);
	 	
	}

}
