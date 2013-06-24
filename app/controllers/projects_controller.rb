class ProjectsController < InheritedResources::Base
  load_and_authorize_resource
  actions :all, except: [:edit, :show, :new]
  respond_to :html, only: [:index]
  respond_to :js, except: :update
  respond_to :json, only: :update

  def update
    update! do |success, failure|
      success.json { respond_with_bip(resource) }
      failure.json { respond_with_bip(resource) }
    end
  end

  protected
  def begin_of_association_chain
    current_user
  end

  def collection
    @projects ||= end_of_association_chain
  end

  def build_resource
    super.tap do |attr|
      attr.user_id = current_user.id
    end
  end
end
