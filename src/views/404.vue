<template>
  <n-result status="404" title="404 资源不存在" description="生活总归带点荒谬">
    <template #footer>
      <n-button><router-link to="/ClassCourseQuery">找点乐子吧</router-link></n-button>
      
    </template>
  </n-result>
</template>
<style scoped>
a{
  text-decoration: none;
  color:black;
}
</style>
<script>
import {NResult,NButton} from 'naive-ui'
export default {
    components:{NResult,NButton}
}
</script>