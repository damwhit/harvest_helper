import BaseThumbnail from '../components/BaseThumbnail.vue';

export default {
  title: 'Building Blocks/BaseThumbnail',
  component: BaseThumbnail,
};

const Template = (args) => ({
  // Components used in your story `template` are defined in the `components` object
  components: { BaseThumbnail },
  // The story's `args` need to be mapped into the template through the `setup()` method
  setup() {
    return { args };
  },
  // And then the `args` are bound to your component with `v-bind="args"`
  template: '<BaseThumbnail v-bind="args" />',
});

export const Primary = Template.bind({});
Primary.args = {
  src: 'https://res.cloudinary.com/do6bw42am/image/upload/t_media_lib_thumb/v1537233955/harvest_helper_production/13_chives',
  altText: 'Picture of Chives',
};
