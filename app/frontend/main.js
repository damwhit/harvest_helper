import { createApp } from 'vue'
import MyGarden from '@/views/MyGarden.vue'

const initMyGarden = () => {
  createApp(MyGarden).mount('#my-garden')
}

export { initMyGarden }