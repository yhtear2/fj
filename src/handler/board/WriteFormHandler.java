package handler.board;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.Commandhandler;



@Controller
public class WriteFormHandler implements Commandhandler{
	

	@RequestMapping("/boardwriteForm") 
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		map.put("menu", "board");
		map.put("page", "/FJ_BOARD/boardwriteForm"); 
		return new ModelAndView("/FJ_MAIN/main", map);
		
	}
}
   







