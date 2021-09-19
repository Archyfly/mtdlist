class Task < ApplicationRecord
  enum status: [:created, :in_progress, :done]

  belongs_to :project

  default_scope { order(priority: :desc) }
  scope :created, -> { where(status: 0) }
  scope :in_progress, -> { where(status: 1) }
  scope :done, -> { where(status: 2) }


  def dead?
    Time.now > deadline
  end
end
