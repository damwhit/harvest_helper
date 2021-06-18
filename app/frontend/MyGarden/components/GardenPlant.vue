<script>
  import BaseButton from '@/components/BaseButton.vue';
  import BaseLink from '@/components/BaseLink.vue';
  import BaseThumbnail from '@/components/BaseThumbnail.vue';

  export default {
    components: { BaseButton, BaseLink, BaseThumbnail },
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
      <BaseThumbnail :src="plant.image_url" :altText="'Image of ' + plant.name" />
    </div>
    <div class="right">
      <h3>{{ plant.name }}</h3>
      <div class="actions">
        <BaseLink :href="'/plants/' + plant.id" text="view details" />
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

  h3 {
    margin-bottom: 20px;
    margin-top: 0;
  }

  .actions {
    align-items: baseline;
    display: flex;
    justify-content: space-between;
  }
</style>