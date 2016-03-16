package handler.join;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
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
		//자동로그인 변수 (1이면 자동로그인 쿠키생성)
		String autologin = request.getParameter( "autologin" );
		
		//로그인 실행
		int result = dao.checkMember( email, passwd );
		
		// 정보 받아오기
		int member_flag = dao.getMember(email).getMember_flag();
		String name = dao.getMember(email).getName();
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		map.put("page", "/FJ_JOIN/loginPro");
		
		//로그인 성공의 경우 세션에 member_flag와 닉네임을 저장
		if( result == 1 ) {
			// 개인 이메일(Id)
			request.getSession().setAttribute("memId", email);
			// 1: 개인회원 , 2: 기업회원, 3: 관리자
			request.getSession().setAttribute("member_flag", member_flag);
			// 닉네임 입력
			request.getSession().setAttribute("name", name);
		}
		
		
		return new ModelAndView("/FJ_MAIN/main", map);
	}
}














