package handler.recruit;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import custom.CustomUtil;
import dao.recruit.RecruitDao;
import dto.recruit.RecruitDataBean;
import handler.Commandhandler;

@Controller
public class RecruitList implements Commandhandler {

	@Resource(name="recruitDao")
	private RecruitDao recruitDao;

	@RequestMapping("/recruitList")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 세션에서 데이터 받아오기
		String email = (String)request.getSession().getAttribute("memId");				// 이메일
		String name = (String)request.getSession().getAttribute("name");				// 닉네임
		int member_flag = ((Integer)request.getSession().getAttribute("member_flag") == null) ? 0 : (Integer)request.getSession().getAttribute("member_flag");	// 사용자 구분
					     
		
		// 변수 선언
		int count = 0;			// 글 개수
		int pageSize=10;		// 페이지 사이즈
		int pageBlock = 3;		// 페이지 블락
	
		// 변수 선언
		String pageNum = null;	// 현재 페이지
		int currentPage = 0;	// 페이지 개수
		int start = 0;			// 시작 페이지
		int end = 0;			// 끝 페이지
		int number = 0;			// 글넘버
		
		//-- 페이지 만들 편수 선언
		int pageCount = 0;		// 페이지 개수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 끝 페이지
	
		// DB접속해서 카운터 받아오기
		count = recruitDao.getRecruitCount();
		
		// 연산
		pageNum = request.getParameter("pageNum");
		if( pageNum == null){
			pageNum = "1";
		} 
		
		

		// 페이지 번호 계산
		//-- 짜투리가 생기면 페이지 하나 더 만들고 없으면 만들지 말아라
		pageCount = count / pageSize + ( count%pageSize >0 ? 1 : 0 );
		currentPage = Integer.parseInt(pageNum);
		// 마지막 페이지 지웠을때 생기는 문제 예외처리
		if( pageCount < currentPage){
			currentPage = pageCount;
			pageNum = String.valueOf( pageCount );
		}
		
		start = ( currentPage - 1) * pageSize + 1;
		end = start + pageSize -1;
		
		// 번호 계산
		number = count-( currentPage -1 ) * pageSize ;
		startPage = (currentPage / pageBlock) * pageBlock +1;
					// (  11		/ 10 ) * 10+1 	11	
		if( currentPage % pageBlock == 0) startPage -= pageBlock;
		endPage = startPage + pageBlock -1;
					// 11+ 10 - 1					20
		if( endPage > pageCount ) endPage = pageCount;
				
			
		// DB 데이터 가져오기
		if(count != 0){
			Map<String, Integer> tempMap = new HashMap<String, Integer>();
			tempMap.put("start", start);
			tempMap.put("end", end);
			List<RecruitDataBean> list = recruitDao.getRecruitList(tempMap);
			
			
			map.put("list", list);
		}
		
		map.put( "pageBlock", pageBlock );
		map.put( "count", count );
		map.put( "number", number );
		map.put( "pageNum", pageNum );
		map.put( "currentPage", currentPage );
		map.put( "startPage", startPage );
		map.put( "endPage", endPage );
		map.put( "pageCount", pageCount );
		map.put("count", count);
		map.put("pageNum", pageNum);
		
		map.put("email", email);
		map.put("name", name);
		map.put("member_flag", member_flag);
		map.put("menu", "recruit");
		map.put("page", "/FJ_RECRUIT/recruitList");
		return new ModelAndView("/FJ_MAIN/main", map);
	}
}

