class PracticeLog < ActiveRecord::Base
    belongs_to :student

    validates :date, presence: true
    validates :practice_minutes, presence: true
    
  end