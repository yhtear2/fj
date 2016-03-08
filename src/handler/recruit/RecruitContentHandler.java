package handler.recruit;

import java.util.HashMap;
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
public class RecruitContentHandler implements Commandhandler {

	@Resource(name="recruitDao")
	private RecruitDao recruitDao;
	
	@RequestMapping("/recruitcontent")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 일단 한글처리
		request.setCharacterEncoding("utf-8");
		
		// 데이터 받아오기
		int recruit_id = Integer.parseInt(request.getParameter("recruit_id"));
		String pageNum = request.getParameter("pageNum");
		
		// 데이터 가져오자
		RecruitDataBean dto = new RecruitDataBean();
		dto = recruitDao.getContent( recruit_id );
		
		// 이메일 비교해서 카운트 올리기
		if( !( dto.getEmail().equals(request.getSession().getAttribute("memId")) ) ){
			recruitDao.addReadContent( recruit_id );
		}
		
		map.put("dto", dto);
		map.put("pageNum", pageNum);
		map.put("menu", "recruit");
		map.put("page", "/FJ_RECRUIT/recruitContent");
		return new ModelAndView("/FJ_MAIN/main", map);
	}

}
