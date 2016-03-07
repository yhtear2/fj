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
public class ReplyProHandler implements Commandhandler {

	@Resource(name="boardDao")
	private BoardDao dao;
	
	@RequestMapping("/boardreplyPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Map<String, Object>map = new HashMap<String, Object>();
		
		
		request.setCharacterEncoding("utf-8");
		
		// 받는 데이터
		String pageNum = request.getParameter("pageNum");							// 페이지 넘버   
		int board_num = Integer.parseInt( request.getParameter( "board_num" ) );	// 읽은 글의 넘버
		String email = (String) request.getSession().getAttribute("memId");			// 댓글 작성자
		String recontent = request.getParameter("recontent");						// 댓글내용
		Timestamp reg_date = new Timestamp( System.currentTimeMillis());			// 작성시간
		int recom_count = 0;														// 댓글 좋아요
		int re_step = 3;															// 게시글 구분
		int ref = 1;                                                                // 그룹화 id 
		     

		
		// 받을 바구니 객체 생성
		BoardDataBean dto = new BoardDataBean();
		
		// 바구니에 담자~
		// 그룹화 아이디 에다가 읽은 글 넘버 넣고
		dto.setEmail(email);				// 댓글 작성자
		dto.setRecontent(recontent);		// 댓글내용
		dto.setReg_date(reg_date);			// 작성시간
		dto.setRecom_count(recom_count);	// 좋아요
		dto.setRe_step(re_step);			// 게시글 구분
		dto.setRef(ref);                    // 그룹화 id 
		
		// 바구니를 dao에다가 보내서 DB에 입력하게
		int result = dao.insertArticle(dto);
			
		   
		// 페이지로 보낼 정보 맵으로 담기
		map.put("pageNum", pageNum);
		map.put("board_num", board_num);
		map.put("result", result); 
		map.put("page", "/FJ_BOARD/boardreplyPro");
		return new ModelAndView("/FJ_MAIN/main", map); 
		
		
	}

}