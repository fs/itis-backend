module Mutations
  class CreateComment < BaseMutation
    include AuthenticableGraphqlUser

    argument :task_id, ID, required: true
    argument :text, String, required: true

    type Types::CommentType

    def resolve(**params)
      result = ::CreateComment.call(params: params, current_user: current_user)

      if result.success?
        result.comment
      else
        execution_error(error_data: result.error_data)
      end
    end
  end
end
