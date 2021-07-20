<template>
  <Header/>
    <n-space vertical style="margin:2em">
        <n-card title="学生所学课程及学分统计" size='huge'>
                <n-grid  :cols="12">
                    <n-gi>
                        <span style="text-align: center;font-size: 1.5em;">学号</span>
                    </n-gi>
                    <n-gi span="2">
                <n-input 
                v-model:value="courseId"
                type="input"
                placeholder="请输入学号"
                autofocus='true'
                />
                </n-gi>
                <n-gi>
            <n-button @click="submit()" type="primary">查询</n-button>
                </n-gi>
                </n-grid>
                
                
        </n-card>
    <n-data-table 
    align="center" 
    :bordered="false"
    :columns="columns" :data="data" />
    </n-space>
</template>
<script>
import {NInput,NCard,NButton,NSpace,NDataTable,NGrid,NGi } from  'naive-ui'
import { ref } from 'vue'
import Header from "../components/Header.vue"

const createColumns = () => {
  return [
    {
      title: '课程号',
      key: '课程号'
    },
    {
      title: '课程名',
      key: '课程名'
    },
    {
      title: '绩点',
      key: '绩点'
    },
    {
      title: '任课教师',
      key: '任课教师'
    },
    {
      title: '学分',
      key: '学分'
    }
  ]
  
}

export default {
    data () {
    return {
      courseId: null
    }
  },
  components:
  {
      NInput,NCard,NButton,NSpace,NDataTable,NGrid,NGi,Header
  }
  ,
  setup () {
    const data = ref([])
    return {
      data,
      columns: createColumns()
    }
  },
  methods:
  {
      run()
      {

      }
  }
}
</script>
