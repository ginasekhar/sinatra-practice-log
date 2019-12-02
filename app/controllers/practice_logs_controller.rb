class PracticeLogsController < ApplicationController

    get "/practice_logs" do
        if logged_in?
            @practice_logs = PracticeLog.all
            #@error = ""
            erb :"/practice_logs/index"
        else
            @error = "Please login to see practice_logs"
            redirect to '/login'
        end
    end

    get '/practice_logs/new' do 
        if logged_in?
            @error = ""
            erb :'/practice_logs/new'
        else
            @error = "Please login to create practice_logs"
            redirect to '/login'
        end
    end
    
    post '/practice_logs' do 
        #binding.pry
        if logged_in?
            if params[:content] != "" 
                if @practice_log = current_user.practice_logs.build(content: params[:content])
                    @practice_log.save
                    @error = ""
                    redirect to "/practice_logs/#{@practice_log.id}"
                else
                    @error = "Not saved, try again"
                    redirect to "/practice_logs/new"
                end
            else
                @error = "Blank content, try again"
                redirect to "/practice_logs/new"
            end
        else
            @error = "Please login to create practice_logs"
            redirect to '/login'
        end
    end
    
    get '/practice_logs/:id' do 
        if logged_in? 
            @practice_log = PracticeLog.find_by_id(params[:id])
            @error = ""
            erb :'/practice_logs/show'
        else
            redirect to '/login'
        end
    end

    get '/practice_logs/:id/edit' do 
        if logged_in? 
            @practice_log = current_user.practice_logs.find_by_id(params[:id])
            if @practice_log 
                erb :'/practice_logs/edit'
            else
                @error = "this is not one of your practice logs.  You can't edit"
                redirect to "/practice_logs/#{@practice_log.id}"
            end
        else
            @error = "Please login to create practice_logs"
            redirect to  '/login'
        end
    end

    patch '/practice_logs/:id' do 
        if logged_in? 
            @practice_log = current_user.practice_logs.find_by_id(params[:id])
            if @practice_log && PracticeLog.valid_params?(params) 
                @practice_log.update(content: params[:content])
                @error = ""
                redirect to "/practice_logs/#{@practice_log.id}"
            else
                @error = "Update only your practice_logs with non blank content, try again"
                redirect to "/practice_logs/#{@practice_log.id}/edit"
            end
        else
            @error = "Please login to create practice_logs"
            redirect to '/login'
        end
    end

    delete '/practice_logs/:id/delete' do
        if logged_in? 
            @practice_log = PracticeLog.find_by_id(params[:id])
            #binding.pry
            if @practice_log && @practice_log.student == current_user
                @practice_log.delete
                @error = ""
                redirect to "/practice_logs"
            else
                @error = "Delete only your practice_logs"
                redirect to "/practice_logs"
            end    
        else
            @error = "Please login to create practice_logs"
            redirect to '/login'
        end      
    end
end
