<template>
      <n-card title="高校成绩管理系统" style="margin-top:8rem;">
    <svg xmlns="http://www.w3.org/2000/svg" style="color:#3DC578;width:5rem;" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M5 12H3l9-9l9 9h-2"></path><path d="M5 12v7a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2v-7"></path><path d="M9 21v-6a2 2 0 0 1 2-2h2a2 2 0 0 1 2 2v6"></path></g></svg>

      <n-grid  :cols="4">
        <n-gi offset="1">
          <span style="text-align: center;font-size: 1.5em;">用户名</span>
        </n-gi>
        <n-gi>
          <n-input id="id" name="id" v-model:value="id" placeholder="请输入用户名"  autofocus="true"/>
        </n-gi>
      </n-grid>
      <n-grid  :cols="4">
        <n-gi offset="1">
          <span style="text-align: center;font-size: 1.5em;">密码</span>
        </n-gi>
        <n-gi>
      <n-input id="pass" name="pass" placeholder="请输入密码" v-model:value="pass" />

        </n-gi>
      </n-grid>
   <n-button type="primary" @click="jump()">
    <router-link to="/admin" style="text-decoration:none;color:white;">登陆</router-link>
     </n-button>
    </n-card>
</template>
<script>
import {NInput,NCard,NButton,NGrid,NGi } from  'naive-ui'
export default {
  data () {
    return {
      id: null
    }
  },
  components:{
      NInput,NCard,NButton,NGrid,NGi
  },
}
</script>