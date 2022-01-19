module Mutations
  class CreateProject < BaseMutation
    include AuthenticableGraphqlUser

    argument :name, String, required: true
    argument :description, String, required: false

    type Types::ProjectType

    def resolve(**params)
      result = ::CreateProject.call(params: params, current_user: current_user)

      if result.success?
        result.project
      else
        execution_error(error_data: result.error_data)
      end
    end
  end
end
