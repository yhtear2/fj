package handler.recruit;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.Commandhandler;

@Controller
public class RecruitWriteFormHandler implements Commandhandler {

	@RequestMapping("/recruitWriteForm")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Map<String, Object> map = new HashMap<String, Object>();
		
		/*String pageNum = request.getParameter("pageNum");
		map.put("pageNum", pageNum);*/
		

		map.put("page", "/FJ_RECRUIT/recruitWriteForm");
		return new ModelAndView("/FJ_MAIN/main", map);

	}

}
