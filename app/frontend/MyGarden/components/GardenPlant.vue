<script>
  import { mapState, mapActions } from 'vuex';
  import BaseButton from '../../components/BaseButton.vue';
  import BaseLink from '../../components/BaseLink.vue';
  import BaseThumbnail from '../../components/BaseThumbnail.vue';

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
      console.log(this.plant.image_url)
      this.plant.image_url = `${baseUrl}${this.plant.image_url}`;
    },
    methods: {
      ...mapActions(['setPlants']),
      async removeFromGarden() {
        const data = { 
          user_id: this.currentUser.id,
          plant_id: this.plant.id,
        }
        const response = await fetch('/mygarden', {
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
  <li class="flex py-8 px-8 width-full bg-white rounded-xl shadow-md space-x-12">
    <div>
      <BaseThumbnail :src="plant.image_url" :altText="'Image of ' + plant.name" />
    </div>
    <div>
      <h3>{{ plant.name }}</h3>
      <div class="flex space-x-16 items-center">
        <BaseLink :href="'/plants/' + plant.id" text="view details" />
        <BaseButton @click="removeFromGarden" size="small" label="remove" />
      </div>
    </div>
  </li>
</template>
