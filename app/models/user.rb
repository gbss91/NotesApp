class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  validates :first_name, :last_name, :email, presence: true, allow_blank: false

  # Devise strong password - https://github.com/heartcombo/devise/wiki/How-To:-Set-up-simple-password-complexity-requirements
  validate :password_complexity

  def password_complexity
    # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
    return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}$/

    errors.add :password,
               'must have at least 8 characters and include 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  end

  has_many :notes, dependent: :destroy
end
