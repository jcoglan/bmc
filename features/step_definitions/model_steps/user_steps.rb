Given /^there is a User "([^\"]*)" with password "([^\"]*)"$/ do |username, password|
  Factory :user, :username => username,
                 :password => password
end

