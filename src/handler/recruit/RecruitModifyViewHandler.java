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
public class RecruitModifyViewHandler implements Commandhandler {
	
	@Resource(name="recruitDao")
	private RecruitDao recruitDao;

	@RequestMapping("/recruitModifyView")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 일단 넘어온 데이터 받자
		int recruit_id = Integer.parseInt(request.getParameter("recruit_id"));
		
		// 넘어온 데이터로 디비에서 정보 받기
		RecruitDataBean dto = new RecruitDataBean();
		dto = recruitDao.getContent( recruit_id );
		
		String tel[] = dto.getTel().split("-");
		map.put("tel_1", tel[0] );
		map.put("tel_2", tel[1] );
		
		// 넘겨받은 데이터를 페이지로 토쓰!!
		map.put("dto", dto);
		
		
		
		map.put("page", "/FJ_RECRUIT/recruitModifyView");
		return new ModelAndView("/FJ_MAIN/main", map);
	}

}
