import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'

const routes = [
  {
    path: '/',
    name: '高校成绩管理系统',
    component: Home
  },
  {
    path: '/admin',
    name: 'Admin',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/Admin.vue')
  },
  {
    path: '/AvgCourseScore',
    name:'AvgCourseScore',
    component:()=> import('../views/AvgCourseScore.vue')
  },
  {
    path: '/ScoreRank',
    name:'ScoreRank',
    component:()=> import('../views/ScoreRank')
  },
  {
    path: '/ScoreStatisticPerYear',
    name:'ScoreStatisticPerYear',
    component:()=> import('../views/ScoreStatisticPerYear')
  },
  {
    path: '/Statistic',
    name:'Statistic',
    component:()=> import('../views/Statistic')
  },
  {
    path:'/DataEntry',
    name:'DataEntry',
    component:()=> import('../views/DataEntry')
  },
  {
    path:'/ClassCourseQuery',
    name:'ClassCourseQuery',
    component:()=> import('../views/ClassCourseQuery')
  },
  {
    path:'/TeacherCourseQuery',
    name:'TeacherCourseQuery',
    component:()=> import('../views/TeacherCourseQuery')
  },
  {
    path:'/StudentCourseQuery',
    name:'StudentCourseQuery',
    component:()=> import('../views/StudentCourseQuery')
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
