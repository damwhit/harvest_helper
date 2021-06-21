import GardenPlant from '../MyGarden/components/GardenPlant.vue';

export default {
  title: 'Components/GardenPlant',
  component: GardenPlant,
};

const Template = (args) => ({
  // Components used in your story `template` are defined in the `components` object
  components: { GardenPlant },
  // The story's `args` need to be mapped into the template through the `setup()` method
  setup() {
    return { args };
  },
  // And then the `args` are bound to your component with `v-bind="args"`
  template: '<GardenPlant v-bind="args" />',
});

export const Default = Template.bind({});
Default.args = {

  plant: {
    id: 13,
    name: 'Chives',
    image_url: 'harvest_helper_production/13_chives',
  },
};
