class Player < ActiveRecord::Base

  VALID_HANDS = ["Right", "Left"]

  [:name, :email, :hand, :grade].each do |attribute|
    validates attribute, presence: true
  end

  validates :hand, inclusion: { in: VALID_HANDS,
    message: "%{value} is not a valid hand" }
  validates :grade, numericality: { only_integer: true }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

end
