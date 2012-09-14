Given /^there (?:is|are) the following users?:$/ do |table|
  table.hashes.each do |attributes|
    # The key passed to delete() here must be a string, NOT a symbol!
    # Because the param "table" only takes string as its key,
    # and is just a plain Hash, not a HashWithIndifferentAccess.
    # Likely, the values are also strings, not FixNums or booleans or anything else.
    unconfirmed = (attributes.delete('unconfirmed') == 'true')
    admin = (attributes.delete('admin') == 'true')
    @user = User.create!(attributes)
    @user.confirm! unless unconfirmed
    @user.update_attribute(:admin, admin) if admin
  end
end

When /^(?:|I am )sign(?:ed)? in as it$/ do
  steps %Q{
      Given I am on the homepage
      When I follow "Sign in"
      And fill in "Email" with "#{@user.email}"
      And fill in "Password" with "P@ssw0rd"
      And press "Sign in"
      Then I should see "Signed in successfully."
    }
end

When /^(?:|I am )sign(?:ed)? in as "([^"]*)"$/ do |email|
  @user = User.find_by_email(email)
  steps "When I am signed in as it"
end
