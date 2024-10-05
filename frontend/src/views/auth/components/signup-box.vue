<template lang="pug">
  main
    el-form(label-width="auto")
      el-form-item(
        label="用户名"
      )
        el-input(
          placeholder="请输入用户名"
        )
      el-form-item(
        label="密码"
      )
        el-input(
          placeholder="请输入密码"
          type="password"
        )
      el-form-item(
        label="密码"
      )
        el-input(
          placeholder="请重复输入密码"
          type="password"
        )
      div(class="btns")
        el-button(
          type="primary"
        ) 注册
        el-button(
          type="default"
          @click="switch_pg"
        ) 登录
</template>

<script lang="ts" setup>
import {
  defineEmits,
} from 'vue'

const emits = defineEmits(['switch_pg'])

function switch_pg() {
  emits('switch_pg', 1)
}
</script>

<style lang="scss" scoped>
.btns {
  display: flex;
  justify-content: center;
}
</style>