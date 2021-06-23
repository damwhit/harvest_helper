import { createStore } from 'vuex'

const store = createStore({
  state() {
    return {
			plants: [],
      currentUser: {},
		}
	},
	mutations: {
		setPlants(state, plants) {
			state.plants = plants;
		},
		setCurrentUser(state, user) {
			state.currentUser = user;
		},
	},
	actions: {
		setPlants({ commit }, plants) {
			commit('setPlants', plants);
		},
		setCurrentUser({ commit }, user) {
			commit('setCurrentUser', user);
		},
	}
})

export default store;