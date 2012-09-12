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
end
