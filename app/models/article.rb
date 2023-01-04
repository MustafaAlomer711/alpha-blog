class Article < ApplicationRecord
  validates :title, :description, presence: true, uniqueness: true
end
