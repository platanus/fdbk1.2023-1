class App::FeedbackSessionsController < App::BaseController
  def index
    @provider_sessions = current_user.providers.includes(:provider, :receiver)
    @tags = Tag.all.select(:id, :name)
  end

  def new
    @feedback_session = FeedbackSession.new
    @users = User.where.not(id: current_user.id)
    @tags = Tag.all.select(:id, :name)
  end

  def show
    @comments = feedback_session.comments
  end

  private

  def feedback_session
    @feedback_session ||= FeedbackSession.find(params[:id])
  end
end
