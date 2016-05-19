class User < ActiveRecord::Base
  has_secure_password

  has_many :messages
  has_many :chats, -> { uniq }, through: :messages

  acts_as_reader

  before_save :create_remember_token

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
