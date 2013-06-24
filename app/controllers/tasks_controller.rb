class TasksController < InheritedResources::Base
  load_and_authorize_resource
  respond_to :js
  belongs_to :project

  custom_actions collection: :sort

  def sort
    params[:task].each_with_index do |id, index|
      collection.update_all( { priority: index + 1 }, { id: id } )
    end
    render nothing: true
  end
end
