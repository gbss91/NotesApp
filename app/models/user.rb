class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  validates :first_name, :last_name, :email, presence: true, allow_blank: false

  has_many :notes, dependent: :destroy
end
