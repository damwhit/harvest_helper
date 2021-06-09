<script>
import GardenPlants from '@/components/GardenPlants.vue';

export default {
  components:  {
    GardenPlants,
  },

  data() {
    return {
      plants: [],
      currentUser: {},
    }
  },

  created() {
    const page = document.querySelector('#my-garden');
    const { user, plants } = page.dataset;
    this.currentUser = JSON.parse(user);
    this.plants = JSON.parse(plants);
  }
}
</script>

<template>
  <div class="container">
    <h4>{{ currentUser.name }}'s Garden</h4>
    <GardenPlants 
      :plants="plants"
    />
  </div>
</template>

<style scoped >
  .container {
    margin: 0 auto;
    max-width: 500px;
  }
</style>