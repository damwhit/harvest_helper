<script>
  export default {
    props: {
      src: {
        type: String,
        required: true,
      },
      altText: {
        type: String,
        required: true,
      },
    }
  }
</script>

<template>
  <img :src="src" :alt="altText">
</template>

<style scoped>
  img {
    border-radius: 5px;
    height: 100px;
    object-fit: cover;
    width: 100px;
  }
</style>