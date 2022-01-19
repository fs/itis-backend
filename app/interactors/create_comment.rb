class CreateComment
  include Interactor

  delegate :params, :current_user, :comment, to: :context

  def call
    context.fail!(error_data: { message: "Task is not exist" }) if task.blank?
    context.fail!(error_data: { message: "You have not permissions" }) unless task.project.users.exists?(current_user.id)

    context.comment = Comment.new(comment_params)

    context.fail!(error_data: error_data) unless comment.save
  end

  private

  def comment_params
    params.merge(
      {
        creator: current_user
      }
    )
  end

  def task
    @task ||= Task.find_by(id: params[:task_id])
  end

  def error_data
    { message: "Record Invalid", detail: comment.errors.to_a }
  end
end
