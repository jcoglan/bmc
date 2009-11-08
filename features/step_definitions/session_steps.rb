Given /^I am logged in$/ do
  Given 'I am logged in as "anonymous"'
end

Given /^I am logged in as "([^\"]*)"$/ do |username|
  Given "there is a User \"#{username}\" with password \"generic\""
  visit path_to("the login page")
  fill_in :username, :with => username
  fill_in :password, :with => "generic"
  click_button "Log in"
end

