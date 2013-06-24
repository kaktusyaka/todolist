require 'ruby-progressbar'
require 'faker'

module Seeder extend self

  def fake_users n = 5
    progress = ProgressBar.create(title: 'Filling users..',
                                  total: n,
                                  format: '%a %B %p%% %t')
    n.times do
      User.create(email: Faker::Internet.email, password: 'testing1', password_confirmation: 'testing1')
      progress.increment
    end

    puts " ----------------------------------- USERS--------------------------------- "
    User.all.map { |u| puts u.email  }
    puts " ----------------------------------- USERS--------------------------------- "
  end

  def fake_projects n = 5
    progress = ProgressBar.create(title: 'Filling projects..',
                                  total: User.count * n,
                                  format: '%a %B %p%% %t')

    User.all.each do |user|
      n.times do
        user.projects.create(name: Faker::Lorem.sentence)
        progress.increment
      end
    end
  end

  def fake_tasks n = 5
    progress = ProgressBar.create(title: 'Filling projects..',
                                  total: Project.count * n,
                                  format: '%a %B %p%% %t')

    Project.all.each do |project|
      n.times do
        project.tasks.create(name: Faker::Lorem.sentence, deadline: Time.now + rand(1..10).days)
        progress.increment
      end
    end
  end
end
