class TaskPolicy < ApplicationPolicy
  def manage?
    return false unless record.is_a? Task
    user == record&.creator
  end

  alias update? manage?
  alias delete? manage?
end
