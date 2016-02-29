
/* Drop Tables */

DROP TABLE FJ_Board_Free CASCADE CONSTRAINTS;
DROP TABLE FJ_Career CASCADE CONSTRAINTS;
DROP TABLE FJ_Comp CASCADE CONSTRAINTS;
DROP TABLE FJ_Introduce CASCADE CONSTRAINTS;
DROP TABLE FJ_Log CASCADE CONSTRAINTS;
DROP TABLE FJ_Message CASCADE CONSTRAINTS;
DROP TABLE FJ_Recruit_Log CASCADE CONSTRAINTS;
DROP TABLE FJ_Recruit CASCADE CONSTRAINTS;
DROP TABLE FJ_School CASCADE CONSTRAINTS;
DROP TABLE FJ_User CASCADE CONSTRAINTS;
DROP TABLE FJ_member CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE FJ_Recruit_seq;




/* Create Sequences */

-- 채용게시판 시퀀스
CREATE SEQUENCE FJ_Recruit_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999 START WITH 1 NOCACHE NOCYCLE;



/* Create Tables */

-- FJ_Board_Free
CREATE TABLE FJ_Board_Free
(
	-- board_num : 게시판 ID
	board_num number NOT NULL,
	-- email : 이메일
	email varchar2(50) NOT NULL,
	-- subject : 제목 
	subject varchar2(100) NOT NULL,
	-- content : 내용 
	content varchar2(4000) NOT NULL,
	-- re_count : 리플의 수 
	re_count number NOT NULL,
	-- scrap_count : 스크랩 수 
	scrap_count number NOT NULL,
	-- recom_count : 좋아요 수 
	recom_count number NOT NULL,
	-- read_count : 읽은 수 
	-- (실제 DB에는 number default 0, 으로 할 것임)
	read_count number,
	-- bad_count : 싫어요 수 
	bad_count number NOT NULL,
	-- re_step : 게시글의 구분 
	re_step number NOT NULL,
	-- reg_date : 작성 날짜 
	reg_date date NOT NULL,
	-- hstag : 해쉬태그
	hstag varchar2(50) NOT NULL,
	 ,
	PRIMARY KEY (board_num)
);


-- FJ_Career
CREATE TABLE FJ_Career
(
	-- career_id : 경력관리 ID 
	career_id varchar2(30) NOT NULL,
	-- user_history_id : 이력서 ID
	user_history_id varchar2(30),
	-- comp_name : 회사 이름 
	comp_name varchar2(10) NOT NULL,
	-- content : 내용 
	content varchar2(5000) NOT NULL,
	-- position : 직책 
	position varchar2(10) NOT NULL,
	-- business : 수주회사 
	business varchar2(20) NOT NULL,
	-- reg_date : 작성일자 
	reg_date date NOT NULL,
	-- last_date : 수정일자 
	last_date date NOT NULL,
	PRIMARY KEY (career_id)
);


-- FJ_Comp
CREATE TABLE FJ_Comp
(
	-- email : 이메일
	email varchar2(50) NOT NULL,
	-- address : 주소 
	address varchar2(100) NOT NULL,
	-- info : 회사 정보(홍보) 
	info varchar2(5000) NOT NULL,
	-- tel : 전화번호 
	tel varchar2(30) NOT NULL,
	-- like_count : 회사 추천수 
	like_count number NOT NULL,
	-- ceo : 대표자명 
	ceo varchar2(10) NOT NULL,
	-- comp_reg_date : 회사 창립일 
	comp_reg_date timestamp NOT NULL,
	-- year_sale : 연매출 
	year_sale number NOT NULL,
	-- reg_date : 작성일자 
	reg_date date NOT NULL,
	-- last_date : 수정일자 
	last_date date NOT NULL,
	-- comp_type : 기업형태 
	comp_type varchar2(30) NOT NULL,
	-- emp_count : 직원수 
	emp_count number NOT NULL,
	-- capital : 자본금 
	capital varchar2(100) NOT NULL,
	PRIMARY KEY (email)
);


-- FJ_Introduce
CREATE TABLE FJ_Introduce
(
	-- introduce_id : 학력관리 ID 
	introduce_id varchar2(30) NOT NULL,
	-- user_history_id : 이력서 ID
	user_history_id varchar2(30) NOT NULL,
	-- title : 제목
	title varchar2(50) NOT NULL,
	-- content : 내용
	content varchar2(5000) NOT NULL,
	-- start_date : 작성일자
	start_date date NOT NULL,
	-- last_date : 수정일자
	last_date date NOT NULL,
	PRIMARY KEY (introduce_id)
);


-- FJ_Log
CREATE TABLE FJ_Log
(
	-- email : 이메일
	email varchar2(50) NOT NULL,
	-- page_id : 페이지 ID 
	page_id varchar2(30) NOT NULL,
	-- reg_date : 작성일자 
	reg_date date NOT NULL,
	-- last_date : 수정일자 
	last_date date NOT NULL
);


-- Fj_member
CREATE TABLE FJ_member
(
	-- email : 이메일
	email varchar2(50) NOT NULL,
	-- passwd : 비밀번호
	passwd varchar2(50) NOT NULL,
	-- name : 닉네임 or 회사이름
	name varchar2(100) NOT NULL,
	-- reg_date : 작성일자 
	reg_date date NOT NULL,
	-- member_flag : 회원구분 
	-- 
	-- 1 : 개인회원 
	-- 2 : 기업회원
	-- 3 : 관리자 
	member_flag number NOT NULL,
	PRIMARY KEY (email)
);


-- FJ_Message
CREATE TABLE FJ_Message
(
	-- message_num : 메시지 ID 
	message_num  NOT NULL,
	-- email : 이메일
	email varchar2(50) NOT NULL,
	-- title : 제목
	title varchar2(200) NOT NULL,
	-- content : 내용 
	content varchar2(1000) NOT NULL,
	-- tag : 태그 분류
	tag varchar2(20) NOT NULL,
	-- reg_date : 보낸날짜 
	reg_date date NOT NULL,
	-- read_yn : 확인 유무
	read_yn  NOT NULL,
	PRIMARY KEY (message_num)
);


-- FJ_Recruit
CREATE TABLE FJ_Recruit
(
	-- recruit_id : 채용게시판 ID 
	recruit_id varchar2(30) NOT NULL,
	-- email : 이메일
	email varchar2(50),
	-- title : 제목 
	title varchar2(100) NOT NULL,
	-- content : 내용 
	content varchar2(5000),
	-- skill : 보유기술 
	skill varchar2(300),
	-- gender : 성별 
	gender varchar2(20),
	-- edu : 학력
	edu varchar2(200),
	-- work_type : 고용 형태 
	work_type varchar2(50),
	-- work_day : 근무요일 
	work_day varchar2(100),
	-- work_area : 근무지역
	-- 
	work_area varchar2(100),
	-- business_part : 담당업무 
	business_part varchar2(200),
	-- incharge : 담당자
	incharge varchar2(100),
	-- tel : 연락처
	tel varchar2(100),
	-- min_salary : 최소 연봉 
	min_salary varchar2(80),
	-- max_salary : 최대 연봉 
	max_salary varchar2(80),
	-- min_career : 최소 경력 
	min_career varchar2(150),
	-- max_career : 최대 경력 
	max_career varchar2(150),
	-- min_age : 최소 나이 
	min_age varchar2(200),
	-- max_age : 최대 나이 
	max_age varchar2(200),
	-- start_date : 채용 시작일 
	start_date varchar2(100),
	-- end_date : 채용 종료일 
	end_date varchar2(100),
	-- num_people : 채용인원 
	num_people number,
	-- readcount : 조회수 
	readcount number,
	-- reg_date : 작성일자 
	reg_date date,
	-- last_date : 수정일자 
	last_date date,
	PRIMARY KEY (recruit_id)
);


-- 새 테이블
CREATE TABLE FJ_Recruit_Log
(
	-- recruit_id : 채용게시판 ID 
	recruit_id varchar2(30) NOT NULL,
	-- email : 이메일
	email varchar2(50) NOT NULL,
	-- user_history_id : 이력서 ID
	user_history_id varchar2(30) NOT NULL,
	-- reg_date : 입사 지원일 
	reg_date date NOT NULL
);


-- FJ_School
CREATE TABLE FJ_School
(
	-- school_id : 학력관리 ID 
	school_id varchar2(30) NOT NULL,
	-- user_history_id : 이력서 ID
	user_history_id varchar2(30) NOT NULL,
	-- school_name : 학교 이름 
	school_name varchar2(10) NOT NULL,
	-- major : 전공 
	major varchar2(20) NOT NULL,
	-- finish_flag : 졸업 구분 
	-- 
	-- 1- 졸업
	-- 2- 중퇴
	-- 3- 재학 
	finish_flag number NOT NULL,
	-- school_rank : 학교 구분 
	school_rank number NOT NULL,
	-- reg_date : 작성일자 
	reg_date date NOT NULL,
	-- last_date : 수정일자
	last_date date NOT NULL,
	PRIMARY KEY (school_id)
);


-- FJ_User
CREATE TABLE FJ_User
(
	-- user_history_id : 이력서 ID
	user_history_id varchar2(30) NOT NULL,
	-- email : 이메일
	email varchar2(50),
	-- eng_name : 영문이름 
	eng_name varchar2(20) NOT NULL,
	-- kor_name : 한글이름 
	kor_name varchar2(10) NOT NULL,
	-- tel : 전화번호 
	tel varchar2(20) NOT NULL,
	-- birth : 생년월일 
	birth date NOT NULL,
	-- address : 주소 
	address varchar2(100) NOT NULL,
	-- army : 병역사항 
	army varchar2(30) NOT NULL,
	-- license : 자격증 
	license varchar2(100) NOT NULL,
	-- want_salary : 희망 연봉 
	want_salary number NOT NULL,
	-- skill : 보유기술 
	skill varchar2(500) NOT NULL,
	-- reg_date : 작성일자 
	reg_date date NOT NULL,
	-- last_date : 수정일자 
	last_date date NOT NULL,
	-- project : 프로젝트 
	project varchar2(100) NOT NULL,
	PRIMARY KEY (user_history_id)
);



/* Create Foreign Keys */

ALTER TABLE FJ_Board_Free
	ADD FOREIGN KEY (email)
	REFERENCES FJ_member (email)
;


ALTER TABLE FJ_Comp
	ADD FOREIGN KEY (email)
	REFERENCES FJ_member (email)
;


ALTER TABLE FJ_Log
	ADD FOREIGN KEY (email)
	REFERENCES FJ_member (email)
;


ALTER TABLE FJ_Message
	ADD FOREIGN KEY (email)
	REFERENCES FJ_member (email)
;


ALTER TABLE FJ_Recruit
	ADD FOREIGN KEY (email)
	REFERENCES FJ_member (email)
;


ALTER TABLE FJ_User
	ADD FOREIGN KEY (email)
	REFERENCES FJ_member (email)
;


ALTER TABLE FJ_Recruit_Log
	ADD FOREIGN KEY (recruit_id)
	REFERENCES FJ_Recruit (recruit_id)
;


ALTER TABLE FJ_Career
	ADD FOREIGN KEY (user_history_id)
	REFERENCES FJ_User (user_history_id)
;


ALTER TABLE FJ_Introduce
	ADD FOREIGN KEY (user_history_id)
	REFERENCES FJ_User (user_history_id)
;


ALTER TABLE FJ_School
	ADD FOREIGN KEY (user_history_id)
	REFERENCES FJ_User (user_history_id)
;



/* Comments */

COMMENT ON TABLE FJ_Board_Free IS 'FJ_Board_Free';
COMMENT ON COLUMN FJ_Board_Free.board_num IS 'board_num : 게시판 ID';
COMMENT ON COLUMN FJ_Board_Free.email IS 'email : 이메일';
COMMENT ON COLUMN FJ_Board_Free.subject IS 'subject : 제목 ';
COMMENT ON COLUMN FJ_Board_Free.content IS 'content : 내용 ';
COMMENT ON COLUMN FJ_Board_Free.re_count IS 're_count : 리플의 수 ';
COMMENT ON COLUMN FJ_Board_Free.scrap_count IS 'scrap_count : 스크랩 수 ';
COMMENT ON COLUMN FJ_Board_Free.recom_count IS 'recom_count : 좋아요 수 ';
COMMENT ON COLUMN FJ_Board_Free.read_count IS 'read_count : 읽은 수 
(실제 DB에는 number default 0, 으로 할 것임)';
COMMENT ON COLUMN FJ_Board_Free.bad_count IS 'bad_count : 싫어요 수 ';
COMMENT ON COLUMN FJ_Board_Free.re_step IS 're_step : 게시글의 구분 ';
COMMENT ON COLUMN FJ_Board_Free.reg_date IS 'reg_date : 작성 날짜 ';
COMMENT ON COLUMN FJ_Board_Free.hstag IS 'hstag : 해쉬태그';
COMMENT ON TABLE FJ_Career IS 'FJ_Career';
COMMENT ON COLUMN FJ_Career.career_id IS 'career_id : 경력관리 ID ';
COMMENT ON COLUMN FJ_Career.user_history_id IS 'user_history_id : 이력서 ID';
COMMENT ON COLUMN FJ_Career.comp_name IS 'comp_name : 회사 이름 ';
COMMENT ON COLUMN FJ_Career.content IS 'content : 내용 ';
COMMENT ON COLUMN FJ_Career.position IS 'position : 직책 ';
COMMENT ON COLUMN FJ_Career.business IS 'business : 수주회사 ';
COMMENT ON COLUMN FJ_Career.reg_date IS 'reg_date : 작성일자 ';
COMMENT ON COLUMN FJ_Career.last_date IS 'last_date : 수정일자 ';
COMMENT ON TABLE FJ_Comp IS 'FJ_Comp';
COMMENT ON COLUMN FJ_Comp.email IS 'email : 이메일';
COMMENT ON COLUMN FJ_Comp.address IS 'address : 주소 ';
COMMENT ON COLUMN FJ_Comp.info IS 'info : 회사 정보(홍보) ';
COMMENT ON COLUMN FJ_Comp.tel IS 'tel : 전화번호 ';
COMMENT ON COLUMN FJ_Comp.like_count IS 'like_count : 회사 추천수 ';
COMMENT ON COLUMN FJ_Comp.ceo IS 'ceo : 대표자명 ';
COMMENT ON COLUMN FJ_Comp.comp_reg_date IS 'comp_reg_date : 회사 창립일 ';
COMMENT ON COLUMN FJ_Comp.year_sale IS 'year_sale : 연매출 ';
COMMENT ON COLUMN FJ_Comp.reg_date IS 'reg_date : 작성일자 ';
COMMENT ON COLUMN FJ_Comp.last_date IS 'last_date : 수정일자 ';
COMMENT ON COLUMN FJ_Comp.comp_type IS 'comp_type : 기업형태 ';
COMMENT ON COLUMN FJ_Comp.emp_count IS 'emp_count : 직원수 ';
COMMENT ON COLUMN FJ_Comp.capital IS 'capital : 자본금 ';
COMMENT ON TABLE FJ_Introduce IS 'FJ_Introduce';
COMMENT ON COLUMN FJ_Introduce.introduce_id IS 'introduce_id : 학력관리 ID ';
COMMENT ON COLUMN FJ_Introduce.user_history_id IS 'user_history_id : 이력서 ID';
COMMENT ON COLUMN FJ_Introduce.title IS 'title : 제목';
COMMENT ON COLUMN FJ_Introduce.content IS 'content : 내용';
COMMENT ON COLUMN FJ_Introduce.start_date IS 'start_date : 작성일자';
COMMENT ON COLUMN FJ_Introduce.last_date IS 'last_date : 수정일자';
COMMENT ON TABLE FJ_Log IS 'FJ_Log';
COMMENT ON COLUMN FJ_Log.email IS 'email : 이메일';
COMMENT ON COLUMN FJ_Log.page_id IS 'page_id : 페이지 ID ';
COMMENT ON COLUMN FJ_Log.reg_date IS 'reg_date : 작성일자 ';
COMMENT ON COLUMN FJ_Log.last_date IS 'last_date : 수정일자 ';
COMMENT ON TABLE FJ_member IS 'Fj_member';
COMMENT ON COLUMN FJ_member.email IS 'email : 이메일';
COMMENT ON COLUMN FJ_member.passwd IS 'passwd : 비밀번호';
COMMENT ON COLUMN FJ_member.name IS 'name : 닉네임 or 회사이름';
COMMENT ON COLUMN FJ_member.reg_date IS 'reg_date : 작성일자 ';
COMMENT ON COLUMN FJ_member.member_flag IS 'member_flag : 회원구분 

1 : 개인회원 
2 : 기업회원
3 : 관리자 ';
COMMENT ON TABLE FJ_Message IS 'FJ_Message';
COMMENT ON COLUMN FJ_Message.message_num IS 'message_num : 메시지 ID ';
COMMENT ON COLUMN FJ_Message.email IS 'email : 이메일';
COMMENT ON COLUMN FJ_Message.title IS 'title : 제목';
COMMENT ON COLUMN FJ_Message.content IS 'content : 내용 ';
COMMENT ON COLUMN FJ_Message.tag IS 'tag : 태그 분류';
COMMENT ON COLUMN FJ_Message.reg_date IS 'reg_date : 보낸날짜 ';
COMMENT ON COLUMN FJ_Message.read_yn IS 'read_yn : 확인 유무';
COMMENT ON TABLE FJ_Recruit IS 'FJ_Recruit';
COMMENT ON COLUMN FJ_Recruit.recruit_id IS 'recruit_id : 채용게시판 ID ';
COMMENT ON COLUMN FJ_Recruit.email IS 'email : 이메일';
COMMENT ON COLUMN FJ_Recruit.title IS 'title : 제목 ';
COMMENT ON COLUMN FJ_Recruit.content IS 'content : 내용 ';
COMMENT ON COLUMN FJ_Recruit.skill IS 'skill : 보유기술 ';
COMMENT ON COLUMN FJ_Recruit.gender IS 'gender : 성별 ';
COMMENT ON COLUMN FJ_Recruit.edu IS 'edu : 학력';
COMMENT ON COLUMN FJ_Recruit.work_type IS 'work_type : 고용 형태 ';
COMMENT ON COLUMN FJ_Recruit.work_day IS 'work_day : 근무요일 ';
COMMENT ON COLUMN FJ_Recruit.work_area IS 'work_area : 근무지역
';
COMMENT ON COLUMN FJ_Recruit.business_part IS 'business_part : 담당업무 ';
COMMENT ON COLUMN FJ_Recruit.incharge IS 'incharge : 담당자';
COMMENT ON COLUMN FJ_Recruit.tel IS 'tel : 연락처';
COMMENT ON COLUMN FJ_Recruit.min_salary IS 'min_salary : 최소 연봉 ';
COMMENT ON COLUMN FJ_Recruit.max_salary IS 'max_salary : 최대 연봉 ';
COMMENT ON COLUMN FJ_Recruit.min_career IS 'min_career : 최소 경력 ';
COMMENT ON COLUMN FJ_Recruit.max_career IS 'max_career : 최대 경력 ';
COMMENT ON COLUMN FJ_Recruit.min_age IS 'min_age : 최소 나이 ';
COMMENT ON COLUMN FJ_Recruit.max_age IS 'max_age : 최대 나이 ';
COMMENT ON COLUMN FJ_Recruit.start_date IS 'start_date : 채용 시작일 ';
COMMENT ON COLUMN FJ_Recruit.end_date IS 'end_date : 채용 종료일 ';
COMMENT ON COLUMN FJ_Recruit.num_people IS 'num_people : 채용인원 ';
COMMENT ON COLUMN FJ_Recruit.readcount IS 'readcount : 조회수 ';
COMMENT ON COLUMN FJ_Recruit.reg_date IS 'reg_date : 작성일자 ';
COMMENT ON COLUMN FJ_Recruit.last_date IS 'last_date : 수정일자 ';
COMMENT ON TABLE FJ_Recruit_Log IS '새 테이블';
COMMENT ON COLUMN FJ_Recruit_Log.recruit_id IS 'recruit_id : 채용게시판 ID ';
COMMENT ON COLUMN FJ_Recruit_Log.email IS 'email : 이메일';
COMMENT ON COLUMN FJ_Recruit_Log.user_history_id IS 'user_history_id : 이력서 ID';
COMMENT ON COLUMN FJ_Recruit_Log.reg_date IS 'reg_date : 입사 지원일 ';
COMMENT ON TABLE FJ_School IS 'FJ_School';
COMMENT ON COLUMN FJ_School.school_id IS 'school_id : 학력관리 ID ';
COMMENT ON COLUMN FJ_School.user_history_id IS 'user_history_id : 이력서 ID';
COMMENT ON COLUMN FJ_School.school_name IS 'school_name : 학교 이름 ';
COMMENT ON COLUMN FJ_School.major IS 'major : 전공 ';
COMMENT ON COLUMN FJ_School.finish_flag IS 'finish_flag : 졸업 구분 

1- 졸업
2- 중퇴
3- 재학 ';
COMMENT ON COLUMN FJ_School.school_rank IS 'school_rank : 학교 구분 ';
COMMENT ON COLUMN FJ_School.reg_date IS 'reg_date : 작성일자 ';
COMMENT ON COLUMN FJ_School.last_date IS 'last_date : 수정일자';
COMMENT ON TABLE FJ_User IS 'FJ_User';
COMMENT ON COLUMN FJ_User.user_history_id IS 'user_history_id : 이력서 ID';
COMMENT ON COLUMN FJ_User.email IS 'email : 이메일';
COMMENT ON COLUMN FJ_User.eng_name IS 'eng_name : 영문이름 ';
COMMENT ON COLUMN FJ_User.kor_name IS 'kor_name : 한글이름 ';
COMMENT ON COLUMN FJ_User.tel IS 'tel : 전화번호 ';
COMMENT ON COLUMN FJ_User.birth IS 'birth : 생년월일 ';
COMMENT ON COLUMN FJ_User.address IS 'address : 주소 ';
COMMENT ON COLUMN FJ_User.army IS 'army : 병역사항 ';
COMMENT ON COLUMN FJ_User.license IS 'license : 자격증 ';
COMMENT ON COLUMN FJ_User.want_salary IS 'want_salary : 희망 연봉 ';
COMMENT ON COLUMN FJ_User.skill IS 'skill : 보유기술 ';
COMMENT ON COLUMN FJ_User.reg_date IS 'reg_date : 작성일자 ';
COMMENT ON COLUMN FJ_User.last_date IS 'last_date : 수정일자 ';
COMMENT ON COLUMN FJ_User.project IS 'project : 프로젝트 ';



