class ApplicationController
  module Authentication
    
    attr_reader :logged_in_user
    
    def self.included(base)
      base.before_filter :load_logged_in_user
    end
    
    def load_logged_in_user
      id = session[:logged_in_user_id]
      @logged_in_user = User.find(id) if id
    end
    
    def log_in(user)
      session[:logged_in_user_id] = user.id
    end
    
  end
end

