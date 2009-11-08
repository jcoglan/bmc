# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  attr_reader :logged_in_user
  
  def render_user(user)
    user == logged_in_user ? "you" : link_to(user.username, user)
  end
  
end
