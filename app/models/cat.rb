class Cat < ApplicationRecord
  validates :name, presence: true, length: { maximum: 10 } 
  validates :age, presence: true 
end
