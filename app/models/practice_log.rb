class PracticeLog < ActiveRecord::Base
    belongs_to :student
    validate :log_date_in_range
    validates :date, presence: true
    validates :practice_minutes, presence: true
    validates :practice_minutes, numericality: { greater_than_or_equal_to: 10, less_than_or_equal_to: 600}
 
    #
  
 
    def log_date_in_range
      binding.pry
      if !((Date.today - 365)..Date.today).include?(date)
        errors.add(:date, "must be within the past year")
      end
    end
  end