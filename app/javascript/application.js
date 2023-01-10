import { createApp } from 'vue';
import InlineSvg from 'vue-inline-svg';

import TheHeader from './components/the-header.vue';
import BaseInput from './components/base-input.vue';
import BaseButton from './components/base-button.vue';
import BaseCheckbox from './components/base-checkbox.vue';
import BaseTitle from './components/base-title.vue';
import BaseTag from './components/base-tag.vue';
import TagSelect from './components/tag-select.vue';
import UserSession from './components/user-session.vue';
import FeedbackSessions from './components/feedback-sessions.vue';
import FeedbackSessionsTitle from './components/feedback-sessions-title.vue';
import FeedbackSessionsForm from './components/feedback-sessions-form.vue';
import FeedbackSessionDetails from './components/feedback-session-details.vue';
import CommentsForm from './components/comments-form.vue';
import './css/application.css';

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp({
    components: {
      TheHeader,
      UserSession,
      FeedbackSessions,
      FeedbackSessionsTitle,
      FeedbackSessionsForm,
      FeedbackSessionDetails,
      CommentsForm,
    },
  });

  app.component('InlineSvg', InlineSvg);

  app.component('BaseInput', BaseInput);
  app.component('BaseButton', BaseButton);
  app.component('BaseCheckbox', BaseCheckbox);
  app.component('BaseTitle', BaseTitle);
  app.component('BaseTag', BaseTag);
  app.component('TagSelect', TagSelect);
  app.mount('#vue-app');

  return app;
});
