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
select count(*) as cnt, mseq from tblBoard group by mseq;

-- ȸ���� ��� ��


























