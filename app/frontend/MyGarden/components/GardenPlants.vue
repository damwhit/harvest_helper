<script>
import GardenPlant from './GardenPlant.vue'
  export default {
  components: { GardenPlant },
    props: {
      plants: {
        type: Array,
        required: true,
      }
    }
  }
</script>

<template>
  <ul>
    <GardenPlant
      :plant="plant"
      v-for="plant in plants"
      :key="plant.id"
    />
  </ul>
</template>

<style scoped>

</style>