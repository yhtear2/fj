package handler.user;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dto.user.CareerDataBean;
import handler.Commandhandler;
import dao.user.UserDao;

@Controller
public class User_CareerProHandler implements Commandhandler {
	
	@Resource( name="userDao" )
	private UserDao dao;
	
	@RequestMapping( "/career_Pro" )	
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding( "utf-8" );
		
		CareerDataBean dto = new CareerDataBean();
		
		String career_comp_name[] = request.getParameterValues("career_comp_name");
		String career_start_date[] = request.getParameterValues("career_start_date");
		String career_last_date[] = request.getParameterValues("career_last_date");
		String career_sort_date[] = request.getParameterValues("career_sort_date");
		String career_kind[] = request.getParameterValues("career_kind");
		String career_department[] = request.getParameterValues("career_department");
		String career_position1[] = request.getParameterValues("career_position1");
		String career_position2[] = request.getParameterValues("career_position2");
		String career_salary[] = request.getParameterValues("career_salary");

		String career_resign[] = request.getParameterValues("career_resign");	
		String career_work[] = request.getParameterValues("career_work");		
		String career_content[] = request.getParameterValues("career_content");		

		dto.setCareer_sort(request.getParameter("career_sort"));
		
		dto.setUser_history_id((Integer)request.getSession().getAttribute("history_id"));


		for(int i=0; i<career_comp_name.length; i++) {
			dto.setCareer_comp_name(career_comp_name[i]);
			dto.setUser_history_id((Integer)request.getSession().getAttribute("history_id"));
			dto.setCareer_start_date(career_start_date[i]);
			dto.setCareer_last_date(career_last_date[i]);
			dto.setCareer_sort_date(career_sort_date[i]);
			dto.setCareer_department(career_department[i]);

			
			if ( request.getParameter("career_salary").equals("") && request.getParameter("career_salary").equals(null)) {
				dto.setCareer_salary(Integer.parseInt("0"));
			} 
			else if ( ! request.getParameter("career_salary").equals("") && ! request.getParameter("career_salary").equals(null)) {
			dto.setCareer_salary(Integer.parseInt(career_salary[i]));
			}
		
			if ( request.getParameter("career_sort").equals("�떊�엯")) {
				dto.setCareer_kind("");
				dto.setCareer_position1("");
				dto.setCareer_position2("");				
			} 
			else if ( ! request.getParameter("career_sort").equals("�떊�엯")) {
				dto.setCareer_kind(career_kind[i]);
				dto.setCareer_position1(career_position1[i]);
				dto.setCareer_position2(career_position2[i]);
			}			
			
			
			dto.setCareer_resign(career_resign[i]);
			dto.setCareer_work(career_work[i]);
			dto.setCareer_content(career_content[i]);


			int result = dao.insertArticle_career( dto );	

			request.setAttribute( "result", result );
			
		}
		return new ModelAndView( "/FJ_USER/career_Pro" );
	}
}






