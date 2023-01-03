<script setup lang="ts">

import type { TagWithColor } from 'api/tags';
import { computed } from 'vue';

const props = defineProps<{
  tag: TagWithColor;
  isSelected: boolean;
  isButton: boolean;
}>();

interface tagClassesType {
  [index: string]: {
    hover: string;
    normal: string;
    stroke: string;
  };
}

const tagClasses : tagClassesType = {
  'gray': {
    'hover': 'hover:border-gray-50 hover:bg-gray-500 hover:text-gray-50',
    'normal': 'border-gray-500 bg-gray-50 text-gray-500',
    'stroke': 'stroke-gray-500',
  },
  'red': {
    'hover': 'hover:border-red-50 hover:bg-red-500 hover:text-red-50',
    'normal': 'border-red-500 bg-red-50 text-red-500',
    'stroke': 'stroke-red-500',
  },
  'orange': {
    'hover': 'hover:border-orange-50 hover:bg-orange-500 hover:text-orange-50',
    'normal': 'border-orange-500 bg-orange-50 text-orange-500',
    'stroke': 'stroke-orange-500',
  },
  'amber': {
    'hover': 'hover:border-amber-50 hover:bg-amber-500 hover:text-amber-50',
    'normal': 'border-amber-500 bg-amber-50 text-amber-500',
    'stroke': 'stroke-amber-500',
  },
  'yellow': {
    'hover': 'hover:border-yellow-50 hover:bg-yellow-500 hover:text-yellow-50',
    'normal': 'border-yellow-500 bg-yellow-50 text-yellow-500',
    'stroke': 'stroke-yellow-500',
  },
  'lime': {
    'hover': 'hover:border-lime-50 hover:bg-lime-500 hover:text-lime-50',
    'normal': 'border-lime-500 bg-lime-50 text-lime-500',
    'stroke': 'stroke-lime-500',
  },
  'green': {
    'hover': 'hover:border-green-50 hover:bg-green-500 hover:text-green-50',
    'normal': 'border-green-500 bg-green-50 text-green-500',
    'stroke': 'stroke-green-500',
  },
  'emerald': {
    'hover': 'hover:border-emerald-50 hover:bg-emerald-500 hover:text-emerald-50',
    'normal': 'border-emerald-500 bg-emerald-50 text-emerald-500',
    'stroke': 'stroke-emerald-500',
  },
  'teal': {
    'hover': 'hover:border-teal-50 hover:bg-teal-500 hover:text-teal-50',
    'normal': 'border-teal-500 bg-teal-50 text-teal-500',
    'stroke': 'stroke-teal-500',
  },
  'cyan': {
    'hover': 'hover:border-cyan-50 hover:bg-cyan-500 hover:text-cyan-50',
    'normal': 'border-cyan-500 bg-cyan-50 text-cyan-500',
    'stroke': 'stroke-cyan-500',
  },
  'sky': {
    'hover': 'hover:border-sky-50 hover:bg-sky-500 hover:text-sky-50',
    'normal': 'border-sky-500 bg-sky-50 text-sky-500',
    'stroke': 'stroke-sky-500',
  },
  'blue': {
    'hover': 'hover:border-blue-50 hover:bg-blue-500 hover:text-blue-50',
    'normal': 'border-blue-500 bg-blue-50 text-blue-500',
    'stroke': 'stroke-blue-500',
  },
  'indigo': {
    'hover': 'hover:border-indigo-50 hover:bg-indigo-500 hover:text-indigo-50',
    'normal': 'border-indigo-500 bg-indigo-50 text-indigo-500',
    'stroke': 'stroke-indigo-500',
  },
  'violet': {
    'hover': 'hover:border-violet-50 hover:bg-violet-500 hover:text-violet-50',
    'normal': 'border-violet-500 bg-violet-50 text-violet-500',
    'stroke': 'stroke-violet-500',
  },
  'purple': {
    'hover': 'hover:border-purple-50 hover:bg-purple-500 hover:text-purple-50',
    'normal': 'border-purple-500 bg-purple-50 text-purple-500',
    'stroke': 'stroke-purple-500',
  },
  'fuchsia': {
    'hover': 'hover:border-fuchsia-50 hover:bg-fuchsia-500 hover:text-fuchsia-50',
    'normal': 'border-fuchsia-500 bg-fuchsia-50 text-fuchsia-500',
    'stroke': 'stroke-fuchsia-500',
  },
  'pink': {
    'hover': 'hover:border-pink-50 hover:bg-pink-500 hover:text-pink-50',
    'normal': 'border-pink-500 bg-pink-50 text-pink-500',
    'stroke': 'stroke-pink-500',
  },
  'rose': {
    'hover': 'hover:border-rose-50 hover:bg-rose-500 hover:text-rose-50',
    'normal': 'border-rose-500 bg-rose-50 text-rose-500',
    'stroke': 'stroke-rose-500',
  },
};

const tagClass = computed(() => [
  tagClasses[props.tag.color].normal,
  props.isButton ? tagClasses[props.tag.color].hover : '',
]);

</script>
<template>
  <span
    :key="props.tag.id"
    class="inline-block rounded border px-2 py-0.5 font-semibold"
    :class="tagClass"
  >
    {{ tag.name }}

    <inline-svg
      v-if="props.isSelected"
      :src="require('images/icons/cross.svg')"
      class="ml-2.5 inline h-2 w-2"
      :class="tagClasses[props.tag.color].stroke"
    />
  </span>
</template>
