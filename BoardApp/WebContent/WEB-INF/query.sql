CREATE TABLE tblBoard(
 num              number,           --�۹�ȣ(���� �����ϱ� ���� , �ڵ���������)
 name             varchar2(20),     --�ۼ���
 email            varchar2(50),     
 homepage         varchar2(50),
 subject          varchar2(50),     --�� ����
 content          varchar2(4000),   --�� ����
 pass             varchar2(10),     
 count            number,           --��ȸ��
 ip               varchar2(50),     --�ۼ��� IP�ּ�
 regdate          date,             --�����
 pos              number,           --�亯��ġ 
 depth            number,           --�亯����
 constraint pk_num     primary key(num)
);

CREATE SEQUENCE seq_num;

insert into tblBoard values (seq_num.nextVal,'erin','bbb','ccc','ddd','eee','fff',0,'ggg',sysdate,1,2);

select * from tblboard;



