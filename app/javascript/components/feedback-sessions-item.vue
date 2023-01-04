<script setup lang="ts">
import type { FeedbackSession } from 'api/feedback-sessions';
import type { TagWithColor } from 'api/tags';
import { computed } from 'vue';

interface Props {
  type: 'provider' | 'receiver';
  session: FeedbackSession,
  tags: TagWithColor[],
}

const props = defineProps<Props>();

const sessionTags = computed(() => props.tags.filter(tag => props.session.tags.map(t => t.id).includes(tag.id)));
</script>

<template>
  <div class="flex flex-row flex-wrap items-center gap-6 bg-white p-4 shadow">
    <div class="flex flex-row items-center gap-6">
      <span class="text-lg text-slate-800">
        {{ type === 'provider' ? props.session.receiver.name : props.session.provider.name }}
      </span>
      <span class="text-sm text-slate-500">{{ props.session.sessionDate }}</span>
    </div>
    <div
      v-for="tag in sessionTags"
      :key="tag.id"
      class="flex flex-row flex-wrap items-center gap-2"
    >
      <BaseTag
        :tag="tag"
        :is-selected="false"
        :is-button="false"
      />
    </div>
    <button class="ml-auto flex h-6 w-6 items-center justify-center rounded-full bg-slate-100">
      <inline-svg
        :src="require('images/icons/dots-vertical.svg')"
        class="h-4 w-4 fill-indigo-900"
      />
    </button>
  </div>
</template>
