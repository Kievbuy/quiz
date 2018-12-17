class Quiz < ApplicationRecord
  has_and_belongs_to_many :instructions
  has_and_belongs_to_many :questions
  has_many :examinations

  validates :title, :level, :active, :answers_to_pass, :percent_to_pass, presence: true

  scope :active, -> { where(active: true) }
end
