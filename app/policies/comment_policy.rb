class CommentPolicy < ApplicationPolicy
  def manage?
    return false unless record.is_a? Comment
    user == record&.creator
  end

  alias update? manage?
  alias delete? manage?
end
