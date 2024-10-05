<template lang="pug">
  main
    el-form(
      ref="form_ref"
      label-width="auto"
      :model="form"
      :rules="form_rules"
    )
      el-form-item(
        label="用户名"
        prop="username"
      )
        el-input(
          v-model="form.username"
          placeholder="请输入用户名"
        )
      el-form-item(
        label="密码"
        prop="password"
      )
        el-input(
          v-model="form.password"
          placeholder="请输入密码"
          type="password"
        )
      div(class="btns")
        el-button(
          type="primary"
          @click="submit(form_ref)"
        ) 登录
        el-button(
          type="default"
          @click="switch_pg"
        ) 注册
</template>

<script lang="ts" setup>
import {
  ref,
  reactive,
  defineEmits,
} from 'vue'
import { useRouter } from 'vue-router'
import type {
  FormRules,
  FormInstance,
} from 'element-plus'
import {
  ElMessage
} from 'element-plus'

import {
  useAuthorizationStore
} from '@/stores/authorization'

// common
interface Form {
  username: string,
  password: string,
}
const router = useRouter()
const emits = defineEmits(['switch_pg'])
const authorization_store = useAuthorizationStore()
const authorization = reactive(authorization_store.authorization)

// data
const form = reactive<Form>({
  username: '',
  password: '',
})
const form_ref = ref<FormInstance>()
const form_rules = reactive<FormRules<Form>>({
  username: [
    { required: true, message: '请输入用户名', trigger: 'blur' },
    { min: 3, max: 20, message: '长度需在 3 到 20 个字符', trigger: 'blur' }
  ],
  password: [
    { required: true, message: '请输入密码', trigger: 'blur' },
    { min: 6, max: 16, message: '长度需在 6 到 16 个字符', trigger: 'blur' }
  ]
})

// methods
function switch_pg() {
  emits('switch_pg', 1)
}
async function submit(form_ref: FormInstance | undefined) {
  if (!form_ref) return
  await form_ref.validate((valid) => {
    if (valid) {
      authorization.authorized = true
      authorization.auth_level = 1
      authorization.authorized_actions = 0
      authorization.token = '1234567890'
      authorization_store.update_authorization(authorization)
      console.log('submit!')
      ElMessage({
        message: '登录成功',
        type: 'success',
      })
      setTimeout(() => {
        router.push('/')
      }, 2000)
    } else {
      console.log('error submit!')
    }
  })
}
</script>

<style lang="scss" scoped>
.btns {
  display: flex;
  justify-content: center;
}
</style>