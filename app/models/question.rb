class Question < ApplicationRecord
  has_and_belongs_to_many :quizzes
  has_many :options, dependent: :destroy

  before_save :check_mandatory

  accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true

  validates :body, presence: true
  validates_associated :options

  scope :active, -> { where(active: true) }
  scope :mandatory, -> { where(mandatory: true) }

  private

  def check_mandatory
    if self.mandatory
      self.quizzes << Quiz.all
    end
  end
end
