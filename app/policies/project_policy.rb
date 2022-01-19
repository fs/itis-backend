class ProjectPolicy < ApplicationPolicy
  def manage?
    return false unless record.is_a? Project
    user == record&.creator
  end

  alias update? manage?
  alias delete? manage?
end
