<template>
  <Header />
  <n-space vertical style="margin: 2em">
    <n-card title="生源地统计" size="huge"> </n-card>
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
import { NCard, NSpace, NDataTable } from "naive-ui";
const createColumns = () => {
  return [
    {
      title: "生源地（邮编）",
      key: "add",
    },
    {
      title: "人数",
      key: "count",
    },
  ];
};
const getdata = async () => {
  let table;
  let f = await fetch("http://localhost:3000/place", { mode: "cors" }); 
  table = await f.json();
  let d = [];
  for (let i = 0; i < table.length; i++) {
    d.push({
      key: i,
      add: table[i].生源地,
      count: table[i].地区人数,
    });
  }
  return d;
};
getdata();
export default {
  components: {
    NCard,
    NSpace,
    NDataTable,
    Header,
  },
  data() {
    return {
      data: [],
      columns: createColumns(),
    };
  },
  async mounted() {
    this.data = await getdata();
  },
};
</script>