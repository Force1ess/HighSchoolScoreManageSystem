use main;

create table Zhengh_Faculty18(
                                 zh_Fno18 varchar(10) primary key,
                                 zh_Fname18 varchar(50)
);
create table Zhengh_Major18(
                               zh_Mno18 varchar(10) primary key,
                               zh_Mname18 varchar(50) not null,
                               zh_Fno18 varchar(10) not null
);
create table Zhengh_Course18(
                                zh_Cno18 varchar(10) primary key ,
                                zh_Cname18 varchar(50) not null,
                                zh_Term18 varchar(30) not null,
                                zh_Hours18 int not null,
                                zh_Credit18 int not null,
                                zh_Way18 varchar(10),
                                constraint Zhengh_CK_Course_Credit18 check (zh_Credit18>0),
                                constraint Zhengh_CK_Course_Hours18 check (zh_Hours18>0),
                                constraint Zhengh_CK_Course_way18 check(zh_Way18 in ('考查','考核'))
);
create table Zhengh_Teacher18(
                                 zh_Tno18 varchar(10) primary key ,
                                 zh_Tname18 varchar(50) not null,
                                 zh_TSex18 varchar(5) not null,
                                 zh_TAge18 int not null,
                                 zh_Pos18 varchar(50) not null,
                                 zh_Phone18 varchar(15) not null,
                                 zh_Fno18 varchar(10) not null,
                                 constraint Zhengh_CK_Teacher_Tage18 check(zh_TAge18>=15),
                                 constraint Zhengh_CK_Teacher_Tsex check (zh_TSex18 in ('男','女'))
);
create table Zhengh_AdClass18(
                                 zh_Classno18 varchar(10) primary key ,
                                 zh_Classname18 varchar(50) not null,
                                 zh_Mno18 varchar(10) not null,
                                 constraint Zhengh_FK_Ad_Major18 foreign key (zh_Mno18)
                                     references Zhengh_Major18(zh_Mno18)
);
create table Zhengh_Student18(
                                 zh_Sno18 varchar(10) primary key ,
                                 zh_Sname18 varchar(50) not null,
                                 zh_Ssex18 varchar(5) not null,
                                 zh_Sage18 int not null,
                                 zh_Grade18 varchar(5) not null,
                                 zh_Adr18 varchar(50) not null,
                                 zh_Scredits18 int not null,
                                 zh_Classno18 varchar(10) not null,
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
                                       primary key(zh_Cno18,zh_Tno18,zh_Classno18),
                                           constraint Zhengh_FK_Teaching_Cno18 foreign key(zh_Cno18)
                                           references Zhengh_Course18(zh_Cno18),
                                       constraint Zhengh_FK_Teaching_Tno18 foreign key(zh_Tno18)
                                           references Zhengh_Teacher18(zh_Tno18)
);
create table Zhengh_2StudentScore18(
                                      zh_Cno18 varchar(10),
                                      zh_Sno18 varchar(10),
                                      zh_Score int,
                                      primary key (zh_Sno18,zh_Cno18),
                                      constraint Zhengh_CK_StudentScore_Score18 check(zh_Score>=0)

);
create table zhengh_class_course18
(
    zh_classno18 varchar(10),
    zh_cno18 varchar(10),
    constraint zhengh_class_ClassFK18 foreign key (zh_classno18)
    references zhengh_adclass18(zh_Classno18),
    constraint zhengh_class_CourseFK18 foreign key(zh_cno18)
    references zhengh_course18(zh_Cno18)
);
