create trigger Zhengh_score_tri18
    after insert on zhengh_studentscore18
    for each row
    if new.zh_Score>=60 then
        update zhengh_student18
            set zh_Scredits18=zh_Scredits18+
                              (
                                  select zh_Credit18
                                  from zhengh_course18
                                  where new.zh_Cno18=zhengh_course18.zh_Cno18
                                  )
        where zh_Sno18=new.zh_Sno18;
    end if;

create trigger Zhengh_updatescore_tri18
    after update on zhengh_studentscore18
    for each row
    if new.zh_Score>=60 and OLD.zh_Score<60 then
        update zhengh_student18
            set zh_Scredits18=zh_Scredits18+
                              (
                                  select zh_Credit18
                                  from zhengh_course18
                                  where new.zh_Cno18=zhengh_course18.zh_Cno18
                                  )
        where zh_Sno18=new.zh_Sno18;
    end if;

create trigger Zhengh_scoredelte_tri18
    after delete on zhengh_studentscore18
    for each row
    if old.zh_Score>=60 then
        update zhengh_student18
            set zh_Scredits18=zh_Scredits18-
                              (
                                  select zh_Credit18
                                  from zhengh_course18
                                  where OLD.zh_Cno18=zhengh_course18.zh_Cno18
                                  )
        where zh_Sno18=OLD.zh_Sno18;
    end if;