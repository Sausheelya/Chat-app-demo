class Group < ApplicationRecord
  has_many :group_members, dependent: :destroy
  has_many :users, through: :group_members
  has_many :chats, dependent: :destroy
  has_many :messages, through: :chats
end