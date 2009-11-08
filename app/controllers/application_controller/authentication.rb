class ApplicationController
  module Authentication
  private
    
    attr_reader :logged_in_user
    
    def self.included(base)
      base.before_filter :load_logged_in_user
    end
    
    def load_logged_in_user
      id = session[:logged_in_user_id]
      @logged_in_user = User.find_by_id(id) if id
      log_out unless @logged_in_user
    end
    
    def log_in(user)
      session[:logged_in_user_id] = user.id
    end
    
    def log_out
      session[:logged_in_user_id] = nil
    end
    
  end
end

