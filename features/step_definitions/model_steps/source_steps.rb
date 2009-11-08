Given /^there is a Source called "([^\"]*)" with domain "([^\"]*)"$/ do |name, domain|
  Factory :source, :name => name,
          :domains => [Factory :domain, :host => domain]
end

