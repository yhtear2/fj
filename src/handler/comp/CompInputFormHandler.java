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
		String memId	= request.getSession().getAttribute("memId").toString();	// 아이디 받기
		String passwd 	= request.getParameter("passwd");							// 입력받은 페스워드
		String name = request.getSession().getAttribute("name").toString();			// 회사이름 받기

		// db에 연결해서 id 비밀번호 확인
		int result = joinDao.checkMember(memId, passwd);
		if(result == 1) {
			if(compDao.getComp(memId) != null) {
				result = 2;
			}
		}
		
		// 맵으로 보내자~~
		map.put("result", result);
		map.put("name", name);
		
		map.put("menu", "comp");
		map.put("page", "/FJ_COMP/compInputForm");
		return new ModelAndView("/FJ_MAIN/main", map);
	}
}
