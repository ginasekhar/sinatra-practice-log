class PracticeLog < ActiveRecord::Base
    belongs_to :student

    validates :date, presence: true
    #validates :date { after: Proc.new { Time.now - 1.year}, before_or_equal_to: Time.now }
    validates :practice_minutes, presence: true
    validates :practice_minutes, numericality: { greater_than_or_equal_to: 10, less_than_or_equal_to: 600}
    #validates :practice_minutes, numericality: { less_than_or_equal_to: 600  }
    
    #validate :log_date_in_range,
  
 
  def log_date_in_range
    if date.valid_date? && date > Date.today
      errors.add(:date, "can't be in the future")
    end
  end
  end