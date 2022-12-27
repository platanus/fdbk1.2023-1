class Tag < ApplicationRecord
  has_many :session_tags, dependent: :destroy
  has_many :feedback_sessions, through: :session_tags

  validates :name, presence: true, uniqueness: true
end

# == Schema Information
#
# Table name: tags
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tags_on_name  (name) UNIQUE
#
