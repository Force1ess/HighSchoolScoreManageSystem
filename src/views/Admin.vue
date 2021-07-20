<template>
  <n-page-header>
    <template #title>
      <router-link to="/" style="font-weight: bold; font-size: 2rem"> 高校成绩管理系统 </router-link>
    </template>
        <router-link to="/data-entry"> 数据录入 </router-link>
        <router-link to="/class-course-query"> 班级排课查询 </router-link>
        <router-link to="/teacher-course-query"> 教师任课查询 </router-link>
        <router-link to="">学生成绩查询</router-link>
        <router-link to="/ScoreStatisticPerYear">学年成绩统计</router-link>
        <router-link to="/ScoreRank">学生成绩排名</router-link>
        <router-link  to="/AvgCourseScore">课程平均成绩统计</router-link>
        <router-link to="/Statistic">学业情况查询</router-link>
  </n-page-header>
</template>
<script>
import { NPageHeader} from "naive-ui";
export default {
  components: {
    NPageHeader,
  },
};
</script>

<style>
a {
  text-decoration: none;
  color: inherit;
}

</style>