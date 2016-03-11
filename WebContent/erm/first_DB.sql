
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

-- ��۷� ������
CREATE SEQUENCE FJ_BOARD_Comment_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999 START WITH 1 NOCYCLE NOCACHE;
-- �Խ���  ������
CREATE SEQUENCE FJ_BOARD_FREE_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999 START WITH 1 NOCYCLE NOCACHE;
-- (�̷¼�)
-- ���  ������
CREATE SEQUENCE FJ_Career_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999 START WITH 1 NOCYCLE NOCACHE;
-- (�̷¼�)�ڱ�Ұ���   ������
CREATE SEQUENCE FJ_Introduce_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999 START WITH 1 NOCYCLE NOCACHE;
-- �޽���  ������
CREATE SEQUENCE FJ_MESSAGE_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999 START WITH 1 NOCYCLE NOCACHE;
-- ä��Խ��� ������
CREATE SEQUENCE FJ_Recruit_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999 START WITH 1 NOCYCLE NOCACHE;
-- (�̷¼�) �з� ������
CREATE SEQUENCE FJ_School_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999 START WITH 1 NOCYCLE NOCACHE;
-- �̷¼� ������
CREATE SEQUENCE FJ_User_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999 START WITH 1 NOCYCLE NOCACHE;



/* Create Tables */

-- FJ_Board_Free
CREATE TABLE FJ_Board_Free
(
	-- board_num : �Խ��� ID
	board_num number NOT NULL,
	-- email : �̸���
	email varchar2(50) NOT NULL,
	-- subject : ���� 
	subject varchar2(100) NOT NULL,
	-- content : ���� 
	content long NOT NULL,
	-- hstag : �ؽ��±�
	hstag varchar2(50),
	-- recontent : ��۳��� 
	recontent varchar2(4000),
	-- category : ī�װ� 
	category varchar2(50) NOT NULL,
	-- name : �۾��� �̸�
	-- 
	name varchar2(100),
	-- re_count : ������ �� 
	re_count number NOT NULL,
	-- scrap_count : ��ũ�� �� 
	scrap_count number NOT NULL,
	-- recom_count : ���ƿ� �� 
	recom_count number NOT NULL,
	-- bad_count : �Ⱦ�� �� 
	bad_count number NOT NULL,
	-- read_count : ���� �� 
	-- (���� DB���� number default 0, ���� �� ����)
	read_count number,
	-- re_step : �Խñ��� ���� 
	re_step number NOT NULL,
	-- reg_date : �ۼ� ��¥ 
	reg_date date NOT NULL,
	PRIMARY KEY (board_num)
);


-- �� ���̺�
CREATE TABLE FJ_Board_Free_Comment
(
	-- comment_board_num : ��� id
	comment_board_num number NOT NULL,
	-- board_num : �Խ��� ID
	board_num number NOT NULL,
	-- email : �̸���
	email varchar2(50) NOT NULL,
	-- name : �ۼ��� �̸�
	name varchar2(100),
	-- reg_date : �ۼ���¥ 
	reg_date date NOT NULL,
	-- recontent : ��۳��� 
	recontent long NOT NULL,
	-- re_step : �Խñ��� ���� 
	re_step number NOT NULL,
	-- recom_count : ���ƿ� �� 
	recom_count number NOT NULL,
	PRIMARY KEY (comment_board_num)
);


-- FJ_Career
CREATE TABLE FJ_Career
(
	-- career_id : ��°��� ID 
	career_id varchar2(30) NOT NULL,
	-- user_history_id : �̷¼� ID
	user_history_id number,
	-- career_sort
	career_sort varchar2(200),
	-- career_comp_name : ȸ�� �̸� 
	career_comp_name varchar2(200),
	-- career_start_date
	career_start_date varchar2(200),
	-- career_last_date : �������� 
	career_last_date varchar2(200),
	-- career_sort_date
	career_sort_date varchar2(200),
	-- career_position1 : ��å 
	career_position1 varchar2(300),
	-- career_position2
	career_position2 varchar2(300),
	-- career_salary
	career_salary number,
	-- career_kind
	career_kind varchar2(100),
	-- CAREER_CONTENT : ���� 
	CAREER_CONTENT long,
	-- career_resign
	career_resign varchar2(200),
	-- career_work
	career_work varchar2(200),
	-- career_department
	career_department varchar2(100),
	-- reg_date : ��������
	reg_date date,
	PRIMARY KEY (career_id)
);


-- FJ_Comp
CREATE TABLE FJ_Comp
(
	-- email : �̸���
	email varchar2(50) NOT NULL,
	-- address : �ּ� 
	address varchar2(200),
	-- content : ȸ�� �Ұ�
	content long,
	-- tel : ��ȭ��ȣ 
	tel varchar2(200),
	-- ceo : ��ǥ�ڸ� 
	ceo varchar2(100),
	-- incharge : ����� �̸�
	incharge varchar2(100),
	-- comp_reg_date : ȸ�� â���� 
	comp_reg_date varchar2(100),
	-- year_sale : ������ 
	year_sale varchar2(200),
	-- comp_type : ������� 
	comp_type varchar2(50),
	-- capital : �ں��� 
	capital varchar2(50),
	-- zipcode : �����ȣ 
	zipcode varchar2(20),
	-- comp_part : ������� 
	comp_part varchar2(20),
	-- like_count : ���ƿ� �� 
	like_count number,
	-- emp_count : ������ 
	emp_count number,
	-- reg_date : �ۼ����� 
	reg_date date,
	-- last_date : �������� 
	last_date date,
	PRIMARY KEY (email)
);


-- FJ_Introduce
CREATE TABLE FJ_Introduce
(
	-- intro_id : �з°��� ID 
	intro_id number NOT NULL,
	-- user_history_id : �̷¼� ID
	user_history_id number,
	-- intro_title : ����
	intro_title varchar2(500),
	-- intro_contents : ����
	intro_contents long,
	-- intro_reg_date : �ۼ�����
	intro_reg_date date,
	-- intro_last_date : ��������  
	intro_last_date date,
	PRIMARY KEY (intro_id)
);


-- Fj_member
CREATE TABLE FJ_JOIN
(
	-- email : �̸���
	email varchar2(50) NOT NULL,
	-- passwd : ��й�ȣ
	passwd varchar2(50) NOT NULL,
	-- name : �г��� or ȸ���̸�
	name varchar2(100) NOT NULL,
	-- member_flag : ȸ������ 
	-- 
	-- 1 : ����ȸ�� 
	-- 2 : ���ȸ��
	-- 3 : ������ 
	member_flag number NOT NULL,
	-- reg_date : ��������
	reg_date date NOT NULL,
	PRIMARY KEY (email)
);


-- FJ_Log
CREATE TABLE FJ_Log
(
	-- email : �̸���
	email varchar2(50) NOT NULL,
	-- page_id : ������ ID 
	page_id varchar2(30) NOT NULL,
	-- reg_date : �ۼ����� 
	reg_date date NOT NULL,
	-- last_date : �������� 
	last_date date NOT NULL
);


-- FJ_Message
CREATE TABLE FJ_Message
(
	-- message_num : �޽��� ID 
	message_num number NOT NULL,
	-- email : �̸���
	email varchar2(50),
	-- title : ����
	title varchar2(200),
	-- content : ���� 
	content long,
	-- tag : �޽��� �з�
	tag number,
	-- reg_date : ������¥ 
	reg_date date,
	-- read_yn : ���� ���� 
	read_yn number,
	-- sender : ������ ��� �̸��� 
	sender varchar2(50),
	PRIMARY KEY (message_num)
);


-- FJ_Recruit
CREATE TABLE FJ_Recruit
(
	-- recruit_id : ä��Խ��� ID 
	recruit_id number NOT NULL,
	-- email : �̸���
	email varchar2(50),
	-- title : ���� 
	title varchar2(200),
	-- content : �ۼ�����
	content long,
	-- name : ȸ���̸�
	name varchar2(100),
	-- skill : ������� 
	skill varchar2(300),
	-- gender : ���� 
	gender varchar2(20),
	-- edu : �з�
	edu varchar2(200),
	-- work_type : ��� ���� 
	work_type varchar2(100),
	-- work_day : �ٹ����� 
	work_day varchar2(100),
	-- work_area : �ٹ�����
	-- 
	work_area varchar2(200),
	-- business_part : ������ 
	business_part varchar2(200),
	-- incharge : �����
	incharge varchar2(200),
	-- tel : ����ó
	tel varchar2(200),
	-- start_date : ä�� ������ 
	start_date varchar2(100),
	-- end_date : ä�� ������ 
	end_date varchar2(100),
	-- min_salary : �ּ� ���� 
	min_salary number,
	-- max_salary : �ִ� ���� 
	max_salary number,
	-- min_career : �ּ� ��� 
	min_career number,
	-- max_career : �ִ� ��� 
	max_career number,
	-- min_age : �ּ� ���� 
	min_age number,
	-- max_age : �ִ� ���� 
	max_age number,
	-- people_count : ä���ο� 
	people_count number,
	-- readcount : ��ȸ�� 
	readcount number,
	-- reg_date : �ۼ����� 
	reg_date date,
	-- last_date : �������� 
	last_date date,
	PRIMARY KEY (recruit_id)
);


-- �� ���̺�
CREATE TABLE FJ_Recruit_Log
(
	-- recruit_id : ä��Խ��� ID 
	recruit_id number NOT NULL,
	-- email : �̸���
	email varchar2(50) NOT NULL,
	-- user_history_id : �̷¼� ID
	user_history_id number NOT NULL,
	-- reg_date : �Ի� ������ 
	reg_date date NOT NULL
);


-- FJ_School
CREATE TABLE FJ_School
(
	-- school_id : �з°��� ID 
	school_id number NOT NULL,
	-- user_history_id : �̷¼� ID
	user_history_id number,
	-- school_name_high : �б� �̸� 
	school_name_high varchar2(100),
	-- school_kind
	school_kind varchar2(100),
	-- school_major : ���� 
	school_major varchar2(100),
	-- school_name_college
	school_name_college varchar2(200),
	-- school_rank : �б� ���� 
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
	-- reg_date : ��������
	reg_date date,
	-- last_date : ��������
	last_date date,
	PRIMARY KEY (school_id)
);


-- FJ_User
CREATE TABLE FJ_User
(
	-- user_history_id : �̷¼� ID
	user_history_id number NOT NULL,
	-- email : �̸���
	email varchar2(50),
	-- resome_title
	resome_title varchar2(200),
	-- eng_name : �����̸� 
	eng_name varchar2(100) NOT NULL,
	-- kor_name : �ѱ��̸� 
	kor_name varchar2(100) NOT NULL,
	-- tel : ��ȭ��ȣ 
	tel varchar2(100) NOT NULL,
	-- birth : ������� 
	birth varchar2(100) NOT NULL,
	-- address : �ּ� 
	address varchar2(200) NOT NULL,
	-- army : �������� 
	army varchar2(200) NOT NULL,
	-- want_salary : ��� ���� 
	want_salary number NOT NULL,
	-- license : �ڰ��� 
	license varchar2(500) NOT NULL,
	-- skill : ������� 
	skill varchar2(4000) NOT NULL,
	-- photo
	photo varchar2(100),
	-- reg_date : �ۼ����� 
	reg_date date NOT NULL,
	-- project : ������Ʈ 
	project varchar2(200) NOT NULL,
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
COMMENT ON COLUMN FJ_Board_Free.board_num IS 'board_num : �Խ��� ID';
COMMENT ON COLUMN FJ_Board_Free.email IS 'email : �̸���';
COMMENT ON COLUMN FJ_Board_Free.subject IS 'subject : ���� ';
COMMENT ON COLUMN FJ_Board_Free.content IS 'content : ���� ';
COMMENT ON COLUMN FJ_Board_Free.hstag IS 'hstag : �ؽ��±�';
COMMENT ON COLUMN FJ_Board_Free.recontent IS 'recontent : ��۳��� ';
COMMENT ON COLUMN FJ_Board_Free.category IS 'category : ī�װ� ';
COMMENT ON COLUMN FJ_Board_Free.name IS 'name : �۾��� �̸�
';
COMMENT ON COLUMN FJ_Board_Free.re_count IS 're_count : ������ �� ';
COMMENT ON COLUMN FJ_Board_Free.scrap_count IS 'scrap_count : ��ũ�� �� ';
COMMENT ON COLUMN FJ_Board_Free.recom_count IS 'recom_count : ���ƿ� �� ';
COMMENT ON COLUMN FJ_Board_Free.bad_count IS 'bad_count : �Ⱦ�� �� ';
COMMENT ON COLUMN FJ_Board_Free.read_count IS 'read_count : ���� �� 
(���� DB���� number default 0, ���� �� ����)';
COMMENT ON COLUMN FJ_Board_Free.re_step IS 're_step : �Խñ��� ���� ';
COMMENT ON COLUMN FJ_Board_Free.reg_date IS 'reg_date : �ۼ� ��¥ ';
COMMENT ON TABLE FJ_Board_Free_Comment IS '�� ���̺�';
COMMENT ON COLUMN FJ_Board_Free_Comment.comment_board_num IS 'comment_board_num : ��� id';
COMMENT ON COLUMN FJ_Board_Free_Comment.board_num IS 'board_num : �Խ��� ID';
COMMENT ON COLUMN FJ_Board_Free_Comment.email IS 'email : �̸���';
COMMENT ON COLUMN FJ_Board_Free_Comment.name IS 'name : �ۼ��� �̸�';
COMMENT ON COLUMN FJ_Board_Free_Comment.reg_date IS 'reg_date : �ۼ���¥ ';
COMMENT ON COLUMN FJ_Board_Free_Comment.recontent IS 'recontent : ��۳��� ';
COMMENT ON COLUMN FJ_Board_Free_Comment.re_step IS 're_step : �Խñ��� ���� ';
COMMENT ON COLUMN FJ_Board_Free_Comment.recom_count IS 'recom_count : ���ƿ� �� ';
COMMENT ON TABLE FJ_Career IS 'FJ_Career';
COMMENT ON COLUMN FJ_Career.career_id IS 'career_id : ��°��� ID ';
COMMENT ON COLUMN FJ_Career.user_history_id IS 'user_history_id : �̷¼� ID';
COMMENT ON COLUMN FJ_Career.career_sort IS 'career_sort';
COMMENT ON COLUMN FJ_Career.career_comp_name IS 'career_comp_name : ȸ�� �̸� ';
COMMENT ON COLUMN FJ_Career.career_start_date IS 'career_start_date';
COMMENT ON COLUMN FJ_Career.career_last_date IS 'career_last_date : �������� ';
COMMENT ON COLUMN FJ_Career.career_sort_date IS 'career_sort_date';
COMMENT ON COLUMN FJ_Career.career_position1 IS 'career_position1 : ��å ';
COMMENT ON COLUMN FJ_Career.career_position2 IS 'career_position2';
COMMENT ON COLUMN FJ_Career.career_salary IS 'career_salary';
COMMENT ON COLUMN FJ_Career.career_kind IS 'career_kind';
COMMENT ON COLUMN FJ_Career.CAREER_CONTENT IS 'CAREER_CONTENT : ���� ';
COMMENT ON COLUMN FJ_Career.career_resign IS 'career_resign';
COMMENT ON COLUMN FJ_Career.career_work IS 'career_work';
COMMENT ON COLUMN FJ_Career.career_department IS 'career_department';
COMMENT ON COLUMN FJ_Career.reg_date IS 'reg_date : ��������';
COMMENT ON TABLE FJ_Comp IS 'FJ_Comp';
COMMENT ON COLUMN FJ_Comp.email IS 'email : �̸���';
COMMENT ON COLUMN FJ_Comp.address IS 'address : �ּ� ';
COMMENT ON COLUMN FJ_Comp.content IS 'content : ȸ�� �Ұ�';
COMMENT ON COLUMN FJ_Comp.tel IS 'tel : ��ȭ��ȣ ';
COMMENT ON COLUMN FJ_Comp.ceo IS 'ceo : ��ǥ�ڸ� ';
COMMENT ON COLUMN FJ_Comp.incharge IS 'incharge : ����� �̸�';
COMMENT ON COLUMN FJ_Comp.comp_reg_date IS 'comp_reg_date : ȸ�� â���� ';
COMMENT ON COLUMN FJ_Comp.year_sale IS 'year_sale : ������ ';
COMMENT ON COLUMN FJ_Comp.comp_type IS 'comp_type : ������� ';
COMMENT ON COLUMN FJ_Comp.capital IS 'capital : �ں��� ';
COMMENT ON COLUMN FJ_Comp.zipcode IS 'zipcode : �����ȣ ';
COMMENT ON COLUMN FJ_Comp.comp_part IS 'comp_part : ������� ';
COMMENT ON COLUMN FJ_Comp.like_count IS 'like_count : ���ƿ� �� ';
COMMENT ON COLUMN FJ_Comp.emp_count IS 'emp_count : ������ ';
COMMENT ON COLUMN FJ_Comp.reg_date IS 'reg_date : �ۼ����� ';
COMMENT ON COLUMN FJ_Comp.last_date IS 'last_date : �������� ';
COMMENT ON TABLE FJ_Introduce IS 'FJ_Introduce';
COMMENT ON COLUMN FJ_Introduce.intro_id IS 'intro_id : �з°��� ID ';
COMMENT ON COLUMN FJ_Introduce.user_history_id IS 'user_history_id : �̷¼� ID';
COMMENT ON COLUMN FJ_Introduce.intro_title IS 'intro_title : ����';
COMMENT ON COLUMN FJ_Introduce.intro_contents IS 'intro_contents : ����';
COMMENT ON COLUMN FJ_Introduce.intro_reg_date IS 'intro_reg_date : �ۼ�����';
COMMENT ON COLUMN FJ_Introduce.intro_last_date IS 'intro_last_date : ��������  ';
COMMENT ON TABLE FJ_JOIN IS 'Fj_member';
COMMENT ON COLUMN FJ_JOIN.email IS 'email : �̸���';
COMMENT ON COLUMN FJ_JOIN.passwd IS 'passwd : ��й�ȣ';
COMMENT ON COLUMN FJ_JOIN.name IS 'name : �г��� or ȸ���̸�';
COMMENT ON COLUMN FJ_JOIN.member_flag IS 'member_flag : ȸ������ 

1 : ����ȸ�� 
2 : ���ȸ��
3 : ������ ';
COMMENT ON COLUMN FJ_JOIN.reg_date IS 'reg_date : ��������';
COMMENT ON TABLE FJ_Log IS 'FJ_Log';
COMMENT ON COLUMN FJ_Log.email IS 'email : �̸���';
COMMENT ON COLUMN FJ_Log.page_id IS 'page_id : ������ ID ';
COMMENT ON COLUMN FJ_Log.reg_date IS 'reg_date : �ۼ����� ';
COMMENT ON COLUMN FJ_Log.last_date IS 'last_date : �������� ';
COMMENT ON TABLE FJ_Message IS 'FJ_Message';
COMMENT ON COLUMN FJ_Message.message_num IS 'message_num : �޽��� ID ';
COMMENT ON COLUMN FJ_Message.email IS 'email : �̸���';
COMMENT ON COLUMN FJ_Message.title IS 'title : ����';
COMMENT ON COLUMN FJ_Message.content IS 'content : ���� ';
COMMENT ON COLUMN FJ_Message.tag IS 'tag : �޽��� �з�';
COMMENT ON COLUMN FJ_Message.reg_date IS 'reg_date : ������¥ ';
COMMENT ON COLUMN FJ_Message.read_yn IS 'read_yn : ���� ���� ';
COMMENT ON COLUMN FJ_Message.sender IS 'sender : ������ ��� �̸��� ';
COMMENT ON TABLE FJ_Recruit IS 'FJ_Recruit';
COMMENT ON COLUMN FJ_Recruit.recruit_id IS 'recruit_id : ä��Խ��� ID ';
COMMENT ON COLUMN FJ_Recruit.email IS 'email : �̸���';
COMMENT ON COLUMN FJ_Recruit.title IS 'title : ���� ';
COMMENT ON COLUMN FJ_Recruit.content IS 'content : �ۼ�����';
COMMENT ON COLUMN FJ_Recruit.name IS 'name : ȸ���̸�';
COMMENT ON COLUMN FJ_Recruit.skill IS 'skill : ������� ';
COMMENT ON COLUMN FJ_Recruit.gender IS 'gender : ���� ';
COMMENT ON COLUMN FJ_Recruit.edu IS 'edu : �з�';
COMMENT ON COLUMN FJ_Recruit.work_type IS 'work_type : ��� ���� ';
COMMENT ON COLUMN FJ_Recruit.work_day IS 'work_day : �ٹ����� ';
COMMENT ON COLUMN FJ_Recruit.work_area IS 'work_area : �ٹ�����
';
COMMENT ON COLUMN FJ_Recruit.business_part IS 'business_part : ������ ';
COMMENT ON COLUMN FJ_Recruit.incharge IS 'incharge : �����';
COMMENT ON COLUMN FJ_Recruit.tel IS 'tel : ����ó';
COMMENT ON COLUMN FJ_Recruit.start_date IS 'start_date : ä�� ������ ';
COMMENT ON COLUMN FJ_Recruit.end_date IS 'end_date : ä�� ������ ';
COMMENT ON COLUMN FJ_Recruit.min_salary IS 'min_salary : �ּ� ���� ';
COMMENT ON COLUMN FJ_Recruit.max_salary IS 'max_salary : �ִ� ���� ';
COMMENT ON COLUMN FJ_Recruit.min_career IS 'min_career : �ּ� ��� ';
COMMENT ON COLUMN FJ_Recruit.max_career IS 'max_career : �ִ� ��� ';
COMMENT ON COLUMN FJ_Recruit.min_age IS 'min_age : �ּ� ���� ';
COMMENT ON COLUMN FJ_Recruit.max_age IS 'max_age : �ִ� ���� ';
COMMENT ON COLUMN FJ_Recruit.people_count IS 'people_count : ä���ο� ';
COMMENT ON COLUMN FJ_Recruit.readcount IS 'readcount : ��ȸ�� ';
COMMENT ON COLUMN FJ_Recruit.reg_date IS 'reg_date : �ۼ����� ';
COMMENT ON COLUMN FJ_Recruit.last_date IS 'last_date : �������� ';
COMMENT ON TABLE FJ_Recruit_Log IS '�� ���̺�';
COMMENT ON COLUMN FJ_Recruit_Log.recruit_id IS 'recruit_id : ä��Խ��� ID ';
COMMENT ON COLUMN FJ_Recruit_Log.email IS 'email : �̸���';
COMMENT ON COLUMN FJ_Recruit_Log.user_history_id IS 'user_history_id : �̷¼� ID';
COMMENT ON COLUMN FJ_Recruit_Log.reg_date IS 'reg_date : �Ի� ������ ';
COMMENT ON TABLE FJ_School IS 'FJ_School';
COMMENT ON COLUMN FJ_School.school_id IS 'school_id : �з°��� ID ';
COMMENT ON COLUMN FJ_School.user_history_id IS 'user_history_id : �̷¼� ID';
COMMENT ON COLUMN FJ_School.school_name_high IS 'school_name_high : �б� �̸� ';
COMMENT ON COLUMN FJ_School.school_kind IS 'school_kind';
COMMENT ON COLUMN FJ_School.school_major IS 'school_major : ���� ';
COMMENT ON COLUMN FJ_School.school_name_college IS 'school_name_college';
COMMENT ON COLUMN FJ_School.school_rank IS 'school_rank : �б� ���� ';
COMMENT ON COLUMN FJ_School.highschool_kind IS 'highschool_kind';
COMMENT ON COLUMN FJ_School.school_college1 IS 'school_college1';
COMMENT ON COLUMN FJ_School.school_college2 IS 'school_college2';
COMMENT ON COLUMN FJ_School.school_college_high IS 'school_college_high';
COMMENT ON COLUMN FJ_School.school_start_date_high IS 'school_start_date_high';
COMMENT ON COLUMN FJ_School.school_last_date_high IS 'school_last_date_high';
COMMENT ON COLUMN FJ_School.school_start_date_college IS 'school_start_date_college';
COMMENT ON COLUMN FJ_School.school_last_date_college IS 'school_last_date_college';
COMMENT ON COLUMN FJ_School.school_ref IS 'school_ref';
COMMENT ON COLUMN FJ_School.reg_date IS 'reg_date : ��������';
COMMENT ON COLUMN FJ_School.last_date IS 'last_date : ��������';
COMMENT ON TABLE FJ_User IS 'FJ_User';
COMMENT ON COLUMN FJ_User.user_history_id IS 'user_history_id : �̷¼� ID';
COMMENT ON COLUMN FJ_User.email IS 'email : �̸���';
COMMENT ON COLUMN FJ_User.resome_title IS 'resome_title';
COMMENT ON COLUMN FJ_User.eng_name IS 'eng_name : �����̸� ';
COMMENT ON COLUMN FJ_User.kor_name IS 'kor_name : �ѱ��̸� ';
COMMENT ON COLUMN FJ_User.tel IS 'tel : ��ȭ��ȣ ';
COMMENT ON COLUMN FJ_User.birth IS 'birth : ������� ';
COMMENT ON COLUMN FJ_User.address IS 'address : �ּ� ';
COMMENT ON COLUMN FJ_User.army IS 'army : �������� ';
COMMENT ON COLUMN FJ_User.want_salary IS 'want_salary : ��� ���� ';
COMMENT ON COLUMN FJ_User.license IS 'license : �ڰ��� ';
COMMENT ON COLUMN FJ_User.skill IS 'skill : ������� ';
COMMENT ON COLUMN FJ_User.photo IS 'photo';
COMMENT ON COLUMN FJ_User.reg_date IS 'reg_date : �ۼ����� ';
COMMENT ON COLUMN FJ_User.project IS 'project : ������Ʈ ';
COMMENT ON COLUMN FJ_User.user_ref IS 'user_ref';
COMMENT ON COLUMN FJ_User.last_date IS 'last_date';



