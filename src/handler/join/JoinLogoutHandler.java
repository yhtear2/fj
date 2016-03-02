package handler.join;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.Commandhandler;

@Controller
public class JoinLogoutHandler implements Commandhandler {

	@RequestMapping( "/joinLogout" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		//로그아웃을 하면 세션에서 id 닉네임 member_flag 삭제
		request.getSession().removeAttribute( "memId" );
		request.getSession().removeAttribute( "name" );
		request.getSession().removeAttribute( "member_flag" );
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("menu", "main");
	 	map.put("page", "/FJ_MAIN/main_page");
		
		return new ModelAndView( "/FJ_MAIN/main", map );
	}
}







