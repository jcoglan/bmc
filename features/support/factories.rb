Factory.define :article do |a|
end

Factory.sequence :username do |n|
  "test_user_#{n}"
end

Factory.define :user do |u|
  u.username { Factory.next :username }
  u.password "foo"
end

