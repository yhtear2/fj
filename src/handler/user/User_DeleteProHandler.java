package handler.user;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.board.BoardDao;
import dao.user.UserDao;
import dto.board.BoardDataBean;
import handler.Commandhandler;


@Controller
public class User_DeleteProHandler implements Commandhandler {

	//* CreateBean의 dao 를 불러오기 위한 Resource 작업  (AutoWired 로 사용해도 된다)  *//

	@Resource(name="userDao")  
	private UserDao dao;
	 
	@RequestMapping("/resomeDelete_Pro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	
		Map<String, Object> map = new HashMap<String, Object>();
		        
		String pageNum = request.getParameter( "pageNum" );
		int user_history_id = Integer.parseInt(request.getParameter("user_history_id"));			
		
		System.out.println("유저히스토리 아이디는 ?" + user_history_id);
		
			//각 테이블마다 Delete문
			int result_school = dao.deleteArticle_school( user_history_id ); 
			int result_career = dao.deleteArticle_career( user_history_id ); 
			int result_introduce = dao.deleteArticle_introduce( user_history_id ); 
			int result_user = dao.deleteArticle_user( user_history_id ); 

			map.put( "result_school", result_school ); 
			map.put( "result_career", result_career ); 
			map.put( "result_introduce", result_introduce ); 
			map.put( "result_user", result_user ); 

			map.put("pageNum", pageNum);
		 
			map.put("page", "/FJ_USER/resomeDelete_Pro");   
		return new ModelAndView("/FJ_MAIN/main", map); 
	}
}
  





