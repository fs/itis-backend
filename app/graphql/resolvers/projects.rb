module Resolvers
  class Projects < Resolvers::Base
    include AuthenticableGraphqlUser

    argument :id, ID, required: false

    type [Types::ProjectType], null: false

    private

    def fetch_data
      FilteredProjectsQuery.new(raw_relation, options).all
    end

    def raw_relation
      object.projects
    end
  end
end
