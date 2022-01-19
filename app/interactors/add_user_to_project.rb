class AddUserToProject
  include Interactor

  delegate :params, :project, to: :context

  def call
    context.fail!(error_data: error_data) unless can_be_added?

    project.users.push user
  end

  private

  def user
    @user ||= User.find_by(id: params[:user_id])
  end

  def can_be_added?
    user.present? && !project.users.exists?(user.id)
  end

  def error_data
    { message: "User can not be added" }
  end
end
