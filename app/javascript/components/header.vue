<template>
  <!-- 背景黒 -->
  <header class='navbar navbar-dark bg-dark'>
    <div class='container'>
      <span id='logo'>プロジェクト管理システム</span>
      <nav>
        <!-- <ul class='nav navbar-nav navbar-right'> -->
          <span class='current-user'>社員A</span>
          <router-link to="/" class="white-color">プロジェクト一覧</router-link>
          <router-link to="/projects/new" class="white-color">プロジェクト登録</router-link>
        <!-- </ul> -->
      </nav>
    </div>
  </header>
</template>

<style>
  .white-color{
    color: #ffffff;
  }
</style>