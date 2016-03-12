package handler.recruit;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.comp.CompDao;
import dao.recruit.RecruitDao;
import dto.comp.CompDataBean;
import dto.recruit.RecruitDataBean;
import handler.Commandhandler;

@Controller
public class RecruitContentHandler implements Commandhandler {

	@Resource(name="recruitDao")
	private RecruitDao recruitDao;
	
	@Resource(name="compDao")
	private CompDao compDao;
	
	@RequestMapping("/recruitcontent")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 일단 한글처리
		request.setCharacterEncoding("utf-8");
		
		// 데이터 받아오기
		int recruit_id = Integer.parseInt(request.getParameter("recruit_id"));
		String pageNum = request.getParameter("pageNum");

		
		// 채용공고 데이터 가져오자
		RecruitDataBean dto = new RecruitDataBean();
		dto = recruitDao.getContent( recruit_id );
		// 회사기본 입력사항 정보를 가져오자!
		CompDataBean compdto = new CompDataBean();
		compdto = compDao.getComp(dto.getEmail());
		int count = 0;
		count = recruitDao.getContent_re();


		
		
		// 이메일 비교해서 카운트 올리기
		if( !( dto.getEmail().equals(request.getSession().getAttribute("memId")) ) ){
			recruitDao.addReadContent( recruit_id );
		}
		
		map.put("count",count);
		map.put("dto", dto);
		map.put("compdto", compdto);
		map.put("pageNum", pageNum);
		map.put("menu", "recruit");
		map.put("page", "/FJ_RECRUIT/recruitContent");
		return new ModelAndView("/FJ_MAIN/main", map);
	}

}
