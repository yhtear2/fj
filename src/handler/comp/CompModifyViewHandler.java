package handler.comp;

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
public class CompModifyViewHandler implements Commandhandler {
	@Resource(name="compDao")
	private CompDao compDao;

	@RequestMapping("/compModifyView")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 맵으로 넘기기 위해서 객체 생성
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 데이터 가져올 페이지 만들기
		String memId = (request.getSession().getAttribute("memId").toString());	// 저장된 멤버아이디 가져오기
	
		// 리턴받을 바구니 생성
		CompDataBean dto = new CompDataBean();
		
		// DB처리
		dto = compDao.getComp(memId);
		
		// 넘어온 tel 분리
		String tels[] = dto.getTel().split("-");
		
		// tels[0]이 직접입력일때 오류가 나서..
		if(tels[0].equals("직접입력")){
			map.put("tel_1", "0");
		} else{
			map.put("tel_1", tels[0]);	
		}
		
		// MAP에 넣어서 페이지로 전송~
		map.put("tel_2", tels[1]);
		map.put("dto", dto);
		
		map.put("menu", "comp");
		map.put("page", "/FJ_COMP/compModifyView");
		return new ModelAndView("/FJ_MAIN/main", map);
	}
	
}

