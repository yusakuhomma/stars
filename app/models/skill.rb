class Skill < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :haveskills
  
  validates :name, presence: true
end
