class Project < ActiveRecord::Base
  belongs_to :user

  has_many :tasks, dependent: :destroy, order: :priority

  attr_accessible :user, :name

  validates :user, presence: true
  validates :name, presence: true, length: { maximum: 255 }
end
