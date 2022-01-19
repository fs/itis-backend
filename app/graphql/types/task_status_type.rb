# frozen_string_literal: true

module Types
  class TaskStatusType < Types::BaseEnum
    value "NOT_STARTED", value: "not_started"
    value "STARTED", value: "started"
    value "FINISHED", value: "finished"
  end
end
