<template>
  <n-space vertical>
    <Header/>
    <n-card title="学生成绩录入">
      <n-space vertical>
        <n-grid x-gap="12" :cols="12">
          <n-gi>
            <span style="text-align: center; font-size: 1.5em">课程号</span>
          </n-gi>
          <n-gi span="2">
            <n-input v-model:value="cid" placeholder="请输入课程号"></n-input>
          </n-gi>
          <n-gi>
            <span style="text-align: center; font-size: 1.5em">教师号</span>
          </n-gi>
          <n-gi span="2">
            <n-input v-model:value="tid" placeholder="请输入教师号"></n-input>
          </n-gi>
          <n-gi>
              <n-button @click="query">选择</n-button>
          </n-gi>
          <n-gi>
            <n-button @click="save">保存数据</n-button>
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
import { h } from "vue";
import {
  NDataTable,
  NSpace,
  NButton,
  NGrid,
  NGi,
  NCard,
  useMessage,
  NInputNumber,
  NInput
} from "naive-ui";
import CourseSelect from "../components/CourseSelect.vue";
import Header from "../components/Header.vue";
export default {
  components: {
    NDataTable,
    CourseSelect,
    NSpace,
    NButton,
    NGrid,
    NGi,
    NCard,
    Header,
    NInput,
    NInputNumber
  },
  data() {
    return {
      cid:'',
      tid:'',
      columns: [
        {
          title: "学号",
          key: "zh_Sno18",
        },
        {
          title: "姓名",
          key: "zh_Sname18",
        },
        {
          title: "成绩",
          key: "zh_Score",
          render(row) {
            return h(
              NInputNumber,
              {
                value: row.zh_Score,
                "onUpdate:value": (v) => (row.zh_Score = v),
                max: 100,
                min: 0,
              },
              null
            );
          },
        },
      ],
      data: [],
      allData: [],
      pagination: {
        pageSize: 10,
      },
    };
  },
  methods: {
    query() {
      this.data = []
      for(let i = 0; i < this.allData.length; i++)
      {
        if(this.allData[i].zh_Tno18==this.tid&&this.allData[i].zh_Cno18==this.cid)
        {
          this.data.push(this.allData[i])
        }
      }
    },
    save() {
      fetch(
        'http://localhost:3000/update',
        {
          method: "POST",
          body: JSON.stringify(this.data),
          headers: new Headers({
            "Content-Type": "application/json",
          }),
        }
      )
    },
  },
  async mounted() {
    let f = await fetch("http://localhost:3000/score");
    this.allData = await f.json();
  }
};
</script>