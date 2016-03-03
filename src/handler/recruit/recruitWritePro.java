package handler.recruit;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.recruit.RecruitDao;
import dto.recruit.RecruitDataBean;
import handler.Commandhandler;

@Controller
public class recruitWritePro implements Commandhandler {
	
	@Resource(name="recruitDao")
	private RecruitDao dao;
	
	@RequestMapping("/recruitWritePro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Map<String, Object> map = new HashMap<String, Object>();
		//한글처리
		request.setCharacterEncoding("utf-8");
		// 바구니 생성
		RecruitDataBean dto = new RecruitDataBean();
		
		// 담아 볼까?
		dto.setEmail( (String)request.getSession().getAttribute("memId") );		// 이메일
		dto.setTitle(request.getParameter("title"));							// 제목	
		dto.setContent(request.getParameter("content"));						// 내용
		dto.setSkill(request.getParameter("skill"));							// 원하는 기술
		dto.setEdu(request.getParameter("edu"));								// 학력
		dto.setBusiness_part(request.getParameter("business_part"));			// 담당업무
		dto.setIncharge(request.getParameter("incharge"));						// 담당자
		dto.setTel(request.getParameter("tel_1") +"-" + request.getParameter("tel_2"));		// 연락처
		
		// 배열로 들어오는 값 처리
		String genders[] = request.getParameterValues("gender");
		if( !(genders[0] == null && genders[0].equals("") )){
			dto.setGender( arrayckeck( genders ) );								// 성별
		}
		
		String work_types[] = request.getParameterValues("work_type");
		if( !(work_types[0] == null && work_types[0].equals("") )){
			dto.setWork_type( arrayckeck( work_types ));							// 고용형태
		}
		
		String work_days[] = request.getParameterValues("work_day");
		if( !(work_days[0] == null && work_days[0].equals("") )){
			dto.setWork_day( arrayckeck( work_days ));								// 근무요일
		}
		
		String work_areas[] = request.getParameterValues("work_area");
		if( !(work_areas[0] == null && work_areas[0].equals("") )){
			dto.setWork_area( arrayckeck( work_areas ));							// 근무지역
		}
		
		// 한글하고 같이 들어오는거 그냥 숫자만 남기기
		String min_salarys[] = request.getParameter("min_salary").split("만원");
		System.out.println(Integer.parseInt(min_salarys[0]));
		dto.setMin_salary( Integer.parseInt(min_salarys[0]));
		/* 
	public String min_salary;		// 최소 연봉
	public String max_salary;		// 최대 연봉
	public String start_date;		// 채용 시작일
	public String end_date;			// 채용 종료일
	public String min_career;		// 최소 경력
	public String max_career;		// 최대 경력
	public String min_age;			// 최소 나이
	public String max_age;			// 최대 나이

	public int people_count;		// 채용인원
	public int readcount;			// 조회수
	
	public Timestamp reg_date;		// 작성일
	public Timestamp last_date;		// 수정일
		 * 
		 * 
		 */

		map.put("page", "/FJ_RECRUIT/recruitWritePro");
		return new ModelAndView("/FJ_MAIN/main", map);
	}

	// 중복으로 들오는애들 분류하기
	public String arrayckeck( String[] re ){
		String temp = "";
		for(int i=0; i<re.length; i++){
			temp += re[i];
			if( i < re.length-1 ) temp += ",";
		}
		return temp;
	}
	
}
