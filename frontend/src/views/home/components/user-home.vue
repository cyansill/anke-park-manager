<template lang="pug">
  main
    div(class="nav")
      div(class="logo-title") LOGO
      ul
        li Home
        li User
        li About
    div(class="container")
      div(class="title-panel")
        div 安客停车场连锁管理系统
        span 数智赋能解决停车难题
      el-carousel(class="carousel")
        el-carousel-item(v-for="item in 4" :key="item")
          img(
            src="https://wallpapercave.com/wp/wp5836968.jpg"
            object-fit="contain"
          )
      div(class="quick-start-panel")
        div(
          v-for="item in 16"
          class="quick-start-item"
        )
      div(class="gap")
</template>

<script lang="ts" setup></script>

<style lang="scss" scoped>
main {
  background: #FFFFFF;
  font-family: 'Microsoft YaHei', 'Concolas', monospace;
}

.gap {
  height: 1rem;
}

.nav {
  position: fixed;
  top: 0;
  width: 100vw;
  height: 50px;
  box-sizing: border-box;
  display: flex;
  justify-content: center;
  align-items: center;
  background: #464E47;
  color: #F1FFFA;
  padding: 0 1rem;
  font-family: 'Consolas', monospace;
  z-index: 970;

  .logo-title {
    padding: 0.5rem;
    font-size: 1.2rem;
    font-weight: 600;
    margin-right: 3rem;
  }

  ul {
    display: flex;
    list-style: none;
    align-items: center;
    height: 100%;

    li {
      // display: block;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 0.5rem 0.5rem;
      font-size: 1.2rem;
      height: 100%;
      line-height: 100%;
      width: 70px;
      box-sizing: border-box;

      cursor: pointer;

      &:hover {
        background: #F1FFFA;
        color: #464E47;
      }
    }
  }
}

.container {
  margin-top: 50px;
  margin-inline: 10vw;
  background-color: #CCCCCC;
  height: auto;
  min-height: 100vh;
  box-sizing: border-box;
}

.title-panel {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  background: #F1FFFA;
  // margin: 1rem 1rem;
  margin: 0 1rem 1rem 1rem;
  padding: 1rem 1rem;
  transform: translate(0, 1rem);

  div {
    font-size: 2.2rem;
    font-weight: 600;
    margin-bottom: .5rem;
  }

  span {
    font-size: 1.5rem;
  }
}

.carousel {
  margin: 2rem 1rem 1rem 1rem;
  background: #FFFFFF;
  height: 250px;

  img {
    width: 100%;
    height: 100%;
  }
}

.quick-start-panel {
  margin: 0 1rem 1rem 1rem;
  display: flex;
  flex-wrap: wrap;
  gap: 10px;

  .quick-start-item {
    background: #464E47;
    min-height: 95px;
    flex: 1 0 24%;
  }
}

@media screen and (max-width: 425px) {
  .nav {
    top: auto;
    bottom: 0;
    justify-content: flex-start;
    padding: 0;

    .logo-title {
      display: none;
    }

    ul {
      flex: 1;

      li {
        flex: 1;
        width: auto;
      }
    }
  }

  .container {
    margin: 0;
    margin-bottom: 50px;
  }

  .title-panel {
    div {
      font-size: 1.5rem;
    }

    span {
      font-size: 1.1rem;
    }
  }

  .carousel {
    height: 180px;
  }

  .quick-start-panel {
    .quick-start-item {
      flex: 1 0 48%;
    }
  }
}
</style>