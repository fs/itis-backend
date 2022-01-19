class UpdateComment
  include Interactor

  delegate :params, :comment, to: :context

  def call
    comment.assign_attributes(params)

    context.fail!(error_data: error_data) unless comment.save
  end

  private

  def error_data
    { message: "Record Invalid", detail: comment.errors.to_a }
  end
end
