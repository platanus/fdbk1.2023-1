import type { AxiosResponse } from 'axios';
import type { Merge } from 'type-fest';
import api from './index';
import type { User } from './users';
import type { Tag } from './tags';

export interface FeedbackSession {
  id: number;
  provider: User;
  receiver: User;
  sessionDate?: string;
  tags: Tag[];
  createdAt: string;
  updatedAt: string;
}

export type FeedbackSessionForm = {
  providerId: number;
  tagsIds: number[];
  sessionDate?: string;
};

export default {
  index(type: string) {
    const path = `/api/internal/feedback_sessions?type=${type}`;

    return api<unknown, Merge<AxiosResponse, { data: { feedbackSessions: FeedbackSession[] }}>>({
      method: 'get',
      url: path,
    });
  },

  create(feedbackSession: FeedbackSessionForm) {
    const path = '/api/internal/feedback_sessions';

    return api({
      method: 'post',
      url: path,
      data: {
        feedbackSession,
      },
    });
  },
};
