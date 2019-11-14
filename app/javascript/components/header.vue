<template>
  <!-- 背景黒 -->
  <header class='navbar navbar-dark bg-dark'>
    <div class='container'>
      <span id='logo'>プロジェクト管理システム</span>
      <nav>
        <ul class='nav navbar-nav navbar-right'>
          <li><span class='current-user'>社員A</span></li>
          <li><router-link to="/">プロジェクト一覧</router-link></li>
          <li><router-link to="/projects/new">プロジェクト登録</router-link></li>
        </ul>
      </nav>
    </div>
  </header>
</template>
