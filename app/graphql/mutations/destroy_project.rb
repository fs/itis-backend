module Mutations
  class DestroyProject < BaseMutation
    include AuthenticableGraphqlUser

    argument :project_id, ID, required: true

    type String

    def resolve(**params)
      project = ::Project.find_by(id: params.delete(:project_id))
      authorize! project || Project, to: :destroy?

      if project.destroy
        "Project destroyed"
      else
        "Project not destroyed"
      end
    end
  end
end
