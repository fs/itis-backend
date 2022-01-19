class UpdateProject
  include Interactor

  delegate :params, :project, to: :context

  def call
    project.assign_attributes(params)

    context.fail!(error_data: error_data) unless project.save
  end

  private

  def error_data
    { message: "Record Invalid", detail: project.errors.to_a }
  end
end
