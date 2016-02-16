package dao.board;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.UrlBasedViewResolverRegistration;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

@Configuration
public class CreateBean {
	
	@Bean   
	// dao 객체 생성 
	public BoardDao dao() {
		BoardDBBean dao = new BoardDBBean();
		return dao;
	} 
	
	//*  Controller-servlet 의 Bean id 부분을 주석처리하고 CreateBean 자바파일로 옮겨 적용한 것 *//
	@Bean
	public UrlBasedViewResolver viewresolver() 
	{
	UrlBasedViewResolver viewResolver = new UrlBasedViewResolver();
	viewResolver.setViewClass(JstlView.class);
	viewResolver.setPrefix("/FJ_BOARD_FREE/");
	viewResolver.setSuffix(".jsp"); 
	
	return viewResolver;
	
	}
	
}












