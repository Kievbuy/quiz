class Answer < ApplicationRecord
  belongs_to :user
  has_many :answers_options
  has_many :options, through: :answers_options, dependent: :destroy
end
