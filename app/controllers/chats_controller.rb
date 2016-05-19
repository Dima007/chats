class ChatsController < ApplicationController
  before_filter :signed_in_user

  def index
    @chats = Chat.all
  end

  def new
    @chat = Chat.new
  end

  def create
    @user ||= current_user
    @chat = @user.chats.create(chat_params)
    if @chat.save
      redirect_to root_path, notice: "Chat created"
    else
      flash.now[:alert] = "Something went wrong, please try again"
      render :new
    end
  end

  def show
    @chat = Chat.find(params[:id])
    @messages = @chat.messages.with_body
    @message = Message.new
    render layout: false
  end

  private
    def chat_params
      params.require(:chat).permit(:name, user_ids:[])
    end
end
