class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :chat

  acts_as_readable on: :created_at

  scope :with_body, -> { where("body NOT ?", nil) }
  scope :other, -> (user_id) { where('user_id != ?', user_id) }
end
