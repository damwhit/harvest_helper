<script>
import { mapState, mapActions } from 'vuex';
import GardenPlants from './GardenPlants.vue';

export default {
  components:  {
    GardenPlants,
  },

  data() {
    return {
      currentUser: {},
    }
  },
	computed: mapState(['plants']),
	methods: mapActions(['setPlants']),
  created() {
    const page = document.querySelector('#my-garden');
    const { user, plants } = page.dataset;
    this.currentUser = JSON.parse(user);
    this.setPlants(JSON.parse(plants));
  }
}
</script>

<template>
  <div class="garden-container">
    <h2>{{ currentUser.name }}'s Garden</h2>
    <GardenPlants 
      :plants="plants"
    />
  </div>
</template>

<style scoped >
  .garden-container {
    color: #414a4c;
    font-family: 'Nunito Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;
    margin: 0 auto;
    max-width: 500px;
    padding: 0 15px;
  }
  h2 {
    margin-bottom: 40px;
  }
</style>