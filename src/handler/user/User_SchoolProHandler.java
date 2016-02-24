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
		
	//	String school_name[] = request.getParameterValues("school_name");
		
		
		dto.setSchool_name_kind(request.getParameter("school_name_kind"));
		dto.setSchool_name(request.getParameter("school_name"));
		dto.setSchool_kind(request.getParameter("school_kind"));
		dto.setSchool_major(request.getParameter("school_major"));
		dto.setSchool_college1(request.getParameter("school_college1"));
		dto.setSchool_college2(request.getParameter("school_college2"));
		dto.setSchool_start_date(request.getParameter("school_start_date"));
		dto.setSchool_last_date(request.getParameter("school_last_date"));
		dto.setReg_date(new Timestamp(System.currentTimeMillis()));
		dto.setLast_date(new Timestamp(System.currentTimeMillis()));			
		
		String school_rank = null;
		String school_rank1 = request.getParameter("school_rank1");
		System.out.println(request.getParameter("school_rank1"));
		String school_rank2 = request.getParameter("school_rank2");
		school_rank = school_rank1 + "/" + school_rank2;
		
		dto.setSchool_rank(request.getParameter("school_rank"));
		
		int result = dao.insertArticle_sc( dto );	
		
		request.setAttribute( "result", result );
		
		return new ModelAndView( "/FJ_USER/school_Pro" );
	}
}






