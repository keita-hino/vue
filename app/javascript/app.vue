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

Vue.use(VueRouter)

export default {
  components: {
    Header,
    Footer
  },
  router
}
</script>