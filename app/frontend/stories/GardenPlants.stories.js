import GardenPlants from '../MyGarden/components/GardenPlants.vue';

export default {
  title: 'Components/GardenPlants',
  component: GardenPlants,
};

const Template = (args) => ({
  // Components used in your story `template` are defined in the `components` object
  components: { GardenPlants },
  // The story's `args` need to be mapped into the template through the `setup()` method
  setup() {
    return { args };
  },
  // And then the `args` are bound to your component with `v-bind="args"`
  template: '<GardenPlants v-bind="args" />',
});

export const Default = Template.bind({});
Default.args = {
  plants: [
    {
      id: 13,
      name: 'Chives',
      image_url: 'harvest_helper_production/13_chives',
    },
    {
      id: 33,
      name: 'Watermelon',
      image_url: 'harvest_helper_production/33_watermelon',
    },
    {
      id: 11,
      name: 'Cauliflower',
      image_url: 'harvest_helper_production/11_cauliflower',
    },
  ],
};

export const Empty = Template.bind({});
Empty.args = {
  plants: [],
};

