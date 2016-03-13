package handler.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.admin.AdminDao;
import handler.Commandhandler;

@Controller
public class MemberManagementDeleteProHandler implements Commandhandler{
	@Resource(name="adminDao")
	private AdminDao dao;
	
	@RequestMapping("/memberManagementDeletePro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String email = request.getParameter("email");
		
		int result = dao.managementDeleteMember(email);
		
		request.setAttribute("result", result);
		
		return new ModelAndView("/FJ_ADMIN/memberManagementDeletePro");
	}

}
