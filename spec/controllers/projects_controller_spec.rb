require 'spec_helper'

describe ProjectsController do
  let(:user_1) { create(:user)  }
  let(:user_2) { create(:user)  }

  context "GET #index" do
    before(:each) do
      project1 = create(:project, user: user_1)
      project2 = create(:project, user: user_1)
      project3 = create(:project, user: user_2)
      @projects_of_user_1 = [project1, project2]
    end

    it "user can see his projects" do
      sign_in(user_1)
      get :index
      assigns(:projects).should eq(@projects_of_user_1)
    end

    it "user cannot see projects lined to another user" do
      sign_in(user_2)
      get :index
      assigns(:projects).should_not eq(@projects_of_user_1)
    end
  end

  context "DELETE #destroy" do
    before { @project = create(:project, user: user_1)  }

    it "user can delete his project with tasks linked to this project" do
      sign_in(user_1)
      @project.tasks << create(:task, project_id: @project.id)
      @project.tasks << create(:task, project_id: @project.id)
      expect { delete :destroy, id: @project }.to change(Project, :count).by -1 and change(Task, :count).by -2
    end

    it "user cannot delete project which is linked to another user" do
      sign_in(user_2)
      expect { delete :destroy, id: @project }.to raise_error(ActiveRecord::RecordNotFound)
      user_1.projects.should include(@project)
    end
  end

  context "POST #create" do
    before { @project = build(:project, user: user_1)  }

    it "user can create his project" do
      sign_in(user_1)
      expect { post :create, :project => {name: @project.name, user_id: @project.user.id } }.to change(Project, :count).by(1)
    end
  end

  context "PUT #update" do
    before(:each) do
      @project = create(:project, user: user_1)
      @attr = { name: "New name" }
    end

    it "user can update his project" do
      sign_in(user_1)
      put :update, id: @project, project: @attr
      @project.reload
      @project.name.should eq(@attr[:name])
    end

    it "user cannot update project of anothe user" do
      sign_in(user_2)
      expect { put :update, id: @project, project: @attr }.to raise_error(ActiveRecord::RecordNotFound)
      @project.reload
      @project.name.should_not eq(@attr[:name])
    end
  end
end
