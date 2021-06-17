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
    created() {
      const baseUrl = 'https://res.cloudinary.com/do6bw42am/image/upload/t_media_lib_thumb/v1537233955/';
      this.plant.image_url = `${baseUrl}${this.plant.image_url}`;
    },
  }
</script>

<template>
  <li class="plant">
    <div class="left">
      <img :src="plant.image_url" :alt="'Image of ' + plant.name">
    </div>
    <div class="right">
      <a :href="'/plants/' + plant.id ">{{ plant.name }}</a>
      <BaseButton label="Remove" :primary="true" />
    </div>
  </li>
</template>

<style scoped>
  .plant {
    align-items: center;
    border-bottom: 1px solid lightgray;
    display: flex;
    margin: 10px 0;
    padding-bottom: 10px;
  }

  .left {
    width: 60%;;
  }

  .right {
    width: 40%;
  }

  img {
    border-radius: 5px;
  }

  a {
    display: block;
    margin-bottom: 15px;
  }
</style>