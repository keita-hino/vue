import Vue from 'vue'
import ProjectForm from '../components/project_form.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(ProjectForm)
  }).$mount()
  document.body.appendChild(app.$el)

  console.log(app)
})