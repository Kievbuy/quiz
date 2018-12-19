class Examination < ApplicationRecord
  enum status: ['passed', 'pending', 'failed']

  belongs_to :user
  belongs_to :quiz
  has_many   :answers

  # before_save :set_status

  private

  # def set_status
  #   self.status ||= :passed
  # end
end
