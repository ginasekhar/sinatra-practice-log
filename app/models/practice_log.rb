class PracticeLog < ActiveRecord::Base
    belongs_to :student

    validates :year, presence: true
    validates :month, presence: true
    validates :day, presence: true
    validates :practice_minutes, presence: true
    
  end