class Api::V1::ChatsController < ApplicationController
  before_action :authenticate_user!

  def index
    @chats = current_user.chats.paginate(page: params[:page], per_page: 10)
    render json: @chats, each_serializer: ChatSerializer
  end

  def show
    @chat = Chat.find(params[:id])
    render json: @chat, serializer: ChatSerializer
  end

  def create
    @chat = current_user.chats.create!(chat_params)
    render json: @chat, serializer: ChatSerializer
  end

  private

  def chat_params
    params.require(:chat).permit(:body)
  end
end

