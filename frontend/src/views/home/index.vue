<template lang="pug">
  main
    userHome(
      v-if="pg_type == 1"
    )
</template>

<script lang="ts" setup>
import {
  onMounted,
  ref
} from 'vue'

import userHome from './components/user-home.vue'

import { useAuthorizationStore } from '@/stores/authorization';

// common
const authorization_store = useAuthorizationStore()
const authorization = authorization_store.authorization

// data
const pg_type = ref(0)

onMounted(() => {
  console.debug(authorization_store.authorization)
  pg_type.value = authorization.auth_level
})
</script>

<style lang="scss" scoped></style>