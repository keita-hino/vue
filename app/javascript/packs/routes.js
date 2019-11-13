import Vue from 'vue'
import VueRouter from 'vue-router';
import Projects from '../projects.vue'
import ProjectForm from '../project_form.vue'

Vue.use(VueRouter);

const routes = [
  {path: '/', component: Projects},
  {path: 'projects/new', component: ProjectForm}
  ];

export default new VueRouter({ routes });