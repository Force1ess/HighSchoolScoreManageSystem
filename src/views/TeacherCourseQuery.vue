<template>
  <n-space vertical>
    <Header/>

    <n-card title="教师任课查询">
      <n-space vertical>
        <n-grid x-gap="12" :cols="8">
          <n-gi>
          <span style="text-align: center; font-size: 1.5em">教师号</span>
        </n-gi>
        <n-gi span="2">
          <n-input
            v-model:value="id"
            placeholder="请输入教师号"
            ></n-input>
        </n-gi>
          <n-gi>
            <n-button @click="query">查询</n-button>
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
import {
  NDataTable,
  NText,
  NSpace,
  NButton,
  NGrid,
  NGi,
  NCard,
  useMessage,
  NInput
} from "naive-ui";
import TeacherSelect from "../components/TeacherSelect.vue";
export default {
  components: {
    NDataTable,
    TeacherSelect,
    NSpace,
    NButton,
    NGrid,
    NGi,
    NCard,
    Header,
    NInput
  },
  data() {
    return {
      id:'',
      columns: [
        {
          title: "教师编号",
          key:'tno'
        },
        {
          title: "课程编号",
          key: "id",
        },
        {
          title: "课程名",
          key: "name",
        },
        {
          title: "任课教师",
          key: "teacher",
        },
        {
          title: "学时",
          key: "hours",
        },
        {
          title: "学分",
          key: "credit",
        },
        {
          title:'班级名',
          key:'classname'
        }
      ],
      data: [],
      allData: [],
      pagination: {
        pageSize: 10,
      },
    };
  },
  methods: {
    async query() {
      this.data=[]

      for(let i= 0;i<this.allData.length; i++)
      {
        if(this.allData[i].tno==this.id)
        {
          this.data.push(this.allData[i])
        }
      }
    },
  },
  async mounted() {
    let f = await fetch('http://127.0.0.1:3000/teachercourse');
    this.allData=await f.json();
  }
};
</script>