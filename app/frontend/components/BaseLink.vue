<script>
  export default {
    props: {
      href: {
        type: String,
        required: true,
      },
      text: {
        type: String,
        required: true,
      },
    }
  }
</script>

<template>
  <a class="base-link" :href="href">{{ text }}</a>
</template>

<style scoped>
  a {
    font-family: 'Nunito Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;
    color: #337ab7;
    text-decoration: none;
  }

  a:hover, a:focus {
    color: #23527c;
    text-decoration: underline;
  }

  a:focus {
    outline: 5px auto -webkit-focus-ring-color;
    outline-offset: -2px;
  }
  .base-link {
    font-size: 16px;
    font-weight: 700;
  }
</style>