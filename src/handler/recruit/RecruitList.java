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
public class RecruitList implements Commandhandler {

	@Resource(name="recruitDao")
	private RecruitDao recruitDao;

	@RequestMapping("/recruitList")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int recruitCount = recruitDao.getRecruitCount();
		map.put("recruitCount", recruitCount);
		
		if(recruitCount != 0){
			List<RecruitDataBean> recruitList = recruitDao.getRecruitList();
			map.put("recruitList", recruitList);
		}
		
		map.put("page", "/FJ_RECRUIT/recruitList");
		return new ModelAndView("/FJ_MAIN/main", map);
	}
}
