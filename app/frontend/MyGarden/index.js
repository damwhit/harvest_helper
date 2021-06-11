import { createApp } from 'vue'
import MyGarden from '@/MyGarden/components/MyGarden.vue'

const initMyGarden = () => {
  createApp(MyGarden).mount('#my-garden')
}

export { initMyGarden }