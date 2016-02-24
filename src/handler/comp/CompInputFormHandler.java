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
import handler.Commandhandler;

@Controller
public class CompInputFormHandler implements Commandhandler {

	@Resource(name="compDao")
	private CompDao compDao;

	@RequestMapping("/compInputForm")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 아이디와 비밀번호 확인
		//String id 		= request.getSession().getAttribute("email").toString();
		//String passwd 	= request.getParameter("passwd");
		
		/**
		 *  DB연결해서 사용자 확인해야함
		 */
		int result = 1;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("menu", "comp");
		map.put("page", "/FJ_COMP/compInputForm");
		map.put("result", result);
		
		return new ModelAndView("/FJ_MAIN/main", map);
	}
}
