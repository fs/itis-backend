class FilteredProjectsQuery < BaseFilteredQuery
  ALLOWED_PARAMS = [:id].freeze

  def by_id(relation, profile_id)
    relation.where(id: profile_id)
  end
end
