class Note < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, allow_blank: false
end
