<script>
  export default {
    props: {
      plant: {
        type: Object,
        required: true,
      }
    },
  }
</script>

<template>
  <li>
    <a :href="'/plants/' + plant.id ">{{ plant.name }}</a>
  </li>
</template>

<style scoped>

</style>