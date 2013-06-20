class Project < ActiveRecord::Base
  belongs_to :user

  has_many :tasks, dependent: :destroy

  attr_accessible :user_id, :name

  validates :user, presence: true
  validates :name, presence: true, length: { maximum: 255 }
end
