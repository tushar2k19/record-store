import Vue from 'vue'
import Router from 'vue-router'

import Signin from '../components/signin.vue'
import Signup from '../components/signup.vue'
import Artist from '../components/artist/artists.vue'
import Record from '../components/records/records.vue'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Signin',
      component: Signin
    },
    {
      path: '/signup',
      name: 'Signup',
      component: Signup
    },
    {
      path: '/artists',
      name: 'Artist',
      component: Artist
    },
    {
      path: '/records',
      name: 'Record',
      component: Record
    },
  ]
})
