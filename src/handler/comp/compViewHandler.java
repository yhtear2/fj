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
public class compViewHandler implements Commandhandler{
	@Resource(name="compDao")
	private CompDao compDao;

	@RequestMapping("/compView")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 맵으로 넘기기 위해서 객체 생성
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		
		map.put("menu", "comp");
		map.put("page", "/FJ_COMP/compView");
		return new ModelAndView("/FJ_MAIN/main", map);
	}
	
}
