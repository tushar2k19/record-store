<!--<template>-->
<!--  <nav class="navbar">-->
<!--    <ul>-->
<!--      <li><router-link to="/home" class="" style="margin: 20px">Home</router-link> </li>-->
<!--      <li><router-link to="/about" class=""  style="margin: 20px">About</router-link></li>-->
<!--      <li><router-link to="/audience" class="" style="margin: 20px">Audience</router-link></li>-->
<!--      <li><router-link to="/csm" class=""  style="margin: 20px">CSM</router-link></li>-->
<!--    </ul>-->
<!--  </nav>-->
<!--</template>-->

<!--<script>-->
<!--export default {-->
<!--  name: 'Navbar',-->
<!--}-->
<!--</script>-->

<!--<style scoped>-->
<!--.navbar {-->
<!--  background-color: #e0e0e0;-->
<!--  padding: 10px;-->
<!--  /* Additional styles for vertical layout */-->
<!--  display: flex; /* Allow stacking items vertically */-->
<!--  flex-direction: column; /* Stack items top to bottom */-->
<!--}-->

<!--.navbar ul {-->
<!--  list-style: none; /* Remove default horizontal bullet points */-->
<!--  margin: 0; /* Remove default margins */-->
<!--  padding: 0; /* Remove default padding */-->
<!--}-->

<!--.navbar li {-->
<!--  margin-bottom: 5px; /* Add spacing between list items */-->
<!--}-->
<!--</style>-->






<!--<template>-->
<!--  <div class="container">-->
<!--    <nav class="navbar">-->
<!--      <ul>-->
<!--        <li><router-link to="/home" class="nav-link">Home</router-link></li>-->
<!--        <li><router-link to="/about" class="nav-link">About</router-link></li>-->
<!--        <li><router-link to="/audience" class="nav-link">Audience</router-link></li>-->
<!--        <li><router-link to="/csm" class="nav-link">CSM</router-link></li>-->
<!--      </ul>-->
<!--    </nav>-->

<!--  </div>-->
<!--</template>-->

<!--<style scoped>-->
<!--.container {-->
<!--  display: flex;-->
<!--}-->

<!--.navbar {-->
<!--  background-color: #333; /* Navbar background color */-->
<!--  padding: 20px;-->
<!--  width: 250px; /* Width of the navbar */-->
<!--  height: 100vh; /* Full height */-->
<!--  position: fixed; /* Fixed position */-->
<!--  top: 0; /* Align to the top */-->
<!--  left: 0; /* Align to the left */-->
<!--  overflow-y: auto; /* Enable vertical scrolling if needed */-->
<!--  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* Box shadow for depth */-->
<!--}-->

<!--ul {-->
<!--  list-style-type: none; /* Remove bullets */-->
<!--  padding: 0; /* Remove default padding */-->
<!--}-->

<!--.nav-link {-->
<!--  text-decoration: none; /* Remove underline */-->
<!--  color: #fff; /* Text color */-->
<!--  font-size: 20px; /* Font size */-->
<!--  display: block; /* Make the link a block element */-->
<!--  margin-bottom: 15px; /* Add some space between links */-->
<!--  padding: 10px 20px; /* Increase padding */-->
<!--  border-radius: 10px; /* Rounded corners */-->
<!--  transition: box-shadow 0.3s, transform 0.3s; /* Smooth transition for box-shadow and transform */-->
<!--}-->

<!--.nav-link:hover {-->
<!--  box-shadow: 0 0 10px rgba(255, 255, 255, 0.5); /* Glow effect on hover */-->
<!--  transform: scale(1.1); /* Scale effect on hover */-->
<!--}-->

<!--.main-content {-->
<!--  margin-left: 250px; /* Adjust according to the width of the navbar */-->
<!--  width: calc(100% - 250px); /* Adjust the width of the main content */-->
<!--}-->
<!--</style>-->



<template>
  <div class="container">
    <nav class="navbar">
      <ul>
        <li><router-link to="/home" class="nav-link">Home</router-link></li>
        <li><router-link to="/audience" class="nav-link">Customers</router-link></li>
        <li><router-link to="/csm" class="nav-link">Conversations</router-link></li>
        <li><router-link to="/analytics" class="nav-link">Analytics</router-link></li>
      </ul>
    </nav>
  </div>
</template>

<style scoped>
.container {
  display: flex;
}

.navbar {
  background-color: #2C4E80; /* Navbar background color */
  padding: 15px;
  width: 140px; /* Width of the navbar */
  align-items: center;
  height: 100vh; /* Full height */
  margin-top: 30%;
  /* overflow-y: auto; /* Enable vertical scrolling if needed */
  /*box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); */ /* Box shadow for depth */
}

ul {
  list-style-type: none; /* Remove bullets */
  padding: 0; /* Remove default padding */
}

.nav-link {
  text-decoration: none; /* Remove underline */
  color: #fff; /* Text color */
  font-size: 20px; /* Font size */
  display: block; /* Make the link a block element */
  margin-bottom: 15px; /* Add some space between links */
  padding: 10px 20px; /* Increase padding */
  border-radius: 10px; /* Rounded corners */
  transition: box-shadow 0.3s, transform 0.3s; /* Smooth transition for box-shadow and transform */
}

.nav-link:hover {
  box-shadow: 0 0 10px rgba(255, 255, 255, 0.5); /* Glow effect on hover */
  transform: scale(1.1); /* Scale effect on hover */
}
</style>
<script setup lang="ts">
</script>
