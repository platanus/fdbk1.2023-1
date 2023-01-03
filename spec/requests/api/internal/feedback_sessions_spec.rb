require 'rails_helper'

RSpec.describe 'Api::Internal::FeedbackSessionsControllers', type: :request do
  let(:user) { create(:user) }

  describe 'GET /index' do
    let(:collection) { JSON.parse(response.body)['feedback_sessions'] }
    let(:params) { {} }

    before do
      create_list(:feedback_session, 5)
      create_list(:feedback_session, 2, receiver: user)
      create_list(:feedback_session, 1, provider: user)
    end

    def perform
      get '/api/internal/feedback_sessions', params: params
    end

    context 'with authorized user' do
      before do
        sign_in(user)
        perform
      end

      it { expect(collection.count).to eq(3) }
      it { expect(response.status).to eq(200) }
    end

    context 'with type param' do
      let(:params) { { type: 'provider' } }

      before do
        sign_in(user)
        perform
      end

      it { expect(collection.count).to eq(1) }
      it { expect(response.status).to eq(200) }
    end

    context 'with unauthenticated user' do
      before { perform }

      it { expect(response.status).to eq(401) }
    end
  end

  describe 'POST /create' do
    let(:provider) { create(:user) }
    let(:tag) { create(:tag) }
    let(:params) { { provider_id: provider.id, session_date: '2023-01-01', tags_ids: [tag.id] } }

    def perform
      post '/api/internal/feedback_sessions', params: { feedback_session: params }
    end

    it { expect(FeedbackSession.count).to eq(0) }

    context 'with authorized user' do
      let(:created_session) { JSON.parse(response.body)['feedback_session'] }

      before do
        sign_in(user)
        perform
      end

      it { expect(response.status).to eq(201) }
      it { expect(FeedbackSession.count).to eq(1) }
      it { expect(created_session['id']).to eq(FeedbackSession.last.id) }
      it { expect(created_session['receiver']['id']).to eq(user.id) }
      it { expect(created_session['tags'].count).to eq(1) }

      context 'without tags' do
        let(:params) { { provider_id: provider.id, session_date: '2023-01-01', tags_ids: [] } }

        it { expect(created_session['tags'].count).to eq(0) }
      end
    end

    context 'with unauthorized user' do
      before { perform }

      it { expect(response.status).to eq(401) }
      it { expect(FeedbackSession.count).to eq(0) }
    end
  end
end
