<template>
  <div>
    <Header/>
      <div class='container'>
        <router-view></router-view>
      </div>
    <Footer/>
  </div>
</template>

<script>
import Vue from 'vue'
import VueRouter from 'vue-router'

import Header from './components/header.vue'
import Footer from './components/footer.vue'

import Projects from './components/projects.vue'
import ProjectForm from './components/project_form.vue'

const router = new VueRouter({
  routes: [
    { path: '/',
      component: Projects
    },
    { path: '/projects/new',
      component: ProjectForm
    }
  ]
})

// ref. https://jp.vuejs.org/v2/guide/plugins.html#%E3%83%97%E3%83%A9%E3%82%B0%E3%82%A4%E3%83%B3%E3%81%AE%E4%BD%BF%E7%94%A8
Vue.use(VueRouter)

export default {
  components: {
    Header,
    Footer
  },
  router
}
</script>