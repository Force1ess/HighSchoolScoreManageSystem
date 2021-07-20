<template>
  <Header/>

    <n-space vertical style="margin:2em">
        <n-card title="学年绩点统计" size='huge'>
                <n-grid x-gap='10' :cols="12">
                    <n-gi>
                        <span style="text-align: center;font-size: 1.5em;">学号</span>
                    </n-gi>
                    <n-gi span="2">
                        <n-select v-model:value="value1" :options="options1" 
                        placeholder='请选择学年'
                        />
                    </n-gi>
                    <n-gi span="2">
                        <n-select v-model:value="value2" :options="options2" 
                        placeholder='请选择学期'/>
                    </n-gi>
                    <n-gi span="2">
                <n-input 
                v-model:value="courseId"
                type="input"
                placeholder="请输入学号"
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
import {NInput,NCard,NButton,NSpace,NDataTable,NGrid,NGi,NSelect } from  'naive-ui'
import { ref } from 'vue'
import Header from "../components/Header.vue"

const createColumns = () => {
  return [
    {
        title:'姓名',
        key:'姓名'
    },
    {
      title: '课程号',
      key: '课程号'
    },
    {
      title: '课程名',
      key: '课程名'
    },
    {
      title: '成绩',
      key: '成绩'
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
      NInput,NCard,NButton,NSpace,NDataTable,NGrid,NGi,NSelect,Header
  }
  ,
  setup () {
    const data = ref([])
    return {
      data,
      columns: createColumns(),
      value1: ref(null),
      value2: ref(null),
      options1: [
        {
          label: "2020~2021",
          value: '2020~2021',
        },
        {
          label: '2019~2020',
          value: '2019~2020'
        }],
        options2: [
        {
          label: "上",
          value: '上',
        },
        {
          label: '下',
          value: '下'
        }]
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