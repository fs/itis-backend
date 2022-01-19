class Task < ApplicationRecord
  ALLOWED_STATUSES = ["not_started", "started", "finished"]

  belongs_to :project

  validates :title, presence: true
  validates :status, inclusion: { in: ALLOWED_STATUSES }

  has_many :comments, dependent: :destroy

  belongs_to :creator, class_name: "User"
end
