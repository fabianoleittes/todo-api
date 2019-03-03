class Todo < ApplicationRecord
  validates :title, :created_by, presence: true
end
