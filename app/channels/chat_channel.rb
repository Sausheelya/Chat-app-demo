class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    ActionCable.server.broadcast "chat_#{current_user.id}", message: data['message']
  end
end