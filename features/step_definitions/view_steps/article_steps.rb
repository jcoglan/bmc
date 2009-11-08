Given /^I add an Article from "([^\"]*)" with URL "([^\"]*)"$/ do |source_name, url|
  Given 'I am on the new article page'
  And 'I fill in "URL" with "' + url + '"'
  And 'I press "Submit"'
  And 'I choose "Other"'
  And 'I fill in "Source" with "' + source_name + '"'
  And 'I press "Save"'
end

