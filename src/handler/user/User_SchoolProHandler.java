package handler.user;
import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import dto.user.SchoolDataBean;
import handler.Commandhandler;
import dao.user.UserDao;

@Controller
public class User_SchoolProHandler implements Commandhandler {
	
	@Resource( name="userDao" )
	private UserDao dao;
	
	@RequestMapping( "/school_Pro" )	
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding( "utf-8" );
		
		SchoolDataBean dto = new SchoolDataBean();
		
		String school_name[] = request.getParameterValues("school_name");
		String school_start_date[] = request.getParameterValues("school_start_date");
		String school_last_date[] = request.getParameterValues("school_last_date");
		String school_college1[] = request.getParameterValues("school_college1");
		String school_college2[] = request.getParameterValues("school_college2");
		String school_major[] = request.getParameterValues("school_major");
		String school_rank1[] = request.getParameterValues("school_rank1");
		String school_rank2[] = request.getParameterValues("school_rank2");
		
		
		dto.setSchool_name_high(request.getParameter("highschool_name"));
		dto.setSchool_start_date_high(request.getParameter("highschool_start_date"));
		dto.setSchool_last_date_high(request.getParameter("highschool_last_date"));
		dto.setSchool_college_high(request.getParameter("highschool_college"));
		dto.setHighschool_kind(request.getParameter("highschool_kind"));
		dto.setReg_date(new Timestamp(System.currentTimeMillis()));
		dto.setLast_date(new Timestamp(System.currentTimeMillis()));	
		
		dto.setUser_history_id(Integer.parseInt(request.getParameter("user_history_id")));
		
		
		
		int result = dao.insertArticle_sc( dto );	

		request.setAttribute( "result", result );
	
		for(int i=0; i<school_name.length; i++) {
		  
			dto.setSchool_name_college(school_name[i]);
			dto.setSchool_kind(request.getParameter("school_kind"+(i+1)));

			dto.setSchool_major(school_major[i]);
			dto.setSchool_college1(school_college1[i]);
			dto.setSchool_college2(school_college2[i]);
			dto.setSchool_start_date_college(school_start_date[i]);
			dto.setSchool_last_date_college(school_last_date[i]);
			dto.setHighschool_kind(null);
			dto.setSchool_college_high(null);
			dto.setSchool_ref(1);

			dto.setReg_date(new Timestamp(System.currentTimeMillis()));
			dto.setLast_date(new Timestamp(System.currentTimeMillis()));
			
			
			for (int j=0; j<school_rank1.length; j++) {
			
				String school_rank = null;
						
				school_rank = school_rank1[j] + "/" + school_rank2[j];
			
				dto.setSchool_rank(school_rank);
			
			}
			
			result = dao.insertArticle_sc( dto );	
			
			request.setAttribute( "result", result );
			
		}
		return new ModelAndView( "/FJ_USER/school_Pro" );
	}
}






