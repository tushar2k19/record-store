<template>
  <div class="signup-container">
    <h1 class="signup-title">Create an Account</h1>
    <form @submit.prevent="handleSubmit">
      <div class="input-group">
        <label for="email">Email:</label>
        <input type="email" id="email" v-model="email" required>
      </div>
      <div class="input-group">
        <label for="password">Password:</label>
        <input type="password" id="password" v-model="password" required>
      </div>
      <div class="input-group">
        <label for="confirmPassword">Confirm Password:</label>
        <input type="password" id="confirmPassword" v-model="confirmPassword" required>
      </div>
      <div class="button-container">
        <button type="submit">Sign Up</button>
      </div>
    </form>
  </div>
</template>

<script>
export default {
  name: "Signup",
  data() {
    return {
      email: "",
      password: "",
      confirmPassword: "",
    };
  },
  methods: {
    handleSubmit() {
      // Implement your signup logic here
      // This example just alerts the information for demonstration
      if (this.password !== this.confirmPassword) {
        alert("Passwords do not match!");
        return;
      }
      // alert(`Email: ${this.email}\nPassword: ${this.password}`);
      // You would typically send this data to your backend for user creation
    },
  },
};
</script>

<style scoped>
.signup-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: 50vh;
  width: 100%;
  background-color: #f0f2f5;
}

.signup-title {
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
  background-color: #2ecc71;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.button-container button:hover {
  background-color: #27ae60;
}
</style>
