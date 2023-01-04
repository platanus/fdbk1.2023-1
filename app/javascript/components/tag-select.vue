<script setup lang="ts">
import { computed } from 'vue';
import type { Tag } from 'api/tags';
import giveTagsColor from 'composables/giveTagsColor';

import {
  Listbox,
  ListboxLabel,
  ListboxButton,
  ListboxOptions,
} from '@headlessui/vue';

const props = defineProps<{
  tags: Tag[];
  modelValue: number[];
}>();

const emit = defineEmits<{
  (event: 'update:modelValue', value: number[]): void;
}>();

function removeTag(tagId: number) {
  const remainingArray = props.modelValue.filter(tag => tag !== tagId);
  emit('update:modelValue', remainingArray);
}

function addTag(tagId: number) {
  emit('update:modelValue', [...props.modelValue, tagId]);
}
const tagsColor = giveTagsColor(props.tags);

const selectedTags = computed(() => tagsColor.value.filter(tag => props.modelValue.includes(tag.id)));

const remainingTags = computed(() => tagsColor.value.filter(tag => !props.modelValue.includes(tag.id)));

</script>

<template>
  <Listbox
    :model-value="props.modelValue"
    as="div"
    multiple
    name="tag"
    @update:model-value="emit('update:modelValue', $event)"
  >
    <ListboxLabel class="mr-2 text-base font-normal text-slate-700">
      Tag
    </ListboxLabel>
    <ListboxButton class="flex w-full flex-wrap rounded border border-slate-200 bg-white focus:ring-indigo-600">
      <div
        v-if="props.modelValue.length !== 0"
        class="flex w-full flex-wrap gap-1 p-1.5"
      >
        <BaseTag
          v-for="tag in selectedTags"
          :key="tag.id"
          :tag="tag"
          :is-selected="true"
          :is-button="true"
          @click.prevent="removeTag(tag.id)"
        />
      </div>
      <div
        v-else
        class="py-2 px-4"
      >
        <span class="text-slate-400">Elige una o más etiquetas</span>
      </div>
    </ListboxButton>

    <div
      v-if="remainingTags.length !== 0"
    >
      <ListboxOptions
        class="flex flex-wrap gap-1 rounded-b-lg border border-slate-200 bg-white p-1"
      >
        <BaseTag
          v-for="tag in remainingTags"
          :key="tag.id"
          :tag="tag"
          :is-selected="false"
          :is-button="true"
          @click="props.modelValue.includes(tag.id) ? removeTag(tag.id) : addTag(tag.id)"
        />
      </ListboxOptions>
    </div>
  </Listbox>
</template>
