package handler;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.recruit.RecruitDao;
import dto.recruit.RecruitDataBean;

@Controller
public class MainHandler implements Commandhandler {
	
	@Resource(name="recruitDao")
	private RecruitDao recruitDao;

	@RequestMapping("/main")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Map<String, Object> map = new HashMap<String, Object>();
		
		/** 채용게시판 **/
		// DB 데이터 가져오기
		Map<String, Integer> tempMap = new HashMap<String, Integer>();
		tempMap.put("start", 0);
		tempMap.put("end", 13);
		List<RecruitDataBean> recruitList = recruitDao.getRecruitList(tempMap);		
		map.put("recruitList", recruitList);
		
		
		map.put("menu", "main");
		map.put("page", "/FJ_MAIN/main_page");
		
		return new ModelAndView("/FJ_MAIN/main", map);
		
	}

}
