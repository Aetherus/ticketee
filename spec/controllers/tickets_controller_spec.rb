require 'spec_helper'

describe TicketsController do
  let :user do
    create_user!
  end

  let :project do
    FactoryGirl.create(:project)
  end

  let :ticket do
    FactoryGirl.create(:ticket, :project => project, :user => user)
  end

  context "standard users" do
    it "cannot access a ticket for a project" do
      sign_in(:user, user)
      get :show, :id => ticket.id, :project_id => project.id
      response.should redirect_to root_path
      flash[:alert].should eql("The project you were looking for could not be found.")
    end
  end

  context "with the permission to view the project" do
    before do
      sign_in(:user, user)
      Permission.create!(user: user,
                         thing: project,
                         action: 'view')
    end

    def cannot_create_tickets!
      response.should redirect_to project
      flash[:alert].should eql("You cannot create tickets on this project.")
    end

    def cannot_edit_tickets!
      response.should redirect_to project
      flash[:alert].should eql("You cannot edit tickets on this project.")
    end

    def cannot_delete_tickets!
      response.should redirect_to project
      flash[:alert].should eql("You cannot delete tickets from this project.")
    end

    it "cannot begin to creating a ticket without permission" do
      get :new, :project_id => project.id
      cannot_create_tickets!
    end

    it "cannot create a ticket without permission" do
      post :create, :project_id => project.id
      cannot_create_tickets!
    end

    it "cannot begin to edit a ticket without permission" do
      get :edit, :project_id => project.id, :id => ticket.id
      cannot_edit_tickets!
    end

    it "cannot edit a ticket without permission" do
      put :update, :project_id => project.id, :id => ticket.id, :ticket => {}
      cannot_edit_tickets!
    end

    it "cannot delete a ticket without permission" do
      delete :destroy, :project_id => project.id, :id => ticket.id
      cannot_delete_tickets!
    end
  end
end
