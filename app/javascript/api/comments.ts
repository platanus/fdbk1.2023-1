import type { AxiosResponse } from 'axios';
import type { Merge } from 'type-fest';
import api from './index';

export interface Comment {
  id: number;
  body: string;
  createdAt: string;
  updatedAt: string;
}

export default {
  create(body: string, sessionFeedbackId: number) {
    const path = `/api/internal/feedback_sessions/${sessionFeedbackId}/comments`;

    return api<unknown, Merge<AxiosResponse, { data: { comments: Comment[] }}>>({
      method: 'post',
      url: path,
      data: JSON.stringify({ comment: { body } }),
    });
  },
};
