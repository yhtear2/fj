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
		
		request.setCharacterEncoding( "utf-8" );
		
		
		String tags[] = request.getParameterValues("tags");   
		String hstag = "";
		//  마지막에 , 으로 되는거 split 으로 자르던가 아니면 막게 해주자 (추후 구현 할 것)
		for (int i=0; i<tags.length; i++){
			hstag += tags[i];
			if(i < tags.length -1){
				hstag += ",";
			}
		}
		
		//BoardDataBean dto = new BoardDataBean();
		//dto.setSubject( (String) request.getParameter( "subject" ) );
		//int result = dao.insertArticle( dto );    
		
		BoardDataBean dto = new BoardDataBean();
		dto.setBoard_num(Integer.parseInt(request.getParameter("board_num")));
		dto.setScrap_count(Integer.parseInt(request.getParameter("scrap_count")));
		dto.setRe_count(Integer.parseInt(request.getParameter("re_count")));
		dto.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		dto.setRead_count(Integer.parseInt(request.getParameter("read_count"))); 
		dto.setRecom_count(Integer.parseInt(request.getParameter("recom_count")));
		dto.setBad_count(Integer.parseInt(request.getParameter("bad_count")));
		dto.setCategory((String)request.getParameter("category"));     
		dto.setSubject((String)request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));      
		dto.setHstag(hstag);   
		dto.setEmail((String)request.getParameter("email"));
		dto.setReg_date(new Timestamp(System.currentTimeMillis()));

		
		
		
	//	request.setAttribute("result", result);
		
		 
		Map<String, Object> map = new HashMap<String, Object>();
		
		int result = dao.insertArticle(dto);  
		map.put("result", result); 
		
		map.put("page", "/FJ_BOARD/boardwritePro");
		return new ModelAndView("/FJ_MAIN/main", map);
	}
}






