USE Testing;

create table member
(
memID varchar(20) primary key,
memPW varchar(20) not null,
memName nvarchar(10) not null,
memGender char(1),
memBday date,
memQues nvarchar(100) not null,
memAns nvarchar(100) not null
)

insert into member values ('abcd', 'lee1458', N'홍길동', 0, '2000-09-21', 'A is', 'a');

select * from member;

delete member where memID<>'abcd';


create table memCal
(
calDate date,
memID varchar(20),
calTime time,
category char(1) check (category = 's' or category ='d'),
contents nvarchar(1000) not null,
startTime time,
endTime time,
primary key(memID, calDate, calTime)
);

select * from memCal;

insert into memCal values ('2021-11-08', 'abcd', '08:23:26.123112', 'd', N'집가고싶다ㅠ',null,null);
insert into memCal values ('2021-11-11','abcd', '08:23:26', 's', N'공부','12:00:00','16:30:00');

insert into memCal values ('2021-11-15','abcd', '08:23:26', 's', N'공부','12:00:00','16:30:00');
insert into memCal values ('2021-11-15','abcd', '08:23:26', 's', N'공부','15:00:00','18:30:00');
insert into memCal values ('2021-11-15','abcd', '09:00:26', 'd', N'공부는 재밌다',null, null);
insert into memCal values ('2021-11-15','abcd', '09:23:26', 'd', N'정말 재밌니',null, null);


select cast(calTime as varchar(8)) as N'시간', contents as N'내용' from memCal 
where calDate = '2021-11-08' and category='d' and memID= 'abcd' union all 
select concat(cast(startTime as varchar(8)),'~',cast(endTime as varchar(8))) as N'시간', contents as N'내용' from memCal  
where calDate = '2021-11-11' and category='s'  and memID= 'abcd' order by 시간 asc;

create table BlogList
(
memID varchar(20),
board nvarchar(50),
createTime datetime,
primary key(memID, board)
);

insert into BlogList values ('abcd', N'기본게시판', GETDATE());
select * from BlogList;


create table memBlog
(
memID varchar(20),
board nvarchar(50),
writeTime datetime,
title nvarchar(100) not null,
contents nvarchar(2000) not null,
primary key(memID, writeTime)
);

insert into memBlog values ('abcd', N'기본게시판', GETDATE(), N'블로그 게시판 첫 게시', N'이게 바로 테스트다');

select * from memBlog;