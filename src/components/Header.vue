<template>
  <n-page-header>
    <n-space></n-space>
    <template #title>
      <router-link to="/" style="font-weight: bold; font-size: 2rem;margin:1.5rem;"> 高校成绩管理系统 </router-link>
    </template>
        <n-grid rows="1" cols="24">
        <n-gi span='2'><router-link to="/DataEntry"> 数据录入 </router-link></n-gi>
        <n-gi span='2'><router-link to="/ClassCourseQuery"> 班级排课查询 </router-link></n-gi>
        <n-gi span='2'><router-link to="/TeacherCourseQuery"> 教师任课查询 </router-link></n-gi>
        <n-gi span='2'><router-link to="StudentCourseQuery"></router-link>学生成绩查询</n-gi>
        <n-gi span='2'><router-link to="/ScoreStatisticPerYear">学年成绩统计</router-link></n-gi>
        <n-gi span='2'><router-link to="/ScoreRank">学生成绩排名</router-link></n-gi>
        <n-gi span='3'><router-link to="/AvgCourseScore">课程平均成绩统计</router-link></n-gi>
        <n-gi span='2'><router-link to="/Statistic">学业情况查询</router-link></n-gi>
        </n-grid>
  </n-page-header>
</template>

<script>
import { NPageHeader,NGrid,NGi,NSpace} from "naive-ui";
export default {
  components: {
    NPageHeader,NGrid,NGi,NSpace
  },
};
</script>

<style>
a {
  text-decoration: none;
  color: inherit;
}
</style>