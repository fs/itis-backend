module Types
  class TaskType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :description, String, null: true

    field :project, Types::ProjectType, null: false
    field :creator, Types::UserType, null: false
    field :comments, [Types::CommentType], null: false

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :status, Types::TaskStatusType, null: false
  end
end
