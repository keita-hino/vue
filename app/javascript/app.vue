<template>
  <div id="app">
    <p>{{ message }}</p><br>
    <div class='container'>
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
          </tr>
        </thead>
        <tbody>
            <tr v-for="(project) in projects" :key="project.id">
              <th>{{ project.project_name }}</th>
              <th>{{ project.sales_amount }}</th>
              <th>{{ project.working_group }}</th>
              <th>{{ project.start_date }}</th>
              <th>{{ project.end_date }}</th>
            </tr>
        </tbody>
      </table><br><br>
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
          </tr>
        </thead>
        <tbody>
            <tr v-for="(project) in projects" :key="project.id">
              <th>{{ project.project_name }}</th>
              <th>{{ project.sales_amount }}</th>
              <th>{{ project.working_group }}</th>
              <th>{{ project.start_date }}</th>
              <th>{{ project.end_date }}</th>
            </tr>
        </tbody>
      </table>
    </div>
  </div>


</template>

<script>
  import axios from 'axios'
  export default {
    data: function () {
      return {
        message: 'Hello Vue!',
        projects: []
      }
    },
    methods: {
      setProjects: function(){
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
    }
  }
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
