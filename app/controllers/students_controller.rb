class StudentsController < ApplicationController
    get '/' do
        erb :'index'
    end

    get '/signup' do
        if !logged_in? 
            erb :'/students/signup'
        else
            redirect '/practice_logs'
        end
    end 

    post '/signup' do
        #create a new user
        if Student.valid_params?(params)
            @student = Student.new(params)
            @student.save
            session[:user_id] = @student.id
            redirect to '/practice_logs'  
        else
            redirect to "/signup"
        end
    end

    get '/login' do
        if !logged_in? 
            erb :'/students/login'
        else
            redirect '/practice_logs'
        end
    end

    post '/login' do
        student = Student.find_by(username: params[:username])
        if student && student.authenticate(params[:password])
            session[:user_id] = student.id
            redirect "/practice_logs"
        else
            redirect "/login"
        end
    end

    get '/logout' do
        if logged_in? 
            erb :'/students/logout'
        else
            redirect "/"
        end
    end

    post '/logout' do
        session.clear
        redirect "/"
    end
end
