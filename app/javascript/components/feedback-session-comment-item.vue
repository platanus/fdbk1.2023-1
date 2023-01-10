<script setup lang="ts">
import type { Comment } from 'api/comments';

interface Props {
  comment: Comment,
}

defineProps<Props>();

</script>

<template>
  <p class="rounded-md bg-white px-1 py-2 text-sm font-light text-blue-gray-700 drop-shadow-md">
    {{ comment.body }}
  </p>
</template>
