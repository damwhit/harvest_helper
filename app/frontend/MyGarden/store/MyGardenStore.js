import { createStore } from 'vuex'

const store = createStore({
  state() {
    return {
			plants: []
		}
	},
	mutations: {
		setPlants(state, plants) {
			state.plants = plants;
		}
	},
	actions: {
		setPlants({ commit }, plants) {
			commit('setPlants', plants);
		}
	}
})

export default store;