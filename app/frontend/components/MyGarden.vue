<template>
  <p>
    {{ message }}
  </p>
</template>

<style scoped >
    p {
        font-size: 4em;
        text-align: center;
    }
</style>

<script>
export default {
  data() {
    return {
        message: 'Sup?'
    }
  }
}
</script>