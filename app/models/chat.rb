class Chat < ActiveRecord::Base
  has_many :messages
  has_many :users, -> { uniq }, through: :messages
end
