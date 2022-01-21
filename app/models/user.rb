class User < ApplicationRecord
  include ImageUploader::Attachment(:avatar)

  has_secure_password
  has_secure_token :password_reset_token

  has_and_belongs_to_many :projects, dependent: :destroy

  has_many :created_tasks, inverse_of: :creator, class_name: "Task",
                           foreign_key: :creator_id, dependent: :destroy
  has_many :created_projects, inverse_of: :creator, class_name: "Project",
                              foreign_key: :creator_id, dependent: :destroy
  has_many :created_comments, inverse_of: :creator, class_name: "Comment",
                              foreign_key: :creator_id, dependent: :destroy

  has_many :activities, dependent: :destroy
  has_many :refresh_tokens, dependent: :destroy

  has_many :possession_tokens, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
