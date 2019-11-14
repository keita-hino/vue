<template>
  <div>
    <Header/>
      <div class='container'>
        <router-view></router-view>
      </div>
    <Footer/>
  </div>
</template>

<script>
import Vue from 'vue'

import Header from './components/header.vue'
import Footer from './components/footer.vue'

export default {
  components: {
    Header,
    Footer
  }
  // router
}
</script>