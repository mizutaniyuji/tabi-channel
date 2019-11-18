class ApplicationController < ActionController::Base
    
    include SessionsHelper
    
    private
    
    def required_loggedin
        unless logged_in?
            redirect_to login_path
        end
    end
    
    def counts(user)
        @count_followings = user.followings.count
        @count_followers = user.followers.count
    end


end
