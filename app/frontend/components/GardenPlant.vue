<script>
  export default {
    props: {
      plant: {
        type: Object,
        required: true,
      }
    },
    created() {
      console.log(this.plant.image_url)
    }
  }
</script>

<template>
  <li>
    <a :href="'/plants/' + plant.id ">{{ plant.name }}</a>
  </li>
</template>

<style scoped>

</style>