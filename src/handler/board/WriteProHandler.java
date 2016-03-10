package handler.board;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.board.BoardDao;
import dto.board.BoardDataBean;
import handler.Commandhandler;



@Controller
public class WriteProHandler implements Commandhandler {

	@Resource(name="boardDao")
	private BoardDao dao;   
	    
	@RequestMapping("/boardwritePro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Map<String, Object> map = new HashMap<String, Object>();
		request.setCharacterEncoding( "utf-8" );
		   
		
		String tags[] = request.getParameterValues("tags");   
		String hstag = "";
		
		// 해시태그 부분 가져와서 합치기
		if( tags != null ) {
			for (int i=0; i<tags.length; i++){
				hstag += tags[i];
				if(i < tags.length -1){
					hstag += ",";
				}
			}
		} else hstag=null;
		

		BoardDataBean dto = new BoardDataBean();
		dto.setEmail((String)request.getSession().getAttribute("memId"));				// 이메일
		dto.setName((String)request.getSession().getAttribute("name"));					// 글쓴이 // 홍석추가
		dto.setSubject((String)request.getParameter("subject"));						// 글제목
		dto.setContent(request.getParameter("content")); 								// 글내용
		dto.setHstag(hstag); 															// 해쉬태그
		dto.setRe_count(Integer.parseInt(request.getParameter("re_count")));			// 리플의 수
		dto.setScrap_count(Integer.parseInt(request.getParameter("scrap_count")));		// 스크랩 수
		dto.setRecom_count(Integer.parseInt(request.getParameter("recom_count")));		// 좋아요 수
		dto.setBad_count(Integer.parseInt(request.getParameter("bad_count")));			// 싫어요 수
		dto.setRead_count(Integer.parseInt(request.getParameter("read_count"))); 		// 읽은 수
		// 1: 공지사항		2: 일반글		3: 댓글
		// 여기선 일반글 이므로 2 삽입
		dto.setRe_step(2);																// 게시글의 구분
		dto.setCategory((String)request.getParameter("category"));    					// 카테고리		
		dto.setReg_date(new Timestamp(System.currentTimeMillis()));						// 작성날짜

		
		int result = dao.insertArticle(dto);  
		
		map.put("result", result); 
		
		map.put("menu", "board");
		map.put("page", "/FJ_BOARD/boardwritePro");
		return new ModelAndView("/FJ_MAIN/main", map);
	}
}






  