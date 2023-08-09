class Group < ApplicationRecord
  before_save :default_icon
  attr_accessor :total_amount

  belongs_to :user
  has_many :entities, dependent: :destroy

  validates :name, presence: true

  private

  def default_icon
    self.icon = 'https://source.unsplash.com/ocAo7MwGfHY' if icon.nil?
  end
end
