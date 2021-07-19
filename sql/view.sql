#成绩视图
create view Zhengh_ScoresView18(姓名,学号,课程编号,课程名,成绩,学期)
as select s.zh_Sname18,s.zh_Sno18,C.zh_Cno18,C.zh_Cname18,Sco.zh_Score,C.zh_Term18
from Zhengh_StudentScore18 Sco,Zhengh_Course18 C,zhengh_student18 S
where Sco.zh_Sno18 = S.zh_Sno18
and Sco.zh_Cno18 = C.zh_Cno18;
#课程平均成绩
create view Zhengh_CourseAvgScore18(课程编号,平均成绩)
as
select S.zh_Cno18,avg(s.zh_Score)
from zhengh_studentscore18 S
group by  zh_Cno18;

create view Zhengh_Course_Statistic(姓名,学号,学期,课程名,课程编号,学时,考核方式)
as
select S.zh_Sname18,S.zh_Sno18,C.zh_Term18,C.zh_Cname18,C.zh_Cno18,C.zh_Credit18,C.zh_Way18
from zhengh_studentscore18 Sco,zhengh_course18 C,zhengh_student18 S
where Sco.zh_Sno18=S.zh_Sno18
and Sco.zh_Cno18= C.zh_Cno18;
#学生课程学分统计
create view Zhengh_TeacherCourse18(教师编号,教师姓名,课程编号,课程名,班级编号,班级名,学时,学分)
as
select T.zh_Tno18,T.zh_Tname18,c.zh_Cno18,c.zh_Cname18,class.zh_Classno18,c.zh_Cname18,c.zh_Hours18,c.zh_Credit18
from zhengh_teacher18 T,zhengh_course18 C,zhengh_teachingclass18 teach,zhengh_adclass18 class
where
teach.zh_Cno18=C.zh_Cno18
and teach.zh_Tno18 = t.zh_Tno18;
#教师任课情况查询视图
create view Zhengh_TeacherCourseView18
as
select t.zh_Tno18,t.zh_Tname18,c.zh_Cno18,c.zh_Cname18,class.zh_Classno18,class.zh_Classname18 ,C.zh_Hours18,c.zh_Credit18
from zhengh_teacher18 T,zhengh_course18 C,zhengh_adclass18 class,zhengh_teachingclass18 teach
where teach.zh_Cno18 = C.zh_Cno18
and teach.zh_Tno18 = t.zh_Tno18;
#班级开课查询视图
create view Zhengh_ClassCourse18
as
select
from zhengh_course18,zhengh_adclass18;
#地区学生统计视图
create view ZHengh_StudentSource18
as
select zh_Adr18 生源地 , count(zh_Sno18) 地区人数
from zhengh_student18
group by zh_Adr18;

create
