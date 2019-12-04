class StudentsController < ApplicationController
    get '/' do
        erb :'welcome'
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
        student = Student.new(params)
        if student.valid?
            student.save
            session[:user_id] = student.id
            @current_user = student
            redirect to '/practice_logs'  
        else
            flash[:error] =  student.errors.full_messages.to_sentence
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
            @current_user = student
            redirect "/practice_logs"
        else
            flash[:error] =  student.errors.full_messages.to_sentence
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
        @current_user = nil
        session.clear
        redirect "/"
    end
end
