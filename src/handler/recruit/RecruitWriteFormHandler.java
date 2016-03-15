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
import dto.comp.CompDataBean;
import handler.Commandhandler;

@Controller
public class RecruitWriteFormHandler implements Commandhandler {
	
	@Resource(name="compDao")
	private CompDao compDao;

	@RequestMapping("/recruitWriteForm")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 기업회원이 기본정보를 입력 했는지 안했는지 체크
		String email = (String)request.getSession().getAttribute("memId");
		
		
		int compinfochekc =compDao.countComp(email);
		if( compinfochekc == 1){
			CompDataBean dto = compDao.getComp(email);
			

			// 기업 TEL이 직접입력일시 오류가 나서
			String tels[] = dto.getTel().split("-");
			if (tels[0].equals("직접입력")){
				map.put("tel_1", "0");
			}else{
				map.put("tel_1", tels[0]);
			}
			
			map.put("tel_2", tels[1]);
			map.put("dto", dto);
			
		}
		
		
		/*String pageNum = request.getParameter("pageNum");
		map.put("pageNum", pageNum);*/
		
		map.put("compinfochekc", compinfochekc);
		map.put("page", "/FJ_RECRUIT/recruitWriteForm");
		return new ModelAndView("/FJ_MAIN/main", map);

	}

}
