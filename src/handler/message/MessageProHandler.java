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
		dto.setEmail( request.getParameter("recipient") );
		dto.setTitle( request.getParameter("title") );
		dto.setContent( request.getParameter("content") );
		//dto.setTag( (String)request.getSession().getAttribute("memId") );

		dto.setTag( "memId" );
		
		dto.setRead_yn(0);
		dto.setReg_date(new Timestamp( System.currentTimeMillis()));

		System.out.println("memId : " + (String)request.getSession().getAttribute("memId"));
		
		// 디비 처리하러 고고고~!
		int result = dao.sendMessage(dto);
		
		// 넘어온 데이터 페이지로 넘기자
		map.put("result", result);
		
		map.put("page", "/FJ_MESSAGE/messagePro");
		return new ModelAndView("/FJ_MAIN/main", map);
	}

}
