import BaseLink from '../components/BaseLink.vue';

export default {
  title: 'Building Blocks/BaseLink',
  component: BaseLink,
};

const Template = (args) => ({
  // Components used in your story `template` are defined in the `components` object
  components: { BaseLink },
  // The story's `args` need to be mapped into the template through the `setup()` method
  setup() {
    return { args };
  },
  // And then the `args` are bound to your component with `v-bind="args"`
  template: '<BaseLink v-bind="args" />',
});

export const Primary = Template.bind({});
Primary.args = {
  href: 'http://google.com',
  text: 'Link',
};
