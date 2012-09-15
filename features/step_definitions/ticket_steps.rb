When /^that project has a ticket:$/ do |table|
  table.hashes.each do |attributes|
    @project.tickets.create!(attributes)
  end
end

When /^"([^"]*)" has created a ticket for this project:$/ do |email, table|
  table.hashes.each do |attributes|
    attributes.merge!(:user => User.find_by_email!(email))
    @project.tickets.create!(attributes)
  end
end

When /^(?:|I )create the following tickets? for the "([^"]*)" project:$/ do |project, table|
  # table is a | Shiny!  | Make it so! |pending
  table.hashes.each do |attributes|
    steps %Q{
      Given I am on the homepage
      When I follow "#{project}"
      And follow "New Ticket"
      And fill in "Title" with "#{attributes['title']}"
      And fill in "Description" with "#{attributes['description']}"
      And press "Create Ticket"
    }
  end
end

When /^(?:|I )update the following tickets? for the "([^"]*)" project:$/ do |project, table|
  table.hashes.each do |attributes|
    steps %Q{
      Given I am on the homepage
      When I follow "#{project}"
      And follow "#{attributes['title']}"
      And follow "Edit Ticket"
      And fill in "Title" with "#{attributes['new title']}"
      And fill in "Description" with "#{attributes['new description']}"
      And press "Update Ticket"
    }
  end
end

When /I delete the "([^"]*)" ticket for the "([^"]*)" project/ do |ticket, project|
  steps %Q{
    Given I am on the homepage
    When I follow "#{project}"
    And follow "#{ticket}"
    And follow "Delete Ticket"
  }
end