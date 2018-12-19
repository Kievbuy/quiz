class Answer < ApplicationRecord
  belongs_to :examination
  belongs_to :question
end
