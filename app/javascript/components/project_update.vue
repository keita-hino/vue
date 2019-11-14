<template>
  <div id="app">
    <!-- <router-view> -->
      <h1>{{ titleName }}</h1><br>
          <form @submit.prevent="createProject">
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
              <button type="submit" class="form_control btn btn-success form_button pull-right">登録</button>
            </form>
    <!-- </router-view> -->
  </div>
</template>

<script>
  import axios from 'axios'
  import { csrfToken } from 'rails-ujs'
  axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()
  // alert(this.$router.params.id)
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
        // TODO:40の部分はparamsから取得するように修正
        axios.get('api/v1/projects/40/edit.json')
          .then(response => {
            for(var i = 0; i < response.data.projects.length; i++) {
              this.projects.push(response.data.projects[i])
            }
          });
      },
      updateProject: function(){
        axios
          .post('api/v1/projects.json', this.project)
          .then(response => {
            this.$router.push('/', () => {}, () => {});
        });
      }
    }
  }
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
