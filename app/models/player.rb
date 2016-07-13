class Player < ActiveRecord::Base

  [:name, :email, :hand, :grade].each do |attribute|
    validates attribute, presence: true
  end

  validates :hand, inclusion: { in: %w(Right Left),
    message: "%{value} is not a valid hand" }
  validates :grade, numericality: { only_integer: true }

end
