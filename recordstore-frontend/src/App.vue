<template>
  <div id="app">
    <Header></Header>
   <router-view/> <!-- shows the content of the route jispe abhi redirect huaa ho -->
  </div>
</template>

<script>
import Header from "./components/header.vue";

export default {
  name: 'App',
  components: {Header}
}
</script>
