class Task < ActiveRecord::Base
  belongs_to :project
  #acts_as_list scope: :project

  attr_accessible :project_id, :name, :deadline, :finish, :priority

  validates :project, presence: true
  validates :name, presence: true, length: { maximum: 255 }
  validates :deadline, presence: true, timeliness: { type: :date }
  validates :finish, inclusion: { in: [true, false] }
  validates :priority, presence: true, numericality: { only_integer: true, greater_than: 0  }

  scope :sort_by_priority, order('priority ASC')
end
