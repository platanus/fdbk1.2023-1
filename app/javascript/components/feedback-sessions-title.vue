<template>
  <div class="mb-7 flex justify-between">
    <base-title class="flex items-center">
      <img
        class="hidden h-7 w-7 md:block"
        :src="require('images/icons/feedback-sessions-desktop.png')"
      >
      <img
        class="block h-7 w-7 md:hidden"
        :src="require('images/icons/feedback-sessions.png')"
      >
      Sesiones de Feedback
    </base-title>

    <a
      href="/app/feedback_sessions/new"
      class="flex items-center justify-between gap-x-2 rounded bg-indigo-500 p-2 text-sm font-semibold text-white"
    >
      <inline-svg
        :src="require('images/icons/plus.svg')"
        class="h-3.5 w-3.5 fill-white"
      />
      Añadir sesión
    </a>
  </div>
</template>
