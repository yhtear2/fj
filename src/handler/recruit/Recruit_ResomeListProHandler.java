package handler.recruit;


import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.recruit.RecruitDao;
import dao.user.UserDao;
import dto.recruit.Recruit_LogDataBean;
import handler.Commandhandler;

@Controller
public class Recruit_ResomeListProHandler implements Commandhandler{
	
	@Resource(name="recruitDao")
	private RecruitDao recruitDao;

	@RequestMapping( "/recruit_resomeList_Pro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		int user_history_id = Integer.parseInt(request.getParameter("user_history_id"));
		int recruit_id = Integer.parseInt(request.getParameter("recruit_id"));
		String email = request.getParameter("email");

		
		Recruit_LogDataBean dto = new Recruit_LogDataBean();
		
		
		
		dto.setEmail(email);	
		dto.setRecruit_id(recruit_id);
		dto.setUser_history_id(user_history_id);

		dto.setReg_date(new Timestamp(System.currentTimeMillis()));

		int result = recruitDao.insertRecruit_re(dto);

		map.put("result", result);
		map.put("page", "/FJ_RECRUIT/recruit_resomeList_Pro");
		


		return new ModelAndView("FJ_MAIN/main", map);

	}
}
		
		
		
		
		
		
		
		
		
		
		
		
		