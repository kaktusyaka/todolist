class TasksController < InheritedResources::Base
  load_and_authorize_resource
  respond_to :js
  belongs_to :project
end
