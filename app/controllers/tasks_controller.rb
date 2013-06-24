class TasksController < InheritedResources::Base
  load_and_authorize_resource
  respond_to :js, except: :edit
  respond_to :html, only: :edit
  belongs_to :project
  actions :all, except: [:new, :show]
  custom_actions collection: :sort
  layout false, only: [:edit]

  def sort
    params[:task].each_with_index do |id, index|
      collection.update_all( { priority: index + 1 }, { id: id } )
    end
    render nothing: true
  end
end
