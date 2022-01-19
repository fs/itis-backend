class CreateProject
  include Interactor

  delegate :params, :current_user, :project, to: :context

  def call
    context.project = Project.new(project_params)

    context.fail!(error_data: error_data) unless project.save
  end

  private

  def project_params
    params.merge(
      {
        creator: current_user,
        users: [current_user]
      }
    )
  end

  def error_data
    { message: "Record Invalid", detail: project.errors.to_a }
  end
end
