package handler.user;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.user.UserDao;
import dto.user.UserDataBean;
import handler.Commandhandler;

@Controller
public class User_ContentHandler implements Commandhandler {

	@Resource(name="userDao")
	private UserDao dao;
	
	@RequestMapping("/resomeContent")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 일단 한글처리
		request.setCharacterEncoding("utf-8");
		
		// 데이터 받아오기
		int user_history_id = Integer.parseInt(request.getParameter("user_history_id"));
		String pageNum = request.getParameter("pageNum");
		
		// 데이터 가져오자
		UserDataBean dto = new UserDataBean();
		dto = dao.getContent(user_history_id);
		
/*		// 이메일 비교해서 카운트 올리기
		if( !( dto.getEmail().equals(request.getSession().getAttribute("memId")) ) ){
			dao.addReadContent( user_history_id );
		}*/
		
		map.put("dto", dto);
		map.put("pageNum", pageNum);
		map.put("page", "/FJ_USER/resomeContent");

		return new ModelAndView("/FJ_MAIN/main", map);
	}

}
