class ProjectsController < InheritedResources::Base
  load_and_authorize_resource
  actions :all, except: [:edit, :show, :new]
  #respond_to :html, only: [:index]
  #respond_to :js, except: :update
  respond_to :json#, only: :update

  protected
  def begin_of_association_chain
    current_user
  end

  def build_resource
    super.tap do |attr|
      attr.user = current_user
    end
  end
end
