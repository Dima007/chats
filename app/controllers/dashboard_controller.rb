class DashboardController < ApplicationController
  before_filter :signed_in_user
  
  def index
    @user ||= current_user
    @chats = @user.chats.order("created_at DESC")
  end
end
