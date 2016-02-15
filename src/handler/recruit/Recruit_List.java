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
import dto.recruit.RecruitDataBean;
import handler.Commandhandler;

@Controller
public class Recruit_List implements Commandhandler {

	@Resource(name="recruitDao")
	private RecruitDao recruitDao;

	@RequestMapping("/recruitList")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int count = recruitDao.getRecruitCount();
		map.put("count", count);
		if( count > 0 ){
			List<RecruitDataBean> recruitList = recruitDao.getRecruitList(new HashMap<String, Integer>());
			map.put("recruitList", recruitList);
		}
		
		map.put("page", "/FJ_RECRUIT/recruitList");
	
		return new ModelAndView("/FJ_MAIN/main", map);
	}
}
