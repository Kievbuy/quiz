class User < ApplicationRecord
  enum role: [:nutzer, :admin]

  has_and_belongs_to_many :instructions
  has_many :answers

  after_initialize :set_default_role, if: :new_record?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :recoverable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  scope :nutzer, -> { where(role: "nutzer") }

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def set_default_role
    self.role ||= :nutzer
  end

end
