Then /^I should see "([^"]*)" link$/ do |text|
  page.should have_link(text)
end

Then /^I should not see "([^"]*)" link$/ do |text|
  page.should_not have_link(text)
end