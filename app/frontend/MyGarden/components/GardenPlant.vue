<script>
  import { mapState, mapActions } from 'vuex';
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
    computed: mapState(['plants', 'currentUser']),
    created() {
      const baseUrl = 'https://res.cloudinary.com/do6bw42am/image/upload/t_media_lib_thumb/v1537233955/';
      this.plant.image_url = `${baseUrl}${this.plant.image_url}`;
    },
    methods: {
      ...mapActions(['setPlants']),
      async removeFromGarden() {
        const data = { 
          user_id: this.currentUser.id,
          plant_id: this.plant.id,
        }
        const response = await fetch('http://localhost:3000/mygarden', {
          method: 'DELETE',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(data),
        })
        if (response.ok) {
          this.setPlants(this.plants.filter(plant => plant.id !== this.plant.id));
        }
      },
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
        <BaseButton @click="removeFromGarden" size="small" label="remove" />
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