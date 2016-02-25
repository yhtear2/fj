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
import dao.join.JoinDao;
import handler.Commandhandler;

@Controller
public class CompInputFormHandler implements Commandhandler {

	@Resource(name="compDao")
	private CompDao compDao;
	
	@Resource(name="joinDao")
	private JoinDao joinDao;

	@RequestMapping("/compInputForm")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Map<String, Object> map = new HashMap<String, Object>();
		// 아이디와 비밀번호 확인
		String memId	= request.getSession().getAttribute("memId").toString();
		System.out.println(memId);
		String passwd 	= request.getParameter("passwd");
		System.out.println(passwd);
		System.out.println("닉네임 : " + request.getSession().getAttribute("name").toString());
		
		// db에 연결해서 id 비밀번호 확인
		int result = joinDao.checkMember(memId, passwd);
		
		// 맵으로 보내자~~
		map.put("result", result);
		
		map.put("menu", "comp");
		map.put("page", "/FJ_COMP/compInputForm");
		return new ModelAndView("/FJ_MAIN/main", map);
	}
}
