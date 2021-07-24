<template>
  <n-space vertical>
    <Header/>
    <n-card title="学生成绩查询">
      <n-space vertical>
        <n-grid x-gap="12" :cols="8">
          <n-gi>
          <span style="text-align: center; font-size: 1.5em">学号</span>
          </n-gi>
          <n-gi :span="2">
            <n-input
            v-model:value="id"
            placeholder="请输入学号"
            ></n-input>
          </n-gi>
          <n-gi>
            <n-button @click="query">查询</n-button>
          </n-gi>
          <n-gi offset='2'>
            <n-statistic label="已修学分" :value="credit"></n-statistic>
          </n-gi>
        </n-grid>
        <n-data-table
          :row-key="(c) => c.id"
          :columns="columns"
          :data="data"
          :pagination="pagination"
        />
      </n-space> </n-card
  ></n-space>
</template>

<script>
import Header from "../components/Header.vue";

import { h } from "vue";
import {
  NDataTable,
  NText,
  NSpace,
  NButton,
  NGrid,
  NGi,
  NCard,
  NStatistic,
  useMessage,
  NInput
} from "naive-ui";
import StudentSelect from "../components/StudentSelect.vue";
export default {
  components: {
    NDataTable,
    StudentSelect,
    NSpace,
    NButton,
    NGrid,
    NGi,
    NCard,
    NStatistic,
    Header,
    NInput
  },
  data() {
    return {
      id:'',
      columns: [
        {
          title: "课程编号",
          key: "id",
        },
        {
          title: "课程名",
          key: "name",
        },
        {
          title: "开设学期",
          key: "semester",
        },
        {
          title: "成绩",
          key: "score",
        },
        
      ],
      allData:[],
      data: [],
      pagination: {
        pageSize: 10,
      },
    credit:0
    };
  },
  methods: {
    async query() {
      this.credit=0;
      this.data=[];
      for(let i = 0; i < this.allData.length; i++)
      {
        if(this.allData[i].sid==this.id)
        {
          this.data.push(this.allData[i])
          console.log(this.allData[i].zh_Credit18)

        }
      }
      let mid = await fetch('http://localhost:3000/credit');
      mid = await mid.json();
      console.log(mid)
      for(let i = 0; i <mid.length; i++)
      {
        if(mid[i].sno==this.id)
        {
          this.credit=mid[i].credit;
        }
      }
    },
  },
  async mounted() {
    let f = await fetch('http://localhost:3000/studentcourse');
    this.allData = await f.json();
    console.log(this.allData)
  }
};
</script>