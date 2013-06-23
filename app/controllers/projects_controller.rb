class ProjectsController < InheritedResources::Base
  load_and_authorize_resource
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
  def begin_association_chain
    current_user
  end

  def build_resource
    super.tap do |attr|
      attr.user_id = current_user.id
    end
  end
end
