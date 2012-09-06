Given /^there (?:is|are)(?:| a) following users?:$/ do |table|
  table.hashes.each do |attributes|
    # The key passed to delete() here must be a string, NOT a symbol!
    # Because the param "table" only takes string as its key.
    # Likely, the values are also strings, not FixNums or booleans or anything else.
    confirmation_required = attributes.delete('confirmation_required') == 'true'
    @user = User.create!(attributes)
    @user.confirm! if (confirmation_required)
  end
end

When /^I am signed in as it$/ do
  steps %Q{
      Given I am on the homepage
      When I follow "Sign in"
      And fill in "Email" with "#{@user.email}"
      And fill in "Password" with "P@ssw0rd"
      And press "Sign in"
      Then I should see "Signed in successfully."
    }
end