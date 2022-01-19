module Mutations
  class AddUserToProject < BaseMutation
    include AuthenticableGraphqlUser

    argument :project_id, ID, required: true
    argument :user_id, ID, required: true

    type Types::ProjectType

    def resolve(**params)
      project = ::Project.find_by(id: params.delete(:project_id))
      authorize! project || Project, to: :update?

      result = ::AddUserToProject.call(params: params, current_user: current_user, project: project)

      if result.success?
        result.project
      else
        execution_error(error_data: result.error_data)
      end
    end
  end
end
