require 'seeder'

if Rails.env.development?
  Seeder.fake_users
  Seeder.fake_projects
  Seeder.fake_tasks
end
