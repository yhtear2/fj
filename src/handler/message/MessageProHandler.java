package handler.message;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dto.message.MessageDataBean;
import handler.Commandhandler;

@Controller
public class MessageProHandler implements Commandhandler {
	
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Map<String, Object> map = new HashMap<String, Object>();
		// 한글이 넘어오니 처리해줌
		request.setCharacterEncoding("utf-8");
		
		// 바구니 객체 생성
		MessageDataBean dto = new MessageDataBean();
		
		// 바구니에 자료 담기
		dto.setEMAIL( request.getParameter("recipient") );
		dto.setTITLE( request.getParameter("title") );
		dto.setCONTENT( request.getParameter("content") );
		dto.setTAG( );
		dto.setREAD_YN(rEAD_YN);
		dto.setREG_DATE(rEG_DATE);
		
		
		
		
		
		map.put("page", "/FJ_MESSAGE/messagePro");
		return new ModelAndView("/FJ_MAIN/main", map);
	}

}
