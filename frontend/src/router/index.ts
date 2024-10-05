import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/auth',
      name: 'auth',
      redirect: '/auth/signin'
    },
    {
      path: '/auth/:path(signin|signup)',
      name: 'auth-path',
      component: () => import("@/views/auth/index.vue")
    },
    {
      path: '/',
      name: 'home',
      component: () => import("@/views/home/index.vue")
    },
    {
      path: '/404',
      name: '404',
      component: () => import("@/views/public/404.vue")
    },
    {
      path: '/:pathMatch(.*)*',
      name: 'not-found',
      redirect: '/404'
    }
  ]
})

export default router
