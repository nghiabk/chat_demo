class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :conversations, foreign_key: :sender_id
  has_many :messages

  scope :not_current_user, ->(user){where.not id: user}
end
