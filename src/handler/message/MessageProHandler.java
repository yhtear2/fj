package handler.message;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.message.MessageDao;
import dto.message.MessageDataBean;
import handler.Commandhandler;

@Controller
public class MessageProHandler implements Commandhandler {
	
	@Resource(name="messageDao")
	private MessageDao dao;
	
	@RequestMapping("/messagePro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 한글이 넘어오니 처리해줌
		request.setCharacterEncoding("utf-8");
		
		// 바구니 객체 생성
		MessageDataBean dto = new MessageDataBean();
		
		// 바구니에 자료 담기
		dto.setSender( (String)request.getSession().getAttribute("memId") );	// 보내는사람
		dto.setEmail( request.getParameter("email") );							// 받는사람
		dto.setTitle( request.getParameter("title") );							// 제목
		dto.setContent( request.getParameter("content") );						// 내용
		dto.setTag(3);															// 메시지 분류 (1:채용공고  // 2:공지사항 // 3:일반쪽지)
		dto.setRead_yn(0);														// 읽음 유무
		dto.setReg_date(new Timestamp( System.currentTimeMillis()));			// 보낸날자

		// 디비 처리하러 고고고~!
		int result = dao.sendMessage(dto);
		
		// 실시간 쪽지를 위한 데이터 한번에 묶기
		// 받는사람#보내는사람#제목#내용
		String msg 	= dto.getEmail() + "#3";
		// 실시간 쪽지 데이터 넘기기
		map.put("msg", msg);
				
		// 넘어온 데이터 페이지로 넘기자
		map.put("result", result);
		
		map.put("page", "/FJ_MESSAGE/messagePro");
		return new ModelAndView("/FJ_MAIN/main", map);
	}

}
