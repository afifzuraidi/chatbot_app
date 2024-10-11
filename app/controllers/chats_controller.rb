class ChatsController < ApplicationController

  # GET /chats or /chats.json
  def index
    @chats = Chat.all.order(created_at: :asc)
    @chat = Chat.new
  end

  # POST /chats or /chats.json
  def create
    @chat = Chat.new(chat_params)

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
