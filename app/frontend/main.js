import { createApp } from 'vue'
import MyGarden from '@/views/MyGarden.vue'
import PlantDetails from '@/views/PlantDetails.vue'

const initMyGarden = () => {
  createApp(MyGarden).mount('#my-garden')
}

const initPlantDetails = () => {
  createApp(PlantDetails).mount('#plant-details')
}

export { initMyGarden, initPlantDetails }