class App::CommentsController < App::BaseController
  def new
    @feedback_session = FeedbackSession.find(params[:feedback_session_id])
  end
end
