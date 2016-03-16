package handler.join;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.board.BoardDao;
import dao.recruit.RecruitDao;
import dto.board.BoardDataBean;
import dto.recruit.RecruitDataBean;
import handler.Commandhandler;

@Controller
public class JoinLogoutHandler implements Commandhandler {
	
	@Resource(name="recruitDao")
	private RecruitDao recruitDao;
	
	@Resource(name="boardDao")
	private BoardDao boardDao; 

	@RequestMapping( "/joinLogout" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		//로그아웃을 하면 세션에서 id 닉네임 member_flag 삭제
		request.getSession().removeAttribute( "memId" );
		request.getSession().removeAttribute( "name" );
		request.getSession().removeAttribute( "member_flag" );
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		/** 채용게시판 **/
		// DB 데이터 가져오기
		Map<String, Integer> Map1 = new HashMap<String, Integer>();
		Map1.put("start", 0);
		Map1.put("end", 13);
		List<RecruitDataBean> recruitList = recruitDao.getRecruitList(Map1);		
		map.put("recruitList", recruitList);
		
		/** 공지사항 **/
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put( "start", 0 );
		map2.put( "end", 6 ); 
		map2.put("category", "공지사항");		// 공지사항의 항목만 가져오기
		List<BoardDataBean> noticeList =  boardDao.getCategorySearchArticles(map2);
		map.put( "noticeList", noticeList );
		
		/** 인기글 **/
		Map<String, Object> map3 = new HashMap<String, Object>();
		map3.put( "start", 0 );			
		map3.put( "end", 6 ); 			 
		map3.put("read_count", 20);		// 글 읽은 수가 20이상일때만 나오게 할꺼야
		List<BoardDataBean> communityList =  boardDao.getBestCommunityList(map3);
		map.put( "communityList", communityList );
		
		
		map.put("menu", "main");
	 	map.put("page", "/FJ_MAIN/main_page");
		
		return new ModelAndView( "/FJ_MAIN/main", map );
	}
}







