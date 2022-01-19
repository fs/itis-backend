module Resolvers
  class Users < Resolvers::Base
    include AuthenticableGraphqlUser

    type [Types::UserType], null: false

    private

    def fetch_data
      User.all
    end
  end
end
