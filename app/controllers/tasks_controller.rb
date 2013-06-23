class TasksController < InheritedResources::Base
  load_and_authorize_resource
  respond_to :js
  belongs_to :project

  def update
    update! do |success, failure|
      success.json { respond_with_bip(resource) }
      failure.json { respond_with_bip(resource) }
    end
  end
end
