CREATE TABLE tblBoard(
 num              number,           --글번호(글을 구별하기 위한 , 자동증가설정)
 name             varchar2(20),     --작성자
 email            varchar2(50),     
 homepage         varchar2(50),
 subject          varchar2(50),     --글 제목
 content          varchar2(4000),   --글 내용
 pass             varchar2(10),     
 count            number,           --조회수
 ip               varchar2(50),     --작성자 IP주소
 regdate          date,             --등록일
 pos              number,           --답변위치 
 depth            number,           --답변레벨
 constraint pk_num     primary key(num)
);

CREATE SEQUENCE seq_num;

insert into tblBoard values (seq_num.nextVal,'erin','bbb','ccc','ddd','eee','fff',0,'ggg',sysdate,1,2);

select * from tblboard;



