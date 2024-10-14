<template lang="pug">
  main
    div(class="layout")
      div(class="layout-header")
        el-icon(
          style="margin-left: 10px" 
          :size="32" 
          @click="sider_hidden = !sider_hidden"
        )
          Operation
      div(
        class="layout-asider" 
        :class="[sider_hidden ? 'hidden' : '']"
      )
        div Logo
      div(class="layout-content")
        div nice to meet u
</template>

<script lang="ts" setup>
import {
  ref
} from 'vue'

const sider_hidden = ref(false)
</script>

<style lang="scss" scoped>
/* animation */
@keyframes slideInLeft {
  0% {}
  100%{
    transform: translateX(-256px);
  }
}

@keyframes slideOutLeft {
  0% {}
  100% {
    
  }
}

main {
  background: #FFFFFF;
}

.layout {
  min-width: 100vw;
  min-height: 100vh;
  display: grid;
  grid-template-columns: max-content 1fr;
  grid-template-rows: 50px 1fr;

  .layout-asider {
    background: green;
    grid-column: 1;
    grid-row: 1 / 3;
    width: 256px;

    transition: .3s ease-in-out;

    &.hidden {
      width: 0;

      >* {
        
      }
    }
  }

  .layout-header {
    background: red;
    grid-row: 1;
    grid-column: 2;

    display: flex;
    align-items: center;
  }

  .layout-content {
    background: blue;
    grid-row: 2;
    grid-column: 2;
  }
}
</style>