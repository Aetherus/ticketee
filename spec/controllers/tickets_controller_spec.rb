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

    it "cannot begin to creating a ticket" do
      get :new, :project_id => project.id
      cannot_create_tickets!
    end

    it "cannot create a ticket without permission" do
      post :create, :project_id => project.id
      cannot_create_tickets!
    end
  end
end
