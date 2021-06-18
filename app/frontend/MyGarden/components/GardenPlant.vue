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
      <h3>{{ plant.name }}</h3>
      <div class="ctas">
        <a :href="'plants/' + plant.id">view details</a>
        <BaseButton size="small" label="remove" :primary="true" />
      </div>
    </div>
  </li>
</template>

<style scoped>
  .plant {
    align-items: center;
    border: 0.5px solid lightgray;
    border-radius: 5px;
    display: flex;
    margin-bottom: 20px;
    padding: 10px;
  }

  .left {
    width: 40%;;
  }

  .right {
    width: 60%;
  }

  img {
    border-radius: 5px;
    height: 100px;
    object-fit: cover;
    width: 100px;
  }

  h3 {
    margin-bottom: 20px;
    margin-top: 0;
  }

  .ctas {
    align-items: baseline;
    display: flex;
    justify-content: space-between;
  }
</style>