module Resolvers
  class Tasks < Resolvers::Base
    include AuthenticableGraphqlUser

    argument :id, ID, required: false

    type [Types::TaskType], null: false

    private

    def fetch_data
      FilteredTasksQuery.new(raw_relation, options).all
    end

    def raw_relation
      Task.all
    end
  end
end
