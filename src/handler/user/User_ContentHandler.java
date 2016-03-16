package handler.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.user.UserDao;
import dto.board.BoardCommentDataBean;
import dto.user.CareerDataBean;
import dto.user.IntroduceDataBean;
import dto.user.SchoolDataBean;
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
		
		// �씪�떒 �븳湲�泥섎━
		request.setCharacterEncoding("utf-8");
		
		int user_history_id = Integer.parseInt(request.getParameter("user_history_id"));
		
		String pageNum = request.getParameter("pageNum");
		
		
		// �뜲�씠�꽣 媛��졇�삤�옄
		UserDataBean dto = new UserDataBean();
		
		List<SchoolDataBean> result = dao.getContent_school(user_history_id);
		
		List<CareerDataBean> result_career = dao.getContent_career(user_history_id);
		List<IntroduceDataBean> result_introduce = dao.getContent_introduce(user_history_id);
		
		
		

		
		if( user_history_id < 9)
		{
			dao.getUser_history_id(user_history_id); 
		}else
		{
			System.out.println("8개수 초과");
		}

		dto = dao.getContent(user_history_id);
		
		map.put("dto", dto);
		map.put("result", result);
		map.put("result_career", result_career);
		map.put("result_introduce", result_introduce);
		map.put("pageNum", pageNum);
		map.put("page", "/FJ_USER/resomeContent");
		map.put("menu", "resome");

		return new ModelAndView("/FJ_MAIN/main", map);
	}

	private int IntegerParseInt(String parameter) {
		
		return 0;
	}

}
