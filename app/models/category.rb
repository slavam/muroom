class Category < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 50 }
  validates :path, presence: true, length: { maximum: 50 }
  validates_numericality_of :weight, :only_integer => true, :allow_nil => true, :greater_than_or_equal_to => 0
end
