module SessionsHelper
  
  def log_in(user) # Used 'log_in' vs 'sign_in' to reflect site style
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    current_user = user
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    @current_user ||= user_from_remember_token
  end
  
  def logged_in? # Reflects use of Used 'log_in' vs 'sign_in'
    !current_user.nil?
  end
  
  def log_out
    cookies.delete(:remember_token)
    current_user = nil
  end
  
  private
  
    def user_from_remember_token
      User.authenticate_with_salt(*remember_token)
    end
    
    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end
end
