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
            <n-button @click="query()" type="primary">查询</n-button>
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
      title:'学号',
      key:'id'
    },
    {
      title: '课程号',
      key: 'cid'
    },
    {
      title: '课程名',
      key: 'cname'
    },
    {
      title: '学分',
      key: 'credit'
    },
    {
      title:'学期',
      key:'term'
    },
    {
      title:'考核方式',
      key:'way'
    }
  ]
  
}

export default {
    data () {
    return {
      courseId: null,
      data:[],
      allData:[],
      columns: createColumns()
    }
  },
  methods:{
    query(){
      this.data=[];
      for(let i = 0; i <this.allData.length; i++) {
        if(this.courseId==this.allData[i].id) {
          this.data.push(this.allData[i])
        }
      }
    }
  },
  async mounted(){
    let f = await fetch("http://localhost:3000/statistic", { mode: "cors" });
    let table = await f.json();
    for(let i=0;i<table.length; i++)
    {
      this.allData.push(
        {
          key:i,
          id:table[i].学号,
          cid:table[i].课程编号,
          cname:table[i].课程名,
          credit:table[i].学时,
          term:table[i].学期,
          way:table[i].考核方式
        }
      )
    }
  },
  components:
  {
      NInput,NCard,NButton,NSpace,NDataTable,NGrid,NGi,Header
  }
}
</script>
