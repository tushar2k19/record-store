<template>
  <div class = "max-w-sm m-auto my-8">
    <div class = "border p-10 border-gray-light shadow rounded">
      <!--      <h3 class = "text-2xl mb-6 text-grey-darkest">Sign In</h3>-->
      <h3 class = "Header">Sign Up</h3>
      <form @submit.prevent = "signup" style="text-align: center;">
        <div class = "text-red" v-if="error"> {{ error }}</div>

        <div>
          <label for="email" class = "label">Email Address</label>
          <input type = "email" v-model = "email" class = "tushar" id = "email" placeholder="abc@xyz.com">
        </div>
        <div>
          <label for="password" class = "label">Password</label>
          <input type = "password" v-model = "password" class = "tushar" id = "password">
        </div>
        <div>
          <label for="password" class = "label">Confirm Password</label>
          <input type = "password" v-model = "password_confirmation" class = "tushar" id = "password_confirmation">
        </div>
        <!--        <button type = "submit" class = "font-sans font-bold px-4 rounded cursor-pointer no-underline bg-green-50 hover:bg-green-dark block w-full py-4 text-white items-center justify-center">Sign in</button>-->
        <button type = "submit" class = "btn">Sign Up</button>

        <div class="signup">
          <router-link to="/" class="link">Sign In</router-link>
        </div>
      </form>

    </div>
  </div>
</template>

<script>
export default {
  name: "Signin",
  data () {
    return {
      email: '',
      password: '',
      error: '',
      password_confirmation: '',
    }
  },
  created: function () {
    this.checkSignedin();
  },
  updated () {
    this.checkSignedin();
  },
  methods: {
    checkSignedin: function () {
      if(Boolean(localStorage.signedIn))
        this.$router.replace('/records')
    },
    signup () {
      this.$http.plain.post('/signup', {email: this.email, password: this.password, password_confirmation: this.password_confirmation})
        .then((response) => {
          this.signinSuccessful(response);})
        .catch(error => this.signinFailed(error))
    },
    signinSuccessful () {
      if(!response.data.csrf)
      {
        this.signinFailed(response);
        return
      }
      localStorage.csrf = response.data.csrf
      localStorage.signedIn = true
      this.error = ''
      this.$router.replace('/records')
    }, signinFailed: function (error) {
      this.error = (error.response && error.response.data && error.response.data.error) || "SOmethign went wrong"
      delete localStorage.csrf
      delete localStorage.signedIn
    },

  }
}
</script>

<style>
.tushar {
  margin: auto;
  border: black solid 2px;
  background-color: #bcafaf;
  color: black;
}
.btn {
  width: 50%;
  text-align: center;
  border: black solid 2px;
  margin-top: 10px;
  background-color: green;
  color: white;
}
.tushar::placeholder {
  color: black;
  opacity: 10%;
}
.signup {
  width: 50%;
  margin: auto;
  text-align: right;
}
.link {
  font-size: 15px;
  font-weight: bold;
}
.Header {
  text-align: center; /* Center the text */
  padding: 10px; /* Add padding for spacing */
  margin-top: 20px; /* Add top margin for separation */
  background-color: #f0f0f0; /* Add background color */
  border-bottom: 2px solid #ccc; /* Add bottom border */
  margin-bottom: 100px;
}
</style>
