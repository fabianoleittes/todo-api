class Item < ApplicationRecord
  belongs_to :todo
  validates :name, :todo, presence: true
end
