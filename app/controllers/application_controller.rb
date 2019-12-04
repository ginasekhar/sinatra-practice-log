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
      if !logged_in?
        flash[:error] = "Please login to use the Music Practice Logger"
        redirect "/login"
      end
    end

    def redirect_if_not_authorized
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
