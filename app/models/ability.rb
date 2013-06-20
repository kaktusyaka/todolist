class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, Project do |project|
      project.user == user
    end

    can :manage, Task do |task|
      task.project.user == user
    end
  end
end
