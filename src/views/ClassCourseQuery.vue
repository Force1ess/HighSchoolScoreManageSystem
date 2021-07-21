<template>
  <n-space vertical>
    <Header/>
    <n-card title="班级排课查询">
      <n-space vertical>
        <n-grid x-gap="12" :cols="3">
          <n-gi>
            <class-select v-on:change="selectClass = $event" />
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
          :loading="inloading"
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
} from "naive-ui";
import ClassSelect from "../components/ClassSelect.vue";

async function getClassCourse(cl) {
  let res = await fetch(`https://localhost:5001/api/class:${cl}/course:all`);
  let j = await res.json();
  return j;
}

export default {
  components: {
    NDataTable,
    ClassSelect,
    NSpace,
    NButton,
    NGrid,
    NGi,
    NCard,
    Header
  },
  data() {
    return {
      selectClass: null,
      inloading: false,
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
          title: "任课教师",
          key: "teacher",
          render(row) {
            const tags = row.teacher.map((tagKey) => {
              return h(
                NText,
                {
                  style: {
                    marginRight: "6px",
                  },
                },
                {
                  default: () => tagKey,
                }
              );
            });
            return tags;
          },
        },
        {
          title: "开设学期",
          key: "semester",
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
          title: "考试或考查",
          key: "examMethod",
        },
      ],
      data: [],
      pagination: {
        pageSize: 10,
      },
    };
  },
  setup() {
    const msg = useMessage();
    return {
      warn(m) {
        msg.warning(m);
      },
      error(m) {
        msg.error(m);
      },
    };
  },
  methods: {
    async query() {
      if (this.selectClass === null) {
        this.warn("请先选择班级");
      } else {
        this.inloading = true;
        getClassCourse(this.selectClass)
          .then((d) => {
            this.data = d;
            this.inloading = false;
          })
          .catch(() => {
            this.error("获取数据失败");
            this.inloading = false;
          });
      }
    },
  },
};
</script>