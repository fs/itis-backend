class UpdateTask
  include Interactor

  delegate :params, :task, to: :context

  def call
    task.assign_attributes(params)

    context.fail!(error_data: error_data) unless task.save
  end

  private

  def error_data
    { message: "Record Invalid", detail: task.errors.to_a }
  end
end
