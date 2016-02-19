package handler.join;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.join.JoinDao;
import handler.Commandhandler;


@Controller
public class JoinDeleteProHandler implements Commandhandler {

	@Resource( name="joinDao" )
	private JoinDao dao;
	
	@RequestMapping( "/joinDeletePro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		String email = (String) request.getSession().getAttribute( "memId" );
		String passwd = request.getParameter( "passwd" );	
			
		int resultCheck = dao.checkMember( email, passwd );
		
		request.setAttribute( "resultCheck", resultCheck );
		
		if( resultCheck == 1 ) {
			int result = dao.deleteMember( email );
			request.setAttribute( "result", result );
		}
		
		return new ModelAndView( "/FJ_JOIN/deletePro" );
	}
}






