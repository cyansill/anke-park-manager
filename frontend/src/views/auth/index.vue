<template lang="pug">
  main(class="full")
    div(class="center-box")
      div(class="sys-title") 安客停车场连锁管理系统
      signInBox(
        class="sign-box"
        @switch_pg="switch_pg"
        v-if="!curr_pg")
      signUpBox(
        class="sign-box"
        @switch_pg="switch_pg"
        v-else)
</template>

<script lang="ts" setup>
import {
  ref,
  reactive,
  onMounted
} from 'vue'
import { useRoute } from 'vue-router'

import signInBox from './components/signin-box.vue'
import signUpBox from './components/signup-box.vue'

// data
const curr_pg = ref(0)

// methods
function switch_pg(_fg: any) {
  console.debug("now switch")
  curr_pg.value ^= 1
}

// lifecycle
onMounted(() => {
  let path = useRoute().params.path ?? 'signin'
  curr_pg.value = path === 'signup' ? 1 : 0
})
</script>

<style lang="scss" scoped>
.full {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background: #464E47;

  .center-box {
    display: flex;
    flex-direction: column;
    flex-wrap: nowrap;
    align-items: center;
    width: 425px;
    height: auto;
    min-width: 300px;
    padding: 2rem 3rem;
    box-sizing: border-box;
    background: #F1FFFA;
    border-radius: 15px;

    .sys-title {
      font-size: 1.5rem;
      font-family: 'PingFang SC' 'Microsoft YaHei';
      font-weight: 600;
      margin-bottom: 18px;
    }

    .sign-box {
      width: 375px;
    }
  }
}

@media screen and (max-width: 425px) {
  .full {
    .center-box {
      width: 100vw;
      box-sizing: border-box;
      margin-inline: 10px;

      .sys-title {
        font-size: 1.1rem;
      }

      .sign-box {
        width: 275px;
      }
    }
  }
}
</style>