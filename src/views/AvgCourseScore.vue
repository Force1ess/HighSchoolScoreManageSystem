<template>
  <Header />
  <n-space vertical style="margin: 2em">
    <n-card title="课程平均成绩查询" size="huge">
      <n-grid :cols="12">
        <n-gi>
          <span style="text-align: center; font-size: 1.5em">课程号</span>
        </n-gi>
        <n-gi span="2">
          <n-input
            v-model:value="courseId"
            type="input"
            placeholder="请输入课程号"
            autofocus="true"
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
      :columns="columns"
      :data="data"
    />
  </n-space>
</template>
<script>
import Header from "../components/Header.vue";

import {
  NInput,
  NCard,
  NButton,
  NSpace,
  NDataTable,
  NGrid,
  NGi,
} from "naive-ui";

const createColumns = () => {
  return [
    {
      title: "课程号",
      key: "cid",
    },
    {
      title: "课程名",
      key: "cname",
    },
    {
      title: "平均成绩",
      key: "avg",
    },
  ];
};
const getdata = async () => {
  let table;
  let f = await fetch("http://localhost:3000/courseavgscore", { mode: "cors" });
  table = await f.json();
  let d = [];
  for (let i = 0; i < table.length; i++) {
    d.push({
      key: i,
      cid: table[i].课程编号,
      cname: table[i].课程名,
      avg: table[i].平均成绩,
    });
  }
  return d;
};
export default {
  data() {
    return {
      courseId:'',
      data: [],
      columns: createColumns(),
      allData:[]
    };
  },
  async mounted() {
    this.allData = await getdata();
  },
  components: {
    NInput,
    NCard,
    NButton,
    NSpace,
    NDataTable,
    NGrid,
    NGi,
    Header,
  },
  methods: {
    submit() {
      let f = this.allData;
      this.data=[]
      for(let i =0;i<f.length;i++)
      {
        if(f[i].cid==this.courseId)
        {
          this.data.push(f[i])
        }
      }
    }
  },
};
</script>