<template>
  <div id="app">
    <!-- <router-view> -->
      <h1>{{ titleName }}</h1><br>
        <form @submit.prevent="createProject">
          <div>
            <label>プロジェクト名</label>
            <input v-model="project.project_name" type="text" class="form_control form_element">
          </div>
          <div>
            <label>売上金額</label>
            <input v-model="project.sales_amount" type="text" class="form_control form_element">
          </div>
          <div>
            <label>担当部署</label>
            <select v-model="project.working_group" class='form_control form_element'>
              <option disabled value="">選択してください</option>
              <option value='develop'>開発</option>
              <option value='design'>デザイン</option>
              <option value='marketing'>マーケティング</option>
              <option value='sales'>営業</option>
            </select>
          </div>
          <div>
            <label>開始日</label>
            <input v-model="project.start_date" type="date" class="form_control form_element">
          </div>
          <div>
            <label>終了日</label>
            <input v-model="project.end_date" type="date" class="form_control form_element">
          </div>
          <div v-if="errors.length != 0">
            <div class="alert alert-danger">
              <ul v-for="e in errors" :key="e">
                <li><font color="red">{{ e }}</font></li>
              </ul>
            </div>
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

  export default {
    data: function () {
      return {
        titleName: 'プロジェクト登録',
        project: {
          project_name: '',
          sales_amount: '',
          start_date: '',
          end_date: ''
        },
        errors: ''
      }
    },
    methods: {
      createProject: function(){
        axios
          .post('api/v1/projects.json', this.project)
          .then(response => {
            this.$router.push('/', () => {}, () => {});
          })
          .catch(error => {
              if (error.response.data && error.response.data.errors) {
                this.errors = error.response.data.errors;
            }
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
