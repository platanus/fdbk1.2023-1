class Api::Internal::FeedbackSessionsController < Api::Internal::BaseController
  before_action :authenticate_user!

  def index
    sessions = if params[:type].present?
                 filtered_sessions
               else
                 FeedbackSession.for_user(current_user)
               end

    respond_with sessions.includes(:provider, :receiver)
  end

  def create
    ActiveRecord::Base.transaction do
      feedback_session = FeedbackSession.create!(
        provider_id: feedback_session_params[:provider_id],
        session_date: feedback_session_params[:session_date],
        receiver: current_user
      )

      if feedback_session_params[:tags_ids].present? &&
          feedback_session_params[:tags_ids].any?(&:present?)
        feedback_session.tags << feedback_session_params[:tags_ids].map { |id| Tag.find(id) }
      end
      respond_with feedback_session
    end
  end

  private

  def feedback_session_params
    params.require(:feedback_session).permit(:provider_id, :session_date, tags_ids: [])
  end

  def filtered_sessions
    params[:type] === 'provider' ? current_user.providers : current_user.receivers
  end
end
