class Instruction < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :quizzes
  belongs_to :category

  validates :title, :body, presence: true

  scope :active, -> { where(active: true) }
end
