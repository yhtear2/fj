package handler.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.admin.AdminDao;
import dto.join.JoinDataBean;
import handler.Commandhandler;

@Controller
public class memberManagementModifyProHandler implements Commandhandler{
	@Resource(name="adminDao")
	private AdminDao dao;
	
	@RequestMapping("/memberManagementModifyPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding( "utf-8" );
		
		JoinDataBean dto = new JoinDataBean();
		dto.setEmail( request.getParameter( "email" ) );
		dto.setPasswd( request.getParameter( "passwd" ) );
		dto.setName( request.getParameter( "name" ) );
			
		int result = dao.managementUpdateMember( dto );

		request.setAttribute( "result", result );
		
		return new ModelAndView("/FJ_ADMIN/memberManagementModifyPro");
	}

}
