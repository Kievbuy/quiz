class Instruction < ApplicationRecord
  has_many :instructions_users
  has_many :users, through: :instructions_users
  has_and_belongs_to_many :quizzes
  belongs_to :category

  validates :title, :body, presence: true

  scope :active, -> { where(active: true) }
end
