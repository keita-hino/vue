<template>
  <div id="app">
    <!-- <router-view> -->
      <h1>{{ titleName }}</h1><br>
        <button @click="deleteProject" type="button" class="form_control btn btn-danger form_button delete pull-right">削除</button>
        <!-- <%= button_to '削除', project_path(@project,updated_at: @project.updated_at), method: :delete ,id: 'delete_button',class: 'form_control btn btn-danger form_button delete pull-right'%><br><br> -->
        <form @submit.prevent="updateProject">
            <!-- <div v-if="errors.length != 0">
              <ul v-for="e in errors" :key="e">
                <li><font color="red">{{ e }}</font></li>
              </ul>
            </div> -->
            <div>
              <label>プロジェクト名</label>
              <input v-model="project.project_name" type="text" class="form_control form_element">
            </div>
            <div>
              <label>売上金額</label>
              <input v-model="project.sales_amount" type="text" class="form_control form_element">
            </div>
            <div>
              <label>開始日</label>
              <input v-model="project.start_date" type="date" class="form_control form_element">
            </div>
            <div>
              <label>終了日</label>
              <input v-model="project.end_date" type="date" class="form_control form_element">
            </div>
            <router-link to="/" class='form_control btn btn-default form_button'>戻る</router-link>
            <button type="submit" class="form_control btn btn-success form_button pull-right">更新</button>
          </form>
    <!-- </router-view> -->
  </div>
</template>

<script>
  import axios from 'axios'
  import { csrfToken } from 'rails-ujs'
  axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

  export default {
    data: function () {
      return {
        titleName: 'プロジェクト編集',
        project: {
          project_name: '',
          sales_amount: '',
          start_date: '',
          end_date: ''
        }
      }
    },
    methods: {
      setProject: function(){
        axios.get('api/v1/projects/' + this.$route.params.id + '/edit.json')
          .then(response => {
            this.project = response.data
          });
      },
      updateProject: function(){
        axios
          .patch('api/v1/projects/' + this.$route.params.id, this.project)
          .then(response => {
            this.$router.push('/', () => {}, () => {});
        });
      },
      deleteProject: function(){
        axios
          .delete('/api/v1/projects/' + this.$route.params.id, this.project.id)
          .then(response => {
            this.$router.push('/', () => {}, () => {});
        });
      }
    },
    mounted: function(){
      this.setProject();
    }
  }
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
