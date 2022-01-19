class Comment < ApplicationRecord
  validates :text, presence: true

  belongs_to :task
  belongs_to :creator, class_name: "User"
end
