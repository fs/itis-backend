module Resolvers
  class Tasks < Resolvers::Base
    include AuthenticableGraphqlUser

    argument :id, ID, required: false

    type [Types::TaskType], null: false

    delegate :projects, to: :current_user

    private

    def fetch_data
      FilteredTasksQuery.new(raw_relation, options).all
    end

    def raw_relation
      Task.where(project: projects)
    end
  end
end
