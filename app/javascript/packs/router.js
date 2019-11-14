import Vue from 'vue'
import VueRouter from 'vue-router';
import Projects from '../components/projects.vue'
import ProjectCreate from '../components/project_create.vue'
import ProjectUpdate from '../components/project_update.vue'

Vue.use(VueRouter);

const routes = [
  {path: '/', component: Projects, name: Projects},
  {path: 'projects/new', component: ProjectCreate, name: ProjectCreate},
  {path: '/projects/:id/edit',component: ProjectUpdate,name: 'ProjectUpdate'}
];

export default new VueRouter({ routes });