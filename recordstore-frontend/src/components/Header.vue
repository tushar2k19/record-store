<template>
  <header class="header">
    <p class="header-text">Granth Thornton Bharat</p>
  </header>
</template>

<script>
export default {
  name: 'Header',
}
</script>

<style scoped>
.header {
  background-color: #2C4E80;
  padding: 10px;
  height: 10vh;
  text-align: center; /* Or customize alignment */
  color: #ffff;
  font-size: 30px;
  width: 100%;
  position: fixed; /* Stick header to the top */
  top: 0; /* Ensure it's at the top */
  left: 0; /* Ensure it spans the full width */
  right: 0;
  z-index: 1000; /* Ensure it's above other content */
}

.header-text {
  margin: 0; /* Remove default margin */
}
</style>
