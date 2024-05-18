class Api::V1::MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = Message.all
    render json: @messages, each_serializer: MessageSerializer
  end

  def show
    @message = Message.find(params[:id])
    render json: @message, serializer: MessageSerializer
  end

  def create
    @message = current_user.messages.create!(message_params)
    render json: @message, serializer: MessageSerializer
  end

  private

  def message_params
    params.require(:message).permit(:body, :chat_id)
  end
end