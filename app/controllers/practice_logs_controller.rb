class PracticeLogsController < ApplicationController

    get "/practice_logs" do
        if logged_in?
            @practice_logs = current_user.practice_logs
            #binding.pry
            erb :"/practice_logs/index"
        else
            flash[:notice] = "Please login to see practice_logs"
            redirect to '/login'
        end
    end

    get '/practice_logs/new' do 
        if logged_in?
            erb :'/practice_logs/new'
        else
            flash[:notice] = "Please login to create practice_logs"
            redirect to '/login'
        end
    end
    
    post '/practice_logs' do 
        #binding.pry
        if logged_in? 
            if @practice_log = current_user.practice_logs.build(params)
                @practice_log.save
                #binding.pry
                if @practice_log.valid?
                    redirect to "/practice_logs/#{@practice_log.id}"
                else
                    flash[:error] = @practice_log.errors.full_messages.to_sentence
                    redirect to "/practice_logs/new"
                end
            end
        else
            @error = "Please login to create practice_logs"
            redirect to '/login'
        end
    end
    
    get '/practice_logs/:id' do 
        if logged_in? 
            @practice_log = PracticeLog.find_by_id(params[:id])
            #binding.pry
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
                flash[:warning] = "this is not one of your practice logs.  You can't edit"
                redirect to "/practice_logs"
            end
        else
            @error = "Please login to edit practice_logs"
            redirect to  '/login'
        end
    end

    patch '/practice_logs/:id' do 
        if logged_in? 
            if @practice_log = current_user.practice_logs.find_by_id(params[:id])
                my_params = params.tap { |p| p.delete("_method") }
                @practice_log.update(my_params)
            
                if @practice_log.valid? 
                    redirect to "/practice_logs/#{@practice_log.id}"
                else
                    @error_message  = @practice_log.errors.full_messages.to_sentence
                    redirect to "/practice_logs/#{@practice_log.id}/edit"
                end
            end
        else
            @error = "Please login to update practice_logs"
            redirect to '/login'
        end
    end

    delete '/practice_logs/:id/delete' do
        if logged_in? 
            @practice_log = PracticeLog.find_by_id(params[:id])
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
