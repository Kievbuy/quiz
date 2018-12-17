class Category < ApplicationRecord
  has_many :instructions, dependent: :destroy

  validates :title, :description, presence: true

  scope :active, -> { where(active: true) }
end
