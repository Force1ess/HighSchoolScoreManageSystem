<template>
    <n-card title="高校成绩管理系统" size='huge'>
      <label for="id">用户名
      <n-input id="id" name="id" v-model:value="id" placeholder="请输入用户名"  autofocus="true"/>
      </label>
      <label for="pass">密码
      <n-input id="pass" name="pass" placeholder="请输入密码" v-model:value="pass" />
      </label>
   <n-button type="primary" @click="jump()">
    <router-link to="/admin" style="text-decoration:none;color:white;">登陆</router-link>
     </n-button>
    </n-card>
</template>

<script>
import {NInput,NCard,NFormItem,NButton,NSpace } from  'naive-ui'
import {NMessageProvider} from 'naive-ui' 
export default {
  data () {
    return {
      id: null
    }
  },
  components:{
      NInput,NCard,NFormItem,NMessageProvider,NButton,NSpace
  },
}
</script>