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
import handler.Commandhandler;

@Controller
public class Recruit_ResomeListDelProHandler implements Commandhandler{
	
	@Resource(name="recruitDao")
	private RecruitDao recruitDao;

	@RequestMapping( "/recruit_resomeListDel_Pro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int user_history_id = Integer.parseInt(request.getParameter("user_history_id"));
		int recruit_id = Integer.parseInt(request.getParameter("recruit_id"));
		String email = request.getParameter("email");
		
		int result1 = recruitDao.deleteArticle( user_history_id ); 
		
		map.put( "result1", result1 ); 

		map.put("page", "/FJ_RECRUIT/recruit_resomeListDel_Pro");
		


		return new ModelAndView("FJ_MAIN/main", map);

	}
}
		
		
		
		
		
		
		
		
		
		
		
		
		