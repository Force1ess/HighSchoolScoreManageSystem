use main;

create table Zhengh_Faculty18(
                                 zh_Fno18 varchar(10),
                                 zh_Fname18 varchar(50)
);
create table Zhengh_Major18(
                               zh_Mno18 varchar(10) primary key,
                               zh_Mname18 varchar(50) not null,
                               zh_Fno18 varchar(10) not null
);
create table Zhengh_Course18(
                                zh_Cno18 varchar(10) primary key ,
                                zh_Cname18 varchar(50),
                                zh_Term18 varchar(30),
                                zh_Hours18 int,
                                zh_Credit18 int ,
                                zh_Way18 varchar(10),
                                constraint Zhengh_CK_Course_Credit18 check (zh_Credit18>0),
                                constraint Zhengh_CK_Course_Hours18 check (zh_Hours18>0),
                                constraint Zhengh_CK_Course_way18 check(zh_Way18 in ('考查','考核'))
);
create table Zhengh_Teacher18(
                                 zh_Tno18 varchar(10) primary key ,
                                 zh_Tname18 varchar(50),
                                 zh_TSex18 varchar(5),
                                 zh_TAge18 int,
                                 zh_Pos18 varchar(50),
                                 zh_Phone18 varchar(15),
                                 zh_Fno18 varchar(10),
                                 constraint Zhengh_CK_Teacher_Tage18 check(zh_TAge18>=15),
                                 constraint Zhengh_CK_Teacher_Tsex check (zh_TSex18 in ('男','女'))
);
create table Zhengh_AdClass18(
                                 zh_Classno18 varchar(10) primary key ,
                                 zh_Classname18 varchar(50),
                                 zh_Mno18 varchar(10),
                                 constraint Zhengh_FK_Ad_Major18 foreign key (zh_Mno18)
                                     references Zhengh_Major18(zh_Mno18)
);
create table Zhengh_Student18(
                                 zh_Sno18 varchar(10) primary key ,
                                 zh_Sname18 varchar(50),
                                 zh_Ssex18 varchar(5),
                                 zh_Sage18 int,
                                 zh_Grade18 varchar(5),
                                 zh_Adr18 varchar(50),
                                 zh_Scredits18 int,
                                 zh_Classno18 varchar(10),
                                     constraint Zhengh_FK_Student18_AdClass18 foreign key (zh_Classno18)
                                     references Zhengh_AdClass18(zh_Classno18),
                                 constraint Zhengh_CK_Student_Ssex18 check (zh_Ssex18 IN ('男','女')),
                                 constraint Zhengh_CK_Student_Scredits18 check (zh_Scredits18>=0),
                                 constraint Zhengh_CK_Student_Sage check (zh_Sage18>=10)
);

create table Zhengh_TeachingClass18(
                                       zh_Cno18 varchar(10),
                                       zh_Tno18 varchar(10),
                                       zh_Classno18 varchar(10),
                                       primary key(zh_Cno18,zh_Tno18),
                                           constraint Zhengh_FK_Teaching_Cno18 foreign key(zh_Cno18)
                                           references Zhengh_Course18(zh_Cno18),
                                       constraint Zhengh_FK_Teaching_Tno18 foreign key(zh_Tno18)
                                           references Zhengh_Teacher18(zh_Tno18)
);
create table Zhengh_StudentScore18(
                                      zh_Cno18 varchar(10),
                                      zh_Sno18 varchar(10),
                                      zh_Score int,
                                      primary key (zh_Sno18,zh_Cno18),
                                      constraint Zhengh_CK_StudentScore_Score18 check(zh_Score>=0)

);
