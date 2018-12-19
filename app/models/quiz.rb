class Quiz < ApplicationRecord
  has_and_belongs_to_many :instructions
  has_and_belongs_to_many :questions
  has_many :examinations, dependent: :destroy

  before_save :check_mandatory

  validates :title, :level, :active, :percent_to_pass, presence: true

  scope :active, -> { where(active: true) }

  private

  def check_mandatory
    self.questions << Question.mandatory
  end
end
