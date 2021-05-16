class Lab < ApplicationRecord
  has_one :mark, dependent: :delete
  validates :title, presence: true,
                    length: { maximum: 250 }
  validates :text, length: {maximum: 500}
end
