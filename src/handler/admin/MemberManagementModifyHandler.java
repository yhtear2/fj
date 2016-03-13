package handler.admin;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.admin.AdminDao;
//import dao.join.JoinDao;
import dto.join.JoinDataBean;
import handler.Commandhandler;

@Controller
public class MemberManagementModifyHandler implements Commandhandler {
	@Resource( name="adminDao" )
	private AdminDao dao;
	
	@RequestMapping( "/memberManagementModify" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String email = request.getParameter("email");
		
		JoinDataBean dto = dao.managementGetMember(email);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("dto", dto);
		map.put("page", "/FJ_ADMIN/memberManagementModify");
		return new ModelAndView("/FJ_MAIN/main", map );
	}

}
