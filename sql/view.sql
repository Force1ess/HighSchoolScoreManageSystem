#成绩视图
create view Zhengh_ScoresView18(姓名,学号,课程编号,课程名,成绩,学期)
as select s.zh_Sname18,s.zh_Sno18,C.zh_Cno18,C.zh_Cname18,Sco.zh_Score,C.zh_Term18
from Zhengh_StudentScore18 Sco,Zhengh_Course18 C,zhengh_student18 S
where Sco.zh_Sno18 = S.zh_Sno18
and Sco.zh_Cno18 = C.zh_Cno18;

#课程平均成绩
drop view zhengh_courseavgscore18;
create view Zhengh_CourseAvgScore18(课程编号,课程名,平均成绩)
as
select S.zh_Cno18,C.zh_Cname18,avg(s.zh_Score)
from zhengh_studentscore18 S,zhengh_course18 C
where C.zh_Cno18=S.zh_Cno18
group by  zh_Cno18

#学生课程学分统计
create view Zhengh_Course_Statistic18(姓名,学号,学期,课程名,课程编号,学时,考核方式)
as
select S.zh_Sname18,S.zh_Sno18,C.zh_Term18,C.zh_Cname18,C.zh_Cno18,C.zh_Credit18,C.zh_Way18
from zhengh_studentscore18 Sco,zhengh_course18 C,zhengh_student18 S
where Sco.zh_Sno18=S.zh_Sno18
and Sco.zh_Cno18= C.zh_Cno18;

#教师任课情况查询视图
create definer = root@localhost view zhengh_teachercourse18 as
select `t`.`zh_Tno18`         AS `zh_Tno18`,
       `t`.`zh_Tname18`       AS `zh_Tname18`,
       `c`.`zh_Cno18`         AS `zh_Cno18`,
       `c`.`zh_Cname18`       AS `zh_Cname18`,
       `class`.`zh_Classno18` AS `zh_Classno18`,
       `class`.`zh_Classname18`       AS `zh_Classname18`,
       `c`.`zh_Hours18`       AS `zh_Hours18`,
       `c`.`zh_Credit18`      AS `zh_Credit18`
from `main`.`zhengh_teacher18` `t`
         join `main`.`zhengh_course18` `c`
         join `main`.`zhengh_teachingclass18` `teach`
         join `main`.`zhengh_adclass18` `class`
where ((`teach`.`zh_Cno18` = `c`.`zh_Cno18`) and (`teach`.`zh_Tno18` = `t`.`zh_Tno18`))
and class.zh_Classno18 = teach.zh_Classno18;


-- create view Zhengh_TeacherCourse18(教师编号,教师姓名,课程编号,课程名,班级编号,班级名,学时,学分)
-- as
-- select T.zh_Tno18,T.zh_Tname18,c.zh_Cno18,c.zh_Cname18,class.zh_Classno18,c.zh_Cname18,c.zh_Hours18,c.zh_Credit18
-- from zhengh_teacher18 T,zhengh_course18 C,zhengh_teachingclass18 teach,zhengh_adclass18 class
-- where
-- teach.zh_Cno18=C.zh_Cno18
-- and teach.zh_Tno18 = t.zh_Tno18;

#班级开课查询视图
create view Zhengh_ClassCourse18
as
select a.zh_Classno18,A.zh_Classname18,c.zh_Cno18,c.zh_Cname18,c.zh_Hours18
from zhengh_course18 C,zhengh_adclass18 A,zhengh_class_course18 CS
where cs.zh_cno18=c.zh_Cno18
and a.zh_Classno18=cs.zh_classno18;
#地区学生统计视图
create view ZHengh_StudentSource18
as
select zh_Adr18 生源地 , count(zh_Sno18) 地区人数
from zhengh_student18
group by zh_Adr18;

#
create definer = root@localhost view zhengh_coursegpa18 as
select `s`.`zh_Sno18`   AS `zh_Sno18`,
       `s`.`zh_Sname18` AS `zh_Sname18`,
       `c`.`zh_Term18`  AS `zh_Term18`,
       `c`.`zh_Cno18`   AS `zh_Cno18`,
       `c`.`zh_Cname18` AS `zh_Cname18`,
       `ss`.`zh_Score`  AS `zh_Score`,
       c.zh_Credit18
from `main`.`zhengh_student18` `s`
         join `main`.`zhengh_course18` `c`
         join `main`.`zhengh_studentscore18` `ss`
where ((`ss`.`zh_Cno18` = `c`.`zh_Cno18`) and (`ss`.`zh_Sno18` = `s`.`zh_Sno18`));


#均绩
drop view zhengh_averageGpa18
-- create view zhengh_averageGpa18
-- (学号,学期,均绩)
-- as select c.zh_Sno18,c.zh_Term18,sum(c.zh_Score)/(s.zh_Credit18)
-- from zhengh_course18 s,Zhengh_CourseGPA18 c
-- where c.zh_Cno18=s.zh_Cno18
-- and c.zh_Score group by c.zh_Term18,c.zh_Sno18;
create definer = root@localhost view zhengh_averagegpa18 as
select `main`.`c`.`zh_Sno18`                                 AS `zh_Sno18`,
       `main`.`c`.`zh_Sname18`                               AS `zh_Sname18`,
       `ad`.`zh_Classname18`                                 AS `zh_Classname18`,
       (sum(`main`.`c`.`zh_Score`) / sum(`s`.`zh_Credit18`)) AS `sum(c.zh_Score)/sum(s.zh_Credit18)`
from (((`main`.`zhengh_course18` `s` join `main`.`zhengh_coursegpa18` `c`) join `main`.`zhengh_student18` `z`)
         join `main`.`zhengh_adclass18` `ad`)
where ((`main`.`c`.`zh_Cno18` = `s`.`zh_Cno18`) and (0 <> `main`.`c`.`zh_Score`) and
       (`main`.`c`.`zh_Sno18` = `z`.`zh_Sno18`) and (`ad`.`zh_Classno18` = `z`.`zh_Classno18`))
group by `main`.`c`.`zh_Sno18`;




create view Zhengh_admin_Student18
as select s.zh_Sno18,s.zh_Sname18,s.zh_Ssex18,s.zh_Sage18,m.zh_Mno18,a.zh_Classname18,s.zh_Adr18,学期,均绩
from zhengh_student18 S,zhengh_averageGpa18 G,zhengh_adclass18 A,zhengh_major18 M
where s.zh_Classno18=a.zh_Classno18
and s.zh_Sno18=g.学号
and m.zh_Mno18=a.zh_Mno18