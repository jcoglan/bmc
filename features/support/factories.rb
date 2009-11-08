Factory.define :article do |a|
end

Factory.define :domain do |d|
  d.host "example.com"
end

Factory.define :source do |s|
  s.domains [Factory(:domain)]
end

Factory.sequence :username do |n|
  "test_user_#{n}"
end

Factory.define :user do |u|
  u.username { Factory.next :username }
  u.password "foo"
end

