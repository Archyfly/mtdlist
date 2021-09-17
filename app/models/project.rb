class Project < ApplicationRecord
  belongs_to :user

  validates :title, :description, presence: true

  def formatted_created_at
    created_at.strftime("%Y-%m-%d %H:%M:%S")
  end
end
