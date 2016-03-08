package handler.recruit;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.recruit.RecruitDao;
import dto.recruit.RecruitDataBean;
import handler.Commandhandler;

@Controller
public class RecruitWriteProHandler implements Commandhandler{

	@Resource(name="recruitDao")
	private RecruitDao recruitDao;

	@RequestMapping("/recruitWritePro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Map<String, Object> map = new HashMap<String, Object>();
		
		request.setCharacterEncoding("utf-8");
		
		// 바구니 생성
		RecruitDataBean dto = new RecruitDataBean();
		
		// 그냥 넘어오는거 넣기
		dto.setEmail((String)request.getSession().getAttribute("memId"));	// 세션에 있는 이메일
		dto.setTitle(request.getParameter("title"));						// 제목
		dto.setContent(request.getParameter("content"));					// 내용
		dto.setName((String)request.getSession().getAttribute("name"));		// 세션에 있는 이름
		dto.setSkill(request.getParameter("skill"));						// 원하는 기술
		dto.setGender(request.getParameter("gender"));						// 성별
		dto.setEdu(request.getParameter("edu"));							// 학력
		dto.setWork_day(request.getParameter("work_area"));					// 근무요일 (주5일) 등등
		dto.setBusiness_part(request.getParameter("business_part"));		// 담당업무
		dto.setIncharge(request.getParameter("incharge"));					// 채용 담당자
		dto.setTel(request.getParameter("tel_1") + request.getParameter("tel_2"));		// 전화번호
		dto.setStart_date(request.getParameter("start_date"));				// 채용 시작일
		dto.setEnd_date(request.getParameter("end_date"));					// 채용 종료일
		dto.setPeople_count(Integer.parseInt(request.getParameter("people_count")));	// 채용인원
		dto.setReadcount(0);												// 조회수
		dto.setReg_date(new Timestamp( System.currentTimeMillis()));		// 작성일
		dto.setLast_date(new Timestamp( System.currentTimeMillis()));		// 수정일

		
		// 반복문을 돌려야 하는 입력부분 처리
		String work_types[] = request.getParameterValues("work_type");
		if( work_types != null){
			dto.setWork_type( arrayCheck(work_types) );						// 근무형태
		}
		
		String work_areas[] = request.getParameterValues("work_area");
		if( work_areas != null ){
			dto.setWork_area( arrayCheck(work_areas) );						// 근무지역
		}
		
		
		// 경력사항 처리
		// 신입 : -1		// 경력무관 : -2		// 경력은 그냥 경력
		String career = request.getParameter("career");
		if( career != null){
			if (career.equals("신입")){
				dto.setMax_career(-1);
				dto.setMin_career(0);
			}else if( career.equals("경력")){
				String max_careers[] = request.getParameter("max_career").split("년");
				String min_careers[] = request.getParameter("min_career").split("년");
				dto.setMax_career( Integer.parseInt(max_careers[0]) );
				dto.setMin_career( Integer.parseInt(min_careers[0]) );
			}else if( career.equals("경력무관")){
				dto.setMax_career(-2);
				dto.setMin_career(0);
			}
		}
		
		// 연령 처리
		// 무관 -1		// 다른 입력은 한글 삭제 숫자만 입력
		String age = request.getParameter("age");
		if(age != null){
			if( age.equals("무관")){
				dto.setMax_age(-1);
				dto.setMin_age(-1);
			} else{
				String max_ages[] = request.getParameter("max_age").split("년");
				String min_ages[] = request.getParameter("min_age").split("년");
				dto.setMax_age(Integer.parseInt(max_ages[0]));
				dto.setMin_age(Integer.parseInt(min_ages[0]));
			}
		}
		
		// 연봉처리
		String max_salarys[] = request.getParameter("max_salary").split("만원");
		String min_salarys[] = request.getParameter("min_salary").split("만원");
		dto.setMax_salary(Integer.parseInt(max_salarys[0]));
		dto.setMin_salary(Integer.parseInt(min_salarys[0]));
		
		////////////////// 입력 끝 //////////////////////////////
		
		// 이제  DB에 넣자
		int result = recruitDao.insertRecruit(dto);
		
		// 처리된거 페이지로 리턴
		map.put("result", result);

		map.put("menu", "recruit");
		map.put("page", "/FJ_RECRUIT/recruitWritePro");
		return new ModelAndView("/FJ_MAIN/main", map);
	}

	// 배열에다가 ","를 입력하기 위한 메소드
	public String arrayCheck(String[] ar ){
		String result = "";
		for(int i=0; i<ar.length; i++){
			result += ar[i];
			if(i < ar.length-1){
				result += ",";
			}
		}
		return result;
	}
}
