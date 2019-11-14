import Vue from 'vue'
import ProjectCreate from '../components/project_create.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(ProjectCreate)
  }).$mount()
  document.body.appendChild(app.$el)

  console.log(app)
})