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
import Header from "../components/Header.vue"

const createColumns = () => {
  return [
    {
        title:'姓名',
        key:'姓名'
    },
    {
      title:'学号',
      key:'学号'
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
    },
    {
      title: '学期',
      key:'学期'
    }
  ]
}
export default {
    data () {
    return {
      data:[],
      courseId: null,
      allData:[],
      columns: createColumns(),
      value1: null,
      value2: null,
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
    };
  },
  components:
  {
      NInput,NCard,NButton,NSpace,NDataTable,NGrid,NGi,NSelect,Header
  },
  async mounted() {
    let f = await fetch("http://localhost:3000/ScoreStatisticPerYear", { mode: "cors" });
    this.allData = await f.json();
    console.log(this.allData)
  },  
  methods:
  {
    submit(){
      console.log(this.value2 , this.courseId)
      this.data=[]
      for(let i = 0; i < this.allData.length;i++) {
        if(this.allData[i].学期==this.value2 && this.courseId == this.allData[i].学号)
        {
          this.data.push(this.allData[i])
        }
      }
      console.log(this.data)
    }
  }
}
</script>