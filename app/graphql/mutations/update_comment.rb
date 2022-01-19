module Mutations
  class UpdateComment < BaseMutation
    include AuthenticableGraphqlUser

    argument :comment_id, ID, required: true
    argument :text, String, required: true

    type Types::CommentType

    def resolve(**params)
      comment = ::Comment.find_by(id: params.delete(:comment_id))
      authorize! comment || Comment, to: :update?

      result = ::UpdateComment.call(params: params, comment: comment)

      if result.success?
        result.comment
      else
        execution_error(error_data: result.error_data)
      end
    end
  end
end
