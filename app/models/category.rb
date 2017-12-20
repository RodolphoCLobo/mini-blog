class Category < ApplicationRecord
  has_many :articles
  validates :name, presence: true

  def to_s
    self.name
  end
end
