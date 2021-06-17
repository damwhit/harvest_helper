<script>
import BaseButton from '@/components/BaseButton.vue';
  export default {
    components: { BaseButton },
    props: {
      plant: {
        type: Object,
        required: true,
      }
    },
  }
</script>

<template>
  <li class="plant">
    <a :href="'/plants/' + plant.id ">{{ plant.name }}</a>
    <BaseButton label="Remove" size="small" :primary="false" />
  </li>
</template>

<style scoped>
  .plant {
    border-bottom: 1px solid lightgray;
    display: flex;
    justify-content: space-between;
    margin: 10px 0;
    padding-bottom: 10px;
  }

</style>