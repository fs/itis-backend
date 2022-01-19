module Types
  class CommentType < Types::BaseObject
    field :id, ID, null: false
    field :text, String, null: false
    field :creator, Types::UserType, null: false

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :task, Types::TaskType, null: false
  end
end
