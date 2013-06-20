class ProjectsController < InheritedResources::Base
  load_and_authorize_resource
  respond_to :html, only: [:index]
  respond_to :js

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
