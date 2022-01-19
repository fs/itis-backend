module Mutations
  class CreateTask < BaseMutation
    include AuthenticableGraphqlUser

    argument :project_id, ID, required: true
    argument :title, String, required: true
    argument :description, String, required: false
    argument :status, Types::TaskStatusType, required: true

    type Types::TaskType

    def resolve(**params)
      result = ::CreateTask.call(params: params, current_user: current_user)

      if result.success?
        result.task
      else
        execution_error(error_data: result.error_data)
      end
    end
  end
end
