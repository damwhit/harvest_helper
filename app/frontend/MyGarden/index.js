import { createApp } from 'vue'
import MyGarden from './components/MyGarden.vue'
import store from './store/MyGardenStore'
import '../stylesheets/index.css'

const initMyGarden = () => {
  const app = createApp(MyGarden)
	app.use(store);
	app.mount('#my-garden')
}

export { initMyGarden }