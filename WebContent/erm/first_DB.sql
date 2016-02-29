
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

-- ä��Խ��� ������
CREATE SEQUENCE FJ_Recruit_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999 START WITH 1 NOCACHE NOCYCLE;



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
	content varchar2(4000) NOT NULL,
	-- re_count : ������ �� 
	re_count number NOT NULL,
	-- scrap_count : ��ũ�� �� 
	scrap_count number NOT NULL,
	-- recom_count : ���ƿ� �� 
	recom_count number NOT NULL,
	-- read_count : ���� �� 
	-- (���� DB���� number default 0, ���� �� ����)
	read_count number,
	-- bad_count : �Ⱦ�� �� 
	bad_count number NOT NULL,
	-- re_step : �Խñ��� ���� 
	re_step number NOT NULL,
	-- reg_date : �ۼ� ��¥ 
	reg_date date NOT NULL,
	-- hstag : �ؽ��±�
	hstag varchar2(50) NOT NULL,
	 ,
	PRIMARY KEY (board_num)
);


-- FJ_Career
CREATE TABLE FJ_Career
(
	-- career_id : ��°��� ID 
	career_id varchar2(30) NOT NULL,
	-- user_history_id : �̷¼� ID
	user_history_id varchar2(30),
	-- comp_name : ȸ�� �̸� 
	comp_name varchar2(10) NOT NULL,
	-- content : ���� 
	content varchar2(5000) NOT NULL,
	-- position : ��å 
	position varchar2(10) NOT NULL,
	-- business : ����ȸ�� 
	business varchar2(20) NOT NULL,
	-- reg_date : �ۼ����� 
	reg_date date NOT NULL,
	-- last_date : �������� 
	last_date date NOT NULL,
	PRIMARY KEY (career_id)
);


-- FJ_Comp
CREATE TABLE FJ_Comp
(
	-- email : �̸���
	email varchar2(50) NOT NULL,
	-- address : �ּ� 
	address varchar2(100) NOT NULL,
	-- info : ȸ�� ����(ȫ��) 
	info varchar2(5000) NOT NULL,
	-- tel : ��ȭ��ȣ 
	tel varchar2(30) NOT NULL,
	-- like_count : ȸ�� ��õ�� 
	like_count number NOT NULL,
	-- ceo : ��ǥ�ڸ� 
	ceo varchar2(10) NOT NULL,
	-- comp_reg_date : ȸ�� â���� 
	comp_reg_date timestamp NOT NULL,
	-- year_sale : ������ 
	year_sale number NOT NULL,
	-- reg_date : �ۼ����� 
	reg_date date NOT NULL,
	-- last_date : �������� 
	last_date date NOT NULL,
	-- comp_type : ������� 
	comp_type varchar2(30) NOT NULL,
	-- emp_count : ������ 
	emp_count number NOT NULL,
	-- capital : �ں��� 
	capital varchar2(100) NOT NULL,
	PRIMARY KEY (email)
);


-- FJ_Introduce
CREATE TABLE FJ_Introduce
(
	-- introduce_id : �з°��� ID 
	introduce_id varchar2(30) NOT NULL,
	-- user_history_id : �̷¼� ID
	user_history_id varchar2(30) NOT NULL,
	-- title : ����
	title varchar2(50) NOT NULL,
	-- content : ����
	content varchar2(5000) NOT NULL,
	-- start_date : �ۼ�����
	start_date date NOT NULL,
	-- last_date : ��������
	last_date date NOT NULL,
	PRIMARY KEY (introduce_id)
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


-- Fj_member
CREATE TABLE FJ_member
(
	-- email : �̸���
	email varchar2(50) NOT NULL,
	-- passwd : ��й�ȣ
	passwd varchar2(50) NOT NULL,
	-- name : �г��� or ȸ���̸�
	name varchar2(100) NOT NULL,
	-- reg_date : �ۼ����� 
	reg_date date NOT NULL,
	-- member_flag : ȸ������ 
	-- 
	-- 1 : ����ȸ�� 
	-- 2 : ���ȸ��
	-- 3 : ������ 
	member_flag number NOT NULL,
	PRIMARY KEY (email)
);


-- FJ_Message
CREATE TABLE FJ_Message
(
	-- message_num : �޽��� ID 
	message_num  NOT NULL,
	-- email : �̸���
	email varchar2(50) NOT NULL,
	-- title : ����
	title varchar2(200) NOT NULL,
	-- content : ���� 
	content varchar2(1000) NOT NULL,
	-- tag : �±� �з�
	tag varchar2(20) NOT NULL,
	-- reg_date : ������¥ 
	reg_date date NOT NULL,
	-- read_yn : Ȯ�� ����
	read_yn  NOT NULL,
	PRIMARY KEY (message_num)
);


-- FJ_Recruit
CREATE TABLE FJ_Recruit
(
	-- recruit_id : ä��Խ��� ID 
	recruit_id varchar2(30) NOT NULL,
	-- email : �̸���
	email varchar2(50),
	-- title : ���� 
	title varchar2(100) NOT NULL,
	-- content : ���� 
	content varchar2(5000),
	-- skill : ������� 
	skill varchar2(300),
	-- gender : ���� 
	gender varchar2(20),
	-- edu : �з�
	edu varchar2(200),
	-- work_type : ��� ���� 
	work_type varchar2(50),
	-- work_day : �ٹ����� 
	work_day varchar2(100),
	-- work_area : �ٹ�����
	-- 
	work_area varchar2(100),
	-- business_part : ������ 
	business_part varchar2(200),
	-- incharge : �����
	incharge varchar2(100),
	-- tel : ����ó
	tel varchar2(100),
	-- min_salary : �ּ� ���� 
	min_salary varchar2(80),
	-- max_salary : �ִ� ���� 
	max_salary varchar2(80),
	-- min_career : �ּ� ��� 
	min_career varchar2(150),
	-- max_career : �ִ� ��� 
	max_career varchar2(150),
	-- min_age : �ּ� ���� 
	min_age varchar2(200),
	-- max_age : �ִ� ���� 
	max_age varchar2(200),
	-- start_date : ä�� ������ 
	start_date varchar2(100),
	-- end_date : ä�� ������ 
	end_date varchar2(100),
	-- num_people : ä���ο� 
	num_people number,
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
	recruit_id varchar2(30) NOT NULL,
	-- email : �̸���
	email varchar2(50) NOT NULL,
	-- user_history_id : �̷¼� ID
	user_history_id varchar2(30) NOT NULL,
	-- reg_date : �Ի� ������ 
	reg_date date NOT NULL
);


-- FJ_School
CREATE TABLE FJ_School
(
	-- school_id : �з°��� ID 
	school_id varchar2(30) NOT NULL,
	-- user_history_id : �̷¼� ID
	user_history_id varchar2(30) NOT NULL,
	-- school_name : �б� �̸� 
	school_name varchar2(10) NOT NULL,
	-- major : ���� 
	major varchar2(20) NOT NULL,
	-- finish_flag : ���� ���� 
	-- 
	-- 1- ����
	-- 2- ����
	-- 3- ���� 
	finish_flag number NOT NULL,
	-- school_rank : �б� ���� 
	school_rank number NOT NULL,
	-- reg_date : �ۼ����� 
	reg_date date NOT NULL,
	-- last_date : ��������
	last_date date NOT NULL,
	PRIMARY KEY (school_id)
);


-- FJ_User
CREATE TABLE FJ_User
(
	-- user_history_id : �̷¼� ID
	user_history_id varchar2(30) NOT NULL,
	-- email : �̸���
	email varchar2(50),
	-- eng_name : �����̸� 
	eng_name varchar2(20) NOT NULL,
	-- kor_name : �ѱ��̸� 
	kor_name varchar2(10) NOT NULL,
	-- tel : ��ȭ��ȣ 
	tel varchar2(20) NOT NULL,
	-- birth : ������� 
	birth date NOT NULL,
	-- address : �ּ� 
	address varchar2(100) NOT NULL,
	-- army : �������� 
	army varchar2(30) NOT NULL,
	-- license : �ڰ��� 
	license varchar2(100) NOT NULL,
	-- want_salary : ��� ���� 
	want_salary number NOT NULL,
	-- skill : ������� 
	skill varchar2(500) NOT NULL,
	-- reg_date : �ۼ����� 
	reg_date date NOT NULL,
	-- last_date : �������� 
	last_date date NOT NULL,
	-- project : ������Ʈ 
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
COMMENT ON COLUMN FJ_Board_Free.board_num IS 'board_num : �Խ��� ID';
COMMENT ON COLUMN FJ_Board_Free.email IS 'email : �̸���';
COMMENT ON COLUMN FJ_Board_Free.subject IS 'subject : ���� ';
COMMENT ON COLUMN FJ_Board_Free.content IS 'content : ���� ';
COMMENT ON COLUMN FJ_Board_Free.re_count IS 're_count : ������ �� ';
COMMENT ON COLUMN FJ_Board_Free.scrap_count IS 'scrap_count : ��ũ�� �� ';
COMMENT ON COLUMN FJ_Board_Free.recom_count IS 'recom_count : ���ƿ� �� ';
COMMENT ON COLUMN FJ_Board_Free.read_count IS 'read_count : ���� �� 
(���� DB���� number default 0, ���� �� ����)';
COMMENT ON COLUMN FJ_Board_Free.bad_count IS 'bad_count : �Ⱦ�� �� ';
COMMENT ON COLUMN FJ_Board_Free.re_step IS 're_step : �Խñ��� ���� ';
COMMENT ON COLUMN FJ_Board_Free.reg_date IS 'reg_date : �ۼ� ��¥ ';
COMMENT ON COLUMN FJ_Board_Free.hstag IS 'hstag : �ؽ��±�';
COMMENT ON TABLE FJ_Career IS 'FJ_Career';
COMMENT ON COLUMN FJ_Career.career_id IS 'career_id : ��°��� ID ';
COMMENT ON COLUMN FJ_Career.user_history_id IS 'user_history_id : �̷¼� ID';
COMMENT ON COLUMN FJ_Career.comp_name IS 'comp_name : ȸ�� �̸� ';
COMMENT ON COLUMN FJ_Career.content IS 'content : ���� ';
COMMENT ON COLUMN FJ_Career.position IS 'position : ��å ';
COMMENT ON COLUMN FJ_Career.business IS 'business : ����ȸ�� ';
COMMENT ON COLUMN FJ_Career.reg_date IS 'reg_date : �ۼ����� ';
COMMENT ON COLUMN FJ_Career.last_date IS 'last_date : �������� ';
COMMENT ON TABLE FJ_Comp IS 'FJ_Comp';
COMMENT ON COLUMN FJ_Comp.email IS 'email : �̸���';
COMMENT ON COLUMN FJ_Comp.address IS 'address : �ּ� ';
COMMENT ON COLUMN FJ_Comp.info IS 'info : ȸ�� ����(ȫ��) ';
COMMENT ON COLUMN FJ_Comp.tel IS 'tel : ��ȭ��ȣ ';
COMMENT ON COLUMN FJ_Comp.like_count IS 'like_count : ȸ�� ��õ�� ';
COMMENT ON COLUMN FJ_Comp.ceo IS 'ceo : ��ǥ�ڸ� ';
COMMENT ON COLUMN FJ_Comp.comp_reg_date IS 'comp_reg_date : ȸ�� â���� ';
COMMENT ON COLUMN FJ_Comp.year_sale IS 'year_sale : ������ ';
COMMENT ON COLUMN FJ_Comp.reg_date IS 'reg_date : �ۼ����� ';
COMMENT ON COLUMN FJ_Comp.last_date IS 'last_date : �������� ';
COMMENT ON COLUMN FJ_Comp.comp_type IS 'comp_type : ������� ';
COMMENT ON COLUMN FJ_Comp.emp_count IS 'emp_count : ������ ';
COMMENT ON COLUMN FJ_Comp.capital IS 'capital : �ں��� ';
COMMENT ON TABLE FJ_Introduce IS 'FJ_Introduce';
COMMENT ON COLUMN FJ_Introduce.introduce_id IS 'introduce_id : �з°��� ID ';
COMMENT ON COLUMN FJ_Introduce.user_history_id IS 'user_history_id : �̷¼� ID';
COMMENT ON COLUMN FJ_Introduce.title IS 'title : ����';
COMMENT ON COLUMN FJ_Introduce.content IS 'content : ����';
COMMENT ON COLUMN FJ_Introduce.start_date IS 'start_date : �ۼ�����';
COMMENT ON COLUMN FJ_Introduce.last_date IS 'last_date : ��������';
COMMENT ON TABLE FJ_Log IS 'FJ_Log';
COMMENT ON COLUMN FJ_Log.email IS 'email : �̸���';
COMMENT ON COLUMN FJ_Log.page_id IS 'page_id : ������ ID ';
COMMENT ON COLUMN FJ_Log.reg_date IS 'reg_date : �ۼ����� ';
COMMENT ON COLUMN FJ_Log.last_date IS 'last_date : �������� ';
COMMENT ON TABLE FJ_member IS 'Fj_member';
COMMENT ON COLUMN FJ_member.email IS 'email : �̸���';
COMMENT ON COLUMN FJ_member.passwd IS 'passwd : ��й�ȣ';
COMMENT ON COLUMN FJ_member.name IS 'name : �г��� or ȸ���̸�';
COMMENT ON COLUMN FJ_member.reg_date IS 'reg_date : �ۼ����� ';
COMMENT ON COLUMN FJ_member.member_flag IS 'member_flag : ȸ������ 

1 : ����ȸ�� 
2 : ���ȸ��
3 : ������ ';
COMMENT ON TABLE FJ_Message IS 'FJ_Message';
COMMENT ON COLUMN FJ_Message.message_num IS 'message_num : �޽��� ID ';
COMMENT ON COLUMN FJ_Message.email IS 'email : �̸���';
COMMENT ON COLUMN FJ_Message.title IS 'title : ����';
COMMENT ON COLUMN FJ_Message.content IS 'content : ���� ';
COMMENT ON COLUMN FJ_Message.tag IS 'tag : �±� �з�';
COMMENT ON COLUMN FJ_Message.reg_date IS 'reg_date : ������¥ ';
COMMENT ON COLUMN FJ_Message.read_yn IS 'read_yn : Ȯ�� ����';
COMMENT ON TABLE FJ_Recruit IS 'FJ_Recruit';
COMMENT ON COLUMN FJ_Recruit.recruit_id IS 'recruit_id : ä��Խ��� ID ';
COMMENT ON COLUMN FJ_Recruit.email IS 'email : �̸���';
COMMENT ON COLUMN FJ_Recruit.title IS 'title : ���� ';
COMMENT ON COLUMN FJ_Recruit.content IS 'content : ���� ';
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
COMMENT ON COLUMN FJ_Recruit.min_salary IS 'min_salary : �ּ� ���� ';
COMMENT ON COLUMN FJ_Recruit.max_salary IS 'max_salary : �ִ� ���� ';
COMMENT ON COLUMN FJ_Recruit.min_career IS 'min_career : �ּ� ��� ';
COMMENT ON COLUMN FJ_Recruit.max_career IS 'max_career : �ִ� ��� ';
COMMENT ON COLUMN FJ_Recruit.min_age IS 'min_age : �ּ� ���� ';
COMMENT ON COLUMN FJ_Recruit.max_age IS 'max_age : �ִ� ���� ';
COMMENT ON COLUMN FJ_Recruit.start_date IS 'start_date : ä�� ������ ';
COMMENT ON COLUMN FJ_Recruit.end_date IS 'end_date : ä�� ������ ';
COMMENT ON COLUMN FJ_Recruit.num_people IS 'num_people : ä���ο� ';
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
COMMENT ON COLUMN FJ_School.school_name IS 'school_name : �б� �̸� ';
COMMENT ON COLUMN FJ_School.major IS 'major : ���� ';
COMMENT ON COLUMN FJ_School.finish_flag IS 'finish_flag : ���� ���� 

1- ����
2- ����
3- ���� ';
COMMENT ON COLUMN FJ_School.school_rank IS 'school_rank : �б� ���� ';
COMMENT ON COLUMN FJ_School.reg_date IS 'reg_date : �ۼ����� ';
COMMENT ON COLUMN FJ_School.last_date IS 'last_date : ��������';
COMMENT ON TABLE FJ_User IS 'FJ_User';
COMMENT ON COLUMN FJ_User.user_history_id IS 'user_history_id : �̷¼� ID';
COMMENT ON COLUMN FJ_User.email IS 'email : �̸���';
COMMENT ON COLUMN FJ_User.eng_name IS 'eng_name : �����̸� ';
COMMENT ON COLUMN FJ_User.kor_name IS 'kor_name : �ѱ��̸� ';
COMMENT ON COLUMN FJ_User.tel IS 'tel : ��ȭ��ȣ ';
COMMENT ON COLUMN FJ_User.birth IS 'birth : ������� ';
COMMENT ON COLUMN FJ_User.address IS 'address : �ּ� ';
COMMENT ON COLUMN FJ_User.army IS 'army : �������� ';
COMMENT ON COLUMN FJ_User.license IS 'license : �ڰ��� ';
COMMENT ON COLUMN FJ_User.want_salary IS 'want_salary : ��� ���� ';
COMMENT ON COLUMN FJ_User.skill IS 'skill : ������� ';
COMMENT ON COLUMN FJ_User.reg_date IS 'reg_date : �ۼ����� ';
COMMENT ON COLUMN FJ_User.last_date IS 'last_date : �������� ';
COMMENT ON COLUMN FJ_User.project IS 'project : ������Ʈ ';



