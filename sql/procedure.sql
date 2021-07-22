create procedure Zhengh_InsertCourses(
in zh_Cno18 char(10),
in zh_Cname18 char(10),
in zh_Term18 char(20),
in zh_Hours int,
in zh_way char(10),
in zh_credit int)
begin
insert zhengh_course18 values
    (zh_Cno18,zh_Cname18,zh_Term18,zh_Hours18,zh_Credit18,zh_Way18);
end
call Zhengh_updateCredit18('01');
create procedure Zhengh_updateCredit18(in zh_sno char(10))
begin
    update zhengh_student18
        set zh_Scredits18 = (
            select sum(zh_Credit18)
            from zhengh_course18
            where zh_Cno18 in
            (
                select zhengh_studentscore18.zh_Cno18
                from zhengh_studentscore18
                where zh_sno=zhengh_studentscore18.zh_Sno18
                and zh_Score >= 60
                )
            );
end;
