class CreateTask
  include Interactor

  delegate :params, :current_user, :task, to: :context

  def call
    context.fail!(error_data: { message: "Project is not exist" }) if project.blank?
    context.fail!(error_data: { message: "You have not permissions" }) unless project.users.exists?(current_user.id)

    context.task = Task.new(task_params)

    context.fail!(error_data: error_data) unless task.save
  end

  private

  def task_params
    params.merge(
      {
        creator: current_user
      }
    )
  end

  def project
    @project ||= Project.find_by(id: params[:project_id])
  end

  def error_data
    { message: "Record Invalid", detail: task.errors.to_a }
  end
end
