package handler.user;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.user.UserDao;
import dto.user.CareerDataBean;
import dto.user.IntroduceDataBean;
import dto.user.SchoolDataBean;
import dto.user.UserDataBean;
import handler.Commandhandler;

@Controller
public class ResomeModify_ProHandler implements Commandhandler {
	
	@Resource( name="userDao" )
	private UserDao dao;

	@RequestMapping("/resomeModify_Pro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Map<String, Object> map = new HashMap<String, Object>();
		request.setCharacterEncoding( "utf-8" );

		String saveDir = request.getServletContext().getRealPath("/") + "FJ_USER\\images";
		MultipartRequest multi = new MultipartRequest(request,saveDir,1024*1024*15,"UTF-8",new DefaultFileRenamePolicy());
		
		// 중요하게 받아오는 값들
		int User_history_id = Integer.parseInt(multi.getParameter("user_history_id"));
		
		// 여기는 기본정보 입력! 
		String imageFileName = multi.getFilesystemName("imginput");
		String projectFile = multi.getFilesystemName("project");
		String resome_title = multi.getParameter("resome_title");
		String email = (String) request.getSession().getAttribute("memId");
		String eng_name = multi.getParameter("eng_name");
		String kor_name = multi.getParameter("kor_name");
		String birth = multi.getParameter("birth");


		String skill = multi.getParameter("skill");
		int want_salary=0;
		String salary = multi.getParameter("want_salary");
		if( !(salary == null || salary.equals(""))){
			want_salary = Integer.parseInt(salary);
		}
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
		
		String postcode = multi.getParameter("postcode");
		String address1 = multi.getParameter("address1");
		String address2 = multi.getParameter("address2");
		String address = postcode + "/" + address1 + "/" + address2;
		
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
		dto.setTotal_career(0);
		dto.setUser_history_id(User_history_id);
		String license = "";

		int license_cnt = Integer.parseInt(multi.getParameter("license_cnt_hidden"));
		


		for(int i=0; i<=license_cnt-1 ; i++) {
			license +=  multi.getParameter("license1"+i) + "#" + multi.getParameter("license2"+i) + "#" + multi.getParameter("license3"+i)+ "/";
		
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
		if( imageFileName != null ){
			String resome_image = "FJ_USER/images/" + imageFileName;
			dto.setPhoto(resome_image);
		}else{
			dto.setPhoto( multi.getParameter("user-photo") );
		}
	
		String resome_project = "library/portfolio/" + projectFile;
		dto.setProject(resome_project);

		int result = dao.updateUserData( dto );	
		
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
			
		school_dto.setUser_history_id( User_history_id );
		
		
		dao.deleteArticle_school(User_history_id);
		result = dao.insertArticle_sc( school_dto );	


		if(school_name != null){
		for(int i=0; i<school_name.length; i++) {
		  
			school_dto.setSchool_name_college(school_name[i]);
			school_dto.setSchool_kind(multi.getParameter("school_kind"+(i+1)));

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
			dao.deleteArticle_school(User_history_id);
			result = dao.insertArticle_sc( school_dto );	

			
			}
		}
		
		
		// 여기는 경력사항 입력!
		
		CareerDataBean Career_dto = new CareerDataBean();
		
		String career_comp_name[] = multi.getParameterValues("career_comp_name");
		String career_start_date[] = multi.getParameterValues("career_start_date");
		String career_last_date[] = multi.getParameterValues("career_last_date");
		String career_kind[] = multi.getParameterValues("career_kind");
		String career_department[] = multi.getParameterValues("career_department");
		String career_position1[] = multi.getParameterValues("career_position1");
		String career_position2[] = multi.getParameterValues("career_position2");
		String career_salary[] = multi.getParameterValues("career_salary");

		String career_resign[] = multi.getParameterValues("career_resign");	
		String career_work[] = multi.getParameterValues("career_work");		
		String career_content[] = multi.getParameterValues("career_content");		

		Career_dto.setCareer_sort(multi.getParameter("career_sort"));
		
		Career_dto.setUser_history_id( User_history_id );
		
		long diffDays = 0;
		for(int i=0; i<career_comp_name.length; i++) {
			Career_dto.setCareer_comp_name(career_comp_name[i]);
			Career_dto.setUser_history_id( User_history_id );
			Career_dto.setCareer_start_date(career_start_date[i]);
			Career_dto.setCareer_last_date(career_last_date[i]);
			Career_dto.setCareer_department(career_department[i]);

			if( ! (career_start_date[i] == null || career_start_date[i].equals(""))){
		       SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		       Date beginDate = formatter.parse(career_start_date[i]);
		       Date endDate = formatter.parse(career_last_date[i]);
		         
		        // 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
		        long diff = endDate.getTime() - beginDate.getTime();
		        diffDays = diffDays + diff / (24 * 60 * 60 * 1000);
			}
			
			if ( multi.getParameter("career_salary").equals("") && multi.getParameter("career_salary").equals(null)) {
				Career_dto.setCareer_salary(Integer.parseInt("0"));
			} 
			else if ( ! multi.getParameter("career_salary").equals("") && ! multi.getParameter("career_salary").equals(null)) {
			Career_dto.setCareer_salary(Integer.parseInt(career_salary[i]));
			}
		
			if ( multi.getParameter("career_sort").equals("신입")) {
				Career_dto.setCareer_kind("");
				Career_dto.setCareer_position1("");
				Career_dto.setCareer_position2("");				
			} 
			else if ( multi.getParameter("career_sort").equals("경력")) {
				Career_dto.setCareer_kind(career_kind[i]);
				Career_dto.setCareer_position1(career_position1[i]);
				Career_dto.setCareer_position2(career_position2[i]);
			}			
			
			Career_dto.setCareer_resign(career_resign[i]);
			Career_dto.setCareer_work(career_work[i]);
			Career_dto.setCareer_content(career_content[i]);

			dao.deleteArticle_career(User_history_id);
			result = dao.insertArticle_career( Career_dto );	
		}
		
		int TOTAL_CAREER = ((int)(diffDays/365));
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("TOTAL_CAREER", TOTAL_CAREER);
		map2.put("user_history_id", User_history_id );
		result = dao.updateTotalCareer(map2);	// 총 경력 이력서에 넣기

		// 여기는 자기소개서 입력
		// 데이터 받기
		int cnt = Integer.parseInt(multi.getParameter("cnt"));

		// 바구니 생성
		IntroduceDataBean Idto = new IntroduceDataBean();
		
		for( int i=0; i<cnt+1; i++){
			Idto.setUser_history_id( User_history_id );
			Idto.setIntro_title(multi.getParameter("sub_name_"+i));
			Idto.setIntro_contents(multi.getParameter("contents"+i));
			Idto.setIntro_reg_date(new Timestamp(System.currentTimeMillis()));
			Idto.setIntro_last_date(new Timestamp(System.currentTimeMillis()));
			
			// 디비 처리
			dao.deleteArticle_introduce(User_history_id);
			result = dao.insertArticle_introduce(Idto);
			map.put("result", result);
		}


		map.put("page", "/FJ_USER/resomeModify_Pro");
		return new ModelAndView("/FJ_MAIN/main", map);
	}

}
