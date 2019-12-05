class PracticeLogsController < ApplicationController

    get "/practice_logs" do
        if logged_in?
            @practice_logs = current_user.practice_logs
            @current_total_mins = current_user.total_practice_mins
            @class_avg_total_mins = PracticeLog.avg_total_practice_mins
            erb :"/practice_logs/index"
        else
            redirect_if_not_logged_in
        end
    end

    get '/practice_logs/new' do 
        if logged_in?
            erb :'/practice_logs/new'
        else
            redirect_if_not_logged_in
        end
    end
    
    post '/practice_logs' do 
        if logged_in? 
            @practice_log = current_user.practice_logs.build(params)
            if @practice_log && @practice_log.valid?
                @practice_log.save
                redirect to "/practice_logs"
            else
                flash[:error] = @practice_log.errors.full_messages.to_sentence
                redirect to "/practice_logs/new"
            end
        else
            redirect_if_not_logged_in
        end
    end
    
    get '/practice_logs/:id' do 
        if logged_in?
            @practice_log = current_user.practice_logs.find_by_id(params[:id])
            if @practice_log  
                erb :'/practice_logs/show'
            else
                redirect_if_not_authorized
            end
        else
            redirect_if_not_logged_in
        end
    end

    get '/practice_logs/:id/edit' do 
        if logged_in? 
            @practice_log = current_user.practice_logs.find_by_id(params[:id])
            if @practice_log 
                erb :'/practice_logs/edit'
            else
                redirect_if_not_authorized
            end
        else
            redirect_if_not_logged_in
        end
    end

    patch '/practice_logs/:id' do 
        if logged_in? 
            my_params = params.tap { |p| p.delete("_method") }
            @practice_log = current_user.practice_logs.find_by_id(params[:id])
                
            if @practice_log && @practice_log.update(my_params)
                redirect to "/practice_logs"
            else
                flash[:error] =  @practice_log.errors.full_messages.to_sentence
                redirect to "/practice_logs/#{@practice_log.id}/edit"
            end
        else
            redirect_if_not_logged_in
        end
    end

    delete '/practice_logs/:id/delete' do
        if logged_in? 
            @practice_log = current_user.practice_logs.find_by_id(params[:id])
            if @practice_log && @practice_log.delete
                redirect to "/practice_logs"
            else
                flash[:error] =  @practice_log.errors.full_messages.to_sentence
                redirect to "/practice_logs"
            end    
        else
            redirect_if_not_logged_in
        end      
    end
end
