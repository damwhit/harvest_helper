<script>
  export default {
    props: {
      plant: {
        type: Object,
        required: true,
      }
    }
  }
</script>

<template>
  <li>
    {{ plant.name }}
  </li>
</template>

<style scoped>

</style>