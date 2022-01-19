module Mutations
  class UpdateTask < BaseMutation
    include AuthenticableGraphqlUser

    argument :task_id, ID, required: true
    argument :title, String, required: true
    argument :description, String, required: false
    argument :status, String, required: true

    type Types::TaskType

    def resolve(**params)
      task = ::Task.find_by(id: params.delete(:task_id))
      authorize! task || Task, to: :update?

      result = ::UpdateTask.call(params: params, task: task)

      if result.success?
        result.task
      else
        execution_error(error_data: result.error_data)
      end
    end
  end
end
