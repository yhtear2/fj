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
public class RecruitWritePro implements Commandhandler {
	
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
		
		// 담아 볼까?... 많네...;;
		dto.setEmail( (String)request.getSession().getAttribute("memId") );		// 이메일
		dto.setTitle(request.getParameter("title"));							// 제목	
		dto.setContent(request.getParameter("content"));						// 내용
		dto.setSkill(request.getParameter("skill"));							// 원하는 기술
		dto.setEdu(request.getParameter("edu"));								// 학력
		dto.setBusiness_part(request.getParameter("business_part"));			// 담당업무
		dto.setIncharge(request.getParameter("incharge"));						// 담당자
		dto.setTel(request.getParameter("tel_1") +"-" + request.getParameter("tel_2"));		// 연락처
		dto.setGender(request.getParameter("gender"));							// 성별
		dto.setWork_day(request.getParameter("work_day"));						// 근무요일
		dto.setStart_date(request.getParameter("start_date"));					// 채용 시작일
		dto.setEnd_date(request.getParameter("end_date"));						// 채용 종료일
		dto.setPeople_count(Integer.parseInt(request.getParameter("people_count")));		//채용인원
		dto.setReadcount(0);													// 조회수
		dto.setReg_date(new Timestamp( System.currentTimeMillis()));			// 입력일
		dto.setLast_date(new Timestamp( System.currentTimeMillis()));			// 수정일

		// 배열로 들어오는 값 처리
		String work_types[] = request.getParameterValues("work_type");
		dto.setWork_type( arrayckeck( work_types ));							// 고용형태
		
		String work_areas[] = request.getParameterValues("work_area");
		dto.setWork_area( arrayckeck( work_areas ));							// 근무지역
		
		// 한글하고 같이 들어오는거 그냥 숫자만 남기기
		String min_salarys[] = request.getParameter("min_salary").split("만원");
		dto.setMin_salary( Integer.parseInt(min_salarys[0]));					// 최소연봉
		
		String max_salarys[] = request.getParameter("max_salary").split("만원");
		dto.setMax_salary( Integer.parseInt(max_salarys[0]));					// 최대연봉
		
		// 경력은 신규와 무관이 있기 때문에 처리를 해줘야함
		// 값들이 -1로 들어오면 신입 // 0으로 들어오면 경력무관 // 나머지는 경력
		String career = request.getParameter("career");
		if( career != null){
			if(career.equals("신입")){
				dto.setMin_career(-1);
				dto.setMax_career(-1);
			}else if(career.equals("경력")){
				// 한글이 들어오니깐 숫자만 남기기
				String min_career[] = request.getParameter("min_career").split("년");
				String max_career[] = request.getParameter("max_career").split("년");
				dto.setMin_career(Integer.parseInt(min_career[0]));
				dto.setMax_career(Integer.parseInt(max_career[0]));
			}else if(career.equals("경력무관")){
				dto.setMin_career(0);
				dto.setMax_career(0);
			}
		}
		
		// 나이 처리하는 페이지
		// 한글로 들어오니 분리해서 숫자로 넣기
		// 나중에 페이지에서 보여질때 계산해서 30살 뭐 이렇게 나오게 하자
		String min_age[] = request.getParameter("min_age").split("년");
		String max_age[] = request.getParameter("max_age").split("년");
		dto.setMin_age(Integer.parseInt(min_age[0]));
		dto.setMax_age(Integer.parseInt(max_age[0]));
		
		// 드디어 입력끝!!
		
		// 이제 DB처리하러 갑시다!!!
		int result = dao.insertRecruit(dto);
		
		// 페이지로 보낼 데이터 넣기
		map.put("result", result);
		
		map.put("page", "/FJ_RECRUIT/recruitWritePro");
		return new ModelAndView("/FJ_MAIN/main", map);
	}

	// 배열로 들오는애들 분류하기
	public String arrayckeck( String[] re ){
		String temp = "";
		if( re != null ){
			for(int i=0; i<re.length; i++){
				temp += re[i];
				if( i < re.length-1 ) temp += ",";
			}
		}
		return temp;
	}
	
}
