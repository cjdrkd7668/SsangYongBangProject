-- D > class > server > codestudy > db.sql

-- ȸ�� ���̺�
select * from tblMember;
drop table tblMember cascade constraints;
drop sequence seqMember;

create table tblMember (
    seq number primary key,                             --��ȣ(PK)
    id varchar2(30) not null unique,                   -- ���̵�
    name varchar2(30) not null,                         -- �̸�
    email varchar2(100) not null,                       -- �̸���
    pw varchar2(30) not null,                             -- ��ȣ
    pic varchar2(50) not null,                            -- ������ ����
    regdate date default sysdate not null           -- ������
);

create sequence seqMember;

-- 1	hong	ȫ�浿	hong@test.com	111	nopic.png	21/02/15
select * from tblMember;






-- �Խ��� ���̺�
drop table tblBoard cascade constraints;
drop table tblComment cascade constraints;

drop sequence seqBoard;
drop sequence seqComment;

create table tblBoard (
    seq number primary key,                                     --�۹�ȣ(PK)
    subject varchar2(1000) not null,                            --����
    content varchar2(2000) not null,                            --����
    regdate date default sysdate not null,                  --��¥
    readcount number default 0 not null,                    --��ȸ��
    mseq number not null references tblMember(seq)  --ȸ����ȣ(FK)
);

create sequence seqBoard;

insert into tblBoard (seq, subject, content, regdate, readcount, mseq) 
    values (seqBoard.nextVal, '�Խ��� �׽�Ʈ�Դϴ�.', '�����Դϴ�.', default, default, 1);

select * from tblBoard;

commit;





-- �Խ��� ��
create or replace view vwBoard
as
select 
    seq, 
    subject, 
    (select name from tblMember where seq = tblBoard.mseq) as name, 
    regdate, 
    readcount, 
    mseq,
    (select pic from tblMember where seq = tblBoard.mseq) as pic,
    (sysdate - regdate)  * 24 as gap,
    content, --�˻� ������ �߰�
    filename,
    (select count(*) from tblComment where bseq = tblBoard.seq) as ccount,
    thread,
    depth
from tblBoard;

select * from vwBoard where name like '%�˻���%' or subject like '%�˻���%' or content like '%�˻���%';




select b.*, (select name from tblMember where seq = b.mseq) as name, (select id from tblMember where seq = b.mseq) as id from tblBoard b;














drop table tblBoard cascade constraints;
drop sequence seqBoard;

create table tblBoard (
    seq number primary key,                                     --�۹�ȣ(PK)
    subject varchar2(1000) not null,                            --����
    content varchar2(2000) not null,                            --����
    regdate date default sysdate not null,                  --��¥
    readcount number default 0 not null,                    --��ȸ��
    mseq number not null references tblMember(seq),  --ȸ����ȣ(FK)
    filename varchar2(100) null,                                 -- ������ ���ϸ�
    orgfilename varchar2(100) null,                             -- ���� ���ϸ�
    downloadcount number default 0                          -- �ٿ�ε� Ƚ��
);

create sequence seqBoard;


select * from tblBoard;



-- ����¡, Paging
-- �������� : 20����
select * from vwBoard order by seq desc;

select * from vwBoard order by seq desc;


select b.*, rownum from vwBoard b order by seq desc;

select * from (select a.*, rownum as rnum from (select * from vwBoard order by seq desc) a) where rnum between 1 and 20;
select * from (select a.*, rownum as rnum from (select * from vwBoard order by seq desc) a) where rnum between 21 and 40;
select * from (select a.*, rownum as rnum from (select * from vwBoard order by seq desc) a) where rnum between 41 and 60;


select count(*) from tblBoard;






-- ��� ���̺�
create table tblComment (
    seq number primary  key,                                                        --��۹�ȣ(PK)
    ccontent varchar2(1000) not null,                                                --��۳���
    regdate date default sysdate not null,                                          --�ۼ��ð�
    mseq number not null references tblMember(seq),                     --ȸ����ȣ(FK)
    bseq number not null references tblBoard(seq)                           --�Խ��� �۹�ȣ(FK)
);

create sequence seqComment;


select * from tblComment;

select c.*, (select name from tblMember where seq = c.mseq) as name, (select id from tblMember where seq = c.mseq) as id from tblComment c;









drop table tblComment;
drop sequence seqComment;

drop table tblBoard;
drop sequence seqBoard;




create table tblBoard (
    seq number primary key,                                     --�۹�ȣ(PK)
    subject varchar2(1000) not null,                            --����
    content varchar2(2000) not null,                            --����
    regdate date default sysdate not null,                  --��¥
    readcount number default 0 not null,                    --��ȸ��
    mseq number not null references tblMember(seq),  --ȸ����ȣ(FK)
    filename varchar2(100) null,                                 -- ������ ���ϸ�
    orgfilename varchar2(100) null,                             -- ���� ���ϸ�
    downloadcount number default 0,                          -- �ٿ�ε� Ƚ��
    thread number not null,                                     -- �亯
    depth number not null                                       -- �亯
);

create sequence seqBoard;



select nvl(max(thread), 0) + 1000 as thread from tblBoard;

--thread depth
--1000	0
--2000	0
--3000	0


select * from tblMember;
select * from tblBoard;
select * from tblComment;

-- ��Ʈ ������
-- ȸ���� �Խù� ��, ��� ��

-- ȸ���� �Խù� ��
select count(*) as cnt, mseq, (select name from tblMember where seq = tblBoard.mseq) as name from tblBoard group by mseq;

-- ȸ���� ��� ��
select count(*) as cnt, mseq, (select name from tblMember where seq = tblComment.mseq) as name from tblComment group by mseq;





select * from tblInsa;



-- insa.data.sql

CREATE TABLE tblInsa(
        num NUMBER(5) NOT NULL CONSTRAINT tblInsa_pk PRIMARY KEY
       ,name VARCHAR2(20) NOT NULL
       ,ssn  VARCHAR2(14) NOT NULL
       ,ibsaDate DATE     NOT NULL
       ,city  VARCHAR2(10)
       ,tel   VARCHAR2(15)
       ,buseo VARCHAR2(15) NOT NULL
       ,jikwi VARCHAR2(15) NOT NULL
       ,basicPay NUMBER(10) NOT NULL
       ,sudang NUMBER(10) NOT NULL
);

INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1001, 'ȫ�浿', '871212-1022432', '2008-10-11', '����', '011-2356-4528', '��ȹ��',
   '����', 2610000, 200000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1002, '�̼���', '901007-1544236', '2010-11-29', '���', '010-4758-6532', '�ѹ���',
   '���', 1320000, 200000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1003, '�̼���', '870922-2312547', '2009-02-25', '��õ', '010-4231-1236', '���ߺ�',
   '����', 2550000, 160000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1004, '������', '890304-1788896', '2010-10-01', '����', '019-5236-4221', '������',
   '�븮', 1954200, 170000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1005, '�Ѽ���', '911112-1566789', '2014-08-13', '����', '018-5211-3542', '�ѹ���',
   '���', 1420000, 160000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1006, '�̱���', '880505-2978541', '2012-02-11', '��õ', '010-3214-5357', '���ߺ�',
   '����', 2265000, 150000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1007, '����ö', '880506-1625148', '2008-03-16', '����', '011-2345-2525', '���ߺ�',
   '�븮', 1250000, 150000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1008, '�迵��', '921011-2362514', '2012-04-30', '����', '016-2222-4444', 'ȫ����',
'���', 950000 , 145000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1009, '������', '910810-1552147', '2013-10-10', '���', '019-1111-2222', '�λ��',
   '���', 840000 , 220400);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1010, '������', '851010-1122233', '2007-08-08', '�λ�', '011-3214-5555', '������',
   '����', 2540000, 130000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1011, '������', '901010-2987897', '2010-07-07', '����', '010-8888-4422', '������',
   '���', 1020000, 140000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1012, '���ѱ�', '860909-1333333', '2009-10-16', '����', '018-2222-4242', 'ȫ����',
   '���', 880000 , 114000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1013, '���̼�', '890102-2777777', '2008-06-07', '���', '019-6666-4444', 'ȫ����',
   '�븮', 1601000, 103000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1014, 'Ȳ����', '910707-2574812', '2012-02-15', '��õ', '010-3214-5467', '���ߺ�',
   '���', 1100000, 130000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1015, '������', '900606-2954687', '2009-07-26', '���', '016-2548-3365', '�ѹ���',
   '���', 1050000, 104000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1016, '�̻���', '881010-1666678', '2011-11-29', '���', '010-4526-1234', '���ߺ�',
   '����', 2350000, 150000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1017, '�����', '920507-1452365', '2010-08-28', '��õ', '010-3254-2542', '���ߺ�',
   '���', 950000 , 210000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1018, '�̼���', '901028-1849534', '2014-08-08', '����', '018-1333-3333', '���ߺ�',
   '���', 880000 , 123000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1019, '�ڹ���', '880710-1985632', '2009-12-10', '����', '017-4747-4848', '�λ��',
   '����', 2300000, 165000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1020, '������', '900304-2741258', '2013-10-10', '����', '011-9595-8585', '�����',
   '���', 880000 , 140000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1021, 'ȫ�泲', '901010-1111111', '2011-09-07', '���', '011-9999-7575', '���ߺ�',
   '���', 875000 , 120000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1022, '�̿���', '900501-2312456', '2013-02-25', '����', '017-5214-5282', '��ȹ��',
   '�븮', 1960000, 180000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1023, '���μ�', '831211-1214576', '2005-02-23', '����', NULL           , '������',
   '����', 2500000, 170000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1024, '�踻��', '930225-2633334', '2009-08-28', '����', '011-5248-7789', '��ȹ��',
   '�븮', 1900000, 170000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1025, '�����', '901103-1654442', '2010-10-01', '����', '010-4563-2587', '������',
   '���', 1100000, 160000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1026, '�����', '910907-2015457', '2012-08-28', '���', '010-2112-5225', '������',
   '���', 1050000, 150000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1027, '�迵��', '901216-1898752', '2010-10-18', '����', '019-8523-1478', '�ѹ���',
   '����', 2340000, 170000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1028, '�̳���', '910101-1010101', '2011-09-07', '����', '016-1818-4848', '�λ��',
   '���', 892000 , 110000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1029, '�踻��', '900301-2020202', '2010-09-08', '����', '016-3535-3636', '�ѹ���',
   '���', 920000 , 124000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1030, '������', '890210-2101010', '2009-10-17', '�λ�', '019-6564-6752', '�ѹ���',
   '����', 2304000, 124000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1031, '����ȯ', '871115-1687988', '2011-01-21', '����', '019-5552-7511', '��ȹ��',
   '����', 2450000, 160000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1032, '�ɽ���', '910206-2222222', '2010-05-05', '����', '016-8888-7474', '�����',
   '���', 880000 , 108000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1033, '��̳�', '880505-2999999', '2008-06-07', '����', '011-2444-4444', '������',
   '���', 1020000, 104000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1034, '������', '920505-1325468', '2015-09-26', '���', '011-3697-7412', '��ȹ��',
   '���', 1100000, 160000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1035, '������', '931010-2153252', '2012-05-16', '��õ', NULL           , '���ߺ�',
   '���', 1050000, 140000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1036, '���翵', '801126-2852147', '2013-08-10', '����', '011-9999-9999', '�����',
   '���', 960400 , 190000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1037, '�ּ���', '870129-1456987', '2008-10-15', '��õ', '011-7777-7777', 'ȫ����',
   '����', 2350000, 187000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1038, '���μ�', '891009-2321456', '2009-11-15', '�λ�', '010-6542-7412', '������',
   '�븮', 2000000, 150000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1039, '�����', '900504-2000032', '2013-12-28', '���', '010-2587-7895', '������',
   '�븮', 2010000, 160000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1040, '�ڼ���', '890509-1635214', '2010-09-10', '���', '016-4444-7777', '�λ��',
   '�븮', 2100000, 130000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1041, '�����', '821217-1951357', '2011-12-10', '�泲', '016-4444-5555', '�����',
   '����', 2300000, 150000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1042, 'ä����', '910709-2000054', '2013-10-17', '���', '011-5125-5511', '���ߺ�',
   '���', 1020000, 200000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1043, '��̿�', '930504-2471523', '2013-09-24', '����', '016-8548-6547', '������',
   '���', 1100000, 210000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1044, '����ȯ', '920305-1475286', '2014-01-21', '����', '011-5555-7548', '������',
   '���', 1060000, 220000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1045, 'ȫ����', '690906-1985214', '2013-03-16', '����', '011-7777-7777', '������',
   '���', 960000 , 152000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1046, '����', '860105-1458752', '2009-05-04', '�泲', '017-3333-3333', '�ѹ���',
   '����', 2650000, 150000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1047, '�긶��', '880505-1234567', '2011-07-15', '����', '018-0505-0505', '������',
   '�븮', 2100000, 112000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1048, '�̱��', '890604-1415141', '2011-06-07', '����', NULL           , '���ߺ�',
   '�븮', 2050000, 106000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1049, '�̹̼�', '930908-2456548', '2010-04-07', '��õ', '010-6654-8854', '���ߺ�',
   '���', 1300000, 130000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1050, '�̹���', '910403-2828287', '2013-06-07', '���', '011-8585-5252', 'ȫ����',
   '�븮', 1950000, 103000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1051, '�ǿ���', '890303-2155554', '2010-06-04', '����', '011-5555-7548', '������',
   '����', 2260000, 104000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1052, '�ǿ���', '920406-2000456', '2010-10-10', '���', '010-3644-5577', '��ȹ��',
   '���', 1020000, 105000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1053, '��̽�', '900715-1313131', '2009-12-12', '����', '011-7585-7474', '�����',
   '���', 960000 , 108000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1054, '����ȣ', '910705-1212141', '2009-10-16', '����', '016-1919-4242', 'ȫ����',
   '���', 980000 , 114000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1055, '���ѳ�', '920506-2425153', '2014-06-07', '����', '016-2424-4242', '������',
   '���', 1000000, 104000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1056, '������', '900605-1456987', '2014-08-13', '��õ', '010-7549-8654', '������',
   '�븮', 1950000, 200000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1057, '�̹̰�', '880406-2003214', '2008-02-11', '���', '016-6542-7546', '�����',
   '����', 2520000, 160000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1058, '�����', '900709-1321456', '2013-08-08', '��õ', '010-2415-5444', '��ȹ��',
   '�븮', 1950000, 180000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1059, '�Ӽ���', '910809-2121244', '2011-10-10', '����', '011-4151-4154', '���ߺ�',
   '���', 890000 , 102000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1060, '��ž�', '910809-2111111', '2011-10-10', '����', '011-4151-4444', '���ߺ�',
   '���', 900000 , 102000);

COMMIT;

SELECT * FROM tblInsa;

















