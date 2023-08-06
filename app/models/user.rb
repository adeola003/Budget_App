class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
  has_many :groups, dependent: :destroy
  has_many :entities, through: :groups

  validates :name, presence: true
end
