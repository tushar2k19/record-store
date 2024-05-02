<template>
  <div class="container">
    <br><br>
    <div><img class="image-container" :src="require('../assets/images/home_icon.jpg')" alt="Description of the image"></div>
    <div><h3>  Customer-centricity elevated.</h3></div>
  </div>
</template>

<script>
export default {
  name: 'Home',
  data() {
    return {
      menuVisible: false
    }
  }
}
</script>

<style scoped>
.container{
  margin-left:4px;
}

.image-container {
  max-width: 75%;
  max-height: 75%;
}
</style>
