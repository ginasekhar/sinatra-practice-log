class PracticeLog < ActiveRecord::Base
    belongs_to :student
    def self.valid_params?(params)
      return !params[:year].empty? && !params[:month].empty? && !params[:day].empty? && params[:practice_minutes].empty?
    end
  end