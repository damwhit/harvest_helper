<script>
import { reactive, computed } from 'vue';

export default {
  props: {
    label: {
      type: String,
      required: true,
    },
    primary: {
      type: Boolean,
      default: false,
    },
    size: {
      type: String,
      validator: function (value) {
        return ['small', 'medium', 'large'].indexOf(value) !== -1;
      },
    },
    backgroundColor: {
      type: String,
    },
  },

  emits: ['click'],

  setup(props, { emit }) {
    return {
      classes: computed(() => ({
        'base-button': true,
        'base-button--primary': props.primary,
        'base-button--secondary': !props.primary,
        [`base-button--${props.size || 'medium'}`]: true,
      })),
      style: computed(() => ({
        backgroundColor: props.backgroundColor,
      })),
      onClick() {
        emit('click');
      }
    }
  },
};
</script>

<template>
  <button type="button" :class="classes" @click="onClick" :style="style">{{ label }}</button>
</template>

<style scoped>
  .base-button {
    @apply text-white font-semibold rounded-xl shadow-md;
  }
  .base-button--primary {
    @apply bg-green-500 hover:bg-green-700;
  }
  .base-button--secondary {
    @apply bg-purple-400 hover:bg-purple-500;
  }
  .base-button--small {
    @apply py-1.5 px-2.5 text-base;
  }
  .base-button--medium {
    @apply py-2 px-3 text-lg;
  }
  .base-button--large {
    @apply py-2.5 px-3.5 text-xl;
  }
</style>