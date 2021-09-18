class Task < ApplicationRecord
  enum status: [:created, :in_progress, :done]

end
