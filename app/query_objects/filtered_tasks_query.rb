class FilteredTasksQuery < BaseFilteredQuery
  ALLOWED_PARAMS = [:id].freeze

  def by_id(relation, id)
    relation.where(id: id)
  end
end
