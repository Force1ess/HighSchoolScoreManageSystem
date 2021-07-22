<template>
  <n-space vertical>
    <Header />
    <n-card title="班级排课查询">
      <n-space vertical>
        <n-grid x-gap="12" :cols="12">
          <n-gi>
            <span style="text-align: center; font-size: 1.5em">班级号</span>
          </n-gi>
          <n-gi span="2">
            <n-input v-model:value="id" placeholder="请输入班级号"></n-input>
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

import { h } from "vue";
import {
  NDataTable,
  NText,
  NSpace,
  NButton,
  NGrid,
  NGi,
  NCard,
  useMessage,
  NInput,
} from "naive-ui";
import ClassSelect from "../components/ClassSelect.vue";
export default {
  components: {
    NDataTable,
    ClassSelect,
    NSpace,
    NButton,
    NGrid,
    NGi,
    NCard,
    Header,
    NInput,
  },
  data() {
    return {
      id: "",
      columns: [
        {
          title: "课程编号",
          key: "zh_Cno18",
        },
        {
          title: "课程名",
          key: "zh_Cname18",
        },
        {
          title: "学时",
          key: "zh_Hours18",
        },
        {
          title: "考试或考查",
          key: "zh_Way18",
        },
      ],
      allData: [],
      data: [],
      pagination: {
        pageSize: 10,
      },
    };
  },
  methods: {
    async query() {
      this.data = [];
      for (let i = 0; i < this.allData.length; i++) {
        if(this.allData[i].zh_Classno18==this.id)
        {
          this.data.push(this.allData[i])
        }
      }
    }
  },
    async mounted() {
      let f = await fetch("http://localhost:3000/classcourse");
      this.allData = await f.json();
    },
};
</script>