package dao;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import dao.admin.AdminDBBean;
import dao.admin.AdminDao;
import dao.board.BoardDBBean;
import dao.board.BoardDao;
import dao.comp.CompDBBean;
import dao.comp.CompDao;
import dao.join.JoinDBBean;
import dao.join.JoinDao;
import dao.message.MessageDBBean;
import dao.recruit.RecruitDBBean;
import dao.user.UserDBBean;

 
@Configuration
public class CreateBean {
	
	@Bean
	public AdminDao adminDao(){
		return new AdminDBBean();
	}
	
	@Bean
	public BoardDao boardDao(){
		return new BoardDBBean();
			
	}
	
	@Bean
	public CompDao compDao() {
		return new CompDBBean();
	}
	
	@Bean
	public JoinDao joinDao() {
		return new JoinDBBean();
	}
	
	@Bean
	public MessageDBBean messageDao() {
		return new MessageDBBean();
	}
	
	@Bean
	public RecruitDBBean recruitDao() {
		return new RecruitDBBean();
	}
	
	@Bean
	public UserDBBean userDao(){
		return new UserDBBean();
	}
	
	@Bean
	public UrlBasedViewResolver viewResolver() {
		UrlBasedViewResolver viewResolver = new UrlBasedViewResolver();
		viewResolver.setViewClass( JstlView.class );
		viewResolver.setSuffix( ".jsp" );		
		return viewResolver;
	}
}












