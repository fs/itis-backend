module Mutations
  class UpdateProject < BaseMutation
    include AuthenticableGraphqlUser

    argument :project_id, ID, required: true
    argument :name, String, required: true
    argument :description, String, required: false

    type Types::ProjectType

    def resolve(**params)
      project = ::Project.find_by(id: params.delete(:project_id))
      authorize! project || Project, to: :update?

      result = ::UpdateProject.call(params: params, project: project)

      if result.success?
        result.project
      else
        execution_error(error_data: result.error_data)
      end
    end
  end
end
