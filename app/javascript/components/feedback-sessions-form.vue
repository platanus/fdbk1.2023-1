<script setup lang="ts">
import { reactive } from 'vue';
import type { User } from 'api/users';
import feedbackSessions, { type FeedbackSessionForm } from 'api/feedback-sessions';

const props = defineProps<{
  users: User[];
}>();

const form = reactive({
  providerId: props.users[0]?.id,
  sessionDate: '',
} as FeedbackSessionForm);

async function submitForm() {
  await feedbackSessions.create(form);
  window.location.href = '/';
}

</script>

<template>
  <a
    href="/"
    class="mb-6 inline-block rounded-2xl bg-slate-100 px-5 py-2"
  >
    <inline-svg
      :src="require('images/icons/left-arrow.svg')"
      class="h-4 w-4 fill-slate-500"
    />
  </a>

  <base-title class="mb-6">
    Crear sesión
  </base-title>

  <form
    class="space-y-5 rounded-lg bg-slate-100 p-4"
    @submit.prevent="submitForm"
  >
    <label
      class="flex flex-col"
    >
      <span class="text-base font-normal text-slate-700">Se va a recibir feedback de</span>
      <select
        v-model="form.providerId"
        class="rounded border-slate-200 bg-white focus:ring-indigo-600"
      >
        <option
          v-for="user in users"
          :key="user.id"
          :value="user.id"
        >
          {{ user.name }}
        </option>
      </select>
    </label>
    <base-input
      v-model="form.sessionDate"
      type="date"
      label="Fecha"
    />
    <base-button>
      Guardar
    </base-button>
  </form>
</template>
