package handler.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.Commandhandler;

@Controller
public class ResomeModyfiFormHandler implements Commandhandler {

	@RequestMapping("/resomeModyfiForm")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Map<String, Object> map = new HashMap<String, Object>();
		
		
/*		map.put("dto", dto);
		map.put("result", result);
		map.put("result_career", result_career);
		map.put("result_introduce", result_introduce);

		map.put("pageNum", pageNum);*/
		map.put("page", "/FJ_USER/resomeModyfiForm");

		return new ModelAndView("/FJ_MAIN/main", map);
	}

}
