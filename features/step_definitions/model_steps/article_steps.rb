Given /^the Article was submitted by ("[^\"]*")$/ do |username|
  article = universe.the(Article)
  user    = universe[username]
  article.update_attribute(:user, user)
end

