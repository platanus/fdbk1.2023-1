<script setup lang="ts">

import type { Comment } from 'api/comments';
import type { FeedbackSession } from 'api/feedback-sessions';
import FeedbackSessionCommentItem from './feedback-session-comment-item.vue';

interface Props {
  comments: Comment[]
  feedbackSession: FeedbackSession
}

defineProps<Props>();

</script>

<template>
  <div class="flex flex-col px-80">
    <a
      class="mb-4 flex h-9 w-16 items-center justify-center rounded-full bg-slate-100"
      href="/"
    >
      <inline-svg
        :src="require('images/icons/back-arrow.svg')"
        class="h-4 w-4 fill-indigo-900"
      />
    </a>

    <p class="mb-7 text-3xl text-blue-gray-700">
      Sesión de Feedback
    </p>

    <div class="mb-5 flex w-fit justify-between space-x-20 rounded-lg bg-blue-gray-50 p-2">
      <div>
        <p class="text-sm text-blue-gray-500">
          Realizada por:
        </p>
        <p>
          {{ feedbackSession.provider.name }}
        </p>
      </div>
      <div>
        <p class="text-sm text-blue-gray-500">
          Fecha:
        </p>
        <p>
          {{ feedbackSession.sessionDate }}
        </p>
      </div>
    </div>

    <div class="mb-2.5 flex items-center justify-between">
      <p class="text-xl text-blue-gray-500">
        Comentarios
      </p>
      <base-button class="bg-indigo-500">
        <a
          class="flex items-center"
          :href="`/feedback_sessions/${feedbackSession.id}/comments/new`"
        >
          <inline-svg
            :src="require('images/icons/comment.svg')"
            class="mr-2 h-4 w-4 fill-indigo-500"
          />
          Añadir comentario
        </a>
      </base-button>
    </div>

    <feedback-session-comment-item
      v-for="comment in comments"
      :key="comment.id"
      class="mb-3"
      :comment="comment"
    />
  </div>
</template>

