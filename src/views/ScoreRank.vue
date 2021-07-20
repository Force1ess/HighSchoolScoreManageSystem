<template>
  <Header/>
    <n-space vertical style="margin:2em">
        <n-card title="绩点排名" size='huge'>
                <n-grid  :cols="12">
                <n-gi>
                        <span style="text-align: center;font-size: 1.5em;">专业</span>
                </n-gi>
                <n-gi span="2">
                    <n-tree-select :options="options" placeholder="请选择" />
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
import {NCard,NButton,NSpace,NDataTable,NGrid,NGi,NTreeSelect } from  'naive-ui'
import { ref } from 'vue'

const createColumns = () => {
  return [
    {
      title: '排名',
      key: '排名'
    },
    {
      title: '学号',
      key: '学号'
    },
    {
      title: '姓名',
      key: '姓名'
    },
    {
      title: '平均绩点',
      key: '平均绩点'
    }
  ]
}
import Header from "../components/Header.vue"

export default {
    data () {
    return {
      courseId: null
    }
  },
  components:
  {
      NCard,NButton,NSpace,NDataTable,NGrid,NGi,NTreeSelect,Header
  }
  ,
  setup () {
    const data = ref([])
    return {
      data,
      columns: createColumns(),
      options: [
        {
          label: '计算机学院',
          key: '计算机学院',
          children: [
            {
              label:
                "计算机科学与技术",
              key: "计算机科学与技术"
            },
            {
              label: '软件工程',
              key: '软件工程'
            },
            {
              label: '数媒',
              key: '数媒'
            },
            {
              label: "大数据",
              key: "大数据"
            }
          ]
        },
        {
          label: '管理学院',
          key: '管理学院',
          children: [
            {
              label: '财务管理',
              key: '财务管理'
            },
            {
              label: '信息管理',
              key: '信息管理'
            },
          ]
        }
      ]
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
