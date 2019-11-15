<template>
  <div id="app">
    <!-- <router-view> -->
      <h1>{{ titleName }}</h1><br>
        <table class='table'>
          <thead>
            <tr>
              <th class='sort_column_header' data-sort-param-name='sort'>
                <a>
                  <span>プロジェクト名</span>
                  <i class='tooltip-n tworows' title='降順で並べ替え'><b class='icon_arrow-car-down'></b></i>
                </a>
              </th>

              <th class='sort_column_header' data-sort-param-name='sort'>
                <a>
                  <span>売上金額</span>
                  <i class='tooltip-n tworows' title='降順で並べ替え'><b class='icon_arrow-car-down'></b></i>
                </a>
              </th>

              <th class='sort_column_header' data-sort-param-name='sort'>
                <a>
                  <span>担当部署</span>
                  <i class='tooltip-n tworows' title='降順で並べ替え'><b class='icon_arrow-car-down'></b></i>
                </a>
              </th>

              <th class='sort_column_header' data-sort-param-name='sort'>
                <a>
                  <span>開始日</span>
                  <i class='tooltip-n tworows' title='降順で並べ替え'><b class='icon_arrow-car-down'></b></i>
                </a>
              </th>

              <th class='sort_column_header' data-sort-param-name='sort'>
                <a>
                  <span>終了日</span>
                  <i class='tooltip-n tworows' title='降順で並べ替え'><b class='icon_arrow-car-down'></b></i>
                </a>
              </th>
              <th></th>
            </tr>
          </thead>
          <tbody>
              <tr v-for="project in projects" :key="project.id">
                <th>{{ project.project_name }}</th>
                <th>{{ project.sales_amount | numberWithDelimiter }}</th>
                <th>{{ project.working_group }}</th>
                <th>{{ project.start_date }}</th>
                <th>{{ project.end_date }}</th>
                <th><router-link :to="{name: 'ProjectUpdate', params: {id: project.id}}" class="btn btn-info">編集</router-link></th>
              </tr>
          </tbody>
        </table><br><br>
      </div>
    <!-- </router-view> -->
</template>

<script>
  import axios from 'axios'
  export default {
    data: function () {
      return {
        titleName: 'プロジェクト一覧',
        projects: []
      }
    },
    methods: {
      setProjects: function(){
        alert(this.$i18n.tc('message.hello'))
        axios.get('api/v1/projects.json')
          .then(response => {
            for(var i = 0; i < response.data.projects.length; i++) {
              this.projects.push(response.data.projects[i])
            }
          });
      }
    },
    mounted: function(){
      this.setProjects();
    },
    filters: {
      numberWithDelimiter: function (value) {
        if (!value) {
          return '0'
        }
        return value.toString().replace(/(\d)(?=(\d{3})+$)/g, '$1,')
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
