<script setup lang="ts">

import { ref } from 'vue';
import api from 'api/comments';
import type { FeedbackSession } from 'api/feedback-sessions';

interface Props {
  feedbackSession: FeedbackSession
}

const props = defineProps<Props>();

const body = ref('');
const hasError = ref(false);

async function submit() {
  try {
    await api.create(body.value, props.feedbackSession.id);
    window.location.href = `/feedback_sessions/${props.feedbackSession.id}`;
  } catch {
    hasError.value = true;
  }
}

</script>

<template>
  <div class="flex flex-col px-80">
    <a
      class="mb-4 flex h-9 w-16 items-center justify-center rounded-full bg-slate-100"
      :href="`/feedback_sessions/${feedbackSession.id}`"
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

    <p class="mb-3.5 text-xl text-blue-gray-700">
      Crear Comentario
    </p>

    <form
      class="flex flex-col rounded-lg bg-blue-gray-50 p-4"
      @submit.prevent="submit"
    >
      <div class="flex flex-col">
        <label
          class="mb-1 text-blue-gray-700"
          for="comment"
        >
          Comentario
        </label>
        <textarea
          v-model="body"
          class="mb-5 h-24 rounded-md border-2 border-blue-gray-200"
          name="body"
          type="text"
          required
        />
      </div>

      <base-button
        class="flex w-fit items-center bg-indigo-500"
      >
        <inline-svg
          :src="require('images/icons/comment.svg')"
          class="mr-2 h-4 w-4 fill-indigo-500"
        />
        Añadir comentario
      </base-button>

      <p v-if="hasError">
        Ha ocurrido un error
      </p>
    </form>
  </div>
</template>
