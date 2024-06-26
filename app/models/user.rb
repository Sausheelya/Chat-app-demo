class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
  has_many :chats, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :group_members, dependent: :destroy
  has_many :groups, through: :group_members
end

