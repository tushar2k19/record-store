<template>
  <div class="login-container">
    <h1 class="login-title">Welcome Back!</h1>
    <form @submit.prevent="handleSubmit">
      <div class="input-group">
        <label for="username">Username:</label>
        <input type="text" id="username" v-model="username" required>
      </div>
      <div class="input-group">
        <label for="password">Password:</label>
        <input type="password" id="password" v-model="password" required>
      </div>
      <div class="button-container">
        <button type="submit">Login</button>
      </div>
    </form>
  </div>
</template>

<script>
export default {
  name: "Signin",
  data() {
    return {
      username: "",
      password: "",
    };
  },
  methods: {
    handleSubmit() {
      // Implement your login logic here
      // This example just alerts the username and password for demonstration
      alert(`Username: ${this.username}\nPassword: ${this.password}`);
      // You would typically send this data to your backend for authentication
    },
  },
};
</script>

<style scoped>
.login-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: 50vh;
  width: 100%;
  background-color: #f0f2f5;
}

.login-title {
  font-size: 2rem;
  margin-bottom: 2rem;
  color: #343a40;
}

.input-group {
  margin-bottom: 1rem;
  display: flex;
  flex-direction: column;
}

.input-group label {
  font-size: 1rem;
  margin-bottom: 0.5rem;
  color: #343a40;
}

.input-group input {
  padding: 0.8rem;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 1rem;
}

.button-container {
  margin-top: 1rem;
}

.button-container button {
  padding: 1rem 2rem;
  background-color: #3498db;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.button-container button:hover {
  background-color: #2980b9;
}
</style>
