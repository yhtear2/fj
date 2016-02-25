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
public class JoinLoginProHandler implements Commandhandler {
	
	@Resource( name="joinDao" )
	private JoinDao dao;	
	
	@RequestMapping( "/joinLoginPro" )	
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String email = request.getParameter( "email" );
		String passwd = request.getParameter( "passwd" );
		
		//로그인 실행
		int result = dao.checkMember( email, passwd );
		
		//로그인 성공의 경우 세션에 member_flag와 닉네임을 저장
		if( result == 1 ) {
			int member_flag = dao.getMember(email).getMember_flag();
			String name = dao.getMember(email).getName();
			request.getSession().setAttribute("member_flag", member_flag);
			request.getSession().setAttribute("name", name);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("result", result);
		
		//request.setAttribute( "email", email );
		//request.setAttribute( "result", result );

		return new ModelAndView( "/FJ_JOIN/loginPro", map );
	}
}














