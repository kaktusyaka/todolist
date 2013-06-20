class Task < ActiveRecord::Base
  belongs_to :project

  attr_accessible :project_id, :name, :deadline, :finish

  validates :project, presence: true
  validates :name, presence: true, length: { maximum: 255 }
  validates :deadline, presence: true, timeliness: { type: :date }
  validates :finish, inclusion: { in: [true, false] }
end
