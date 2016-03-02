package handler.user;
import java.sql.Timestamp;

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
		
		request.setCharacterEncoding( "utf-8" );
		
		IntroduceDataBean dto = new IntroduceDataBean();
		
		String intro_title = request.getParameter("sub_name_0");
		String intro_contents = request.getParameter("contents0");
				
		
		//for(int i=0; i<=intro_title.length; i++) {
						
			dto.setIntro_title(intro_title);

			dto.setIntro_contents(intro_contents);

			dto.setIntro_reg_date(new Timestamp(System.currentTimeMillis()));
			dto.setIntro_last_date(new Timestamp(System.currentTimeMillis()));

			int result = dao.insertArticle_introduce( dto );	

			request.setAttribute( "result", result );
			
	//	}
		return new ModelAndView( "/FJ_USER/introduce_Pro" );
	}
}



