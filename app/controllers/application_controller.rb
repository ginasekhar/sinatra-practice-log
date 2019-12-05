require './config/environment'


class ApplicationController < Sinatra::Base
  
  register Sinatra::Flash
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    set :session_secret, "SesameOpen"
  end

  get "/" do
    erb :welcome
  end

  helpers do

    def redirect_if_not_logged_in
      #this method is invoked if user is not logged in and tries to view, edit or delete
      if !logged_in?
        flash[:error] = "Please login to use the Music Practice Logger"
        redirect "/login"
      end
    end

    def redirect_if_not_authorized
      #this method is invoked if user is logged in but tries to view, edit or delete a practice_log that does not exist or belong to them
      flash[:error] = "There is no such log associated with your account. You cannot View, Edit or Delete it"
      redirect to "/practice_logs"
        
    end

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= Student.find_by(id: session[:user_id]) if session[:user_id]
    end

  end
end
