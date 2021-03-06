package handler.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.user.UserDao;
import dto.user.CareerDataBean;
import dto.user.IntroduceDataBean;
import dto.user.SchoolDataBean;
import dto.user.UserDataBean;
import handler.Commandhandler;

@Controller
public class ResomeModyfiFormHandler implements Commandhandler {
	
	@Resource(name="userDao")
	private UserDao dao; 

	@RequestMapping("/resomeModyfiForm")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Map<String, Object> map = new HashMap<String, Object>();
		
		request.setCharacterEncoding("utf-8");
		
		int user_history_id = Integer.parseInt(request.getParameter("user_history_id"));
		
		UserDataBean dto_user = dao.getContent(user_history_id);
		List<SchoolDataBean> dto_school = dao.getContent_school(user_history_id);
		List<CareerDataBean> dto_career = dao.getContent_career(user_history_id);
		List<IntroduceDataBean> dto_introduce = dao.getContent_introduce(user_history_id);
		
		 
		// 학력 입력을 위한 거...(사실 이중에 하나만 씀..)
		for( int i=0; i<dto_school.size(); i++){
			SchoolDataBean name = dto_school.get(i);
			map.put("school_dto"+i, name);
		}
		map.put("school_size", dto_school.size() );
		
		// 경력사이즈 넘기자
		map.put("career_size", dto_career.size() );
		
		// 자기소개서 사이즈 넘기자
		map.put("introduce_size", dto_introduce.size() );
		
		map.put("user_history_id", user_history_id);
		map.put("dto_user", dto_user);
		map.put("dto_school", dto_school);
		map.put("dto_career", dto_career);
		map.put("dto_introduce", dto_introduce);
		
		map.put("menu", "resome");
		map.put("page", "/FJ_USER/resomeModyfiForm");

		return new ModelAndView("/FJ_MAIN/main", map);
	}

}
