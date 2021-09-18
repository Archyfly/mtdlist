class Task < ApplicationRecord
  enum status: [:created, :in_progress, :done]

  belongs_to :project
end
