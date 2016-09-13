class Owner < ActiveRecord::Base
  has_many :articles
  validates :name, uniqueness: true
end
