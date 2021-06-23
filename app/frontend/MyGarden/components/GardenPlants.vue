<script>
import GardenPlant from './GardenPlant.vue'
import BaseLink from '../../components/BaseLink.vue'

  export default {
  components: { GardenPlant, BaseLink },
    props: {
      plants: {
        type: Array,
        required: true,
      }
    }
  }
</script>

<template>
  <ul v-if="plants.length > 0">
    <GardenPlant
      :plant="plant"
      v-for="plant in plants"
      :key="plant.id"
    />
  </ul>
  <div v-else>
    <h4>You don't have any plants yet. 🌱 🌿 🪴</h4>
    <base-link href="/" text="Find something to plant" />
  </div>
</template>

<style scoped>
  ul {
    list-style: none;
    padding: 0;
  }

  h4 {
    color: #414a4c;
    font-family: 'Nunito Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;
    font-size: 18px;;
    line-height: 1.1;
    font-weight: 500;
    margin: 10px 0;
  }
</style>