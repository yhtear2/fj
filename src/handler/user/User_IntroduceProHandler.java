package handler.user;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dto.user.IntroduceDataBean;
import handler.Commandhandler;
import dao.user.UserDao;


@Controller
public class User_IntroduceProHandler implements Commandhandler {
	
	@Resource( name="userDao" )
	private UserDao dao;
	
	@RequestMapping( "/introduce_Pro" )	
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Map<String, Object> map = new HashMap<String, Object>();
		// 넘오는거 한글처리
		request.setCharacterEncoding( "utf-8" );
		
		// 데이터 받기
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		
		// 바구니 생성
		IntroduceDataBean dto = new IntroduceDataBean();
		
		System.out.println((Integer)request.getSession().getAttribute("history_id"));
		for( int i=0; i<cnt+1; i++){
			dto.setUser_history_id( (Integer)request.getSession().getAttribute("history_id") );
			dto.setIntro_title(request.getParameter("sub_name_"+i));
			dto.setIntro_contents(request.getParameter("contents"+i));
			dto.setIntro_reg_date(new Timestamp(System.currentTimeMillis()));
			dto.setIntro_last_date(new Timestamp(System.currentTimeMillis()));
			
			// 디비 처리
			int result = dao.insertArticle_introduce(dto);
			map.put("result", result);
		}
	
		map.put("page", "/FJ_USER/introduce_Pro");	
		return new ModelAndView("/FJ_MAIN/main", map);
	}
}



