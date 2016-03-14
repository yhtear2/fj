package handler.recruit;


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
import dto.user.CareerDataBean;
import dto.user.UserDataBean;
import handler.Commandhandler;

@Controller
public class Recruit_ResomeListHandler implements Commandhandler{
	
	@Resource(name="userDao")
	private UserDao dao;
	
	@Resource(name="recruitDao")
	private RecruitDao recruitDao;

	@RequestMapping( "/recruit_resomeList" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String email = (String)request.getSession().getAttribute("memId");				// 이메일
		String name = (String)request.getSession().getAttribute("name");				// 닉네임
		

		
		Map<String, Object> tempMap = new HashMap<String, Object>();
		Map<String, Integer> temp = new HashMap<String, Integer>();

		List<UserDataBean> list = dao.getUserList(tempMap);
		
		List<Recruit_LogDataBean> get_history = recruitDao.get_history_id(temp);


		map.put("list", list);
		map.put("get_history", get_history);
		map.put("email", email);
		map.put("name", name);

		return new ModelAndView("FJ_RECRUIT/recruit_resomeList", map);


	}
}
		
		
		
		
		
		
		
		
		
		
		
		
		