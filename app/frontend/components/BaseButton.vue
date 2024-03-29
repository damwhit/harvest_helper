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
    font-family: 'Nunito Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;
    font-weight: 700;
    border: 0;
    border-radius: 3em;
    cursor: pointer;
    display: inline-block;
    line-height: 1;
  }
  .base-button--primary {
    color: white;
    background-color: #789A54;
  }
  .base-button--secondary {
    color: white;
    background-color: #747d97;
  }
  .base-button--small {
    font-size: 12px;
    padding: 10px 16px;
  }
  .base-button--medium {
    font-size: 14px;
    padding: 11px 20px;
  }
  .base-button--large {
    font-size: 16px;
    padding: 12px 24px;
  }
</style>