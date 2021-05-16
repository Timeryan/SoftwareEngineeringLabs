class Mark < ApplicationRecord
  belongs_to :lab
  validates :points, numericality: { only_integer: true }, :inclusion => 1..100, presence: true
end
