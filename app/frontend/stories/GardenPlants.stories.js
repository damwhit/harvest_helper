import GardenPlants from '../MyGarden/components/GardenPlants.vue';
import { withDesign } from 'storybook-addon-designs'

export default {
  title: 'Components/GardenPlants',
  component: GardenPlants,
  decorators: [withDesign],
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

Default.parameters = {
  design: {
    type: 'figma',
    url: 'https://www.figma.com/file/DMN9Qj2DLzqxpm3UjAb5hK/Mocks_v1',
  },
  zeplinLink: [
    {
      name: "Desktop",
      link: "https://app.zeplin.io/project/5d4873c7ff6f4a134f9b7fd8/screen/5d680a880357eb490e012a0a",
    },
    {
      name: "Mobile",
      link: "https://app.zeplin.io/project/5d4873c7ff6f4a134f9b7fd8/screen/5d680972f828bf7299f81ce5",
    },
  ],
}

export const Empty = Template.bind({});
Empty.args = {
  plants: [],
};

