package handler.user;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dto.user.SchoolDataBean;
import dto.user.UserDataBean;
import handler.Commandhandler;
import dao.user.UserDao;

@Controller
public class User_ProHandler implements Commandhandler {
	
	@Resource( name="userDao" )
	private UserDao dao;
	
	@RequestMapping( "/resome_Pro" )	
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		Map<String, Object> map = new HashMap<String, Object>();
		
		request.setCharacterEncoding( "utf-8" );
		// 여기는 기본정보 입력!
		String saveDir = request.getServletContext().getRealPath("/") + "FJ_USER\\images";
		MultipartRequest multi = new MultipartRequest(request,saveDir,1024*1024*15,"UTF-8",new DefaultFileRenamePolicy());
		String imageFileName = multi.getFilesystemName("imginput");
		String projectFile = multi.getFilesystemName("project");
		
		String resome_title = multi.getParameter("resome_title");
		String email = multi.getParameter("email");
		String eng_name = multi.getParameter("eng_name");
		String kor_name = multi.getParameter("kor_name");
		String birth = multi.getParameter("birth");


		String skill = multi.getParameter("skill");
		int want_salary = Integer.parseInt(multi.getParameter("want_salary"));
		String project = multi.getParameter("project");
		String army = null;
		String army1 =  multi.getParameter("army1");
		String army2 = (String) multi.getParameter("army2");
		String army3 = multi.getParameter("army3");
		String army4 = multi.getParameter("army4");
		String army5 = multi.getParameter("army5");
		String army6 = multi.getParameter("army6");
		String army7 = multi.getParameter("army7");

		
		army = army1 + "/" + army2 + "/" + army3 + "/" + army4 + "/" + army5 + "/" + army6 + "/" + army7;
		
		String address = null;
		String address1 = multi.getParameter("address1");
		String address2 = multi.getParameter("address2");
		
		address = address1 + " " + address2;
		
		UserDataBean dto = new UserDataBean();

		dto.setResome_title(resome_title);
		dto.setEmail(email);
		dto.setEng_name(eng_name);
		dto.setKor_name(kor_name);
		dto.setBirth(birth);
		dto.setAddress(address);
		dto.setSkill(skill);
		dto.setWant_salary(want_salary);
		dto.setProject(project);
		dto.setReg_date(new Timestamp(System.currentTimeMillis()));
		dto.setLast_date(new Timestamp(System.currentTimeMillis()));		
		dto.setUser_ref(1);
		String license = null;

		int license_cnt = Integer.parseInt(multi.getParameter("license_cnt_hidden"));
		


		for(int i=0; i<=license_cnt; i++) {
			license +=  multi.getParameter("license1"+i) + "-" + multi.getParameter("license2"+i) + "-" + multi.getParameter("license3"+i)+ "/";
		
		}
		dto.setLicense(license);
		
		// tel
		String tel = null;
		String tel1 = multi.getParameter( "tel1" );
		String tel2 = multi.getParameter( "tel2" );
		String tel3 = multi.getParameter( "tel3" );
		
		if( ! tel1.equals( "" ) && ! tel2.equals( "" ) && ! tel3.equals( "" ) ) {
			tel = tel1 + "-" + tel2 + "-" + tel3;
		}	
		dto.setTel( tel );
				
		dto.setArmy(army);
		
		String resome_image = "FJ_USER/images/" + imageFileName;
		System.out.println(resome_image);
		dto.setPhoto(resome_image);
	
		String resome_project = "library/portfolio/" + projectFile;
		dto.setProject(resome_project);

		int result = dao.insertArticle( dto );	
		
		HttpSession session = request.getSession();
		session = request.getSession(true);
		
		session.setAttribute("history_id",dto.getHistory_id());
		
		
		
		// 여기는 학력정보 입력
		SchoolDataBean school_dto = new SchoolDataBean();
		
		String school_name[] = multi.getParameterValues("school_name");
		String school_start_date[] = multi.getParameterValues("school_start_date");
		String school_last_date[] = multi.getParameterValues("school_last_date");
		String school_college1[] = multi.getParameterValues("school_college1");
		String school_college2[] = multi.getParameterValues("school_college2");
		String school_major[] = multi.getParameterValues("school_major");
		String school_rank1[] = multi.getParameterValues("school_rank1");
		String school_rank2[] = multi.getParameterValues("school_rank2");
		
		
		school_dto.setSchool_name_high(multi.getParameter("highschool_name"));
		school_dto.setSchool_start_date_high(multi.getParameter("highschool_start_date"));
		school_dto.setSchool_last_date_high(multi.getParameter("highschool_last_date"));
		school_dto.setSchool_college_high(multi.getParameter("highschool_college"));
		school_dto.setHighschool_kind(multi.getParameter("highschool_kind"));
		school_dto.setReg_date(new Timestamp(System.currentTimeMillis()));
		school_dto.setLast_date(new Timestamp(System.currentTimeMillis()));	
			
		school_dto.setUser_history_id(dto.getHistory_id());
		
		
		
		result = dao.insertArticle_sc( school_dto );	


		if(school_name != null){
		for(int i=0; i<school_name.length; i++) {
		  
			school_dto.setSchool_name_college(school_name[i]);
			school_dto.setSchool_kind(request.getParameter("school_kind"+(i+1)));

			school_dto.setSchool_major(school_major[i]);
			school_dto.setSchool_college1(school_college1[i]);
			school_dto.setSchool_college2(school_college2[i]);
			school_dto.setSchool_start_date_college(school_start_date[i]);
			school_dto.setSchool_last_date_college(school_last_date[i]);
			school_dto.setHighschool_kind(null);
			school_dto.setSchool_college_high(null);
			school_dto.setSchool_ref(1);

			school_dto.setReg_date(new Timestamp(System.currentTimeMillis()));
			school_dto.setLast_date(new Timestamp(System.currentTimeMillis()));
			
			
			for (int j=0; j<school_rank1.length; j++) {
			
				String school_rank = null;
						
				school_rank = school_rank1[j] + "/" + school_rank2[j];
			
				school_dto.setSchool_rank(school_rank);
			
			}
			
			result = dao.insertArticle_sc( school_dto );	

			
			}
		}
		
		map.put("History_id", dto.getHistory_id());
		map.put("result", result);
		map.put("page", "/FJ_USER/resome_Pro");
		
		return new ModelAndView("/FJ_MAIN/main", map);
		
	}
}






