package handler.join;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.join.JoinDao;
import dto.join.JoinDataBean;
import handler.Commandhandler;

@Controller
public class JoinModifyViewHandler implements Commandhandler {

	@Resource( name="joinDao" )
	private JoinDao dao;
	
	@RequestMapping( "/joinModifyView" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String email = (String) request.getSession().getAttribute( "memId" );
		String passwd = request.getParameter( "passwd" );
		
		int resultCheck = dao.checkMember( email, passwd );

		request.setAttribute( "resultCheck", resultCheck );
		
		if( resultCheck == 1 ) {
			JoinDataBean dto = dao.getMember( email );
			request.setAttribute( "dto", dto );			
		}	
		
		return new ModelAndView( "/FJ_JOIN/modifyView" );
	}
}












