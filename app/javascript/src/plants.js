import { createApp } from 'vue'
import PlantList from './PlantList.vue'

export default () => {
  document.addEventListener('DOMContentLoaded', () => {
    const app = createApp(PlantList)
    app.mount('#plants-app')
  });
}