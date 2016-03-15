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
	
		int count = 0;
		
		count = recruitDao.getContent_re();
		
		System.out.println(count);
		
		// 데이터 받아오기
		int recruit_id = Integer.parseInt(request.getParameter("recruit_id"));
		String pageNum = request.getParameter("pageNum");

		request.getSession().setAttribute("recruit_id", recruit_id);
		//System.out.println(recruit_id);
		
		// 채용공고 데이터 가져오자
		RecruitDataBean dto = new RecruitDataBean();
		dto = recruitDao.getContent( recruit_id );
		if( dto.getMin_career() == -1 ) {
			map.put("career", "신입");
		} else if( dto.getMin_career() == -2 ) {
			map.put("career", "경력무관");
		} else {
			map.put("career", dto.getMin_career()+"년~"+dto.getMax_career()+"년");
		}
		
		if( dto.getMin_age() == -1) {
			map.put("age", "무관");
		} else {
			map.put("age", dto.getMax_age()+"이후 ~ " + dto.getMin_age()+"이전 출생자");
		}
		
		// 회사기본 입력사항 정보를 가져오자!
		CompDataBean compdto = new CompDataBean();
		compdto = compDao.getComp(dto.getEmail());
		
		
		// 이메일 비교해서 카운트 올리기
		if( !( dto.getEmail().equals(request.getSession().getAttribute("memId")) ) ){ 
			recruitDao.addReadContent( recruit_id );
		}
		
		// 기업 TEL이 직접입력일시 오류가 나서
		String tels[] = compdto.getTel().split("-");
		if (tels[0].equals("직접입력")){
			map.put("tel_1", "");
			map.put("tel", tels[1]);
		}else{
			String tel = tels[0]+"-"+tels[1];
			map.put("tel", tel);
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
