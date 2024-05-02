<template>
  <header class="bg-grey-lighter py-4">
    <div class="container m-auto flex flex-wrap items-center justify-end head">
      <div class="flex-1 flex items-center" style = "text-align: center">
        <a href="/" class="uppercase text-sm font-mono pl-4 font-semibold no-underline text-indigo-dark hover:text-indigo-darker">Record Store</a>
      </div>
      <div class = "btns">
        <router-link to="/" class="link-grey px-2 no-underline" v-if="!signedIn()" style="margin: 20px">Sign in</router-link>
        <router-link to="/signup" class="link-grey px-2 no-underline" v-if="!signedIn()" style="margin: 10px">Sign Up</router-link>
        <router-link to="/records" class="link-grey px-2 no-underline" v-if="signedIn()" style="margin: 20px">Records</router-link>
        <router-link to="/artists" class="link-grey px-2 no-underline" v-if="signedIn()" style="margin: 20px">Artists</router-link>
        <a href="#" @click.prevent="signOut" class="link-grey px-2 no-underline" v-if="signedIn()" style="margin: 10px">Sign out</a>
      </div>
    </div>
  </header>
</template>

<script>
export default {
  name: 'Header',
  created () {
    console.log("inside created")
    this.signedIn()
  },
  methods: {
    setError (error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text
    },
    signedIn () {
      console.log(Boolean(localStorage.signedIn))
      // return Boolean(localStorage.signedIn)
      return localStorage.signedIn
    },
    signOut () {
      this.$http.secured.delete('/signout')
        .then(response => {
          delete localStorage.csrf
          delete localStorage.signedIn
          this.$router.replace('/')
        })
        .catch(error => this.setError(error, 'Cannot sign out'))
    }
  }
}
</script>

<style>
.head {
  background-color: purple;
}
.btns {
  text-align: right;
}
</style>
