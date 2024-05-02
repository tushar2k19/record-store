<!--<template>-->
<!--  <div class="analytics-container">-->
<!--    <h2 style="color: green">Analytics</h2>-->
<!--    <div class="stats-row">-->
<!--      <div class="stat-itemA animated-box">-->
<!--        <h3>Total Contacts</h3>-->
<!--        <p>{{ totalContacts }}</p>-->
<!--      </div>-->
<!--      <div class="stat-itemB animated-box">-->
<!--        <h3>Contacts (Last 7 Days)</h3>-->
<!--        <p>{{ newContactsLastWeek }}</p>-->
<!--      </div>-->
<!--    </div>-->
<!--    <div class="stat-itemC full-width animated-box">-->
<!--      <h3>Conversations (Last 7 Days)</h3>-->
<!--      <p>{{ conversationsLastWeek }}</p>-->
<!--    </div>-->
<!--  </div>-->
<!--</template>-->


<!--<script>-->
<!--export default {-->
<!--  data() {-->
<!--    return {-->
<!--      totalContacts: 0,-->
<!--      newContactsLastWeek: 0,-->
<!--      conversationsLastWeek: 0,-->
<!--    };-->
<!--  },-->
<!--  created() {-->
<!--    // Implement logic to fetch data for counters (replace with your API calls)-->
<!--    this.totalContacts = 123;-->
<!--    this.newContactsLastWeek = 15;-->
<!--    this.conversationsLastWeek = 42;-->
<!--  },-->
<!--};-->

<!--</script>-->


<!--<style scoped>-->
<!--.analytics-container {-->
<!--  display: flex;-->
<!--  flex-direction: column; /* Arrange elements vertically */-->
<!--  align-items: center; /* Center elements horizontally */-->
<!--  width: 100vw; /* Fill entire viewport width */-->
<!--  height: 90vh; /* Fill entire viewport height */-->
<!--  background-color: #f5f5f5;-->
<!--  padding: 1rem;-->
<!--  border-radius: 4px;-->
<!--}-->

<!--.stats-row {-->
<!--  display: flex;-->
<!--  justify-content: space-between; /* Distribute items evenly */-->
<!--  width: 1100px; /* Ensure full width for the row */-->
<!--  margin-top: 100px;-->
<!--}-->

<!--.stat-item h3 {-->
<!--  margin-bottom: 0.5rem;-->
<!--  font-size: 1rem;-->
<!--}-->

<!--.stat-item p {-->
<!--  font-size: 1.2rem;-->
<!--  font-weight: bold;-->
<!--}-->

<!--.full-width {-->
<!--   /* Ensure Conversations stat uses full width (50% width) */-->
<!--  margin-top: 1rem; /* Spacing between rows */-->
<!--}-->

<!--.stat-itemA{-->
<!--  margin-left: 150px;-->
<!--  border: red 2px solid;-->
<!--  padding: 20px;-->
<!--  padding-left: 70px;-->
<!--  padding-right: 70px;-->
<!--}-->
<!--.stat-itemB{-->
<!--  margin-right: 120px;-->
<!--  border: red 2px solid;-->
<!--  padding: 20px;-->
<!--  padding-left: 30px;-->
<!--  padding-right: 30px;-->

<!--}-->
<!--.stat-itemC{-->
<!--  margin-right: 80px;-->
<!--  margin-left: 100px;-->
<!--  border: red 2px solid;-->
<!--  align-items: center;-->
<!--  padding: 30px;-->
<!--  padding-left: 130px;-->
<!--  padding-right: 130px;-->
<!--}-->
<!--.animated-box:hover {-->
<!--  transform: scale(1.05);-->
<!--}-->

<!--@keyframes fadeInUp {-->
<!--  from {-->
<!--    opacity: 0;-->
<!--    transform: translateY(20px);-->
<!--  }-->
<!--  to {-->
<!--    opacity: 1;-->
<!--    transform: translateY(0);-->
<!--  }-->
<!--}-->

<!--.animated-box {-->
<!--  animation: fadeInUp 0.5s ease;-->
<!--}-->


<!--</style>-->




<template>
  <div class="analytics-container">
    <h2 style="color: green">Analytics</h2>
    <div class="stats-row">
      <div class="stat-itemA animated-box">
        <h3>Total Contacts</h3>
        <p>{{ totalContacts }}</p>
      </div>
      <div class="stat-itemB animated-box">
        <h3>Contacts (Last 7 Days)</h3>
        <p>{{ newContactsLastWeek }}</p>
      </div>
    </div>
    <div class="stat-itemC full-width animated-box">
      <h3>Conversations (Last 7 Days)</h3>
      <p>{{ conversationsLastWeek }}</p>
    </div>
  </div>
</template>


<script>
export default {
  data() {
    return {
      totalContacts: 0,
      newContactsLastWeek: 0,
      conversationsLastWeek: 0,
    };
  },
  created() {
    // Implement logic to fetch data for counters (replace with your API calls)
    this.totalContacts = 123;
    this.newContactsLastWeek = 15;
    this.conversationsLastWeek = 42;
  },
};

</script>


<style scoped>
.analytics-container {
  display: flex;
  flex-direction: column; /* Arrange elements vertically */
  align-items: center; /* Center elements horizontally */
  width: 100vw; /* Fill entire viewport width */
  height: 90vh; /* Fill entire viewport height */
  background-color: #f5f5f5;
  padding: 1rem;
  border-radius: 4px;
}

.stats-row {
  display: flex;
  justify-content: space-between; /* Distribute items evenly */
  width: 1100px; /* Ensure full width for the row */
  margin-top: 100px;
}

.stat-item h3 {
  margin-bottom: 0.5rem;
  font-size: 1rem;
}

.stat-item p {
  font-size: 1.2rem;
  font-weight: bold;
}

.full-width {
  /* Ensure Conversations stat uses full width (50% width) */
  margin-top: 1rem; /* Spacing between rows */
}

.stat-itemA{
  margin-left: 150px;
  border: red 2px solid;
  padding: 20px;
  padding-left: 70px;
  padding-right: 70px;
}
.stat-itemB{
  margin-right: 120px;
  border: red 2px solid;
  padding: 20px;
  padding-left: 30px;
  padding-right: 30px;

}
.stat-itemC{
  margin-right: 80px;
  margin-left: 100px;
  border: red 2px solid;
  align-items: center;
  padding: 30px;
  padding-left: 130px;
  padding-right: 130px;
}
.animated-box:hover {
  transform: scale(1.05);
}

@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.animated-box {
  animation: fadeInUp 0.5s ease;
}


</style>
