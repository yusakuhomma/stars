class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  belongs_to :department
  has_many :skills
  
  has_many :haveskills
  has_many :all_skills,through: :haveskills,source: :skill 
  has_many :yet_skills,through: :haveskills,source: :skill 
end
