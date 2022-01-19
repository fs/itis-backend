module Mutations
  class DestroyTask < BaseMutation
    include AuthenticableGraphqlUser

    argument :task_id, ID, required: true

    type String

    def resolve(**params)
      task = ::Task.find_by(id: params.delete(:task_id))
      authorize! task || Task, to: :destroy?

      if task.destroy
        "Task destroyed"
      else
        "Task not destroyed"
      end
    end
  end
end
