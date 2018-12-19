class InstructionsUser < ApplicationRecord
  belongs_to :instruction
  belongs_to :user
end
