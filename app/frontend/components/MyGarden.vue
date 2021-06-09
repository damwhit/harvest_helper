<style scoped >
  .container {
    margin: 0 auto;
    max-width: 500px;
  }
</style>

<template>
  <div class="container">
    <h4>{{ currentUser.name }}'s Garden</h4>
    <ul>
      <li 
        v-for="plant in plants"
        :key="plant.id"
      >
        {{ plant.name }}
      </li>
    </ul>
  </div>
</template>

<script>
export default {
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