class Option < ApplicationRecord
  belongs_to :question
  has_many :answers_options
  has_many :answers, through: :answers_options, dependent: :destroy

  validates :body, presence: true
end
