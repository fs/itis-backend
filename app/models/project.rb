class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy

  has_and_belongs_to_many :users

  validates :name, presence: true

  belongs_to :creator, class_name: "User"
end
