<template>
  <Header />
  <n-space vertical style="margin: 2em">
    <n-card title="绩点排名" size="huge">
      <n-grid :cols="12">
        <n-gi>
          <span style="text-align: center; font-size: 1.5em">专业</span>
        </n-gi>
        <n-gi span="2">
          <n-tree-select :options="options" placeholder="请选择" v-model:value='v'/>
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
import {
  NCard,
  NButton,
  NSpace,
  NDataTable,
  NGrid,
  NGi,
  NTreeSelect} from "naive-ui";

const createColumns = () => {
  return [
    {
      title: "排名",
      key: "rank",
    },
    {
      title: "学号",
      key: "id",
    },
    {
      title: "姓名",
      key: "name",
    },
    {
      title:'班级名',
      key:'classname'
    },
    {
      title: "平均绩点",
      key: "gpa",
    },
  ];
};
import Header from "../components/Header.vue";
import {ref } from "vue"
export default {
  data() {
    return {
      v:ref('计算机科学与技术'),
      allData:[],
      data:[],
      columns: createColumns(),
      options: [
        {
          label: "计算机学院",
          key: "计算机学院",
          children: [
            {
              label: "计算机科学与技术",
              key: "计算机科学与技术",
            },
            {
              label: "软件工程",
              key: "软件工程",
            },
            {
              label: "数媒",
              key: "数媒",
            },
            {
              label: "大数据",
              key: "大数据",
            },
          ],
        },
        {
          label: "管理学院",
          key: "管理学院",
          children: [
            {
              label: "财务管理",
              key: "财务管理",
            },
            {
              label: "信息管理",
              key: "信息管理",
            },
          ],
        },
      ],
    };
  },
  components: {
    NCard,
    NButton,
    NSpace,
    NDataTable,
    NGrid,
    NGi,
    NTreeSelect,
    ref,
    Header,
  },
  async mounted() {
    let table;
    let f = await fetch("http://localhost:3000/scorerank", { mode: "cors" });
    table = await f.json();
    for(let i = 0; i < table.length; i++)
    {
      table[i].rank=i;
    }
    this.allData = table
    console.log(table)
  },
  methods: {
    submit() {
        this.data=[]
        console.log(this.options)
        for(let i = 0; i < this.allData.length; i++)
        {
          if(this.allData[i].classname.startsWith(this.v))
          {
            console.log(1)
            this.data.push(this.allData[i])
          }
        }
    },
  },
};
</script>
