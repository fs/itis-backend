module Types
  class QueryType < Types::BaseObject
    field :me, resolver: Resolvers::CurrentUser
    field :activities, resolver: Resolvers::Activities, connection: true
    field :users, resolver: Resolvers::Users
    field :tasks, resolver: Resolvers::Tasks
  end
end
