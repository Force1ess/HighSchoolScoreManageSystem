<template>
  <div style="padding: 2rem">
    <n-config-provider :locale="zhCN">
      <n-message-provider>
        <router-view />
      </n-message-provider>
    </n-config-provider>
  </div>
</template>

<script>
import { NMessageProvider, NConfigProvider,zhCN } from "naive-ui";
export default {
  name: "App",
  components: {
    NMessageProvider,
    NConfigProvider
  },
  setup() {
    return {
      zhCN
    }
  }
};
</script>

