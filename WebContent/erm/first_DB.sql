
/* Drop Tables */

DROP TABLE FJ_Board_Free_Comment CASCADE CONSTRAINTS;
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
DROP TABLE FJ_JOIN CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE FJ_BOARD_Comment_seq;
DROP SEQUENCE FJ_BOARD_FREE_seq;
DROP SEQUENCE FJ_Career_seq;
DROP SEQUENCE FJ_Introduce_seq;
DROP SEQUENCE FJ_MESSAGE_seq;
DROP SEQUENCE FJ_Recruit_seq;
DROP SEQUENCE FJ_School_seq;
DROP SEQUENCE FJ_User_seq;




/* Create Sequences */

-- 댓글로 시퀀스
CREATE SEQUENCE FJ_BOARD_Comment_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999 START WITH 1;
-- 게시판  시퀀스
CREATE SEQUENCE FJ_BOARD_FREE_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999 START WITH 1;
-- (이력서)
-- 경력  시퀀스
CREATE SEQUENCE FJ_Career_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999 START WITH 1;
-- (이력서)자기소개서   시퀀스
CREATE SEQUENCE FJ_Introduce_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999 START WITH 1;
-- 메시지  시퀀스
CREATE SEQUENCE FJ_MESSAGE_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999 START WITH 1;
-- 채용게시판 시퀀스
CREATE SEQUENCE FJ_Recruit_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999 START WITH 1;
-- (이력서) 학력 시퀀스
CREATE SEQUENCE FJ_School_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999 START WITH 1;
-- 이력서 시퀀스
CREATE SEQUENCE FJ_User_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999 START WITH 1;



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
	content long NOT NULL,
	-- hstag : 해쉬태그
	hstag varchar2(50),
	-- recontent : 댓글내용 
	recontent varchar2(4000),
	-- category : 카테고리 
	category varchar2(50) NOT NULL,
	-- name : 글쓴이 이름
	-- 
	name varchar2(100),
	-- re_count : 리플의 수 
	re_count number NOT NULL,
	-- scrap_count : 스크랩 수 
	scrap_count number NOT NULL,
	-- recom_count : 좋아요 수 
	recom_count number NOT NULL,
	-- bad_count : 싫어요 수 
	bad_count number NOT NULL,
	-- read_count : 읽은 수 
	-- (실제 DB에는 number default 0, 으로 할 것임)
	read_count number,
	-- re_step : 게시글의 구분 
	re_step number NOT NULL,
	-- reg_date : 작성 날짜 
	reg_date date NOT NULL,
	PRIMARY KEY (board_num)
);


-- 새 테이블
CREATE TABLE FJ_Board_Free_Comment
(
	-- comment_board_num : 댓글 id
	comment_board_num number NOT NULL,
	-- board_num : 게시판 ID
	board_num number NOT NULL,
	-- email : 이메일
	email varchar2(50) NOT NULL,
	-- name : 작성자 이름
	name varchar2(100),
	-- reg_date : 작성날짜 
	reg_date date NOT NULL,
	-- recontent : 댓글내용 
	recontent long NOT NULL,
	-- re_step : 게시글의 구분 
	re_step number NOT NULL,
	-- recom_count : 좋아요 수 
	recom_count number NOT NULL,
	PRIMARY KEY (comment_board_num)
);


-- FJ_Career
CREATE TABLE FJ_Career
(
	-- career_id : 경력관리 ID 
	career_id varchar2(30) NOT NULL,
	-- user_history_id : 이력서 ID
	user_history_id number,
	-- career_sort
	career_sort varchar2(200),
	-- career_comp_name : 회사 이름 
	career_comp_name varchar2(200),
	-- career_start_date
	career_start_date varchar2(200),
	-- career_last_date : 수정일자 
	career_last_date varchar2(200),
	-- career_sort_date
	career_sort_date varchar2(200),
	-- career_position1 : 직책 
	career_position1 varchar2(300),
	-- career_position2
	career_position2 varchar2(300),
	-- career_salary
	career_salary number,
	-- career_kind
	career_kind varchar2(100),
	-- CAREER_CONTENT : 내용 
	CAREER_CONTENT long,
	-- career_resign
	career_resign varchar2(200),
	-- career_work
	career_work varchar2(200),
	-- career_department
	career_department varchar2(100),
	-- reg_date : 가입일자
	reg_date date,
	PRIMARY KEY (career_id)
);


-- FJ_Comp
CREATE TABLE FJ_Comp
(
	-- email : 이메일
	email varchar2(50) NOT NULL,
	-- address : 주소 
	address varchar2(200),
	-- content : 회사 소개
	content long,
	-- tel : 전화번호 
	tel varchar2(200),
	-- ceo : 대표자명 
	ceo varchar2(100),
	-- incharge : 담당자 이름
	incharge varchar2(100),
	-- comp_reg_date : 회사 창립일 
	comp_reg_date varchar2(100),
	-- year_sale : 연매출 
	year_sale varchar2(200),
	-- comp_type : 기업업종 
	comp_type varchar2(50),
	-- capital : 자본금 
	capital varchar2(50),
	-- zipcode : 우편번호 
	zipcode varchar2(20),
	-- comp_part : 기업구분 
	comp_part varchar2(20),
	-- like_count : 좋아요 수 
	like_count number,
	-- emp_count : 직원수 
	emp_count number,
	-- reg_date : 작성일자 
	reg_date date,
	-- last_date : 수정일자 
	last_date date,
	PRIMARY KEY (email)
);


-- FJ_Introduce
CREATE TABLE FJ_Introduce
(
	-- intro_id : 학력관리 ID 
	intro_id number NOT NULL,
	-- user_history_id : 이력서 ID
	user_history_id number,
	-- intro_title : 제목
	intro_title varchar2(500),
	-- intro_contents : 내용
	intro_contents long,
	-- intro_reg_date : 작성일자
	intro_reg_date date,
	-- intro_last_date : 수정일자  
	intro_last_date date,
	PRIMARY KEY (intro_id)
);


-- Fj_member
CREATE TABLE FJ_JOIN
(
	-- email : 이메일
	email varchar2(50) NOT NULL,
	-- passwd : 비밀번호
	passwd varchar2(50) NOT NULL,
	-- name : 닉네임 or 회사이름
	name varchar2(100) NOT NULL,
	-- member_flag : 회원구분 
	-- 
	-- 1 : 개인회원 
	-- 2 : 기업회원
	-- 3 : 관리자 
	member_flag number NOT NULL,
	-- reg_date : 가입일자
	reg_date date NOT NULL,
	PRIMARY KEY (email)
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


-- FJ_Message
CREATE TABLE FJ_Message
(
	-- message_num : 메시지 ID 
	message_num number NOT NULL,
	-- email : 이메일
	email varchar2(50),
	-- title : 제목
	title varchar2(200),
	-- content : 내용 
	content long,
	-- tag : 메시지 분류
	tag number,
	-- reg_date : 보낸날짜 
	reg_date date,
	-- read_yn : 읽음 유무 
	read_yn number,
	-- sender : 보내는 사람 이메일 
	sender varchar2(50),
	PRIMARY KEY (message_num)
);


-- FJ_Recruit
CREATE TABLE FJ_Recruit
(
	-- recruit_id : 채용게시판 ID 
	recruit_id number NOT NULL,
	-- email : 이메일
	email varchar2(50),
	-- title : 제목 
	title varchar2(200),
	-- content : 작성내용
	content long,
	-- name : 회사이름
	name varchar2(100),
	-- skill : 보유기술 
	skill varchar2(300),
	-- gender : 성별 
	gender varchar2(20),
	-- edu : 학력
	edu varchar2(200),
	-- work_type : 고용 형태 
	work_type varchar2(100),
	-- work_day : 근무요일 
	work_day varchar2(100),
	-- work_area : 근무지역
	-- 
	work_area varchar2(200),
	-- business_part : 담당업무 
	business_part varchar2(200),
	-- incharge : 담당자
	incharge varchar2(200),
	-- tel : 연락처
	tel varchar2(200),
	-- start_date : 채용 시작일 
	start_date varchar2(100),
	-- end_date : 채용 종료일 
	end_date varchar2(100),
	-- min_salary : 최소 연봉 
	min_salary number,
	-- max_salary : 최대 연봉 
	max_salary number,
	-- min_career : 최소 경력 
	min_career number,
	-- max_career : 최대 경력 
	max_career number,
	-- min_age : 최소 나이 
	min_age number,
	-- max_age : 최대 나이 
	max_age number,
	-- people_count : 채용인원 
	people_count number,
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
	recruit_id number NOT NULL,
	-- email : 이메일
	email varchar2(50) NOT NULL,
	-- user_history_id : 이력서 ID
	user_history_id number NOT NULL,
	-- reg_date : 입사 지원일 
	reg_date date NOT NULL
);


-- FJ_School
CREATE TABLE FJ_School
(
	-- school_id : 학력관리 ID 
	school_id number NOT NULL,
	-- user_history_id : 이력서 ID
	user_history_id number,
	-- school_name_high : 학교 이름 
	school_name_high varchar2(100),
	-- school_kind
	school_kind varchar2(100),
	-- school_major : 전공 
	school_major varchar2(100),
	-- school_name_college
	school_name_college varchar2(200),
	-- school_rank : 학교 구분 
	school_rank varchar2(100),
	-- highschool_kind
	highschool_kind varchar2(100),
	-- school_college1
	school_college1 varchar2(100),
	-- school_college2
	school_college2 varchar2(100),
	-- school_college_high
	school_college_high varchar2(200),
	-- school_start_date_high
	school_start_date_high varchar2(100),
	-- school_last_date_high
	school_last_date_high varchar2(200),
	-- school_start_date_college
	school_start_date_college varchar2(200),
	-- school_last_date_college
	school_last_date_college varchar2(200),
	-- school_ref
	school_ref number,
	-- reg_date : 가입일자
	reg_date date,
	-- last_date : 수정일자
	last_date date,
	PRIMARY KEY (school_id)
);


-- FJ_User
CREATE TABLE FJ_User
(
	-- user_history_id : 이력서 ID
	user_history_id number NOT NULL,
	-- email : 이메일
	email varchar2(50),
	-- resome_title
	resome_title varchar2(200),
	-- eng_name : 영문이름 
	eng_name varchar2(100),
	-- kor_name : 한글이름 
	kor_name varchar2(100),
	-- tel : 전화번호 
	tel varchar2(100),
	-- birth : 생년월일 
	birth varchar2(100),
	-- address : 주소 
	address varchar2(200),
	-- army : 병역사항 
	army varchar2(200),
	-- want_salary : 희망 연봉 
	want_salary number,
	-- license : 자격증 
	license varchar2(500),
	-- skill : 보유기술 
	skill varchar2(4000),
	-- photo
	photo varchar2(100),
	-- reg_date : 작성일자 
	reg_date date,
	-- project : 프로젝트 
	project varchar2(200),
	-- user_ref
	user_ref number,
	-- last_date
	last_date date,
	PRIMARY KEY (user_history_id)
);



/* Create Foreign Keys */

ALTER TABLE FJ_Board_Free_Comment
	ADD FOREIGN KEY (board_num)
	REFERENCES FJ_Board_Free (board_num)
;


ALTER TABLE FJ_Board_Free
	ADD FOREIGN KEY (email)
	REFERENCES FJ_JOIN (email)
;


ALTER TABLE FJ_Comp
	ADD FOREIGN KEY (email)
	REFERENCES FJ_JOIN (email)
;


ALTER TABLE FJ_Log
	ADD FOREIGN KEY (email)
	REFERENCES FJ_JOIN (email)
;


ALTER TABLE FJ_Message
	ADD FOREIGN KEY (email)
	REFERENCES FJ_JOIN (email)
;


ALTER TABLE FJ_Recruit
	ADD FOREIGN KEY (email)
	REFERENCES FJ_JOIN (email)
;


ALTER TABLE FJ_User
	ADD FOREIGN KEY (email)
	REFERENCES FJ_JOIN (email)
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
COMMENT ON COLUMN FJ_Board_Free.hstag IS 'hstag : 해쉬태그';
COMMENT ON COLUMN FJ_Board_Free.recontent IS 'recontent : 댓글내용 ';
COMMENT ON COLUMN FJ_Board_Free.category IS 'category : 카테고리 ';
COMMENT ON COLUMN FJ_Board_Free.name IS 'name : 글쓴이 이름
';
COMMENT ON COLUMN FJ_Board_Free.re_count IS 're_count : 리플의 수 ';
COMMENT ON COLUMN FJ_Board_Free.scrap_count IS 'scrap_count : 스크랩 수 ';
COMMENT ON COLUMN FJ_Board_Free.recom_count IS 'recom_count : 좋아요 수 ';
COMMENT ON COLUMN FJ_Board_Free.bad_count IS 'bad_count : 싫어요 수 ';
COMMENT ON COLUMN FJ_Board_Free.read_count IS 'read_count : 읽은 수 
(실제 DB에는 number default 0, 으로 할 것임)';
COMMENT ON COLUMN FJ_Board_Free.re_step IS 're_step : 게시글의 구분 ';
COMMENT ON COLUMN FJ_Board_Free.reg_date IS 'reg_date : 작성 날짜 ';
COMMENT ON TABLE FJ_Board_Free_Comment IS '새 테이블';
COMMENT ON COLUMN FJ_Board_Free_Comment.comment_board_num IS 'comment_board_num : 댓글 id';
COMMENT ON COLUMN FJ_Board_Free_Comment.board_num IS 'board_num : 게시판 ID';
COMMENT ON COLUMN FJ_Board_Free_Comment.email IS 'email : 이메일';
COMMENT ON COLUMN FJ_Board_Free_Comment.name IS 'name : 작성자 이름';
COMMENT ON COLUMN FJ_Board_Free_Comment.reg_date IS 'reg_date : 작성날짜 ';
COMMENT ON COLUMN FJ_Board_Free_Comment.recontent IS 'recontent : 댓글내용 ';
COMMENT ON COLUMN FJ_Board_Free_Comment.re_step IS 're_step : 게시글의 구분 ';
COMMENT ON COLUMN FJ_Board_Free_Comment.recom_count IS 'recom_count : 좋아요 수 ';
COMMENT ON TABLE FJ_Career IS 'FJ_Career';
COMMENT ON COLUMN FJ_Career.career_id IS 'career_id : 경력관리 ID ';
COMMENT ON COLUMN FJ_Career.user_history_id IS 'user_history_id : 이력서 ID';
COMMENT ON COLUMN FJ_Career.career_sort IS 'career_sort';
COMMENT ON COLUMN FJ_Career.career_comp_name IS 'career_comp_name : 회사 이름 ';
COMMENT ON COLUMN FJ_Career.career_start_date IS 'career_start_date';
COMMENT ON COLUMN FJ_Career.career_last_date IS 'career_last_date : 수정일자 ';
COMMENT ON COLUMN FJ_Career.career_sort_date IS 'career_sort_date';
COMMENT ON COLUMN FJ_Career.career_position1 IS 'career_position1 : 직책 ';
COMMENT ON COLUMN FJ_Career.career_position2 IS 'career_position2';
COMMENT ON COLUMN FJ_Career.career_salary IS 'career_salary';
COMMENT ON COLUMN FJ_Career.career_kind IS 'career_kind';
COMMENT ON COLUMN FJ_Career.CAREER_CONTENT IS 'CAREER_CONTENT : 내용 ';
COMMENT ON COLUMN FJ_Career.career_resign IS 'career_resign';
COMMENT ON COLUMN FJ_Career.career_work IS 'career_work';
COMMENT ON COLUMN FJ_Career.career_department IS 'career_department';
COMMENT ON COLUMN FJ_Career.reg_date IS 'reg_date : 가입일자';
COMMENT ON TABLE FJ_Comp IS 'FJ_Comp';
COMMENT ON COLUMN FJ_Comp.email IS 'email : 이메일';
COMMENT ON COLUMN FJ_Comp.address IS 'address : 주소 ';
COMMENT ON COLUMN FJ_Comp.content IS 'content : 회사 소개';
COMMENT ON COLUMN FJ_Comp.tel IS 'tel : 전화번호 ';
COMMENT ON COLUMN FJ_Comp.ceo IS 'ceo : 대표자명 ';
COMMENT ON COLUMN FJ_Comp.incharge IS 'incharge : 담당자 이름';
COMMENT ON COLUMN FJ_Comp.comp_reg_date IS 'comp_reg_date : 회사 창립일 ';
COMMENT ON COLUMN FJ_Comp.year_sale IS 'year_sale : 연매출 ';
COMMENT ON COLUMN FJ_Comp.comp_type IS 'comp_type : 기업업종 ';
COMMENT ON COLUMN FJ_Comp.capital IS 'capital : 자본금 ';
COMMENT ON COLUMN FJ_Comp.zipcode IS 'zipcode : 우편번호 ';
COMMENT ON COLUMN FJ_Comp.comp_part IS 'comp_part : 기업구분 ';
COMMENT ON COLUMN FJ_Comp.like_count IS 'like_count : 좋아요 수 ';
COMMENT ON COLUMN FJ_Comp.emp_count IS 'emp_count : 직원수 ';
COMMENT ON COLUMN FJ_Comp.reg_date IS 'reg_date : 작성일자 ';
COMMENT ON COLUMN FJ_Comp.last_date IS 'last_date : 수정일자 ';
COMMENT ON TABLE FJ_Introduce IS 'FJ_Introduce';
COMMENT ON COLUMN FJ_Introduce.intro_id IS 'intro_id : 학력관리 ID ';
COMMENT ON COLUMN FJ_Introduce.user_history_id IS 'user_history_id : 이력서 ID';
COMMENT ON COLUMN FJ_Introduce.intro_title IS 'intro_title : 제목';
COMMENT ON COLUMN FJ_Introduce.intro_contents IS 'intro_contents : 내용';
COMMENT ON COLUMN FJ_Introduce.intro_reg_date IS 'intro_reg_date : 작성일자';
COMMENT ON COLUMN FJ_Introduce.intro_last_date IS 'intro_last_date : 수정일자  ';
COMMENT ON TABLE FJ_JOIN IS 'Fj_member';
COMMENT ON COLUMN FJ_JOIN.email IS 'email : 이메일';
COMMENT ON COLUMN FJ_JOIN.passwd IS 'passwd : 비밀번호';
COMMENT ON COLUMN FJ_JOIN.name IS 'name : 닉네임 or 회사이름';
COMMENT ON COLUMN FJ_JOIN.member_flag IS 'member_flag : 회원구분 

1 : 개인회원 
2 : 기업회원
3 : 관리자 ';
COMMENT ON COLUMN FJ_JOIN.reg_date IS 'reg_date : 가입일자';
COMMENT ON TABLE FJ_Log IS 'FJ_Log';
COMMENT ON COLUMN FJ_Log.email IS 'email : 이메일';
COMMENT ON COLUMN FJ_Log.page_id IS 'page_id : 페이지 ID ';
COMMENT ON COLUMN FJ_Log.reg_date IS 'reg_date : 작성일자 ';
COMMENT ON COLUMN FJ_Log.last_date IS 'last_date : 수정일자 ';
COMMENT ON TABLE FJ_Message IS 'FJ_Message';
COMMENT ON COLUMN FJ_Message.message_num IS 'message_num : 메시지 ID ';
COMMENT ON COLUMN FJ_Message.email IS 'email : 이메일';
COMMENT ON COLUMN FJ_Message.title IS 'title : 제목';
COMMENT ON COLUMN FJ_Message.content IS 'content : 내용 ';
COMMENT ON COLUMN FJ_Message.tag IS 'tag : 메시지 분류';
COMMENT ON COLUMN FJ_Message.reg_date IS 'reg_date : 보낸날짜 ';
COMMENT ON COLUMN FJ_Message.read_yn IS 'read_yn : 읽음 유무 ';
COMMENT ON COLUMN FJ_Message.sender IS 'sender : 보내는 사람 이메일 ';
COMMENT ON TABLE FJ_Recruit IS 'FJ_Recruit';
COMMENT ON COLUMN FJ_Recruit.recruit_id IS 'recruit_id : 채용게시판 ID ';
COMMENT ON COLUMN FJ_Recruit.email IS 'email : 이메일';
COMMENT ON COLUMN FJ_Recruit.title IS 'title : 제목 ';
COMMENT ON COLUMN FJ_Recruit.content IS 'content : 작성내용';
COMMENT ON COLUMN FJ_Recruit.name IS 'name : 회사이름';
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
COMMENT ON COLUMN FJ_Recruit.start_date IS 'start_date : 채용 시작일 ';
COMMENT ON COLUMN FJ_Recruit.end_date IS 'end_date : 채용 종료일 ';
COMMENT ON COLUMN FJ_Recruit.min_salary IS 'min_salary : 최소 연봉 ';
COMMENT ON COLUMN FJ_Recruit.max_salary IS 'max_salary : 최대 연봉 ';
COMMENT ON COLUMN FJ_Recruit.min_career IS 'min_career : 최소 경력 ';
COMMENT ON COLUMN FJ_Recruit.max_career IS 'max_career : 최대 경력 ';
COMMENT ON COLUMN FJ_Recruit.min_age IS 'min_age : 최소 나이 ';
COMMENT ON COLUMN FJ_Recruit.max_age IS 'max_age : 최대 나이 ';
COMMENT ON COLUMN FJ_Recruit.people_count IS 'people_count : 채용인원 ';
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
COMMENT ON COLUMN FJ_School.school_name_high IS 'school_name_high : 학교 이름 ';
COMMENT ON COLUMN FJ_School.school_kind IS 'school_kind';
COMMENT ON COLUMN FJ_School.school_major IS 'school_major : 전공 ';
COMMENT ON COLUMN FJ_School.school_name_college IS 'school_name_college';
COMMENT ON COLUMN FJ_School.school_rank IS 'school_rank : 학교 구분 ';
COMMENT ON COLUMN FJ_School.highschool_kind IS 'highschool_kind';
COMMENT ON COLUMN FJ_School.school_college1 IS 'school_college1';
COMMENT ON COLUMN FJ_School.school_college2 IS 'school_college2';
COMMENT ON COLUMN FJ_School.school_college_high IS 'school_college_high';
COMMENT ON COLUMN FJ_School.school_start_date_high IS 'school_start_date_high';
COMMENT ON COLUMN FJ_School.school_last_date_high IS 'school_last_date_high';
COMMENT ON COLUMN FJ_School.school_start_date_college IS 'school_start_date_college';
COMMENT ON COLUMN FJ_School.school_last_date_college IS 'school_last_date_college';
COMMENT ON COLUMN FJ_School.school_ref IS 'school_ref';
COMMENT ON COLUMN FJ_School.reg_date IS 'reg_date : 가입일자';
COMMENT ON COLUMN FJ_School.last_date IS 'last_date : 수정일자';
COMMENT ON TABLE FJ_User IS 'FJ_User';
COMMENT ON COLUMN FJ_User.user_history_id IS 'user_history_id : 이력서 ID';
COMMENT ON COLUMN FJ_User.email IS 'email : 이메일';
COMMENT ON COLUMN FJ_User.resome_title IS 'resome_title';
COMMENT ON COLUMN FJ_User.eng_name IS 'eng_name : 영문이름 ';
COMMENT ON COLUMN FJ_User.kor_name IS 'kor_name : 한글이름 ';
COMMENT ON COLUMN FJ_User.tel IS 'tel : 전화번호 ';
COMMENT ON COLUMN FJ_User.birth IS 'birth : 생년월일 ';
COMMENT ON COLUMN FJ_User.address IS 'address : 주소 ';
COMMENT ON COLUMN FJ_User.army IS 'army : 병역사항 ';
COMMENT ON COLUMN FJ_User.want_salary IS 'want_salary : 희망 연봉 ';
COMMENT ON COLUMN FJ_User.license IS 'license : 자격증 ';
COMMENT ON COLUMN FJ_User.skill IS 'skill : 보유기술 ';
COMMENT ON COLUMN FJ_User.photo IS 'photo';
COMMENT ON COLUMN FJ_User.reg_date IS 'reg_date : 작성일자 ';
COMMENT ON COLUMN FJ_User.project IS 'project : 프로젝트 ';
COMMENT ON COLUMN FJ_User.user_ref IS 'user_ref';
COMMENT ON COLUMN FJ_User.last_date IS 'last_date';



