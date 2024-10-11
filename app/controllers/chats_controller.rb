class ChatsController < ApplicationController
  require_relative '../services/chat_gpt_service'
  before_action :authenticate_user!

  # GET /chats or /chats.json
  def index
    @chats = current_user.chats.order(created_at: :asc)
    @chat = Chat.new
  end

  # POST /chats or /chats.json
  def create
    @chat = current_user.chats.new(chat_params)

    respond_to do |format|
      if @chat.save
        response = ChatGPTService.new(@chat.message).call
        @chat.update(response: response)
        redirect_to root_path
      else
        render :index
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def chat_params
      params.require(:chat).permit(:message)
    end
end
