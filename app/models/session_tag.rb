class SessionTag < ApplicationRecord
  belongs_to :feedback_session
  belongs_to :tag
end

# == Schema Information
#
# Table name: session_tags
#
#  id                  :bigint(8)        not null, primary key
#  feedback_session_id :bigint(8)        not null
#  tag_id              :bigint(8)        not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_session_tags_on_feedback_session_id  (feedback_session_id)
#  index_session_tags_on_tag_id               (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (feedback_session_id => feedback_sessions.id)
#  fk_rails_...  (tag_id => tags.id)
#
