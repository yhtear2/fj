package handler.message;

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
public class messgaeSendContentHandler implements Commandhandler {
	@Resource(name="messageDao")
	private MessageDao dao;

	@RequestMapping("/messgaeSendContent")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int message_num = Integer.parseInt( request.getParameter("message_num") );
		String pageNum = request.getParameter("pageNum");
		
		MessageDataBean dto = dao.getContent(message_num);
		
		map.put("pageNum", pageNum);
		map.put("dto", dto);
		map.put("page", "/FJ_MESSAGE/messgaeSendContent");
		return new ModelAndView("/FJ_MAIN/main", map);
	}
}
