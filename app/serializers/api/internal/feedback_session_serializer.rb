class Api::Internal::FeedbackSessionSerializer < ActiveModel::Serializer
  type :feedback_session

  belongs_to :provider, serializer: ::Api::Internal::UserSerializer
  belongs_to :receiver, serializer: ::Api::Internal::UserSerializer
  has_many :tags, serializer: ::Api::Internal::TagSerializer

  attributes(
    :id,
    :session_date
  )
end
